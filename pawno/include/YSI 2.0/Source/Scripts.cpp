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
#include "Scripts.h"
#include "YSI.h"

extern CYSI
	*pYSI;

cell CScripts::OnObjectMoved(cell objectid)
{
	return IntFunc1("OnObjectMoved", objectid);
}

cell CScripts::OnPlayerLeaveArea(cell playerid, cell areaid)
{
	return IntFunc2("OnPlayerLeaveArea", playerid, areaid);
}

cell CScripts::OnPlayerEnterArea(cell playerid, cell areaid)
{
	return IntFunc2("OnPlayerEnterArea", playerid, areaid);
}

cell CScripts::IntFunc1(char *function, cell par1)
{
	AMX
		**pFS = GetFilterScripts(),
		*pGM = GetGameMode();
	cell
		ret = 0;
	int
		idx;
	for (int i = 0; i < MAX_FILTER_SCRIPTS; i++)
	{
		if (pFS[i])
		{
			if (!amx_FindPublic(pFS[i], function, &idx))
			{
				amx_Push(pFS[i], par1);
				amx_Exec(pFS[i], &ret, idx);
			}
		}
	}
	if (pGM)
	{
		if (!amx_FindPublic(pGM, function, &idx))
		{
			amx_Push(pGM, par1);
			amx_Exec(pGM, &ret, idx);
		}
	}
	return ret;
}

cell CScripts::IntFunc2(char *function, cell par1, cell par2)
{
	AMX
		**pFS = GetFilterScripts(),
		*pGM = GetGameMode();
	cell
		ret = 0;
	int
		idx;
	for (int i = 0; i < MAX_FILTER_SCRIPTS; i++)
	{
		if (pFS[i])
		{
			if (!amx_FindPublic(pFS[i], function, &idx))
			{
				amx_Push(pFS[i], par2);
				amx_Push(pFS[i], par1);
				amx_Exec(pFS[i], &ret, idx);
			}
		}
	}
	if (pGM)
	{
		if (!amx_FindPublic(pGM, function, &idx))
		{
			amx_Push(pGM, par2);
			amx_Push(pGM, par1);
			amx_Exec(pGM, &ret, idx);
		}
	}
	return ret;
}

AMX *CScripts::GetGameMode()
{
	return (AMX *)pYSI->GetServer()->GetGameMode();
}

AMX **CScripts::GetFilterScripts()
{
	return (AMX **)pYSI->GetServer()->GetFilterScripts();
}
