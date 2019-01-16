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
#include "BitArray.h"

class CObject
{
private:
	unsigned int
		m_iModel,
		m_iID;
	float
		// Current position
		m_fX,
		m_fY,
		m_fZ,
		// Current rotation
		m_fRX,
		m_fRY,
		m_fRZ,
		// Target position
		m_fTX,
		m_fTY,
		m_fTZ,
		// Target rotation
		m_fTRX,
		m_fTRY,
		m_fTRZ,
		// Movement delta
		m_fDX,
		m_fDY,
		m_fDZ,
		// Rotation delta
		m_fDRX,
		m_fDRY,
		m_fDRZ,
		// Move speed
		m_fSpeed;
	CBitArray
		m_players;
	bool
		m_bMoving,
		m_bSetPos;
public:
	CObject(unsigned int model, float x, float y, float z, float rx, float ry, float rz);
	~CObject() {};

	void Process(float elapsed);
	void SetAllPlayers(int set) { m_players.SetAll(set); };
	void SetPlayer(PLAYERID playerid, int set) { m_players.Set(playerid, set); };
	void GetPos(float *x, float *y, float *z) { *x = m_fX; *y = m_fY; *z = m_fZ; };
	void GetRot(float *x, float *y, float *z) { *x = m_fRX; *y = m_fRY; *z = m_fRZ; };
	void SetID(unsigned int id) { m_iID = id; };
	unsigned int GetID() { return m_iID; };
	bool IsInMoveList() { return m_bMoving || m_bSetPos; };
	bool IsMoving() { return m_bMoving; };
	bool IsDirty() { return m_bSetPos; };
	bool HasPlayer(PLAYERID playerid) { return m_players.Get(playerid); };
	void Move(float tX, float tY, float tZ, float speed);
	void Display(PLAYERID playerid, BYTE id);
	void Hide(PLAYERID playerid, BYTE id);
	void UpdateRot(PLAYERID playerid, BYTE id);
	void UpdatePos(PLAYERID playerid, BYTE id);
	void MoveForPlayer(PLAYERID playerid, BYTE id);
	void StopForPlayer(PLAYERID playerid, BYTE id);
	void SetPos(float x, float y, float z);
	void SetRot(float x, float y, float z);
	void Stop();
};
