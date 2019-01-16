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
#include "Scripting.h"
#include "Addresses.h"

extern CYSI
	*pYSI;
extern logprintf_t
	logprintf;
extern int
	g_iServerVersion;

void SetModeRestartTime(float time);

// native CreateObject(model, Float:x, Float:y, Float:z, Float:rx, Float:ry, Float:rz);
static cell AMX_NATIVE_CALL n_CreateObject(AMX *amx, cell *params)
{
	CHECK_PARAMS(7, "CreateObject");
	if (pYSI)
	{
		CObjectPool
			*pObjectPool = pYSI->GetObjectPool();
		if (pObjectPool)
		{
			return pObjectPool->New(params[1], amx_ctof(params[2]), amx_ctof(params[3]), amx_ctof(params[4]), amx_ctof(params[5]), amx_ctof(params[6]), amx_ctof(params[7]));
		}
	}
	return 0;
}

// native CreatePlayerObject(playerid, model, Float:x, Float:y, Float:z, Float:rx, Float:ry, Float:rz);
static cell AMX_NATIVE_CALL n_CreatePlayerObject(AMX *amx, cell *params)
{
	CHECK_PARAMS(8, "CreatePlayerObject");
	if (pYSI)
	{
		CObjectPool
			*pObjectPool = pYSI->GetObjectPool();
		if (pObjectPool)
		{
			return pObjectPool->New(params[2], amx_ctof(params[3]), amx_ctof(params[4]), amx_ctof(params[5]), amx_ctof(params[6]), amx_ctof(params[7]), amx_ctof(params[8]), params[1]);
		}
	}
	return 0;
}

// native DestroyObject(objectid);
static cell AMX_NATIVE_CALL n_DestroyObject(AMX *amx, cell *params)
{
	CHECK_PARAMS(1, "DestroyObject");
	if (pYSI)
	{
		CObjectPool
			*pObjectPool = pYSI->GetObjectPool();
		if (pObjectPool)
		{
			pObjectPool->Delete(params[1]);
			return 1;
		}
	}
	return 0;
}

// native MoveObject(objectid, Float:x, Float:y, Float:z, Float:speed);
static cell AMX_NATIVE_CALL n_MoveObject(AMX *amx, cell *params)
{
	CHECK_PARAMS(5, "MoveObject");
	if (pYSI)
	{
		CObjectPool
			*pObjectPool = pYSI->GetObjectPool();
		if (pObjectPool)
		{
			CObject
				*pObject = pObjectPool->GetAt(params[1]);
			if (pObject)
			{
				pObject->Move(amx_ctof(params[2]), amx_ctof(params[3]), amx_ctof(params[4]), amx_ctof(params[5]));
				return 1;
			}
		}
	}
	return 0;
}

// native SetObjectPos(objectid, Float:x, Float:y, Float:z);
static cell AMX_NATIVE_CALL n_SetObjectPos(AMX *amx, cell *params)
{
	CHECK_PARAMS(4, "SetObjectPos");
	if (pYSI)
	{
		CObjectPool
			*pObjectPool = pYSI->GetObjectPool();
		if (pObjectPool)
		{
			CObject
				*pObject = pObjectPool->GetAt(params[1]);
			if (pObject)
			{
				pObject->SetPos(amx_ctof(params[2]), amx_ctof(params[3]), amx_ctof(params[4]));
				return 1;
			}
		}
	}
	return 0;
}

// native SetObjectRot(objectid, Float:x, Float:y, Float:z);
static cell AMX_NATIVE_CALL n_SetObjectRot(AMX *amx, cell *params)
{
	CHECK_PARAMS(4, "SetObjectRot");
	if (pYSI)
	{
		CObjectPool
			*pObjectPool = pYSI->GetObjectPool();
		if (pObjectPool)
		{
			CObject
				*pObject = pObjectPool->GetAt(params[1]);
			if (pObject)
			{
				pObject->SetRot(amx_ctof(params[2]), amx_ctof(params[3]), amx_ctof(params[4]));
				return 1;
			}
		}
	}
	return 0;
}

// native GetObjectPos(objectid, &Float:x, &Float:y, &Float:z);
static cell AMX_NATIVE_CALL n_GetObjectPos(AMX *amx, cell *params)
{
	CHECK_PARAMS(4, "GetObjectPos");
	if (pYSI)
	{
		CObjectPool
			*pObjectPool = pYSI->GetObjectPool();
		if (pObjectPool)
		{
			CObject
				*pObject = pObjectPool->GetAt(params[1]);
			if (pObject)
			{
				float
					x,
					y,
					z;
				pObject->GetPos(&x, &y, &z);
				cell
					*pCell;
				amx_GetAddr(amx, params[2], &pCell);
				*pCell = amx_ftoc(x);
				amx_GetAddr(amx, params[3], &pCell);
				*pCell = amx_ftoc(y);
				amx_GetAddr(amx, params[4], &pCell);
				*pCell = amx_ftoc(z);
				return 1;
			}
		}
	}
	return 0;
}

// native GetObjectRot(objectid, &Float:x, &Float:y, &Float:z);
static cell AMX_NATIVE_CALL n_GetObjectRot(AMX *amx, cell *params)
{
	CHECK_PARAMS(4, "GetObjectRot");
	if (pYSI)
	{
		CObjectPool
			*pObjectPool = pYSI->GetObjectPool();
		if (pObjectPool)
		{
			CObject
				*pObject = pObjectPool->GetAt(params[1]);
			if (pObject)
			{
				float
					x,
					y,
					z;
				pObject->GetRot(&x, &y, &z);
				cell
					*pCell;
				amx_GetAddr(amx, params[2], &pCell);
				*pCell = amx_ftoc(x);
				amx_GetAddr(amx, params[3], &pCell);
				*pCell = amx_ftoc(y);
				amx_GetAddr(amx, params[4], &pCell);
				*pCell = amx_ftoc(z);
				return 1;
			}
		}
	}
	return 0;
}

// native DestroyPlayerObject(playerid, objectid);
static cell AMX_NATIVE_CALL n_DestroyPlayerObject(AMX *amx, cell *params)
{
	CHECK_PARAMS(2, "DestroyPlayerObject");
	if (pYSI)
	{
		CObjectPool
			*pObjectPool = pYSI->GetObjectPool();
		if (pObjectPool)
		{
			pObjectPool->Delete(params[2]);
			return 1;
		}
	}
	return 0;
}

// native MovePlayerObject(playerid, objectid, Float:x, Float:y, Float:z, Float:speed);
static cell AMX_NATIVE_CALL n_MovePlayerObject(AMX *amx, cell *params)
{
	CHECK_PARAMS(6, "MovePlayerObject");
	if (pYSI)
	{
		CObjectPool
			*pObjectPool = pYSI->GetObjectPool();
		if (pObjectPool)
		{
			CObject
				*pObject = pObjectPool->GetAt(params[2]);
			if (pObject)
			{
				pObject->Move(amx_ctof(params[3]), amx_ctof(params[4]), amx_ctof(params[5]), amx_ctof(params[5]));
				return 1;
			}
		}
	}
	return 0;
}

// native SetPlayerObjectPos(playerid, objectid, Float:x, Float:y, Float:z);
static cell AMX_NATIVE_CALL n_SetPlayerObjectPos(AMX *amx, cell *params)
{
	CHECK_PARAMS(5, "SetPlayerObjectPos");
	if (pYSI)
	{
		CObjectPool
			*pObjectPool = pYSI->GetObjectPool();
		if (pObjectPool)
		{
			CObject
				*pObject = pObjectPool->GetAt(params[2]);
			if (pObject)
			{
				pObject->SetPos(amx_ctof(params[3]), amx_ctof(params[4]), amx_ctof(params[5]));
				return 1;
			}
		}
	}
	return 0;
}

// native SetPlayerObjectRot(playerid, objectid, Float:x, Float:y, Float:z);
static cell AMX_NATIVE_CALL n_SetPlayerObjectRot(AMX *amx, cell *params)
{
	CHECK_PARAMS(5, "SetPlayerObjectRot");
	if (pYSI)
	{
		CObjectPool
			*pObjectPool = pYSI->GetObjectPool();
		if (pObjectPool)
		{
			CObject
				*pObject = pObjectPool->GetAt(params[2]);
			if (pObject)
			{
				pObject->SetRot(amx_ctof(params[3]), amx_ctof(params[4]), amx_ctof(params[5]));
				return 1;
			}
		}
	}
	return 0;
}

// native GetPlayerObjectPos(playerid, objectid, &Float:x, &Float:y, &Float:z);
static cell AMX_NATIVE_CALL n_GetPlayerObjectPos(AMX *amx, cell *params)
{
	CHECK_PARAMS(5, "GetPlayerObjectPos");
	if (pYSI)
	{
		CObjectPool
			*pObjectPool = pYSI->GetObjectPool();
		if (pObjectPool)
		{
			CObject
				*pObject = pObjectPool->GetAt(params[2]);
			if (pObject)
			{
				float
					x,
					y,
					z;
				pObject->GetPos(&x, &y, &z);
				cell
					*pCell;
				amx_GetAddr(amx, params[3], &pCell);
				*pCell = amx_ftoc(x);
				amx_GetAddr(amx, params[4], &pCell);
				*pCell = amx_ftoc(y);
				amx_GetAddr(amx, params[5], &pCell);
				*pCell = amx_ftoc(z);
				return 1;
			}
		}
	}
	return 0;
}

// native GetPlayerObjectRot(playerid, objectid, &Float:x, &Float:y, &Float:z);
static cell AMX_NATIVE_CALL n_GetPlayerObjectRot(AMX *amx, cell *params)
{
	CHECK_PARAMS(5, "GetPlayerObjectRot");
	if (pYSI)
	{
		CObjectPool
			*pObjectPool = pYSI->GetObjectPool();
		if (pObjectPool)
		{
			CObject
				*pObject = pObjectPool->GetAt(params[2]);
			if (pObject)
			{
				float
					x,
					y,
					z;
				pObject->GetRot(&x, &y, &z);
				cell
					*pCell;
				amx_GetAddr(amx, params[3], &pCell);
				*pCell = amx_ftoc(x);
				amx_GetAddr(amx, params[4], &pCell);
				*pCell = amx_ftoc(y);
				amx_GetAddr(amx, params[5], &pCell);
				*pCell = amx_ftoc(z);
				return 1;
			}
		}
	}
	return 0;
}

// native StopPlayerObject(playerid, objectid);
static cell AMX_NATIVE_CALL n_StopPlayerObject(AMX *amx, cell *params)
{
	CHECK_PARAMS(2, "StopPlayerObject");
	if (pYSI)
	{
		CObjectPool
			*pObjectPool = pYSI->GetObjectPool();
		if (pObjectPool)
		{
			CObject
				*pObject = pObjectPool->GetAt(params[2]);
			if (pObject)
			{
				pObject->Stop();
				return 1;
			}
		}
	}
	return 0;
}

// native StopObject(objectid);
static cell AMX_NATIVE_CALL n_StopObject(AMX *amx, cell *params)
{
	CHECK_PARAMS(1, "StopObject");
	if (pYSI)
	{
		CObjectPool
			*pObjectPool = pYSI->GetObjectPool();
		if (pObjectPool)
		{
			CObject
				*pObject = pObjectPool->GetAt(params[1]);
			if (pObject)
			{
				pObject->Stop();
				return 1;
			}
		}
	}
	return 0;
}

// native IsValidObject(objectid);
static cell AMX_NATIVE_CALL n_IsValidObject(AMX *amx, cell *params)
{
	CHECK_PARAMS(1, "IsValidObject");
	if (pYSI)
	{
		CObjectPool
			*pObjectPool = pYSI->GetObjectPool();
		if (pObjectPool)
		{
			if (pObjectPool->GetAt(params[1]))
			{
				return 1;
			}
		}
	}
	return 0;
}

// native IsValidPlayerObject(playerid, objectid);
static cell AMX_NATIVE_CALL n_IsValidPlayerObject(AMX *amx, cell *params)
{
	CHECK_PARAMS(2, "IsValidPlayerObject");
	if (pYSI)
	{
		CObjectPool
			*pObjectPool = pYSI->GetObjectPool();
		if (pObjectPool)
		{
			if (pObjectPool->GetAt(params[2]))
			{
				return 1;
			}
		}
	}
	return 0;
}

// native SetModeRestartTime(Float:time);
static cell AMX_NATIVE_CALL n_SetModeRestartTime(AMX *amx, cell *params)
{
	CHECK_PARAMS(1, "SetModeRestartTime");
	SetModeRestartTime(amx_ctof(params[1]));
	return 1;
}

// native Area_AddCube(Float:minx, Float:miny, Float:minz, Float:maxx, Float:maxy, Float:maxz);
static cell AMX_NATIVE_CALL n_Area_AddCube(AMX *amx, cell *params)
{
	CHECK_PARAMS(6, "Area_AddCube");
	if (pYSI)
	{
		CAreaPool
			*pAreaPool = pYSI->GetAreaPool();
		if (pAreaPool)
		{
			return pAreaPool->NewCube(amx_ctof(params[1]), amx_ctof(params[2]), amx_ctof(params[3]), amx_ctof(params[4]), amx_ctof(params[5]), amx_ctof(params[6]));
		}
	}
	return 0;
}

// native Area_AddBox(Float:minx, Float:miny, Float:maxx, Float:maxy);
static cell AMX_NATIVE_CALL n_Area_AddBox(AMX *amx, cell *params)
{
	CHECK_PARAMS(4, "Area_AddBox");
	if (pYSI)
	{
		CAreaPool
			*pAreaPool = pYSI->GetAreaPool();
		if (pAreaPool)
		{
			return pAreaPool->NewBox(amx_ctof(params[1]), amx_ctof(params[2]), amx_ctof(params[3]), amx_ctof(params[4]));
		}
	}
	return 0;
}

// And an array containing the native function-names and the functions specified with them
AMX_NATIVE_INFO YSINatives[] =
{
	// Object natives
	{"CreateDynamicObject",			n_CreateObject},
	{"CreatePlayerDynamicObject",	n_CreatePlayerObject},
	{"DestroyDynamicObject",		n_DestroyObject},
	{"MoveDynamicObject",			n_MoveObject},
	{"SetDynamicObjectPos",			n_SetObjectPos},
	{"SetDynamicObjectRot",			n_SetObjectRot},
	{"GetDynamicObjectPos",			n_GetObjectPos},
	{"GetDynamicObjectRot",			n_GetObjectRot},
	{"StopDynamicObject",			n_StopObject},
	{"IsValidDynamicObject",		n_IsValidObject},
	
	// Area natives
	{"Area_AddCube",				n_Area_AddCube},
	{"Area_AddBox",					n_Area_AddBox},
	
	// Generic natives
	{"SetModeRestartTime",			n_SetModeRestartTime},

	// End
	{0,							0}
};

int InitScripting(AMX *amx)
{
	return amx_Register(amx, YSINatives, -1);
}

int InitSQLite(AMX *amx)
{
	switch (g_iServerVersion)
	{
		case SERVER_VERSION_0221:
			return amx_Register(amx, SQLITE_FUNCTIONS_0221, -1);
		case SERVER_VERSION_0222:
			return amx_Register(amx, SQLITE_FUNCTIONS_0222, -1);
		case SERVER_VERSION_0223:
			return amx_Register(amx, SQLITE_FUNCTIONS_0223, -1);
	}
	return 0;
}

void Redirect(DWORD from, DWORD to)
{
	DWORD
		oldp,
		newp;
	VirtualProtect((LPVOID)from, 4, PAGE_EXECUTE_READWRITE, &oldp);
	*(PDWORD)(from) = to;
	VirtualProtect((LPVOID)from, 4, oldp, &newp);
}

// This function redirects existing natives to our new ones so we can fix them.
// This is done so we can issue updates faster
void RedirectNatives()
{
	switch (g_iServerVersion)
	{
		case SERVER_VERSION_0221:
			Redirect(DESTROY_OBJECT_0221,			(DWORD)n_DestroyObject);
			Redirect(CREATE_OBJECT_0221,			(DWORD)n_CreateObject);
			Redirect(CREATE_PLAYER_OBJECT_0221,		(DWORD)n_CreatePlayerObject);
			Redirect(DESTROY_PLAYER_OBJECT_0221,	(DWORD)n_DestroyPlayerObject);
			Redirect(SET_OBJECT_POS_0221,			(DWORD)n_SetObjectPos);
			Redirect(GET_OBJECT_POS_0221,			(DWORD)n_GetObjectPos);
			Redirect(SET_PLAYER_OBJECT_POS_0221,	(DWORD)n_SetPlayerObjectPos);
			Redirect(GET_PLAYER_OBJECT_POS_0221,	(DWORD)n_GetPlayerObjectPos);
			Redirect(SET_OBJECT_ROT_0221,			(DWORD)n_SetObjectRot);
			Redirect(GET_OBJECT_ROT_0221,			(DWORD)n_GetObjectRot);
			Redirect(SET_PLAYER_OBJECT_ROT_0221,	(DWORD)n_SetPlayerObjectRot);
			Redirect(GET_PLAYER_OBJECT_ROT_0221,	(DWORD)n_GetPlayerObjectRot);
			Redirect(MOVE_OBJECT_0221,				(DWORD)n_MoveObject);
			Redirect(MOVE_PLAYER_OBJECT_0221,		(DWORD)n_MovePlayerObject);
			Redirect(STOP_OBJECT_0221,				(DWORD)n_StopObject);
			Redirect(STOP_PLAYER_OBJECT_0221,		(DWORD)n_StopPlayerObject);
			Redirect(IS_VALID_OBJECT_0221,			(DWORD)n_IsValidObject);
			Redirect(IS_VALID_PLAYER_OBJECT_0221,	(DWORD)n_IsValidPlayerObject);
			break;
		case SERVER_VERSION_0222:
			Redirect(DESTROY_OBJECT_0222,			(DWORD)n_DestroyObject);
			Redirect(CREATE_OBJECT_0222,			(DWORD)n_CreateObject);
			Redirect(CREATE_PLAYER_OBJECT_0222,		(DWORD)n_CreatePlayerObject);
			Redirect(DESTROY_PLAYER_OBJECT_0222,	(DWORD)n_DestroyPlayerObject);
			Redirect(SET_OBJECT_POS_0222,			(DWORD)n_SetObjectPos);
			Redirect(GET_OBJECT_POS_0222,			(DWORD)n_GetObjectPos);
			Redirect(SET_PLAYER_OBJECT_POS_0222,	(DWORD)n_SetPlayerObjectPos);
			Redirect(GET_PLAYER_OBJECT_POS_0222,	(DWORD)n_GetPlayerObjectPos);
			Redirect(SET_OBJECT_ROT_0222,			(DWORD)n_SetObjectRot);
			Redirect(GET_OBJECT_ROT_0222,			(DWORD)n_GetObjectRot);
			Redirect(SET_PLAYER_OBJECT_ROT_0222,	(DWORD)n_SetPlayerObjectRot);
			Redirect(GET_PLAYER_OBJECT_ROT_0222,	(DWORD)n_GetPlayerObjectRot);
			Redirect(MOVE_OBJECT_0222,				(DWORD)n_MoveObject);
			Redirect(MOVE_PLAYER_OBJECT_0222,		(DWORD)n_MovePlayerObject);
			Redirect(STOP_OBJECT_0222,				(DWORD)n_StopObject);
			Redirect(STOP_PLAYER_OBJECT_0222,		(DWORD)n_StopPlayerObject);
			Redirect(IS_VALID_OBJECT_0222,			(DWORD)n_IsValidObject);
			Redirect(IS_VALID_PLAYER_OBJECT_0222,	(DWORD)n_IsValidPlayerObject);
			break;
		case SERVER_VERSION_0223:
			Redirect(DESTROY_OBJECT_0223,			(DWORD)n_DestroyObject);
			Redirect(CREATE_OBJECT_0223,			(DWORD)n_CreateObject);
			Redirect(CREATE_PLAYER_OBJECT_0223,		(DWORD)n_CreatePlayerObject);
			Redirect(DESTROY_PLAYER_OBJECT_0223,	(DWORD)n_DestroyPlayerObject);
			Redirect(SET_OBJECT_POS_0223,			(DWORD)n_SetObjectPos);
			Redirect(GET_OBJECT_POS_0223,			(DWORD)n_GetObjectPos);
			Redirect(SET_PLAYER_OBJECT_POS_0223,	(DWORD)n_SetPlayerObjectPos);
			Redirect(GET_PLAYER_OBJECT_POS_0223,	(DWORD)n_GetPlayerObjectPos);
			Redirect(SET_OBJECT_ROT_0223,			(DWORD)n_SetObjectRot);
			Redirect(GET_OBJECT_ROT_0223,			(DWORD)n_GetObjectRot);
			Redirect(SET_PLAYER_OBJECT_ROT_0223,	(DWORD)n_SetPlayerObjectRot);
			Redirect(GET_PLAYER_OBJECT_ROT_0223,	(DWORD)n_GetPlayerObjectRot);
			Redirect(MOVE_OBJECT_0223,				(DWORD)n_MoveObject);
			Redirect(MOVE_PLAYER_OBJECT_0223,		(DWORD)n_MovePlayerObject);
			Redirect(STOP_OBJECT_0223,				(DWORD)n_StopObject);
			Redirect(STOP_PLAYER_OBJECT_0223,		(DWORD)n_StopPlayerObject);
			Redirect(IS_VALID_OBJECT_0223,			(DWORD)n_IsValidObject);
			Redirect(IS_VALID_PLAYER_OBJECT_0223,	(DWORD)n_IsValidPlayerObject);
			break;
	}
}
