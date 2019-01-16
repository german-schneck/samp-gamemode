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
#include "Zone.h"
#include "BitArray.h"
#include "LinkedList.h"

template <class T>
inline void SWAP(T &m, T &n)
{
	T
		temp = m;
	m = n;
	n = temp;
}

// Mutual inclusion
class CZone;

class CArea
{
private:
	CBitArray
		m_players;
	CLinkedList<CZone>
		*m_pZones;
	int
		m_iAreaID;
public:
	CArea();
	~CArea();
	
	virtual bool Process(int playerid, float x, float y, float z) = 0;
	void SetAllPlayers(int set) { m_players.SetAll(set); };
	void SetPlayer(PLAYERID playerid, int set) { m_players.Set(playerid, set); };
	bool HasPlayer(PLAYERID playerid) { return m_players.Get(playerid); };
	void AddZone(CZone *pZone) { if (m_pZones) m_pZones->Add(pZone); };
	void SetID(int id) { m_iAreaID = id; };
	int GetID() { return m_iAreaID; };
};
