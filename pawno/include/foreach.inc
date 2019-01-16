/*----------------------------------------------------------------------------*-
					===========================
					 foreach efficient looping
					===========================
Description:
	Provides functionality to loop efficiently through all connected players.
	Removes reliance on both modification of MAX_PLAYERS for more efficient
	processing on small servers (although still recommended) and 
	IsPlayerConnected.
Legal:
	Copyright (C) 2007 Alex "Y_Less" Cole

	This program is free software; you can redistribute it and/or
	modify it under the terms of the GNU General Public License
	as published by the Free Software Foundation; either version 2
	of the License, or (at your option) any later version.

	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.

	You should have received a copy of the GNU General Public License
	along with this program; if not, write to the Free Software
	Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
	MA 02110-1301, USA.
Version:
	0.1.5
Changelog:
	02/09/09:
		Fixed (again) for 0.3.
		Added free slot finding.
	21/08/09:
		Updated to include random functions.
		Made entirely stand alone.
		Ported to 0.3 (separate version).
		Added automatic callback hook code.
		Removed debug information from stand alone version.
	06/01/08:
		Added debug information.
	09/10/07:
		Moved to system.
	16/09/07:
		Added list sorting.
		Made this part of Y SeRver Includes, not Y Sever Includes.
		Made list sorting optional.
		Fixed version number.
	08/09/07:
		First version.
Functions:
	Public:
		OnPlayerDisconnect - Called when a player leaves to remove them.
		OnPlayerConnect - Called when a player connects to add them.
	Core:
		-
	Stock:
		Itter_ShowArray - Displays the contents of the array.
		Itter_AddInternal - Add a value to an itterator.
		Itter_RemoveInternal - Remove a value from an itterator.
		Itter_RandomInternal - Get a random item from an itterator.
		Itter_FreeInternal - Gets the first free slot in the itterator.
	Static:
		-
	Inline:
		Itter_Create - Create a new itterator value set.
		Itter_Add - Wraps Itter_AddInternal.
		Itter_Remove - Wraps Itter_RemoveInternal.
		Itter_Random - Wraps Itter_RandomInternal.
		Itter_Count - Gets the number of items in an itterator.
		Itter_Debug - Wraps around Itter_ShowArray so you can use an itterator.
		Itter_Free - Wraps around Itter_FreeInternal.
	API:
		-
Callbacks:
	-
Hooks:
	Itter_OnPlayerConnect - Hook for the OnPlayerConnect callback.
	Itter_OnPlayerDisconnect - Hook for the OnPlayerDisconnect callback.
	Itter_OnGameModeInit - Only exists to make the code compile correctly...
Definitions:
	-
Enums:
	-
Macros:
	foreach - Command to loop through all connected players efficiently.
	foreachex - Like foreach but without a new variable.
Tags:
	-
Variables:
	Global:
		-
	Static:
		YSI_g_OPC - Records wether Itter_OnPlayerConnect exists for speed.
Commands:
	-
Compile options:
	YSI_ITTER_NO_SORT - Removed.
	FOREACH_NO_BOTS - Remove the bot iterators for smaller code.
	FOREACH_NO_PLAYERS - Remove all code for player itteration.
Operators:
	-
Iterators:
	Player - List of all players connected.
	Bot - List of all bots (npcs) connected.
	NPC - Alias of Bot.
	Character - All players and bots.
-*----------------------------------------------------------------------------*/

#if defined _foreach_included
	#endinput
#endif
#define _foreach_included

#if !defined _samp_included
	#error "Please include a_samp or a_npc before foreach"
#endif

#if defined SendChat || defined FOREACH_NO_PLAYERS
	#define BOTSYNC_IS_BOT     (true)
#endif

#if defined IsPlayerNPC
	#define _FOREACH_BOT
#endif

#if !defined BOTSYNC_IS_BOT
	static
		bool:YSI_g_OPC = false,
		bool:YSI_g_OPDC = false;
#endif

#if defined YSI_ITTER_NO_SORT
	#error "YSI_ITTER_NO_SORT is no longer supported by foreach"
#endif

/*----------------------------------------------------------------------------*-
Function:
	Itter_Create
Params:
	name - Itterator identifier.
	size - Number of values.
Return:
	-
Notes:
	Creates a new itterator start/array pair.
-*----------------------------------------------------------------------------*/

#define Iter_Create Itter_Create
#define Itter_Create(%1,%2) \
	new \
		YSI_g%1S = -1, \
		YSI_g%1C = 0, \
		YSI_g%1A[%2] = {-1, ...}

/*----------------------------------------------------------------------------*-
Function:
	Itter_Add
Params:
	itter - Name of the itterator to add the data to.
	value - Value to add to the itterator.
Return:
	-
Notes:
	Wrapper for Itter_AddInternal.
-*----------------------------------------------------------------------------*/

#define Iter_Add Itter_Add
#define Itter_Add(%1,%2) \
	Itter_AddInternal(YSI_g%1S, YSI_g%1C, YSI_g%1A, %2)

/*----------------------------------------------------------------------------*-
Function:
	Itter_Free
Params:
	itter - Name of the itterator to get the first free slot in.
Return:
	-
Notes:
	Wrapper for Itter_FreeInternal.
-*----------------------------------------------------------------------------*/

#define Iter_Free Itter_Free
#define Itter_Free(%1) \
	Itter_FreeInternal(YSI_g%1S, YSI_g%1C, YSI_g%1A, sizeof (YSI_g%1A))

/*----------------------------------------------------------------------------*-
Function:
	Itter_Remove
Params:
	itter - Name of the itterator to remove data from.
	value - Data to remove.
Return:
	-
Notes:
	Wrapper for Itter_RemoveInternal.
-*----------------------------------------------------------------------------*/

#define Iter_Remove Itter_Remove
#define Itter_Remove(%1,%2) \
	Itter_RemoveInternal(YSI_g%1S, YSI_g%1C, YSI_g%1A, %2)

/*----------------------------------------------------------------------------*-
Function:
	Itter_Random
Params:
	itter - Name of the itterator to get a random slot from.
Return:
	-
Notes:
	Wrapper for Itter_RandomInternal.
-*----------------------------------------------------------------------------*/

#define Iter_Random Itter_Random
#define Itter_Random(%1) \
	Itter_RandomInternal(YSI_g%1S, YSI_g%1C, YSI_g%1A)

/*----------------------------------------------------------------------------*-
Function:
	Itter_Debug
Params:
	itter - Name of the itterator to output debug information from.
Return:
	-
Notes:
	Wrapper for Itter_ShowArray.
-*----------------------------------------------------------------------------*/

#define Iter_Debug Itter_Debug
#define Itter_Debug(%1) \
	Itter_ShowArray(YSI_g%1S, YSI_g%1A, YSI_g%1C)

/*----------------------------------------------------------------------------*-
Function:
	Itter_Count
Params:
	itter - Name of the itterator to get a random slot from4.
Return:
	-
Notes:
	Returns the number of items in this itterator.
-*----------------------------------------------------------------------------*/

#define Iter_Count Itter_Count
#define Itter_Count(%1) \
	YSI_g%1C

/*----------------------------------------------------------------------------*-
Create the internal itterators.
-*----------------------------------------------------------------------------*/

#if !defined BOTSYNC_IS_BOT
	Itter_Create(Player, MAX_PLAYERS);
	
	#if defined _FOREACH_BOT && !defined FOREACH_NO_BOTS
		Itter_Create(Bot, MAX_PLAYERS);
		Itter_Create(Character, MAX_PLAYERS);
		
		#define YSI_gNPCS YSI_gBotS
		#define YSI_gNPCC YSI_gBotC
		#define YSI_gNPCA YSI_gBotA
	#endif
#endif

/*----------------------------------------------------------------------------*-
Function:
	foreach
Params:
	data - Data to itterate through.
	as - Variable to set value to.
Return:
	-
Notes:
	Not exactly the same as PHP foreach, just itterates through a list and
	returns the value of the current slot but uses that slot as the next index
	too.  Variables must be in the form YSI_g<name>S for the start index and
	YSI_g<name>A for the data array where <name> is what's entered in data.
-*----------------------------------------------------------------------------*/

#define foreach(%1,%2) \
	for (new %2 = YSI_g%1S; %2 != -1; %2 = YSI_g%1A[%2])

/*----------------------------------------------------------------------------*-
Function:
	foreachex
Params:
	data - Data to itterate through.
	as - Variable to set value to.
Return:
	-
Notes:
	Similar to foreach but doesn't declare a new variable for the itterator.
-*----------------------------------------------------------------------------*/

#define foreachex(%1,%2) \
	for (%2 = YSI_g%1S; %2 != -1; %2 = YSI_g%1A[%2])

/*----------------------------------------------------------------------------*-
Function:
	Itter_OnPlayerConnect
Params:
	playerid - Player who joined.
Return:
	-
Notes:
	Adds a player to the loop data.  Now sorts the list too.  Note that I found
	the most bizzare bug ever (I *think* it may be a compiler but, but it
	requires further investigation), basically it seems that multiple variables
	were being treated as the same variable (namely YSI_gBotS and
	YSI_gCharacterS were the same and YSI_gBotC and YSI_gCharacterC were the
	same).  Adding print statements which reference these variables seem to fix
	the problem, and I've tried to make sure that the values will never actually
	get printed.
-*----------------------------------------------------------------------------*/

#if !defined BOTSYNC_IS_BOT
	public OnPlayerConnect(playerid)
	{
		#if defined _FOREACH_BOT
			if (!IsPlayerNPC(playerid))
			{
				Itter_Add(Player, playerid);
			}
			#if !defined FOREACH_NO_BOTS
				else
				{
					Itter_Add(Bot, playerid);
				}
				#pragma tabsize 4
				Itter_Add(Character, playerid);
			#endif
		#else
			Itter_Add(Player, playerid);
		#endif
		if (YSI_g_OPC)
		{
			CallLocalFunction("Itter_OnPlayerConnect", "i", playerid);
		}
		return 1;
	}
	
	#if defined _ALS_OnPlayerConnect
		#undef OnPlayerConnect
	#else
		#define _ALS_OnPlayerConnect
	#endif
	#define OnPlayerConnect Itter_OnPlayerConnect
	
	forward Itter_OnPlayerConnect(playerid);
#endif

/*----------------------------------------------------------------------------*-
Function:
	Itter_OnGameModeInit
Params:
	-
Return:
	-
Notes:
	There are WIERD bugs in this script, seemingly caused by the compiler, so
	this hopefully fixes them.
-*----------------------------------------------------------------------------*/

#if !defined BOTSYNC_IS_BOT
	public OnGameModeInit()
	{
		printf("foreach called");
		if (YSI_gPlayerC)
		{
			print("foreach error: Something went wrong again!  Please tell Y_less");
			#if defined _FOREACH_BOT && !defined FOREACH_NO_BOTS
				printf("%d", YSI_gBotS);
				printf("%d", YSI_gBotC);
				printf("%d", YSI_gCharacterS);
				printf("%d", YSI_gCharacterC);
			#endif
			printf("%d", YSI_gPlayerS);
			printf("%d", YSI_gPlayerC);
		}
		YSI_g_OPC = (funcidx("Itter_OnPlayerConnect") != -1);
		YSI_g_OPDC = (funcidx("Itter_OnPlayerDisconnect") != -1);
		CallLocalFunction("Itter_OnGameModeInit", "");
	}
	
	#if defined _ALS_OnGameModeInit
		#undef OnGameModeInit
	#else
		#define _ALS_OnGameModeInit
	#endif
	#define OnGameModeInit Itter_OnGameModeInit
	
	forward Itter_OnGameModeInit();
#endif

/*----------------------------------------------------------------------------*-
Function:
	Itter_OnPlayerDisconnect
Params:
	playerid - Player who left.
Return:
	-
Notes:
	Removes a player from the loop data.
-*----------------------------------------------------------------------------*/

#if !defined BOTSYNC_IS_BOT
	public OnPlayerDisconnect(playerid, reason)
	{
		#if defined _FOREACH_BOT
			if (!IsPlayerNPC(playerid))
			{
				Itter_Remove(Player, playerid);
			}
			#if !defined FOREACH_NO_BOTS
				else
				{
					Itter_Remove(Bot, playerid);
				}
				#pragma tabsize 4
				Itter_Remove(Character, playerid);
			#endif
		#else
			Itter_Remove(Player, playerid);
		#endif
		if (YSI_g_OPDC)
		{
			CallLocalFunction("Itter_OnPlayerDisconnect", "ii", playerid, reason);
		}
		return 1;
	}
	
	#if defined _ALS_OnPlayerDisconnect
		#undef OnPlayerDisconnect
	#else
		#define _ALS_OnPlayerDisconnect
	#endif
	#define OnPlayerDisconnect Itter_OnPlayerDisconnect
	
	forward Itter_OnPlayerDisconnect(playerid, reason);
#endif

/*----------------------------------------------------------------------------*-
Function:
	Itter_ShowArray
Params:
	start - Itterator start point.
	members[] - Itterator contents.
	size - Number of itterator values
Return:
	-
Notes:
	Pure debug function.  Has regular prints not debug prints
	as it's only called when debug is on.
-*----------------------------------------------------------------------------*/

stock Itter_ShowArray(start, members[], size)
{
	static
		sString[61];
	new
		i,
		j = 10;
	printf("Start: %d", start);
	printf("Size:  %d", size);
	while (i < size)
	{
		sString[0] = '\0';
		while (i < j && i < size)
		{
			format(sString, sizeof (sString), "%s, %d", sString, members[i]);
			i++;
		}
		printf("Array (%d): %s", j, sString);
		j += 10;
	}
}

/*----------------------------------------------------------------------------*-
Function:
	Itter_RandomInternal
Params:
	start - Array start index.
	count - Number of items in the itterator.
	array[] - Itterator data.
Return:
	-
Notes:
	Returns a random value from an iterator.
-*----------------------------------------------------------------------------*/

stock Itter_RandomInternal(start, count, array[])
{
	if (count == 0)
	{
		return -1;
	}
	new
		rnd = random(count),
		cur = start;
	while (cur != -1)
	{
		if (rnd--)
		{
			cur = array[cur];
		}
		else
		{
			return cur;
		}
	}
	return -1;
}

/*----------------------------------------------------------------------------*-
Function:
	Itter_FreeInternal
Params:
	start - Array start index.
	count - Number of items in the itterator.
	array[] - Itterator data.
	size - Size of the itterator.
Return:
	-
Notes:
	Finds the first free slot in the itterator.  Itterators now HAVE to be
	sorted for this function to work correctly as it uses that fact to decide
	wether a slot is unused or the last one.  If you want to use the slot
	straight after finding it the itterator will need to re-find it to add in
	the data.
-*----------------------------------------------------------------------------*/

stock Itter_FreeInternal(start, count, array[], size)
{
	if (count == size)
	{
		return -1;
	}
	else if (count == 0)
	{
		return 0;
	}
	new
		first = 0;
	while (first != -1)
	{
		if (first == start)
		{
			start = array[start];
		}
		else if (array[first] == -1)
		{
			return first;
		}
		++first;
	}
	return -1;
}

/*----------------------------------------------------------------------------*-
Function:
	Itter_AddInternal
Params:
	&start - Array start index.
	&count - Number of items in the itterator.
	array[] - Itterator data.
	value - Item to add.
Return:
	-
Notes:
	Adds a value to a given itterator set.
-*----------------------------------------------------------------------------*/

stock Itter_AddInternal(&start, &count, array[], value)
{
	if (array[value] != -1)
	{
		return 0;
	}
	++count;
	if (start == -1)
	{
		start = value;
	}
	else if (start > value)
	{
		array[value] = start;
		start = value;
	}
	else
	{
		new
			cur = start,
			last;
		do
		{
			last = cur;
			cur = array[cur];
			if (cur > value)
			{
				array[value] = cur;
				array[last] = value;
				return 1;
			}
		}
		while (cur != -1);
		array[last] = value;
	}
	return 1;
}

/*----------------------------------------------------------------------------*-
Function:
	Itter_RemoveInternal
Params:
	&start - Array start index.
	&count - Number of items in the itterator.
	array[] - Itterator data.
	value - Item to remove.
Return:
	-
Notes:
	Removes a value from an itterator.
-*----------------------------------------------------------------------------*/

stock Itter_RemoveInternal(&start, &count, array[], value)
{
	if (start == -1)
	{
		return 0;
	}
	if (start == value)
	{
		start = array[value];
	}
	else
	{
		new
			cur = start;
		while (array[cur] != value)
		{
			cur = array[cur];
			if (cur == -1)
			{
				return 0;
			}
		}
		array[cur] = array[value];
	}
	array[value] = -1;
	--count;
	return 1;
}