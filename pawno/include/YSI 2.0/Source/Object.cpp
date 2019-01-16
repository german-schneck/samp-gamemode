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
#include "Object.h"
#include "Stream.h"
#include <cmath>
#include "YSI.h"
#include "Messages.h"

extern logprintf_t
	logprintf;

extern CYSI
	*pYSI;

CObject::CObject(unsigned int model, float x, float y, float z, float rx, float ry, float rz)
{
	m_iModel = model;
	m_fX = x;
	m_fY = y;
	m_fZ = z;
	m_fRX = rx;
	m_fRY = ry;
	m_fRZ = rz;
	m_bMoving = false;
	m_bSetPos = false;
}

void CObject::SetPos(float x, float y, float z)
{
	m_fX = x;
	m_fY = y;
	m_fZ = z;
	// Update zone information here
	// DO NOT send move information to players
	// This will be updated at the next update
	m_bSetPos = true;
}

void CObject::SetRot(float x, float y, float z)
{
	m_fRX = x;
	m_fRY = y;
	m_fRZ = z;
	// Update rotation for players with this object
	pYSI->GetObjectPool()->UpdateRot(this);
}

void CObject::Stop()
{
	m_bMoving = false;
	pYSI->GetObjectPool()->RemoveFromMoving(this);
}

void CObject::Move(float tX, float tY, float tZ, float speed)
{
	if (m_bMoving)
	{
		// Already moving - makes things slightly fun
	}
	// Target position
	m_fTX = tX;
	m_fTY = tY;
	m_fTZ = tZ;
	
	// Get position - target distances
	tX -= m_fX;
	tY -= m_fY;
	tZ -= m_fZ;
	
	// Calculate time to move
	float
		time = (float)sqrt((float)((tX * tX) + (tY * tY) + (tZ * tZ))) / speed;
	
	// Calculate 1 second steps here for speed later
	// Movement delta
	m_fDX = (float)(tX / time);
	m_fDY = (float)(tY / time);
	m_fDZ = (float)(tZ / time);
	
	// Rotation currently unsupported
	// Target rotation
	m_fTRX = m_fRX;
	m_fTRY = m_fRY;
	m_fTRZ = m_fRZ;
	// Rotation delta
	m_fDRX = 0.0f;
	m_fDRY = 0.0f;
	m_fDRZ = 0.0f;
	
	m_fSpeed = speed;
	
	// Add to the moving list so we can
	pYSI->GetObjectPool()->AddToMoving(this);

	m_bMoving = true;
}

// Not sure which of these is faster but I suspect it's the first
#define OBJ_D_DIFF(l,m,n) \
	(((m - l) * (m - l)) <= (n * n))
//	((n < 0.0) ? (l + n < m) : (l + n > m))

void CObject::Process(float elapsed)
{
	if (m_bSetPos)
	{
		// Has been updated, we can unmark it now
		m_bSetPos = false;
		pYSI->GetObjectPool()->RemoveCurrentMovingObject();
	}
	else
	{
		float
			x = m_fDX * elapsed,
			y = m_fDY * elapsed,
			z = m_fDZ * elapsed;
		// Check if the object will finish moving this frame
		if (OBJ_D_DIFF(m_fX, m_fTX, x))
		{
			m_fDX = 0.0f;
		}
		if (OBJ_D_DIFF(m_fY, m_fTY, y))
		{
			m_fDY = 0.0f;
		}
		if (OBJ_D_DIFF(m_fZ, m_fTZ, z))
		{
			m_fDZ = 0.0f;
		}
		// Had to hack it as in rare cases it overshot due to axies being out of sync
		// Used to check all the OBJ_D_DIFF values at once, but one would finish and another wouldn't
		// Meaning the finished one would keep going, then the other would finish and keep going
		if (m_fDX == 0.0f && m_fDY == 0.0f && m_fDZ == 0.0f)
		{
			// Object moved - fix it's end location
			m_fX = m_fTX;
			m_fY = m_fTY;
			m_fZ = m_fTZ;
			// Mark as not moving
			m_bMoving = false;
			// Remove before calling the callback so we can add it again
			pYSI->GetObjectPool()->RemoveCurrentMovingObject();
			// Call the OnObjectMoved callbacks
			pYSI->GetServer()->GetScripts()->OnObjectMoved(m_iID);
		}
		else
		{
			// Moving, update the position
			m_fX += x;
			m_fY += y;
			m_fZ += z;
		}
	}
}

// Sends object construction data to a player
void CObject::Display(PLAYERID playerid, BYTE id)
{
	CStream
		data;
	data.Write((BYTE)id);
	data.Write(m_iModel);
	data.Write(m_fX);
	data.Write(m_fY);
	data.Write(m_fZ);
	data.Write(m_fRX);
	data.Write(m_fRY);
	data.Write(m_fRZ);
	data.Send(MESSAGE_TYPE_CREATE_OBJECT, playerid);
}

// Sends object destruction data to a player
void CObject::Hide(PLAYERID playerid, BYTE id)
{
	CStream
		data;
	data.Write((BYTE)id);
	data.Send(MESSAGE_TYPE_DESTROY_OBJECT, playerid);
}

// Sends object rotation change data to a player
void CObject::UpdateRot(PLAYERID playerid, BYTE id)
{
	CStream
		data;
	data.Write((BYTE)id);
	data.Write(m_fRX);
	data.Write(m_fRY);
	data.Write(m_fRZ);
	data.Send(MESSAGE_TYPE_SET_OBJECT_ROT, playerid);
}

// Sends position rotation change data to a player
void CObject::UpdatePos(PLAYERID playerid, BYTE id)
{
	CStream
		data;
	data.Write((BYTE)id);
	data.Write(m_fX);
	data.Write(m_fY);
	data.Write(m_fZ);
	data.Send(MESSAGE_TYPE_SET_OBJECT_POS, playerid);
}

// Tell objects to move for players who can see them
void CObject::MoveForPlayer(PLAYERID playerid, BYTE id)
{
	CStream
		data;
	data.Write((BYTE)id);
	data.Write(m_fX);
	data.Write(m_fY);
	data.Write(m_fZ);
	data.Write(m_fTX);
	data.Write(m_fTY);
	data.Write(m_fTZ);
	data.Write(m_fSpeed);
	data.Send(MESSAGE_TYPE_MOVE_OBJECT, playerid);
}

// Tell objects to move for players who can see them
void CObject::StopForPlayer(PLAYERID playerid, BYTE id)
{
	CStream
		data;
	data.Write((BYTE)id);
	data.Write(m_fX);
	data.Write(m_fY);
	data.Write(m_fZ);
	data.Send(MESSAGE_TYPE_STOP_OBJECT, playerid);
}
