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
#define WINDOWS_LEAN_AND_MEAN
#include <windows.h>
#include "../main.h"

#pragma pack(1)
typedef struct SS_CPlayer
{
	char
		pad1[463];
	float
		x,
		y,
		z;
}
SS_CPlayer;

#pragma pack(1)
typedef struct SS_CPlayerPool
{
	BOOL
		bPlayerConnected[MAX_PLAYERS];
	SS_CPlayer*
		vPlayers[MAX_PLAYERS];
}
SS_CPlayerPool;

#pragma pack(1)
typedef struct SS_CServer
{
	void
		*pFirst;
	SS_CPlayerPool
		*pPlayerPool;
	void
		*pad[2],
		*pObjectPool,
		*pGameMode,
		*pFilterScripts;
}
SS_CServer;

#pragma pack(1)
typedef struct SS_CStream
{
	char
		pad[273];
}
SS_CStream;

#pragma pack(1)
typedef struct SS_PlayerID
{
	unsigned long
		pad1;
	unsigned short
		pad2;
}
SS_PlayerID;
