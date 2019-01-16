//----------------------------------------------------------
//
//   SA:MP Multiplayer Modification For GTA:SA
//   Copyright 2004-2007 SA:MP Team
//
//----------------------------------------------------------

#include "main.h"
#include "Source/YSI.h"
#include "Source/Scripting.h"
#include "Source/Addresses.h"

//----------------------------------------------------------

logprintf_t
	logprintf;

void
	**ppPluginData;

extern void
	*pAMXFunctions;

CYSI
	*pYSI = NULL;

int
	g_iServerVersion = 0;

bool
	g_bFirstTime = false;

void SetModeRestartTime(float time);
void InstallPreHooks();
void InstallPostHooks();

//----------------------------------------------------------
// The Support() function indicates what possibilities this
// plugin has. The SUPPORTS_VERSION flag is required to check
// for compatibility with the server. 

PLUGIN_EXPORT unsigned int PLUGIN_CALL Supports() 
{
	return SUPPORTS_VERSION | SUPPORTS_AMX_NATIVES;
}

//----------------------------------------------------------
// The Load() function gets passed on exported functions from
// the SA-MP Server, like the AMX Functions and logprintf().
// Should return true if loading the plugin has succeeded.

PLUGIN_EXPORT bool PLUGIN_CALL Load(void **ppData)
{
	pAMXFunctions = ppData[PLUGIN_DATA_AMX_EXPORTS];
	logprintf = (logprintf_t)ppData[PLUGIN_DATA_LOGPRINTF];

	if (logprintf == LOGPRINTF_0221)
	{
		g_iServerVersion = SERVER_VERSION_0221;
	}
	else if (logprintf == LOGPRINTF_0222)
	{
		g_iServerVersion = SERVER_VERSION_0222;
	}
	else if (logprintf == LOGPRINTF_0223)
	{
		g_iServerVersion = SERVER_VERSION_0223;
	}
	
	logprintf("\n ===============================\n");
	logprintf("         YSI 2.0 loaded\n");
	logprintf("   (c) 2008 Alex \"Y_Less\" Cole\n");
	logprintf("     Server version: %d.%d.%dR%d\n", (g_iServerVersion >> 014) & 0x0F, (g_iServerVersion >> 010) & 0x0F, (g_iServerVersion >> 004) & 0x0F, (g_iServerVersion >> 000) & 0x0F);
	logprintf(" ===============================\n");
	
	InstallPreHooks();
	
	pYSI = new CYSI();
	
	return pYSI ? true : false;
}

//----------------------------------------------------------
// The Unload() function is called when the server shuts down,
// meaning this plugin gets shut down with it.

PLUGIN_EXPORT void PLUGIN_CALL Unload()
{
	logprintf("\n ==================\n");
	logprintf("  YSI 2.0 unloaded\n");
	logprintf(" ==================");
}

//----------------------------------------------------------
// The AmxLoad() function gets called when a new gamemode or
// filterscript gets loaded with the server. In here we register
// the native functions we like to add to the scripts.

PLUGIN_EXPORT int PLUGIN_CALL AmxLoad(AMX *amx) 
{
	if (!g_bFirstTime)
	{
		// Certain server aspects we need are loaded AFTER plugins
		InstallPostHooks();
		pYSI->LateInit();
		g_bFirstTime = true;
	}
	else if (amx == pYSI->GetServer()->GetGameMode())
	{
		// The gamemode restarted - reset the restart time
		SetModeRestartTime(12.0);
	}
	else
	{
		// This is a plugin - repair SQLite access
		InitSQLite(amx);
	}
	return InitScripting(amx);
}

//----------------------------------------------------------
// When a gamemode is over or a filterscript gets unloaded, this
// function gets called. No special actions needed in here.

PLUGIN_EXPORT int PLUGIN_CALL AmxUnload(AMX *amx) 
{
	if (amx == pYSI->GetServer()->GetGameMode())
	{
		pYSI->Reset();
	}
	return AMX_ERR_NONE;
}
