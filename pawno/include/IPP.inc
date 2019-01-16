// Icons++ Icon Streamer
// Credits:
// Lavamike - Creator
// Double-O-Seven, GoldKiller - IsPosInDistance

// You may use this streamer, all I ask is you keep the credits above.


#include <a_samp>

// IsPosInDistance (From Double-O-Seven's Script)
// He said: "BIG THX to GoldKiller"
#define IsPosInDistance(%0,%1,%2,%3,%4,%5,%6) \
        (((%0 - %3) * (%0 - %3)) + ((%1 - %4) * (%1 - %4)) + ((%2 - %5) * (%2 - %5)) <= %6 * %6)

#define MAX_STREAMED_ICONS 100

new Icons[MAX_PLAYERS] = -1;
new Float:IconLocX[MAX_PLAYERS][MAX_STREAMED_ICONS];
new Float:IconLocY[MAX_PLAYERS][MAX_STREAMED_ICONS];
new Float:IconLocZ[MAX_PLAYERS][MAX_STREAMED_ICONS];
new IconType[MAX_PLAYERS][MAX_STREAMED_ICONS];
new IconColor[MAX_PLAYERS][MAX_STREAMED_ICONS];
new IconOn[MAX_PLAYERS][MAX_STREAMED_ICONS];

stock OnMapIconConnect(playerid)
{
	Icons[playerid] = -1;
}

stock OnMapIconDisconnect(playerid)
{
	Icons[playerid] = -1;
}

stock CreateStreamedMapIcon(playerid, Float:X, Float:Y, Float:Z, markerType, color)
{
	if(Icons[playerid] >= 31)
	{
		Icons[playerid]++;
		IconOn[playerid][Icons[playerid]] = 0;
		IconLocX[playerid][Icons[playerid]] = Float:X;
		IconLocY[playerid][Icons[playerid]] = Float:Y;
		IconLocZ[playerid][Icons[playerid]] = Float:Z;
		IconType[playerid][Icons[playerid]] = markerType;
		IconColor[playerid][Icons[playerid]] = color;
		CheckIcons(playerid);
		return Icons[playerid];
	}
	else
	{
		Icons[playerid]++;
		IconOn[playerid][Icons[playerid]] = 1;
		IconLocX[playerid][Icons[playerid]] = Float:X;
		IconLocY[playerid][Icons[playerid]] = Float:Y;
		IconLocZ[playerid][Icons[playerid]] = Float:Z;
		IconType[playerid][Icons[playerid]] = markerType;
		IconColor[playerid][Icons[playerid]] = color;
		SetPlayerMapIcon(playerid, Icons[playerid], Float:X, Float:Y, Float:Z, markerType, color);
		CheckIcons(playerid);
		return Icons[playerid];
	}
}

stock RemoveStreamedMapIcon(playerid, IconID)
{
	if(IconOn[playerid][IconID])
	{
		RemovePlayerMapIcon(playerid, IconID);
		if(IconID == Icons[playerid]) Icons[playerid]--;
		IconOn[playerid][IconID] = 0;
		IconLocX[playerid][IconID] = 0.0;
		IconLocY[playerid][IconID] = 0.0;
		IconLocZ[playerid][IconID] = 0.0;
		IconType[playerid][IconsID] = -1;
		IconColor[playerid][IconID] = -1;
		CheckIcons(playerid);
		return true;
	}
	else
	{
		if(IconID == Icons[playerid]) Icons[playerid]--;
		IconOn[playerid][Icons[playerid]] = 1;
		IconLocX[playerid][Icons[playerid]] = 0.0;
		IconLocY[playerid][Icons[playerid]] = 0.0;
		IconLocZ[playerid][Icons[playerid]] = 0.0;
		IconType[playerid][Icons[playerid]] = -1;
		IconColor[playerid][Icons[playerid]] = -1;
		CheckIcons(playerid);
		return true;
	}
	
	return false;
}

stock CheckIcons(playerid)
{
	if(Icons[playerid] > 31)
	{
		new Float:X, Float:Y, Float:Z;
		GetPlayerPos(playerid, X, Y, Z);
		for(new i = 0; i < Icons[playerid]+1; i++)
		{
			/*
			new Float:X = IconLocX[playerid][i];
			new Float:Y = IconLocY[playerid][i];
			new Float:Z = IconLocZ[playerid][i];
			*/
			if(IconOn[playerid][i] == 1)
			{
				if(!IsPosInDistance(X, Y, Z, IconLocX[playerid][i], IconLocY[playerid][i], IconLocZ[playerid][i], 300))
				{
					RemovePlayerMapIcon(playerid, i);
					IconOn[playerid][i] = 0;
					Icons[playerid]--;
				}
			}
			else if(IsPosInDistance(X, Y, Z, IconLocX[playerid][i], IconLocY[playerid][i], IconLocZ[playerid][i], 300))
			{
				new IconID = GetNextIconID(playerid);
				SetPlayerMapIcon(playerid, IconID, IconLocX[playerid][i], IconLocY[playerid][i], IconLocZ[playerid][i], IconType[playerid][i], IconColor[playerid][i]);
			}
		}
	}
}

stock GetNextIconID(playerid)
{
	for(new s = 0; s < 32; s++)
	{
		if(!IconOn[playerid][s]) return s;
	}
	return -1;
}

