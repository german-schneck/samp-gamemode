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
#include "Addresses.h"

#define NUDE _declspec (naked) void

extern CYSI
	*pYSI;

extern int
	g_iServerVersion;

void
	*g_pCStream__cons = 0,
	*g_pCStream__dest = 0,
	*g_pCStream__Write = 0;

float
	*g_fpRestartWaitTime;

void RedirectNatives();
void InitSendInternal();

NUDE GameLoop()
{
	_asm pushad
	_asm mov ecx, pYSI
	_asm push ebx
	_asm call CYSI::Loop
	_asm popad
	_asm ret
}

NUDE OnPlayerConnect()
{
//	BYTE
//		playerid;
	_asm pushad
//	_asm mov playerid, ebx
	_asm mov ecx, pYSI
	_asm push ebx
	_asm call CYSI::OnPlayerConnect
//	pYSI->OnPlayerConnect(playerid);
	_asm popad
	_asm ret
}

void Call(DWORD from, DWORD to)
{
	DWORD
		oldp,
		newp,
		disp = to - (from + 5);
	VirtualProtect((LPVOID)from, 5, PAGE_EXECUTE_READWRITE, &oldp);
	*(PBYTE)(from) = 0xE8;
	*(PDWORD)(from + 1) = (DWORD)disp;
	VirtualProtect((LPVOID)from, 5, oldp, &newp);
}

void WriteBytes(DWORD address, BYTE *data, DWORD size)
{
	DWORD
		oldp,
		newp;
	VirtualProtect((LPVOID)address, size, PAGE_EXECUTE_READWRITE, &oldp);
	memcpy((void *)address, data, size);
	VirtualProtect((LPVOID)address, size, oldp, &newp);
}

void NOPRange(DWORD start, DWORD length)
{
	DWORD
		oldp,
		newp;
	VirtualProtect((LPVOID)start, length, PAGE_EXECUTE_READWRITE, &oldp);
	memset((LPVOID)start, 0x90, length);
	VirtualProtect((LPVOID)start, length, oldp, &newp);
}

void Unlock(void *address)
{
	DWORD
		oldp;
	VirtualProtect((LPVOID)address, 4, PAGE_EXECUTE_READWRITE, &oldp);
}

void GetAddresses()
{
	switch (g_iServerVersion)
	{
		case SERVER_VERSION_0221:
			g_pCStream__cons = CSTREAM__CONS_0221;
			g_pCStream__dest = CSTREAM__DEST_0221;
			g_pCStream__Write = CSTREAM__WRITE_0221;
			g_fpRestartWaitTime = G_F_RESTART_WAIT_TIME_0221;
			break;
		case SERVER_VERSION_0222:
			g_pCStream__cons = CSTREAM__CONS_0222;
			g_pCStream__dest = CSTREAM__DEST_0222;
			g_pCStream__Write = CSTREAM__WRITE_0222;
			g_fpRestartWaitTime = G_F_RESTART_WAIT_TIME_0222;
			break;
		case SERVER_VERSION_0223:
			g_pCStream__cons = CSTREAM__CONS_0223;
			g_pCStream__dest = CSTREAM__DEST_0223;
			g_pCStream__Write = CSTREAM__WRITE_0223;
			g_fpRestartWaitTime = G_F_RESTART_WAIT_TIME_0223;
			break;
	}
	Unlock(g_fpRestartWaitTime);
}

void InstallPreHooks()
{
	GetAddresses();
	BYTE
		ndata[] = {0xEB, 0x32},
		pdata[] = {0xEB, 0x1D};
	// Main loop
	switch (g_iServerVersion)
	{
		case SERVER_VERSION_0221:
			// Skip the object creation code to save memory
			WriteBytes(COBJECTS__INIT_0221, ndata, sizeof (ndata));
			// Skip player object deletion
			WriteBytes(COBJECTS__DEL_0221, pdata, sizeof (pdata));
			// Redirect the object processing here for the main loop
			NOPRange(NETGAME_CALL_0221 + 5, 8);
			Call(NETGAME_CALL_0221, (DWORD)GameLoop);
			Call(COBJECTS__INITFP_0221, (DWORD)OnPlayerConnect);
			// NOP calls to the objects pool for speed and safety
			NOPRange(COBJECTS__REINIT_0221, 9);
			NOPRange(COBJECTS__INITFP_0221 + 5, 4);
			break;
		case SERVER_VERSION_0222:
			// Skip the object creation code to save memory
			WriteBytes(COBJECTS__INIT_0222, ndata, sizeof (ndata));
			// Skip player object deletion
			WriteBytes(COBJECTS__DEL_0222, pdata, sizeof (pdata));
			// Redirect the object processing here for the main loop
			NOPRange(NETGAME_CALL_0222 + 5, 8);
			Call(NETGAME_CALL_0222, (DWORD)GameLoop);
			Call(COBJECTS__INITFP_0222, (DWORD)OnPlayerConnect);
			// NOP calls to the objects pool for speed and safety
			NOPRange(COBJECTS__REINIT_0222, 9);
			NOPRange(COBJECTS__INITFP_0222 + 5, 4);
			break;
		case SERVER_VERSION_0223:
			// Skip the object creation code to save memory
			WriteBytes(COBJECTS__INIT_0223, ndata, sizeof (ndata));
			// Skip player object deletion
			WriteBytes(COBJECTS__DEL_0223, pdata, sizeof (pdata));
			// Redirect the object processing here for the main loop
			NOPRange(NETGAME_CALL_0223 + 5, 8);
			Call(NETGAME_CALL_0223, (DWORD)GameLoop);
			Call(COBJECTS__INITFP_0223, (DWORD)OnPlayerConnect);
			// NOP calls to the objects pool for speed and safety
			NOPRange(COBJECTS__REINIT_0223, 9);
			NOPRange(COBJECTS__INITFP_0223 + 5, 4);
			break;
	}
	// Redirect existing SA:MP natives to the YSI versions
	RedirectNatives();
}

void InstallPostHooks()
{
	// For things which need setting up after pNetGame is initiated
	InitSendInternal();
}
