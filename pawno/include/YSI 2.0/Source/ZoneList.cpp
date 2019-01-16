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
#include "ZoneList.h"

CZoneList::CZoneList()
{
	m_pZonesN = new CDynamicArray<CZone>(3000 / ZONE_Y_SIZE);
	m_pZonesP = new CDynamicArray<CZone>(3000 / ZONE_Y_SIZE);
}

CZoneList::~CZoneList()
{
	delete m_pZonesN;
	delete m_pZonesP;
}

CZone* CZoneList::GetZone(ZONEID zoneid)
{
	int
		y = zoneid.y;
	if (y < 0)
	{
		return m_pZonesN->Get(-y);
	}
	else
	{
		return m_pZonesP->Get(y);
	}
}

CZone* CZoneList::AddZone(ZONEID zoneid)
{
	// Get the zone list
	CZone
		*pZone = GetZone(zoneid);
	// See if the zone list exists already
	if (!pZone)
	{
		pZone = new CZone();
		int
			y = zoneid.y;
		if (y < 0)
		{
			m_pZonesN->Set(-y, pZone);
		}
		else
		{
			m_pZonesP->Set(y, pZone);
		}
	}
	return pZone;
}
