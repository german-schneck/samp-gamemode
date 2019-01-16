/*  
 *  Version: MPL 1.1
 *  
 *  The contents of this file are subject to the Mozilla Public License Version 
 *  1.1 (the "License"); you may not use this file except in compliance with 
 *  the License. You may obtain a copy of the License at 
 *  http://www.mozilla.org/MPL/
 *  
 *  Software distributed under the License is distributed on an "AS IS" basis,
 *  WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
 *  for the specific language governing rights and limitations under the
 *  License.
 *  
 *  The Original Code is the YSI 2.0 SA:MP plugin.
 *  
 *  The Initial Developer of the Original Code is Alex "Y_Less" Cole.
 *  Portions created by the Initial Developer are Copyright (C) 2008
 *  the Initial Developer. All Rights Reserved.
 *  
 *  Contributor(s):
 *  
 *  Peter Beverloo
 *  Marcus Bauer
 */
#include "../main.h"
#include "IdentifiedItem.h"
#include "LimitedList.h"
#include "YSI.h"
#include "Utils.h"
#include "BitArray.h"
#include "ZoneIter.h"

#define OBJECT_UPDATE_TIME (200.0)
#define DEFAULT_VIEW_RANGE (500.0f)

extern CYSI
	*pYSI;

extern logprintf_t
	logprintf;

CObjectPool::CObjectPool()
{
	InitAll();
}

CObjectPool::~CObjectPool()
{
	RemoveAll();
}

void CObjectPool::Reset()
{
	// Delete all the lists and remake
	// Delete the objects when the last list is deleted
	RemoveAll();
	// Remake
	InitAll();
}

void CObjectPool::RemoveAll()
{
	delete m_pObjectList;
	if (m_pObjectArray)
	{
		m_pObjectArray->SetRemove(false);
		delete m_pObjectArray;
	}
	if (m_pMovingObjects)
	{
		m_pMovingObjects->SetRemove(false);
		delete m_pMovingObjects;
	}
}

void CObjectPool::InitAll()
{
	m_pObjectList = new CIdentifiedList<CObject>();
	m_pObjectArray = new CDynamicArray<CObject>(4096);
	m_pMovingObjects = new CLinkedList<CObject>();
	m_fElapsed = 0.0;
	memset(m_iPlayerObjects, 0, sizeof (m_iPlayerObjects));
	m_iHighestID = 0;
	m_iObjectCount = 0;
}

int CObjectPool::New(int model, float x, float y, float z, float rx, float ry, float rz, int playerid)
{
	if (m_pObjectList)
	{
		CObject
			*pObject = new CObject(model, x, y, z, rx, ry, rz);
		if (pObject)
		{
			int
				ret = m_pObjectList->Add(pObject);
			m_pObjectArray->Set(ret, pObject);
			pYSI->GetZonePool()->AddToZone(pObject, x, y);
			if (playerid != INVALID_PLAYER_ID && playerid >= 0 && playerid < MAX_PLAYERS)
			{
				pObject->SetAllPlayers(0);
				pObject->SetPlayer((PLAYERID)playerid, 1);
			}
			else
			{
				pObject->SetAllPlayers(1);
			}
			pObject->SetID(ret);
			m_iObjectCount++;
			if (ret > m_iHighestID)
			{
				m_iHighestID = ret;
			}
			return ret;
		}
	}
	return 0;
}

int CObjectPool::Delete(int objectID)
{
	CObject
		*pObject = m_pObjectArray->Get(objectID);
	if (pObject)
	{
		// Hide for players
		BOOL
			*connected = pYSI->GetPlayerPool()->GetConnected();
		for (PLAYERID playerid = 0; playerid < MAX_PLAYERS; playerid++)
		{
			if (connected[playerid])
			{
				CObject
					**playerObjects = m_iPlayerObjects[playerid];
				// Check if this player has this object
				for (BYTE i = 0; i < MAX_PLAYER_OBJECTS; i++)
				{
					if (playerObjects[i] == pObject)
					{
						pObject->Hide(playerid, i + 1);
						playerObjects[i] = NULL;
						// Won't have the same object twice
						// (if they do there's a bug somewhere else
						// not here).
						break;
					}
				}
			}
		}
		m_iObjectCount--;
		// Remove from lists
		m_pObjectArray->Set(objectID, NULL);
		if (pObject->IsInMoveList())
		{
			m_pMovingObjects->Remove(pObject);
		}
		m_pObjectList->DeleteAt(objectID);
		if (objectID == m_iHighestID)
		{
			m_iHighestID = m_pObjectList->GetHighestID();
		}
		return 1;
	}
	return 0;
}

void CObjectPool::Process(float elapsed)
{
	if (m_iObjectCount)
	{
		m_fElapsed = m_fElapsed + (elapsed * 1000.0f);
		// Don't process object streaming all the time
		// it's way too intensive and pointless even in C
		if (m_fElapsed >= OBJECT_UPDATE_TIME)
		{
			CPlayerPool
				*pPP = pYSI->GetPlayerPool();
			if (pPP)
			{
				BOOL
					*connected = pPP->GetConnected();
				SS_CPlayer
					**players = pPP->GetPlayers();
				CBitArray
					*objects = NULL;
				for (int playerid = 0; playerid < MAX_PLAYERS; playerid++)
				{
					if (connected[playerid])
					{
						if (objects == NULL)
						{
							objects = new CBitArray(m_iHighestID + 1);
						}
						if (objects == NULL)
						{
							return;
						}
						CObject
							*pObject;
						CLimitedList<CObject, float>
							*pList = new CLimitedList<CObject, float>(MAX_PLAYER_OBJECTS);
						pList->SetRemove(false);
						SS_CPlayer
							*player = players[playerid];
						float
							x = player->x,
							y = player->y,
							z = player->z,
							range = 0.0f;
						CZoneIter
							*playerIter = new CZoneIter(x, y);
						int
							ring = -1;
						bool
							bOneMore = true;
						while ((!pList->IsFull() || bOneMore) && ++ring * ZONE_RING_SIZE <= DEFAULT_VIEW_RANGE)
						{
							if (pList->IsFull())
							{
								bOneMore = false;
							}
							CLinkedList<CLinkedList<CObject>>
								*playerZones = playerIter->NextRing();
							CLinkedList<CObject>
								*objectsList;
							foreach (playerZones, objectsList)
							{
								foreach (objectsList, pObject)
								{
									// If this player can't see this object skip it
									if (!pObject->HasPlayer(playerid))
									{
										continue;
									}
									float
										ox,
										oy,
										oz,
										or;
									// Get the SQUARED distance between player and object
									// this is MUCH faster and just as accurate
									pObject->GetPos(&ox, &oy, &oz);
									or = GetRangeSquared(x, y, z, ox, oy, oz);
									// Do they have 150 objects?
									if (pList->IsFull())
									{
										// Yes = is this object closer than one of those?
										if (or < range)
										{
											// Yes, add it and update the furthest object range
											pList->Add(pObject, or);
											range = pList->GetLast()->GetValue();
										}
									}
									else
									{
										// No - Just add it
										if (or < (DEFAULT_VIEW_RANGE * DEFAULT_VIEW_RANGE))
										{
											pList->Add(pObject, or);
											if (or > range)
											{
												range = or;
											}
										}
									}
								}
							}
						}
						delete playerIter;
						// Go through all the objects we just found and mark as required
						foreach (pList, pObject)
						{
							objects->Let(pObject->GetID());
						}
						CObject
							**playerObjects = m_iPlayerObjects[playerid];
						// Loop through existing objects
						for (int i = 0; i < MAX_PLAYER_OBJECTS; i++)
						{
							pObject = playerObjects[i];
							if (pObject)
							{
								unsigned int
									id = pObject->GetID();
								// See if we still want this object
								if (objects->Get(id))
								{
									// Yes
									// Is the object dirty?
									if (pObject->IsDirty())
									{
										// The object has moved but the player can STILL see it
										pObject->UpdatePos(playerid, id + 1);
									}
									// Mark it as spawned
									objects->Vet(id);
								}
								else
								{
									// No - remove it
									pObject->Hide(playerid, i + 1);
									playerObjects[i] = NULL;
								}
							}
						}
						// See if the object still exists
						int
							min = 0;
						foreach (pList, pObject)
						{
							int
								id = pObject->GetID();
							// See if we still want this object
							if (objects->Get(id))
							{
								// Spawn the object
								for (int i = min; i < MAX_PLAYER_OBJECTS; i++)
								{
									// Find a free slot
									if (playerObjects[i] == NULL)
									{
										// Spawn the object in this slot
										playerObjects[i] = pObject;
										// Go from this slot in future
										min = i + 1;
										pObject->Display(playerid, i + 1);
										if (pObject->IsMoving())
										{
											pObject->MoveForPlayer(playerid, i + 1);
										}
										break;
									}
								}
								// Yes - mark it as spawned
								objects->Vet(id);
							}
						}
						delete pList;
					}
				}
				delete objects;
			}
			m_fElapsed = 0.0f;
		}
		// Update object positions
		CObject
			*objectid;
		foreach (m_pMovingObjects, objectid)
		{
			objectid->Process(elapsed);
		}
	}
}

void CObjectPool::RemoveCurrentMovingObject()
{
	m_pMovingObjects->RemoveCurrent();
}

void CObjectPool::UpdateRot(CObject *pObject)
{
	// Update an object's rotation for a player
	// Done here not in CObject so you don't need to duplicate object ids
	BOOL
		*connected = pYSI->GetPlayerPool()->GetConnected();
	for (PLAYERID playerid = 0; playerid < MAX_PLAYERS; playerid++)
	{
		if (connected[playerid])
		{
			CObject
				**playerObjects = m_iPlayerObjects[playerid];
			// Check if this player has this object
			for (BYTE i = 0; i < MAX_PLAYER_OBJECTS; i++)
			{
				if (playerObjects[i] == pObject)
				{
					// If so send the update to the player
					pObject->UpdateRot(playerid, i + 1);
					break;
				}
			}
		}
	}
}

void CObjectPool::AddToMoving(CObject *pObject)
{
	// Add to the list
	m_pMovingObjects->Add(pObject);
	
	// Update for players who can see this object
	// Update an object's rotation for a player
	// Done here not in CObject so you don't need to duplicate object ids
	BOOL
		*connected = pYSI->GetPlayerPool()->GetConnected();
	for (PLAYERID playerid = 0; playerid < MAX_PLAYERS; playerid++)
	{
		if (connected[playerid])
		{
			CObject
				**playerObjects = m_iPlayerObjects[playerid];
			// Check if this player has this object
			for (BYTE i = 0; i < MAX_PLAYER_OBJECTS; i++)
			{
				if (playerObjects[i] == pObject)
				{
					// If so send the update to the player
					pObject->MoveForPlayer(playerid, i + 1);
					break;
				}
			}
		}
	}
}

void CObjectPool::RemoveFromMoving(CObject *pObject)
{
	// Called from CObject::Stop only
	m_pMovingObjects->Remove(pObject);

	// Send stop signal to players
	BOOL
		*connected = pYSI->GetPlayerPool()->GetConnected();
	for (PLAYERID playerid = 0; playerid < MAX_PLAYERS; playerid++)
	{
		if (connected[playerid])
		{
			CObject
				**playerObjects = m_iPlayerObjects[playerid];
			// Check if this player has this object
			for (BYTE i = 0; i < MAX_PLAYER_OBJECTS; i++)
			{
				if (playerObjects[i] == pObject)
				{
					// If so send the update to the player
					pObject->StopForPlayer(playerid, i + 1);
					break;
				}
			}
		}
	}
}
