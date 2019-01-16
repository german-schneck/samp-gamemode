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
#include "YSI.h"

extern logprintf_t
	logprintf;

CYSI::CYSI()
{
	// CServer doesn't actually work at this point due to the late initialisation
	m_pServer = new CServer();
	m_pObjectPool = new CObjectPool();
	m_pZonePool = new CZonePool();
	m_pPlayerPool = new CPlayerPool();
	m_pAreaPool = new CAreaPool();
//	logprintf("CYSI::CYSI() called: %x %x %x %x", (int)m_pServer, (int)m_pObjectPool, (int)m_pZonePool, (int)m_pPlayerPool);
}

CYSI::~CYSI()
{
}

void CYSI::LateInit()
{
	// Do CServer requiring things here
}

void CYSI::Loop(float elapsed)
{
	if (m_pObjectPool)
	{
		m_pObjectPool->Process(elapsed);
	}
	if (m_pAreaPool)
	{
		m_pAreaPool->Process(elapsed);
	}
}

void CYSI::OnPlayerConnect(int playerid)
{
	if (m_pObjectPool)
	{
		m_pObjectPool->OnPlayerConnect(playerid);
	}
	if (m_pAreaPool)
	{
		m_pAreaPool->OnPlayerConnect(playerid);
	}
}

void CYSI::Reset()
{
	if (m_pObjectPool)
	{
		m_pObjectPool->Reset();
	}
	if (m_pZonePool)
	{
		m_pZonePool->Reset();
	}
	if (m_pAreaPool)
	{
		m_pAreaPool->Reset();
	}
}