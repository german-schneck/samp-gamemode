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
#include "AreaPool.h"
#include "AreaBox.h"
#include "AreaCube.h"
#include "YSI.h"

extern CYSI
	*pYSI;
extern logprintf_t
	logprintf;

CAreaPool::CAreaPool()
{
	InitAll();
}
						
CAreaPool::~CAreaPool()
{
	RemoveAll();
}

void CAreaPool::Reset()
{
	RemoveAll();
	// Remake
	InitAll();
}

void CAreaPool::InitAll()
{
	m_pAreaList = new CIdentifiedList<CArea>();
	m_pAreaArray = new CDynamicArray<CArea>(256);
	m_iHighestID = 0;
	m_iAreaCount = 0;
	memset(m_pLastArea, 0, sizeof (CArea *) * MAX_PLAYERS);
}

void CAreaPool::RemoveAll()
{
	delete m_pAreaList;
	if (m_pAreaArray)
	{
		m_pAreaArray->SetRemove(false);
		delete m_pAreaArray;
	}
}

int CAreaPool::NewBox(float minx, float miny, float maxx, float maxy)
{
	if (m_pAreaList)
	{
		if (minx > maxx)
		{
			SWAP(minx, maxx);
		}
		if (miny > maxy)
		{
			SWAP(miny, maxy);
		}
		return Add(new CAreaBox(minx, miny, maxx, maxy), minx, miny, maxx, maxy);
	}
	return 0;
}

int CAreaPool::NewCube(float minx, float miny, float minz, float maxx, float maxy, float maxz)
{
	if (m_pAreaList)
	{
		if (minx > maxx)
		{
			SWAP(minx, maxx);
		}
		if (miny > maxy)
		{
			SWAP(miny, maxy);
		}
		if (minz > maxz)
		{
			SWAP(minz, maxz);
		}
		return Add(new CAreaCube(minx, miny, minz, maxx, maxy, maxz), minx, miny, maxx, maxy);
	}
	return 0;
}

int CAreaPool::Add(CArea *pArea, float minx, float miny, float maxx, float maxy)
{
	if (pArea)
	{
		int
			ret = m_pAreaList->Add(pArea);
		m_pAreaArray->Set(ret, pArea);
		pYSI->GetZonePool()->AddToZone(pArea, minx, miny, maxx, maxy);
		pArea->SetAllPlayers(1);
		pArea->SetID(ret);
		m_iAreaCount++;
		if (ret > m_iHighestID)
		{
			m_iHighestID = ret;
		}
		return ret;
	}
	return 0;
}

void CAreaPool::Process(float elapsed)
{
	// Check there are actually any areas first
	if (m_iAreaCount)
	{
		CPlayerPool
			*pPP = pYSI->GetPlayerPool();
		if (pPP)
		{
			BOOL
				*connected = pPP->GetConnected();
			SS_CPlayer
				**players = pPP->GetPlayers();
			CScripts
				*pScripts = pYSI->GetServer()->GetScripts();
			CZonePool
				*pZonePool = pYSI->GetZonePool();
			for (int playerid = 0; playerid < MAX_PLAYERS; playerid++)
			{
				if (connected[playerid])
				{
					SS_CPlayer
						*player = players[playerid];
					float
						x = player->x,
						y = player->y,
						z = player->z;
					// Get the player's current zone
					CArea
						*oldArea = m_pLastArea[playerid];
					// Check if they're still in this zone
					if (oldArea)
					{
						if (oldArea->Process(playerid, x, y, z))
						{
							// Go to the next player
							continue;
						}
						// They left their old area
						pScripts->OnPlayerLeaveArea(playerid, oldArea->GetID());
					}
					CZone
						*pZone = pZonePool->GetZone(x, y);
					if (pZone)
					{
						CArea
							*newArea = pZone->ProcessAreas(playerid, x, y, z);
						m_pLastArea[playerid] = newArea;
						if (newArea)
						{
							pScripts->OnPlayerEnterArea(playerid, newArea->GetID());
						}
					}
					else
					{
						m_pLastArea[playerid] = NULL;
					}
				}
			}
		}
	}
}
