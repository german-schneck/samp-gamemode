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
#include "Area.h"
#include "LinkedList.h"

#define ZONE_X_SIZE (100)
#define ZONE_Y_SIZE (100)

#if ZONE_X_SIZE < ZONE_Y_SIZE
	#define ZONE_RING_SIZE ZONE_X_SIZE
#else
	#define ZONE_RING_SIZE ZONE_Y_SIZE
#endif

typedef struct ZONEID
{
	short
		x,
		y;
}
ZONEID;

// Mutual inclusion
class CArea;

class CZone
{
private:
	CLinkedList<CObject>
		*m_pObjects;
	CLinkedList<CArea>
		*m_pAreas;
public:
	CZone();
	~CZone();
	void AddToZone(CObject* obj);
	void AddToZone(CArea* area);
	bool HasObjects() { return !m_pObjects->IsEmpty(); };
	CLinkedList<CObject>* GetObjects() { if (!m_pObjects || !HasObjects()) return NULL; return m_pObjects; };
	bool HasAreas() { return !m_pAreas->IsEmpty(); };
	CLinkedList<CArea>* GetAreas() { if (!m_pAreas || !HasAreas()) return NULL; return m_pAreas; };
	CArea* ProcessAreas(int playerid, float x, float y, float z);
};
