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
#include "YSI.h"

extern CYSI
	*pYSI;

CPlayerPool::CPlayerPool()
{
}

CPlayerPool::~CPlayerPool()
{
}

BOOL CPlayerPool::IsConnected(int playerid)
{
	return pYSI->GetServer()->GetPlayerPool()->bPlayerConnected[playerid];
}

BOOL* CPlayerPool::GetConnected()
{
	return &pYSI->GetServer()->GetPlayerPool()->bPlayerConnected[0];
}

SS_CPlayer** CPlayerPool::GetPlayers()
{
	return &pYSI->GetServer()->GetPlayerPool()->vPlayers[0];
}

