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
#include "ZonePool.h"
#include "YSI.h"

extern logprintf_t
	logprintf;
extern CYSI
	*pYSI;

CZonePool::CZonePool()
{
	InitAll();
}

CZonePool::~CZonePool()
{
	RemoveAll();
}

void CZonePool::RemoveAll()
{
	delete m_pZoneListsN;
	delete m_pZoneListsP;
}

void CZonePool::InitAll()
{
	// Zone lists below 0
	m_pZoneListsN = new CDynamicArray<CZoneList>(3000 / ZONE_X_SIZE);
	// Zone lists above 0
	m_pZoneListsP = new CDynamicArray<CZoneList>(3000 / ZONE_X_SIZE);
//	memset(m_zPlayerZone, 0, sizeof (ZONEID) * MAX_PLAYERS);
}

void CZonePool::Reset()
{
	RemoveAll();
	InitAll();
}

void CZonePool::AddToZone(CObject* obj, float x, float y)
{
	ZONEID
		zoneid = DetermineZone(x, y);
	CZone
		*pZone = GetZone(zoneid);
	if (!pZone)
	{
		pZone = AddZone(zoneid);
	}
	if (pZone)
	{
		pZone->AddToZone(obj);
	}
}

void CZonePool::AddToZone(CArea* area, float minx, float miny, float maxx, float maxy)
{
	// Determine the upper and lowed zone bounds
	ZONEID
		zu = DetermineZone(maxx, maxy),
		zl = DetermineZone(minx, miny);
	ZONEID
		cur = zl;
	while (cur.x <= zu.x)
	{
		while (cur.y <= zu.y)
		{
			CZone
				*pZone = GetZone(cur);
			if (!pZone)
			{
				pZone = AddZone(cur);
			}
			if (pZone)
			{
				pZone->AddToZone(area);
				area->AddZone(pZone);
			}
			cur.y++;
		}
		cur.y = zl.y;
		cur.x++;
	}
}

CZone* CZonePool::AddZone(ZONEID zoneid)
{
	// Get the zone list
	CZoneList
		*pList = GetList(zoneid);
	// See if the zone list exists already
	if (!pList)
	{
		pList = new CZoneList();
		int
			x = zoneid.x;
		if (x < 0)
		{
			m_pZoneListsN->Set(-x, pList);
		}
		else
		{
			m_pZoneListsP->Set(x, pList);
		}
	}
	// Not "else" as it could have just been created so we need to recheck
	if (pList)
	{
		return pList->AddZone(zoneid);
	}
	return NULL;
}

CZoneList* CZonePool::GetList(ZONEID zoneid)
{
	int
		x = zoneid.x;
	if (x < 0)
	{
		return m_pZoneListsN->Get(-x);
	}
	else
	{
		return m_pZoneListsP->Get(x);
	}
}

CZone* CZonePool::GetZone(ZONEID zoneid)
{
	CZoneList
		*pList = GetList(zoneid);
	if (pList)
	{
		return pList->GetZone(zoneid);
	}
	return NULL;
}

ZONEID CZonePool::DetermineZone(float x, float y)
{
	ZONEID
		ret = {(short)x / ZONE_X_SIZE, (short)y / ZONE_Y_SIZE};
	return ret;
}
