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
#include "Area.h"
#include "IdentifiedList.h"
#include "DynamicArray.h"

class CAreaPool
{
private:
	CIdentifiedList<CArea>
		*m_pAreaList;
	CDynamicArray<CArea>
		*m_pAreaArray;
	int
		m_iAreaCount,
		m_iHighestID;
	CArea
		*m_pLastArea[MAX_PLAYERS];

	int Add(CArea *pArea, float minx, float miny, float maxx, float maxy);
	void RemoveAll();
	void InitAll();
public:
	CAreaPool();
	~CAreaPool();

	int NewBox(float minx, float miny, float maxx, float maxy);
	int NewCube(float minx, float miny, float minz, float maxx, float maxy, float maxz);
	void Process(float elapsed);
	void Reset();
	void OnPlayerConnect(BYTE playerid) { m_pLastArea[playerid] = NULL; };
};
