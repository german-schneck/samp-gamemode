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
#include "ZoneIter.h"
#include "YSI.h"

extern CYSI
	*pYSI;

CZoneIter::CZoneIter(float x, float y)
{
	ZONEID
		start = CZonePool::DetermineZone(x, y);
	m_iRing = 0;
	m_ziStart = start;
	m_llData = NULL;
}

CZoneIter::~CZoneIter()
{
	Reset();
}

CLinkedList<CLinkedList<CObject>>* CZoneIter::NextRing()
{
	CZonePool
		*pZonePool = pYSI->GetZonePool();
	if (pZonePool)
	{
		Reset();
		m_llData = new CLinkedList<CLinkedList<CObject>>();
		if (m_llData)
		{
			short
				sx = m_ziStart.x - m_iRing,
				sy = m_ziStart.y - m_iRing,
				ex = sx + (m_iRing * 2),
				ey = sy + (m_iRing * 2),
				x,
				y = sy;
			m_iRing++;
			while (y <= ey)
			{
				x = sx;
				while (x <= ex)
				{
					ZONEID
						z = {x, y};
					CZone
						*zone = pZonePool->GetZone(z);
					if (zone)
					{
						CLinkedList<CObject>
							*dat = zone->GetObjects();
						if (dat)
						{
							m_llData->Add(dat);
						}
					}
					if (y == sy || y == ey)
					{
						x++;
					}
					else
					{
						if (x == sx)
						{
							x = ex;
						}
						else
						{
							break;
						}
					}
				}
				y++;
			}
			return m_llData;
		}
	}
	return NULL;
}
