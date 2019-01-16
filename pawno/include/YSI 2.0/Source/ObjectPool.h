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
#pragma once
#include "Object.h"
#include "IdentifiedList.h"
#include "DynamicArray.h"
#include "LinkedList.h"

#define MAX_PLAYER_OBJECTS (150)

class CObjectPool
{
private:
	CIdentifiedList<CObject>
		*m_pObjectList;
	CDynamicArray<CObject>
		*m_pObjectArray;
	CLinkedList<CObject>
		*m_pMovingObjects;
	CObject
		*m_iPlayerObjects[MAX_PLAYERS][MAX_PLAYER_OBJECTS];
	float
		m_fElapsed;
	int
		m_iObjectCount,
		m_iHighestID;

	void StreamForPlayer(int playerid, float x, float y, float z);
	void RemoveAll();
	void InitAll();
public:
	CObjectPool();
	~CObjectPool();

	int New(int model, float x, float y, float z, float rx, float ry, float rz, int playerid = INVALID_PLAYER_ID);
	CObject* GetAt(int objectID) { if (m_pObjectArray) return m_pObjectArray->Get(objectID); return NULL; };
	int Delete(int objectID);
	void Process(float elapsed);
	void Reset();
	void UpdateRot(CObject *pObject);
	void AddToMoving(CObject *pObject);
	void RemoveCurrentMovingObject();
	void OnPlayerConnect(BYTE playerid) { memset(&m_iPlayerObjects[playerid][0], 0, MAX_PLAYER_OBJECTS * sizeof (CObject *)); };
	void RemoveFromMoving(CObject *pObject);
};
