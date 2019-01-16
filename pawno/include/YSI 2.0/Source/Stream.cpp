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
#include "Stream.h"
#include "YSI.h"

extern void
	*g_pCStream__cons,
	*g_pCStream__dest;

extern CYSI
	*pYSI;

extern logprintf_t
	logprintf;

typedef void (* CStream__Send_t)(char *, CStream *, int, int, char, SS_PlayerID, bool, bool);

CStream__Send_t
	g_pCStream__Send = 0;

void InitSendInternal()
{
	void
		*send = pYSI->GetServer()->GetFirst();
	_asm mov ecx, send
	_asm mov edx, [ecx]
	_asm mov eax, [edx + 0x7C]
	_asm mov g_pCStream__Send, eax

}

CStream::CStream()
{
	_asm mov ecx, this ; May be redundant due to ecx already being "this"
	_asm mov eax, g_pCStream__cons
	_asm call eax
}

CStream::~CStream()
{
	_asm mov ecx, this
	_asm mov eax, g_pCStream__dest
	_asm call eax
}

void CStream::Send(char *type, short playerid)
{
	void
		*tt = pYSI->GetServer()->GetFirst();
	void
		*cc = type;
	SS_PlayerID
		pi = GetPlayer(playerid);
	long
		p1 = pi.pad1;
	short
		p2 = pi.pad2;
	_asm push 0
	_asm push 0
	_asm sub esp, 8
	_asm mov ecx, esp
	_asm push 0
	_asm mov edi, p1
	_asm mov [ecx], edi
	_asm push 3
	_asm mov ax, p2
	_asm mov [ecx + 4], ax
	_asm push 1
	_asm push this
	_asm push cc
	_asm mov ecx, tt
	_asm call g_pCStream__Send
}

SS_PlayerID INVALID_PLAYERID = { 0xFFFFFFFF, 0xFFFF };

SS_PlayerID CStream::GetPlayer(short playerid)
{
	int
		tt = (int)pYSI->GetServer()->GetFirst() + 0x04;
	if (playerid >= 0 && playerid < *(short *)(tt + 0x07))
	{
		int
			rsl = (*(int *)(tt + 0x0334)) + (playerid * 0x080A);
		if (*(int *)(rsl + 0x0806) == 8)
		{
			return *(SS_PlayerID *)(rsl + 1);
		}
	}
	return INVALID_PLAYERID;
}
