/*
					-----------------------------------------------------
					|///////////////////////////////////////////////////|
					|///////////////////////////////////////////////////|
					|////                                           ////|
					|////          tAxI's ADVANCED MAP ICON         ////|
                    |////                  SYSTEM                   ////|
					|////                                           ////|
					|////     COPYRIGHT: RELEASED UNDER the GNU     ////|
					|////                 LICENCE                   ////|
					|////                                           ////|
					|///////////////////////////////////////////////////|
					|///////////////////////////////////////////////////|
                    -----------------------------------------------------


    tAxI's Advanced Icon system - INC Package for SA-MP Multiplayer Modification
    of Grand Theft Auto - San Andreas.

    Copyright (C) 2008  Chris Johnstone (tAxI/Necrioss)

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program. If not, see <http://www.gnu.org/licenses/>.

	-=============================================================================================-
	|=============================================================================================|
	|-----------------------------------------DESCRIPTION-----------------------------------------|
	|=============================================================================================|
	|                                                                                             |
	|THIS SYSTEM WILL ADD A FULLY FUNCTIONING MAP ICON MANAGER TO YOUR SERVER ALLOWING UP TO      |
	|3000 MAP ICONS TO BE ACTIVE PER PLAYER ESSENTIALLY EXTENDING THE EXISTING SYSTEM AD IMPROVING|
	|THE ORIGINAL. ITS EASY TO MANAGE AND EVEN ALLOWS CHANGING OF MAP ICON MODELS ON THE FLY!     |
	|                                                                                             |
 	|=============================================================================================|
 	|=============================================================================================|
	|NOTES:                                                                                       |
	|=============================================================================================|
 	|=============================================================================================|
	|                                                                                             |
	|THIS SYSTEM IS VERY VERY SIMPLE SO IT SHOULD BE A STRAIGHT FORWARD ADDITION TO YOUR OWN      |
	|BUT IF YOU HAVE PROBLEMS FEEL FREE TO CANTACT ME, <tAxI>, ON THE SA-MP FORUMS AT             |
	|HTTP://FORUM.SA-MP.COM. ENJOY!
 	|                                                                                             |
	|=============================================================================================|
 	|=============================================================================================|
	|NATIVE AND AVAILLABLE COMMAND FUNCTIONS:                                                     |
	|=============================================================================================|
 	|=============================================================================================|
	
			native tAxI_OnGameModeInit()
			native CreateMapIcon(Float:x,Float:y,Float:z,modelid,Float:spawn_dist)
			native DestroyMapIcon(iconid)
			native GetPlayerClosestIcon(playerid)
			native IsPlayerInRangeOfIcon(playerid,iconid)
			native ChangeMapIconInfo(iconid,Float:x,Float:y,Float:z,modelid,Float:spawn_dist)

	|=============================================================================================|
	-=============================================================================================-

*/

//=================SYSTEM REQUIRED DEFINES===================//

#define MAX_ICONS 3000
#define MAX_ACTIVE_ICONS 32
#define MAX_SECTORS 256
#define MAX_SECTOR_ICONS 200

//===============SYSTEM VARIABLES **DO NOT TOUCH!!!!**==========================//

enum MIInfo {Float:x_ent,Float:y_ent,Float:z_ent,model,valid,Float:spawndist,id_prev_used};
new IconVar[MAX_ICONS][MIInfo];
new overalliconcount = 0;
new MIstreamcount[MAX_PLAYERS];
new IconStatus[MAX_PLAYERS][MAX_ICONS];
new IconID[MAX_PLAYERS][MAX_SECTOR_ICONS];
new SectorIcons[MAX_SECTORS][MAX_SECTOR_ICONS];
new SectorIconCount[MAX_SECTORS];
new vSecActive[MAX_SECTORS];

//========SYSTEM FORWARDS========//

forward SectorScan();
forward InitiateMinimapStreamer();
forward Float:PlayerDistanceToIcon(playerid,iconid);

//============SYSTEM CORE PROCESSES ** NO FIDDLING WITH THESE!!! **==========//

stock GetPlayerSector(playerid)
{
	new Float:pos[3];
	if(IsPlayerConnected(playerid)) {
		GetPlayerPos(playerid,pos[0],pos[1],pos[2]);
		new xsec = floatround(((pos[0] +4000) / 500), floatround_floor);
		new ysec = floatround(((pos[1] +4000) / 500), floatround_floor);
		return (xsec * 16) + ysec;
	}
	return 999;
}

public Float:PlayerDistanceToIcon(playerid,iconid)
{
	new Float:x,Float:y,Float:z;
	GetPlayerPos(playerid,x,y,z);
	return floatsqroot(floatpower(IconVar[iconid][x_ent] - x, 2) + floatpower(IconVar[iconid][y_ent] - y, 2) + floatpower(IconVar[iconid][z_ent] - z, 2));
}

public SectorScan()
{
    new psec[MAX_PLAYERS];
    for(new i = 0;i<MAX_SECTORS;i++) {
		vSecActive[i] = 0;
	}
    for(new i = 0;i<MAX_PLAYERS;i++) {
        if(IsPlayerConnected(i)) {
			psec[i] = GetPlayerSector(i);
   			if(vSecActive[psec[i]] == 0) {
			    vSecActive[psec[i]] = 1;
			}
			if(vSecActive[psec[i]+1] == 0) {
	    		vSecActive[psec[i]+1] = 1;
			}
			if(vSecActive[psec[i]-1] == 0) {
			    vSecActive[psec[i]-1] = 1;
			}
			if(vSecActive[psec[i]-15] == 0) {
			    vSecActive[psec[i]-15] = 1;
			}
			if(vSecActive[psec[i]-16] == 0) {
			    vSecActive[psec[i]-16] = 1;
			}
			if(vSecActive[psec[i]-17] == 0) {
	    		vSecActive[psec[i]-17] = 1;
			}
			if(vSecActive[psec[i]+15] == 0) {
			    vSecActive[psec[i]+15] = 1;
			}
			if(vSecActive[psec[i]+16] == 0) {
			    vSecActive[psec[i]+16] = 1;
			}
			if(vSecActive[psec[i]+17] == 0) {
			    vSecActive[psec[i]+17] = 1;
			}
    		StreamProcess(i,psec[i],psec[i]+1,psec[i]-1,psec[i]+15,psec[i]-15,psec[i]+16,psec[i]-16,psec[i]+17,psec[i]-17);
		}
	}
}

stock PlayerClose(playerid,Float:x,Float:y,Float:z,Float:MAX)
{
	new Float:PPos[3];
	if(IsPlayerConnected(playerid)) {
			GetPlayerPos(playerid, PPos[0], PPos[1], PPos[2]);
			if (PPos[0] >= floatsub(x, MAX) && PPos[0] <= floatadd(x, MAX)
			&& PPos[1] >= floatsub(y, MAX) && PPos[1] <= floatadd(y, MAX)
			&& PPos[2] >= floatsub(z, MAX) && PPos[2] <= floatadd(z, MAX))
			{
				return 1;
			}
	}
	return 0;
}

stock StreamProcess(playerid,v1,v2,v3,v4,v5,v6,v7,v8,v9)
{
    new p,i;
    new sec[9];
    sec[0] = v1;
    sec[1] = v2;
    sec[2] = v3;
    sec[3] = v4;
    sec[4] = v5;
    sec[5] = v6;
    sec[6] = v7;
    sec[7] = v8;
    sec[8] = v9;
    for(new k = 0;k<8;k++) {
        i = sec[k];
        if(vSecActive[i] == 1) {
    		for(new j = 1;j<=SectorIconCount[i];j++) {
        		p = SectorIcons[i][j];
				if(IconStatus[playerid][p] == 0 && PlayerClose(playerid,IconVar[p][x_ent],IconVar[p][y_ent],IconVar[p][z_ent],IconVar[p][spawndist]) == 1) {
					if(MIstreamcount[playerid] < MAX_ACTIVE_ICONS) {
					    MIstreamcount[playerid]++;
					    IconID[playerid][p] = p;
					    SetPlayerMapIcon(playerid,IconID[playerid][p],IconVar[p][x_ent],IconVar[p][y_ent],IconVar[p][z_ent],IconVar[p][model],1);
						IconStatus[playerid][p] = 1;
					}
					else {
					    MIstreamcount[playerid]++;
					    IconID[playerid][p] = p;
					    SetPlayerMapIcon(playerid,IconID[playerid][p],IconVar[p][x_ent],IconVar[p][y_ent],IconVar[p][z_ent],IconVar[p][model],1);
						IconStatus[playerid][p] = 1;
					}
				}
			}
    	}
 	}
 	for(new n = 0;n<overalliconcount;n++) {
        if(IconStatus[playerid][n] == 1 && PlayerClose(playerid,IconVar[n][x_ent],IconVar[n][y_ent],IconVar[n][z_ent],IconVar[n][spawndist]) == 0) {
		   	RemovePlayerMapIcon(playerid,IconID[playerid][n]);
		   	MIstreamcount[playerid]--;
		   	IconStatus[playerid][n] = 0;
		}
    }
}

stock GetPointSector(Float:x,Float:y)
{
	new xsec = floatround(((x +4000) / 500), floatround_floor);
	new ysec = floatround(((y +4000) / 500), floatround_floor);
	return (xsec * 16) + ysec;
}

stock GetIconSector(iconid)
{
	new xsec = floatround(((IconVar[iconid][x_ent] +4000) / 500), floatround_floor);
	new ysec = floatround(((IconVar[iconid][y_ent] +4000) / 500), floatround_floor);
	return (xsec * 16) + ysec;
}

stock PlayersClose(Float:x,Float:y,Float:z,Float:MAX)
{
	new Float:PPos[3];
	for(new i = 0;i<MAX_PLAYERS;i++) {
		if(IsPlayerConnected(i)) {
			GetPlayerPos(i, PPos[0], PPos[1], PPos[2]);
			if (PPos[0] >= floatsub(x, MAX) && PPos[0] <= floatadd(x, MAX)
			&& PPos[1] >= floatsub(y, MAX) && PPos[1] <= floatadd(y, MAX)
			&& PPos[2] >= floatsub(z, MAX) && PPos[2] <= floatadd(z, MAX))
			{
				return 1;
			}
		}
	}
	return 0;
}

stock UpdateIconSectorInfo()
{
    new secnum;
	for(new i = 0;i<MAX_SECTORS;i++) {
	    SectorIconCount[i] = 0;
	}
   	for(new j = 0;j<overalliconcount;j++) {
		secnum = GetIconSector(j);
		SectorIconCount[secnum]++;
		SectorIcons[secnum][SectorIconCount[secnum]] = j;
	}
	return 1;
}

public InitiateMinimapStreamer()
{
    UpdateIconSectorInfo();
	SetTimer("SectorScan",1000,1);
}

//====================NATIVES REQUIRED FOR SYSTEM TO START PROPERLY===================================

stock tAxI_OnGameModeInit()
{
    SetTimer("InitiateMinimapStreamer",3000,0);
	return 1;
}

stock tAxI_OnPlayerDisconnect(playerid)
{
    for(new iconid = 0;iconid<MAX_ICONS;iconid++) {
        if(IconStatus[playerid][iconid] == 1) {
		   	RemovePlayerMapIcon(playerid,IconID[playerid][iconid]);
		   	MIstreamcount[playerid]--;
		   	IconStatus[playerid][iconid] = 0;
		}
    }
	return 1;
}

//==================AVAILLABLE COMMAND FUNCTIONS FOR THE HOUSES================//

stock GetPlayerClosestIcon(playerid)
{
	new Float:dist,Float:tmp;
	new lowesticon;
	dist = 9999.0;
    for(new i = 0;i<overalliconcount;i++) {
        tmp = PlayerDistanceToIcon(playerid,i);
        if(tmp < dist) {
            dist = tmp;
            lowesticon = i;
        }
	}
	return lowesticon;
}

stock IsPlayerInRangeOfIcon(playerid,iconid)
{
    if(IconVar[iconid][valid] == 1) {
    	new Float:ppos[3];
    	GetPlayerPos(playerid, ppos[0], ppos[1], ppos[2]);
   		if (ppos[0] >= floatsub(IconVar[iconid][x_ent], IconVar[iconid][spawndist]) && ppos[0] <= floatadd(IconVar[iconid][x_ent], IconVar[iconid][spawndist])
   		&& ppos[1] >= floatsub(IconVar[iconid][y_ent], IconVar[iconid][spawndist]) && ppos[1] <= floatadd(IconVar[iconid][y_ent], IconVar[iconid][spawndist])
   		&& ppos[2] >= floatsub(IconVar[iconid][z_ent], IconVar[iconid][spawndist]) && ppos[2] <= floatadd(IconVar[iconid][z_ent], IconVar[iconid][spawndist]))
   		{
    	   	return 1;
   		}
		return 0;
	}
	return 0;
}

stock CreateMapIcon(Float:x,Float:y,Float:z,modelid,Float:spawn_dist)
{
    for(new i = 0;i<MAX_ICONS;i++) {
	    if(IconVar[i][valid] == 0) {
			IconVar[i][model] = modelid;
			IconVar[i][x_ent] = x;
			IconVar[i][y_ent] = y;
			IconVar[i][z_ent] = z;
			IconVar[i][valid] = 1;
			IconVar[i][spawndist] = spawn_dist;
			if(IconVar[i][id_prev_used] == 0) {
			    overalliconcount++;
			}
			UpdateIconSectorInfo();
			return i;
		}
	}
	return 0;
}

stock DestroyMapIcon(iconid)
{
	if(IconVar[iconid][valid] == 1) {
		IconVar[iconid][valid] = 0;
		IconVar[iconid][id_prev_used] =1;
		for(new playerid = 0;playerid<MAX_PLAYERS;playerid++) {
        	if(IconStatus[playerid][iconid] == 1) {
		   		RemovePlayerMapIcon(playerid,IconID[playerid][iconid]);
		   		MIstreamcount[playerid]--;
		   		IconStatus[playerid][iconid] = 0;
			}
		}
		return 1;
    }
    return 0;
}

stock ChangeMapIconInfo(iconid,Float:x,Float:y,Float:z,modelid,Float:spawn_dist)
{
    if(IconVar[iconid][valid] == 1) {
		IconVar[iconid][model] = modelid;
		IconVar[iconid][x_ent] = x;
		IconVar[iconid][y_ent] = y;
		IconVar[iconid][z_ent] = z;
		IconVar[iconid][spawndist] = spawn_dist;
		UpdateIconSectorInfo();
		for(new playerid = 0;playerid<MAX_PLAYERS;playerid++) {
        	if(IconStatus[playerid][iconid] == 1) {
		   		RemovePlayerMapIcon(playerid,IconID[playerid][iconid]);
		   		MIstreamcount[playerid]--;
		   		IconStatus[playerid][iconid] = 0;
			}
		}
		return 1;
	}
	return 0;
}
