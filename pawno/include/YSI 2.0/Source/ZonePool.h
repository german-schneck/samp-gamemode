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
#include "OrderedList.h"
#include "ZoneList.h"
#include "Zone.h"
#include "Object.h"

/*#ifndef AddToZone
	#define AddToZone(l,m,n)                       \
		do                                         \
		{                                          \
			CZone                                  \
				*_atz_pZone = DetermineZone(m, n); \
			if (_atz_pZone)                        \
			{                                      \
				_atz_pZone->AddToZone(l);        \
			}                                      \
		}                                          \
		while (0)
#endif*/

class CZonePool
{
private:
	CDynamicArray<CZoneList>
		*m_pZoneListsN,
		*m_pZoneListsP;
/*	ZONEID
		m_zPlayerZone[MAX_PLAYERS];*/
	CZone* AddZone(ZONEID zoneid);
	CZoneList* GetList(ZONEID zoneid);
	void RemoveAll();
	void InitAll();
public:
	CZonePool();
	~CZonePool();
	void Process(float elapsed) {};
	void AddToZone(CObject* obj, float x, float y);
	void AddToZone(CArea* area, float x, float y);
	static ZONEID DetermineZone(float x, float y);
	CZone* GetZone(ZONEID zoneid);
	CZone* GetZone(float x, float y) { return GetZone(DetermineZone(x, y)); };
	void AddToZone(CArea* area, float minx, float miny, float maxx, float maxy);
	void Reset();
	void OnPlayerConnect(BYTE playerid) {};
//	ZONEID GetPlayerZone(playerid) { return m_zPlayerZone[playerid]; };
};
