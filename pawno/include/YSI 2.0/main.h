#pragma once
#include "./SDK/amx/amx.h"
#include "./SDK/plugincommon.h"

#define MAX_PLAYERS (200)
#define INVALID_PLAYER_ID (255)

#define MAX_FILTER_SCRIPTS (50)

typedef void (* logprintf_t)(char *, ...);

typedef unsigned char PLAYERID;

#ifndef NULL
	#ifdef __cplusplus
		#define NULL (0)
	#else
		#define NULL ((void *)0)
	#endif
#endif

#define SERVER_VERSION_0221 (0x0221)
#define SERVER_VERSION_0222 (0x0222)
#define SERVER_VERSION_0223 (0x0223)
