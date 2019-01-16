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
#include "ObjectPool.h"
#include "ZonePool.h"
#include "PlayerPool.h"
#include "Server.h"
#include "AreaPool.h"

class CYSI
{
private:
	CServer
		*m_pServer;
	CObjectPool
		*m_pObjectPool;
	CZonePool
		*m_pZonePool;
	CPlayerPool
		*m_pPlayerPool;
	CAreaPool
		*m_pAreaPool;
public:
	CYSI();
	~CYSI();
	
	CObjectPool* GetObjectPool() { return m_pObjectPool; };	
	CZonePool* GetZonePool() { return m_pZonePool; };
	CPlayerPool* GetPlayerPool() { return m_pPlayerPool; };
	CServer* GetServer() { return m_pServer; };
	CAreaPool* GetAreaPool() { return m_pAreaPool; };
	void LateInit();
	void Loop(float elapsed);
	void OnPlayerConnect(int playerid);
	void Reset();
};
