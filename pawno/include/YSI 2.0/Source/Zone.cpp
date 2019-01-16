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
#include "Zone.h"
#include "YSI.h"

extern CYSI
	*pYSI;

CZone::CZone()
{
	m_pObjects = new CLinkedList<CObject>();
	m_pAreas = new CLinkedList<CArea>();
}

CZone::~CZone()
{
	if (m_pObjects)
	{
		m_pObjects->SetRemove(false);
		delete m_pObjects;
	}
	if (m_pAreas)
	{
		m_pAreas->SetRemove(false);
		delete m_pAreas;
	}
}

void CZone::AddToZone(CObject* obj)
{
	if (m_pObjects)
	{
		m_pObjects->Add(obj);
	}
}

void CZone::AddToZone(CArea* obj)
{
	if (m_pAreas)
	{
		m_pAreas->Add(obj);
	}
}

// Process things in this zone (except objects)
CArea* CZone::ProcessAreas(int playerid, float x, float y, float z)
{
	if (m_pAreas)
	{
		CArea
			*pArea;
		foreach (m_pAreas, pArea)
		{
			if (pArea->Process(playerid, x, y, z))
			{
				return pArea;
			}
		}
	}
	return NULL;
}
