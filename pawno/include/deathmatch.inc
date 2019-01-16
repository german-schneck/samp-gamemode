//
// Created:     08.09.06
// Aurthor:    Iain Gilbert
//

#if defined _deathmatch_included
  #endinput
#endif

#define _deathmatch_included
#pragma library deathmatch
#include "base"
#include "player"
#include "world"
#include "weapons"

#define MAX_DMWEAPONS 10
#define MAX_DM 50
#define MAX_DM_SP 10

#define DM_STATE_DISABLED 0
#define DM_STATE_SLEEPING 1
#define DM_STATE_LINEUP 2
#define DM_STATE_COUNTDOWN 3
#define DM_STATE_ACTIVE 4
#define INVALID_DM_ID 0

enum DMInfo{
	dm_name[MAX_NAME],    // name of dm
	dm_minlevel,         // minimum level required to enter dm
    dm_minplayers,         // minimum dmplayers needed to dm
    dm_maxtime,       // max time player can take to complete a dm
    dm_frequency,        // frquency that dm runs
    dm_lineupdelay,       // time to wait for players to linup
    dm_cashprize, 		// cash earned for 1st position
	dm_cashentry, 		// Cash required to enter (earned by winner)
	dm_xpprize, 			// xp earned for 1st position
	dm_xpbonus,			// xp earned per player still in dm
	dm_distance,        // distance players can wander from DM
	dm_xpkill,          // xp gained for killing someone in dm
	dm_xpdeath,         // xp lost for dieing in dm
	dm_activedmjoin,         // can a player join this dm while it is currently running
	dm_weapons[MAX_DMWEAPONS]   //array of dm weaponid's
}
new Deathmatch[MAX_DM][DMInfo];

enum DMStateInfo{
	dm_state,             // dm state
	dm_timer,
	dm_playercount,
	dm_questid,
	dm_activecpid
}
new DeathmatchStats[MAX_DM][DMStateInfo];

enum DMPlayerInfo{
	dm_player_active, // is the player active and spawned in the deathmatch zone
	dm_player_kills,
	dm_player_deaths,
	dm_player_gotcentre,
	dm_player_outzone
}
new DMPlayerStats[MAX_PLAYERS][DMPlayerInfo];

enum DMScoreInfo {
	dm_score_player[MAX_NAME],
	dm_score_record,
	dm_score_kills,
	dm_score_deaths
};
new DMBestScore[MAX_DM][DMScoreInfo];

new DMCount; // count of active deathmatches
new DMCPSize=8; // size of checkpoints
new Float:DMSpawnPoints[MAX_DM][MAX_CP][CoordInfo]; // moo
new DMSpawnsSize[MAX_DM]; // number of spawnpoints
new DMStartCP[MAX_DM][CoordInfo];
new DMCentreCP[MAX_DM][CoordInfo];

//--------------------------------------------------------------

new DeathmatchDB[MAX_STRING] = "GTO\\Deathmatch\\GTO.Deathmatches.txt";
new DMBaseDB[MAX_STRING] = "GTO\\Deathmatch\\";
new DMRecordDB[MAX_STRING] = "GTO\\Deathmatch\\Record\\";


public CheckDM() // must be ran by timer every second
{
    new string [MAX_STRING];
	for (new dmid=1; dmid<=DMCount;dmid++)
	{
	    if (DeathmatchStats[dmid][dm_state] == DM_STATE_DISABLED) continue;
	    
		if (DeathmatchStats[dmid][dm_state] == DM_STATE_SLEEPING)
		{
		    if (DeathmatchStats[dmid][dm_timer] <= 0) // if it is time to run
		    {
		    	DeathmatchStats[dmid][dm_timer] = 0;
		        StartDMLineup(dmid);
		        continue;
			}
			DeathmatchStats[dmid][dm_timer]--;
			continue;
		}
		
		DeathmatchStats[dmid][dm_timer]++;
		if (DeathmatchStats[dmid][dm_state] == DM_STATE_LINEUP)
		{
	   		if (DeathmatchStats[dmid][dm_timer] >= Deathmatch[dmid][dm_lineupdelay]) // if it is time to run
	    	{
	    		DeathmatchStats[dmid][dm_timer] = 0;
	        	StartDMCountdown(dmid);
			}
			else
			{
			    if (DeathmatchStats[dmid][dm_playercount] > 0)
			    {
			        new dmcountdown = Deathmatch[dmid][dm_lineupdelay] - DeathmatchStats[dmid][dm_timer];
					if ((dmcountdown == 5) || (dmcountdown == 10) || (dmcountdown == 20) || (dmcountdown == 30) || (dmcountdown == 45) || (dmcountdown == 60) || (dmcountdown == 90))
					{
						format(string, sizeof(string), "Deathmatch starts in %d seconds.",(Deathmatch[dmid][dm_lineupdelay] - DeathmatchStats[dmid][dm_timer]));
						SendMessageToDMPlayers(dmid,string,COLOUR_DM);
						
					}
				}
			}
		}
		else if (DeathmatchStats[dmid][dm_state] == DM_STATE_COUNTDOWN)
		{
			for (new playerid=0; playerid<MAX_PLAYERS;playerid++)
			{
			    if (IsPlayerConnected(playerid))
				{
	  				if (PlayerQuest[playerid] == GetDMQuestID(dmid)) // if player is in this dm
	    			{
         	   	    	if (DMPlayerStats[playerid][dm_player_active] == 1)
         	   	    	{
	    			    	new Countdown = MAX_COUNTDOWN - DeathmatchStats[dmid][dm_timer];
			    			if (Countdown >= 1)
							{
								format(string, sizeof(string), "%d",Countdown);
								PlayerPlaySound(playerid,1056,GetPlayerX(playerid),GetPlayerY(playerid),GetPlayerZ(playerid));
							}
							else
							{
								format(string, sizeof(string), "GO!");
								PlayerPlaySound(playerid,1057,GetPlayerX(playerid),GetPlayerY(playerid),GetPlayerZ(playerid));
							}
      						GameTextForPlayer(playerid, string,1000,6);
	  					}
					}
	 			}
			}
			if (DeathmatchStats[dmid][dm_timer] >= MAX_COUNTDOWN)
			{
		   		StartDM(dmid);
			}
		}
		else if (DeathmatchStats[dmid][dm_state] == DM_STATE_ACTIVE)
		{
		    CheckDMPlayersInZone(dmid);
		    if (DeathmatchStats[dmid][dm_timer] >= Deathmatch[dmid][dm_maxtime]) // if time limit reached
	    	{
		    	EndDM(dmid);
			}
 		}
	}
}

CheckDMPlayersInZone(dmid)
{
	for (new playerid=0;playerid<MAX_PLAYERS;playerid++)
	{
	    if (!IsPlayerConnected(playerid))
		{
		    //DMResetPlayerStats(playerid);
			continue;
		}
	    if (!IsPlayerInDM(playerid,dmid)) continue;
	    if (DMPlayerStats[playerid][dm_player_active] == 0) continue;
        new Float:playerdistance;
        new Float:x,Float:y,Float:z;
        GetPlayerPos(playerid, x, y, z);
        playerdistance = GetDistanceXYZtoXYZ(x,y,z,DMCentreCP[dmid][Coord_X],DMCentreCP[dmid][Coord_Y],DMCentreCP[dmid][Coord_Z]);
		if (playerdistance > Deathmatch[dmid][dm_distance])
		{
		    DMPlayerStats[playerid][dm_player_outzone]++;
			if (DMPlayerStats[playerid][dm_player_outzone] > 12)
			{
				SendClientMessage(playerid,COLOUR_RED, "You have been kicked from the deathmatch because you left the deathmatch zone.");
				PlayerLeaveDM(playerid,dmid);
				DMPlayerStats[playerid][dm_player_outzone] = 0;
				continue;
			}
			else if (DMPlayerStats[playerid][dm_player_outzone] > 2)
			{
				SendClientMessage(playerid,COLOUR_YELLOW, "You are outside the deathmatch zone, get back to the deathmatch.");
			}
		}
	}
}

DMPlayerDisconnect(playerid)
{
	new dmid = GetPlayerDM(playerid);
	if (dmid == INVALID_DM_ID) return;

	PlayerLeaveDM(playerid,dmid);
}

public RegisterDM(name[])
{
	for (new i=0;i<MAX_DM;i++)
	{
	    if (DeathmatchStats[i][dm_state] == DM_STATE_DISABLED) continue;
	    if (strcomp(name,Deathmatch[i][dm_name],true)==1)
	    {
	        return INVALID_DM_ID;
	    }
	}
	if (DMCount >= MAX_DM) return INVALID_DM_ID;
	DMCount++;
 	new dmid = DMCount;
 	DeathmatchStats[dmid][dm_questid] = RegisterQuest(name);
 	if (DeathmatchStats[dmid][dm_questid] == INVALID_QUEST_ID)
	{
		DMCount--;
 		return INVALID_DM_ID;
	}
	set(Deathmatch[dmid][dm_name],name);
 	return dmid;
}


StartDMLineup(dmid)
{
    DeathmatchStats[dmid][dm_state] = DM_STATE_LINEUP;
    DeathmatchStats[dmid][dm_timer] = 0;
    DeathmatchStats[dmid][dm_playercount] = 0;
	new string1[MAX_STRING];
	new string2[MAX_STRING];
	format(string1, sizeof(string1), "Deathmatch: '%s' (dmid:%d). Starts in %d seconds. Location: '%s'.",Deathmatch[dmid][dm_name],dmid,Deathmatch[dmid][dm_lineupdelay],GetDMStartZoneName(dmid));
	if (Deathmatch[dmid][dm_minplayers] > 1)
	{
		format(string2, sizeof(string2), "Entry Fee: $%d. Rquired Level: %d. Minimum players: %d.",Deathmatch[dmid][dm_cashentry],Deathmatch[dmid][dm_minlevel],Deathmatch[dmid][dm_minplayers]);
	}
	else
	{
		format(string2, sizeof(string2), "Entry Fee: $%d. Rquired Level: %d.",Deathmatch[dmid][dm_cashentry],Deathmatch[dmid][dm_minlevel]);
	}
	for (new playerid=0; playerid<MAX_PLAYERS;playerid++)
	{
		if (!IsPlayerConnected(playerid)) continue;
		SendClientMessage(playerid,GetDMColourForPlayer(playerid,dmid), string1);
		SendClientMessage(playerid,GetDMColourForPlayer(playerid,dmid), string2);
	    if (PlayerQuest[playerid] == 0) // if player not on a quest
    	{
   			oSetPlayerCheckpoint(playerid,GetDMCPX(dmid),GetDMCPY(dmid),GetDMCPZ(dmid),DMCPSize);
   			DMResetPlayerStats(playerid);
		}
	}
	DeathmatchStats[dmid][dm_activecpid] = AddActiveCheckpoint(GetDMCPX(dmid),GetDMCPY(dmid),GetDMCPZ(dmid),10000,8);
}

StartDMCountdown(dmid)
{
    DeathmatchStats[dmid][dm_timer]=0;
	//if (DeathmatchStats[dmid][dm_activecpid] != 0)
	//{
	//	RemoveActiveCheckpoint(DeathmatchStats[dmid][dm_activecpid]);
	//	DeathmatchStats[dmid][dm_activecpid] = 0;
 	//}
	new string[MAX_STRING];
	

	for (new playerid=0; playerid<MAX_PLAYERS;playerid++)
	{
		if (!IsPlayerConnected(playerid)) continue;
	    if (PlayerQuest[playerid] == GetDMQuestID(dmid)) // if player is in this dm
	    {
	   	    if (!oIsPlayerInCheckpoint(playerid,GetDMCPX(dmid),GetDMCPY(dmid),GetDMCPZ(dmid),50))
        	{
        	    if (Deathmatch[dmid][dm_activedmjoin] == 0)
        	    {
			    	PlayerLeaveDM(playerid,dmid);
		    		SendPlayerFormattedText(playerid, "Deathmatch Aborted. You are not at startline.", 0,COLOUR_RED);
				}
				else
				{
					SendPlayerFormattedText(playerid, "The deathmatch has started! Get to the startline!", 0,COLOUR_DM);
				}
			}
 		}
	}

	if (DeathmatchStats[dmid][dm_playercount] < Deathmatch[dmid][dm_minplayers])
	{
		format(string, sizeof(string), "Deathmatch: '%s' did not run.",Deathmatch[dmid][dm_name]);
		SendClientMessageToRegistered(COLOUR_RED, string);
		format(string, sizeof(string), "Deathmatch: '%s' did not run. Not enough players.",Deathmatch[dmid][dm_name]);
		SendMessageToDMPlayers(dmid,string,COLOUR_DM);
		CleanupDM(dmid);
		return;
	}

	format(string, sizeof(string), "Deathmatch: %s starting.",Deathmatch[dmid][dm_name]);
	SendClientMessageToRegistered(COLOUR_DM, string);
	DeathmatchStats[dmid][dm_state] = DM_STATE_COUNTDOWN;

	for (new playerid=0; playerid<MAX_PLAYERS;playerid++)
	{
		if (!IsPlayerConnected(playerid)) continue;
	    if (PlayerQuest[playerid] == GetDMQuestID(dmid)) // if player is in this dm
	    {
	        if (oIsPlayerInCheckpoint(playerid,GetDMCPX(dmid),GetDMCPY(dmid),GetDMCPZ(dmid),50))
        	{
				TogglePlayerControllable(playerid, 0);
				SetCameraBehindPlayer(playerid);
				DMPlayerSpawn(playerid,dmid);
			}
		}
	}
}

StartDM(dmid)
{
	DeathmatchStats[dmid][dm_timer]=0;
	DeathmatchStats[dmid][dm_state] = DM_STATE_ACTIVE;
	for (new playerid=0; playerid<MAX_PLAYERS;playerid++)
	{
	    if (IsPlayerConnected(playerid))
		{
	    	if (PlayerQuest[playerid] == GetDMQuestID(dmid)) // if player is in this dm
	    	{
				TogglePlayerControllable(playerid, 1);
			}
		}
	}
}

JoinDM(playerid,dmid)
{
	new string[MAX_STRING];
	if (oGetPlayerMoney(playerid) < Deathmatch[dmid][dm_cashentry])
	{
		format(string, sizeof(string), "You need $%d to enter this deathmatch.", Deathmatch[dmid][dm_cashentry]);
		SendPlayerFormattedText(playerid,string, 0,COLOUR_RED);
		return;
	}
	if (GetPlayerLevel(playerid) < Deathmatch[dmid][dm_minlevel])
	{
		format(string, sizeof(string), "You must be at least level %d to enter this deathmatch.", Deathmatch[dmid][dm_minlevel]);
		SendPlayerFormattedText(playerid,string, 0,COLOUR_RED);
		return;
	}
	DMResetPlayerStats(playerid);
	DeathmatchStats[dmid][dm_playercount]++;
    if (Deathmatch[dmid][dm_minplayers] > 1)
	{
		format(string, sizeof(string), "%s has joined the deathmatch. (Players:%d/%d)", oGetPlayerName(playerid),DeathmatchStats[dmid][dm_playercount],Deathmatch[dmid][dm_minplayers]);
	}
	else
	{
		format(string, sizeof(string), "%s has joined the deathmatch. (Players:%d)", oGetPlayerName(playerid),DeathmatchStats[dmid][dm_playercount]);
	}
	SendMessageToDMPlayers(dmid,string,COLOUR_WHITE);

	oGivePlayerMoney(playerid,0-Deathmatch[dmid][dm_cashentry],1);
	GameTextForPlayer(playerid, "~g~Deathmatch Entered.",3000,6);
	PlayerQuest[playerid] = GetDMQuestID(dmid);
	
	if (DeathmatchStats[dmid][dm_state] == DM_STATE_LINEUP)
	{
		format(string, sizeof(string), "Deathmatch Entered. Starts in %d seconds.",(Deathmatch[dmid][dm_lineupdelay] - DeathmatchStats[dmid][dm_timer]));
 		SendPlayerFormattedText(playerid, string, 0,COLOUR_DM);
 		oSetPlayerCheckpoint(playerid,GetDMCPX(dmid),GetDMCPY(dmid),GetDMCPZ(dmid),DMCPSize);
	}
	else if ((DeathmatchStats[dmid][dm_state] == DM_STATE_ACTIVE) && (Deathmatch[dmid][dm_activedmjoin] == 1))
	{
	    SendPlayerFormattedText(playerid, "Deathmatch Entered!", 0,COLOUR_DM);
	    if (oIsPlayerInCheckpoint(playerid,GetDMCPX(dmid),GetDMCPY(dmid),GetDMCPZ(dmid),50))
        {
			DMPlayerSpawn(playerid,dmid);
			format(string, sizeof(string), "GO!");
			PlayerPlaySound(playerid,1057,GetPlayerX(playerid),GetPlayerY(playerid),GetPlayerZ(playerid));
   			GameTextForPlayer(playerid, string,1000,6);

		}
		else
		{
			SendPlayerFormattedText(playerid, "Deathmatch has already started! Get to the startline!", 0,COLOUR_DM);
			oSetPlayerCheckpoint(playerid,GetDMCPX(dmid),GetDMCPY(dmid),GetDMCPZ(dmid),DMCPSize);
		}
	}
	else
	{
		format(string, sizeof(string), "You cannot enter this deathmatch at this time.");
		SendPlayerFormattedText(playerid,string, 0,COLOUR_RED);
		return;
	}
}

DMPlayerSpawn(playerid,dmid)
{
	if (!IsPlayerInDM(playerid,dmid))
	{
		DMResetPlayerStats(playerid);
		return;
	}
	
	PlayerJustTeleported[playerid]+=5;
	SetPlayerInterior(playerid,0);
	new spid = random(DMSpawnsSize[dmid]);
	SetPlayerPos(playerid,DMSpawnPoints[dmid][spid][Coord_X], DMSpawnPoints[dmid][spid][Coord_Y], DMSpawnPoints[dmid][spid][Coord_Z]); // Warp the player

	spid = random(DMSpawnsSize[dmid]);
	oSetPlayerHealth(playerid,GetMaxHealth(playerid)); // set health based on level
	oSetPlayerMoney(playerid,Player[playerid][Money]);
	GivePlayerDMWeapons(playerid,dmid);
	DMPlayerStats[playerid][dm_player_active] = 1;
	oSetPlayerCheckpoint(playerid,DMCentreCP[dmid][Coord_X],DMCentreCP[dmid][Coord_Y],DMCentreCP[dmid][Coord_Z],DMCPSize);
	//oDisablePlayerCheckpoint(playerid);
}


GetPlayerDMPosition(playerid,dmid)
{
	if (!IsPlayerInDM(playerid,dmid)) return 0;
	new position=1;
	for (new i=0;i<MAX_PLAYERS;i++)
	{
		if (!IsPlayerInDM(i,dmid)) continue;
		new iscore = DMPlayerStats[i][dm_player_kills] - DMPlayerStats[i][dm_player_deaths];
		new playerscore = DMPlayerStats[playerid][dm_player_kills] - DMPlayerStats[playerid][dm_player_deaths];
		if (iscore > playerscore)
		{
			position++;
		}
		else if (iscore == playerscore)
		{
		    if (DMPlayerStats[i][dm_player_kills] > DMPlayerStats[playerid][dm_player_kills])
		    {
		    	position++;
		    }
		}
	}
	return position;
}

EndDM(dmid)
{
	for (new playerid=0; playerid<MAX_PLAYERS;playerid++)
	{
		if (!IsPlayerConnected(playerid)) continue;
	    if (PlayerQuest[playerid] == GetDMQuestID(dmid)) // if player is in this dm
     	{
     	    new playerpos = GetPlayerDMPosition(playerid,dmid);
			PlayerFinishDM(playerid,dmid,playerpos);
		}
  	}
	CleanupDM(dmid);
}

CleanupDM(dmid)
{
	for (new playerid=0; playerid<MAX_PLAYERS;playerid++)
	{
		if (!IsPlayerConnected(playerid)) continue;
	    if (PlayerQuest[playerid] == GetDMQuestID(dmid)) // if player is in this dm
	    {
		    PlayerLeaveDM(playerid,dmid);
		}
	}
	DeathmatchStats[dmid][dm_playercount] = 0;
	DeathmatchStats[dmid][dm_timer] = MakeDMSleepTime(dmid);
	DeathmatchStats[dmid][dm_state] = DM_STATE_SLEEPING;

	if (DeathmatchStats[dmid][dm_activecpid] != 0)
	{
		RemoveActiveCheckpoint(DeathmatchStats[dmid][dm_activecpid]);
		DeathmatchStats[dmid][dm_activecpid] = 0;
	}
}

PlayerFinishDM(playerid,dmid,position)
{
		new string[MAX_STRING];

        set(string,FormatPosition(position));
		GameTextForPlayer(playerid,string,5000,6);
		PlayerPlaySoundOnPlayer(playerid,1057);

        if (position == 1)
        {
            format(string, sizeof(string), "Deathmatch complete: '%s'. Position: %s. Score: %d.",Deathmatch[dmid][dm_name],FormatPosition(position),GetPlayerDMScore(playerid,dmid));
			SendClientMessage(playerid,COLOUR_GREEN, string);

            format(string, sizeof(string), "%s has won deathmatch '%s'! Score: %d.",oGetPlayerName(playerid),Deathmatch[dmid][dm_name],GetPlayerDMScore(playerid,dmid));
            SendClientMessageToRegistered(COLOUR_DM, string);
            oGivePlayerMoney(playerid,Deathmatch[dmid][dm_cashprize],1);
            GivePlayerXP(playerid,Deathmatch[dmid][dm_xpprize] + (Deathmatch[dmid][dm_xpbonus] * DeathmatchStats[dmid][dm_playercount]),1);

	    }
        else if (position == 2)
        {
           	format(string, sizeof(string), "Deathmatch complete: '%s'. Position: %s. Score: %d.",Deathmatch[dmid][dm_name],FormatPosition(position),GetPlayerDMScore(playerid,dmid));
			SendClientMessage(playerid,COLOUR_GREEN, string);

			//format(string, sizeof(string), "%s finished %s in deathmatch '%s'. Score: %d.",oGetPlayerName(playerid),FormatPosition(Position[dmid]),Deathmatch[dmid][dm_name],GetPlayerDMScore(playerid));
            //SendClientMessageToRegistered(COLOUR_DM, string);
            if (DeathmatchStats[dmid][dm_playercount] > 2)
            {
            	oGivePlayerMoney(playerid,(Deathmatch[dmid][dm_cashprize]/2),1);
            	GivePlayerXP(playerid,(Deathmatch[dmid][dm_xpprize]/2) + (Deathmatch[dmid][dm_xpbonus] * DeathmatchStats[dmid][dm_playercount]),1);

			}
			else
			{
			    GivePlayerXP(playerid,Deathmatch[dmid][dm_xpbonus] * DeathmatchStats[dmid][dm_playercount],1);
			}
		}
        else if ((position == 3) && (DeathmatchStats[dmid][dm_playercount] > 3))
        {
           	format(string, sizeof(string), "Deathmatch complete: '%s'. Position: %s. Score: %d.",Deathmatch[dmid][dm_name],FormatPosition(position),GetPlayerDMScore(playerid,dmid));
			SendClientMessage(playerid,COLOUR_GREEN, string);

			//format(string, sizeof(string), "%s finished %s in dm '%s'. Score: %d.",oGetPlayerName(playerid),FormatPosition(Position[dmid]),Deathmatch[dmid][dm_name],GetPlayerDMScore(playerid));
            //SendClientMessageToRegistered(COLOUR_DM, string);
            if (DeathmatchStats[dmid][dm_playercount] > 3)
            {
        		oGivePlayerMoney(playerid,(Deathmatch[dmid][dm_cashprize]/3),1);
        		GivePlayerXP(playerid,(Deathmatch[dmid][dm_xpprize]/3) + (Deathmatch[dmid][dm_xpbonus] * DeathmatchStats[dmid][dm_playercount]),1);

			}
			else
			{
			    GivePlayerXP(playerid,Deathmatch[dmid][dm_xpbonus] * DeathmatchStats[dmid][dm_playercount],1);
			}
		}
        else
        {
        	format(string, sizeof(string), "Deathmatch complete: '%s'. Position: %s. Score: %d.",Deathmatch[dmid][dm_name],FormatPosition(position),GetPlayerDMScore(playerid,dmid));
			SendClientMessage(playerid,COLOUR_GREEN, string);
			GivePlayerXP(playerid,Deathmatch[dmid][dm_xpbonus] * DeathmatchStats[dmid][dm_playercount],1);
		}

		if ((GetPlayerDMScore(playerid,dmid) > DMBestScore[dmid][dm_score_record]) || (DMBestScore[dmid][dm_score_record] == 0))
		{
			format(string, sizeof(string), "%s has set a new record for deathmatch '%s'! Score: %d. Old record: %d.",oGetPlayerName(playerid),Deathmatch[dmid][dm_name],GetPlayerDMScore(playerid,dmid),DMBestScore[dmid][dm_score_record]);
            SendClientMessageToRegistered(COLOUR_DM, string);
            oGivePlayerMoney(playerid,(Deathmatch[dmid][dm_cashprize]*3),1);
        	GivePlayerXP(playerid,(Deathmatch[dmid][dm_xpprize]*3),1);
        	DMBestScore[dmid][dm_score_record] = GetPlayerDMScore(playerid,dmid);
           	DMBestScore[dmid][dm_score_kills] = DMPlayerStats[playerid][dm_player_kills];
           	DMBestScore[dmid][dm_score_deaths] = DMPlayerStats[playerid][dm_player_deaths];
			set(DMBestScore[dmid][dm_score_player],oGetPlayerName(playerid));

		}

		PlayerLeaveDM(playerid,dmid);
}

PlayerLeaveDM(playerid,dmid)
{
	new string[MAX_STRING];
	ResetQuest(playerid);  // reset checkpoints
	DeathmatchStats[dmid][dm_playercount]--;

	if (!IsPlayerConnected(playerid))
	{
		DMResetPlayerStats(playerid);
		return;
	}
	if (DeathmatchStats[dmid][dm_state] == DM_STATE_LINEUP)
	{
	    if (Deathmatch[dmid][dm_minplayers] > 1)
	    {
	 		format(string, sizeof(string), "%s has left the dm. (Players:%d/%d)", oGetPlayerName(playerid),DeathmatchStats[dmid][dm_playercount],Deathmatch[dmid][dm_minplayers]);
  		}
  		else
  		{
  			format(string, sizeof(string), "%s has left the dm. (Players:%d)", oGetPlayerName(playerid),DeathmatchStats[dmid][dm_playercount]);
  		}
		SendMessageToDMPlayers(dmid,string,COLOUR_GREY);
		oGivePlayerMoney(playerid,Deathmatch[dmid][dm_cashentry],1); // give player back thier cash entry
		GameTextForPlayer(playerid, "~r~Deathmatch Aborted.",5000,6);
		SendPlayerFormattedText(playerid, "Deathmatch Aborted.", 0,COLOUR_RED);
	}
	else
	{
		format(string, sizeof(string), "%s has left the deathmatch. (Players:%d).", oGetPlayerName(playerid),DeathmatchStats[dmid][dm_playercount]);
		SendMessageToDMPlayers(dmid,string,COLOUR_GREY);
		SendPlayerFormattedText(playerid, "Deathmatch Left.", 0,COLOUR_RED);
	}

	if (DMPlayerStats[playerid][dm_player_active])
	{
		ResetPlayerDMWeapons(playerid);
		PlayerJustTeleported[playerid]+=5;
		SetPlayerPos(playerid,DMStartCP[dmid][Coord_X], DMStartCP[dmid][Coord_Y], DMStartCP[dmid][Coord_Z]);

		SetPlayerInterior(playerid,0);
		oSetPlayerHealth(playerid,GetMaxHealth(playerid)); // set health based on level
        oDisablePlayerCheckpoint(playerid);
		GivePlayerOwnedWeapons(playerid);
	}
	DMResetPlayerStats(playerid);
}

SendPlayerDMWeapons(playerid,dmid)
{
	ResetPlayerWeapons(playerid);
	new string[MAX_STRING];
	new weapons[MAX_DMWEAPONS+1];
	set(weapons,Deathmatch[dmid][dm_weapons]);
	if (strlen(weapons) <= 7)
	{
		set(string,"Deathmatch weapons: ");
		for (new i=0;i<strlen(weapons);i++)
		{
		    if (weapons[i] == 0)  break;
	        if (i>0) strins(string, ", ", strlen(string));
			strins(string, GetWeaponName(weapons[i]), strlen(string));
		}
		SendClientMessage(playerid,COLOUR_GREY, string);
   	}
	else
	{
		SendPlayerScrollingText(playerid,"~g~Deathmatch weapons: ");
		for (new i=0;i<strlen(weapons);i++)
		{
	   	    if (weapons[i] == 0)  break;
	        if (i>0) strins(string, ", ", strlen(string));

			strins(string, GetWeaponName(weapons[i]), strlen(string));
			SendPlayerScrollingText(playerid,string);
		}
	}
}

GivePlayerDMWeapons(playerid,dmid)
{
	new weapons[MAX_DMWEAPONS+1];
	set(weapons,Deathmatch[dmid][dm_weapons]);
	ResetPlayerWeapons(playerid);
	for (new i=0;i<strlen(weapons);i++)
	{
	    if (weapons[i] == 0)  break;
	    new ammo = GetWeaponMaxAmmo(weapons[i]);
		GivePlayerWeapon(playerid,weapons[i],ammo);
		PlayerTempWeapons[playerid][i] = 1;
	}

}

ResetPlayerDMWeapons(playerid)
{
	ResetPlayerWeapons(playerid);
	for (new i=0;i<MAX_WEAPONS;i++)
	{
		PlayerTempWeapons[playerid][i] = 0;
	}
}

SendMessageToDMPlayers(dmid,string[],colour)
{
	for (new dmplayerid=0; dmplayerid<MAX_PLAYERS;dmplayerid++)
	{
	    if (!IsPlayerConnected(dmplayerid)) continue;
	    if (PlayerQuest[dmplayerid] == GetDMQuestID(dmid)) // if player is in this dm
	    {
	        SendPlayerFormattedText(dmplayerid, string, 0,colour);
		}
	}
}

IsPlayerInDM(playerid,dmid)
{
	if (dmid == INVALID_DM_ID) return 0;
	if (!IsPlayerConnected(playerid)) return 0;
	if (PlayerQuest[playerid] != GetDMQuestID(dmid)) return 0; 
	return 1;
}

IsPlayerInAnyDM(playerid)
{
	new dmid = GetPlayerDM(playerid);
	if (dmid == INVALID_DM_ID) return 0;
	if (DMPlayerStats[playerid][dm_player_active] == 0) return 0; // if we are not spawned in dm zone then we are not actualy active in dm
	return 1;
}

DMResetPlayerStats(playerid)
{
	DMPlayerStats[playerid][dm_player_active] = 0;
	DMPlayerStats[playerid][dm_player_kills] = 0;
	DMPlayerStats[playerid][dm_player_deaths] = 0;
	DMPlayerStats[playerid][dm_player_gotcentre] = 0;
	DMPlayerStats[playerid][dm_player_outzone] = 0;
}

GetPlayerDMScore(playerid,dmid)
{
	if (!IsPlayerInDM(playerid,dmid)) return 0;
	new score;
	score = DMPlayerStats[playerid][dm_player_kills] - DMPlayerStats[playerid][dm_player_deaths];
	if (score < 0) score = 0;
	return score;
}

GetDMColourForPlayer(playerid,dmid)
{
	new colour = COLOUR_DM;
	if (DeathmatchStats[dmid][dm_playercount] >= Deathmatch[dmid][dm_minplayers]-1)
	{
		colour = COLOUR_DM;
	}
	else if (DeathmatchStats[dmid][dm_playercount] < (Deathmatch[dmid][dm_minplayers]-1))
	{
		colour = COLOUR_DM_BAD;
	}
	
	if (GetPlayerLevel(playerid) < Deathmatch[dmid][dm_minlevel])
	{
		colour = COLOUR_DM_BAD;
	}
	return colour;
}

SendPlayerCurrentDeathmatches(playerid)
{
	if (!IsPlayerConnected(playerid)) return;
	new string[MAX_STRING];
	new dmfound;
	for (new dmid=1; dmid<=DMCount;dmid++)
	{
	    if ((DeathmatchStats[dmid][dm_state] == DM_STATE_LINEUP) || (DeathmatchStats[dmid][dm_state] == DM_STATE_ACTIVE))
	    {
	        if (dmfound == 0)
	        {
	       		SendPlayerFormattedText(playerid, "Available deathmatches: ", 0,COLOUR_DM);
	        	dmfound++;
	        }
	        if (DeathmatchStats[dmid][dm_playercount] >= Deathmatch[dmid][dm_minplayers])
	        {
	            format(string, sizeof(string), "Deathmatch: '%s' (dmid:%d). Players: %d. Start Location: '%s'.",Deathmatch[dmid][dm_name],dmid,DeathmatchStats[dmid][dm_playercount],GetDMStartZoneName(dmid));
			}
			else 
			{
				format(string, sizeof(string), "Deathmatch: '%s' (dmid:%d). Players: %d/%d. Start Location: '%s'.",Deathmatch[dmid][dm_name],dmid,DeathmatchStats[dmid][dm_playercount],Deathmatch[dmid][dm_minplayers],GetDMStartZoneName(dmid));
			}
	    	SendPlayerFormattedText(playerid, string, 0,GetDMColourForPlayer(playerid,dmid));
	    }
	    else if (IsPlayerAdmin(playerid))
	    {
	        if (strlen(Deathmatch[dmid][dm_name]) > 0)
	        {
	    		format(string, sizeof(string), "Deathmatch: '%s' (dmid:%d).",Deathmatch[dmid][dm_name],dmid);
            	SendPlayerFormattedText(playerid, string, 0,COLOUR_RED);
			}
	    }
	}
	if (dmfound == 0)
	{
		SendPlayerFormattedText(playerid, "There are no available deathmatches at this time.", 0,COLOUR_RED);
	}
}

GetPlayerDM(playerid)
{
	if (!IsPlayerConnected(playerid)) return 0;
	for (new dmid=1; dmid<=DMCount;dmid++)
	{
	    if (DeathmatchStats[dmid][dm_state] == DM_STATE_DISABLED) continue;
	    if (PlayerQuest[playerid] == GetDMQuestID(dmid)) // if player is in this dm
	    {
	        return dmid;
		}
	}
	return 0;
}

GetDMQuestID(dmid)
{
	return DeathmatchStats[dmid][dm_questid];
}


//----------------------------------------

Float:GetDMCPX(dmid)
{
	return DMStartCP[dmid][Coord_X];
}
Float:GetDMCPY(dmid)
{
	return DMStartCP[dmid][Coord_Y];
}
Float:GetDMCPZ(dmid)
{
	return DMStartCP[dmid][Coord_Z];
}

GetDMStartZoneName(dmid)
{
	new zone[MAX_NAME];
	zone = GetXYZZoneName(GetDMCPX(dmid),GetDMCPY(dmid),GetDMCPZ(dmid));
	return zone;
}

GetDMWinner(dmid)
{
	new winnerid=INVALID_PLAYER_ID;
	new winnerscore;
	for (new playerid=0; playerid<MAX_PLAYERS;playerid++)
	{
		if (!IsPlayerConnected(playerid)) continue;
	   	if (PlayerQuest[playerid] == GetDMQuestID(dmid)) // if player is in this dm
	    {
	        if (DMPlayerStats[playerid][dm_player_kills] - DMPlayerStats[playerid][dm_player_deaths] > winnerscore)
	        {
	            winnerid = playerid;
	            winnerscore = DMPlayerStats[playerid][dm_player_kills] - DMPlayerStats[playerid][dm_player_deaths];
	        }
	    }
	}
	return winnerid;
}


UpdateDMScore(dmid)
{
	new winnerid = GetDMWinner(dmid);
	if (winnerid != INVALID_PLAYER_ID)
	{
	    new string[MAX_STRING];
	    format(string, sizeof(string), "%s is in 1st place with %d kills and %d deaths.",oGetPlayerName(winnerid),DMPlayerStats[winnerid][dm_player_kills],DMPlayerStats[winnerid][dm_player_deaths]);
		SendMessageToDMPlayers(dmid,string,COLOUR_DM);
	}
}

MakeDMSleepTime(dmid)
{
	new sleeptime;
	if (Deathmatch[dmid][dm_frequency] == 0) Deathmatch[dmid][dm_frequency] = 5;
	sleeptime = ((Deathmatch[dmid][dm_frequency] * DMCount) * 125);
	return sleeptime;
}

IsWeaponAllowedInDM(weaponid,dmid)
{
	if (weaponid == 0) return 1; //unarmed always allowed
	new weapons[MAX_DMWEAPONS+1];
	set(weapons,Deathmatch[dmid][dm_weapons]);
	for (new i=0;i<strlen(weapons);i++)
	{
	    if (weapons[i] == weaponid) return 1;
	}
	return 0;
}

public OnPlayerDMKill(playerid,victimid,weaponid)
{

    // check gang kill
    //if (PlayerGangid[killerid] != 0)
	//{
	//    if (GangKill(PlayerGangid[killerid],killerid,victimid,reason) == 1) return;
	//}

	Player[playerid][Kills]++;
	PlayerCurrentKills[playerid]++;
	
	new dmid = GetPlayerDM(playerid);
	if ((dmid == INVALID_DM_ID) || (!IsPlayerInDM(playerid,dmid)))
	{
	 	DMResetPlayerStats(playerid);
		return; // player not in a dm
	}
	if (IsWeapon(weaponid))
	{
		if (!IsWeaponAllowedInDM(weaponid,dmid))
		{
	    	KickPlayer(playerid,"Invalid deathmatch weapon.");
	    	return;
		}
	}
	if (GetPlayerDM(victimid) != dmid)
	{
	    new string[MAX_STRING];
		format(string, sizeof(string), "%s is not in the deathmatch.",oGetPlayerName(victimid));
		SendMessageToDMPlayers(dmid,string,COLOUR_DM);
	}
	DMPlayerStats[playerid][dm_player_kills]++;
	GivePlayerXP(playerid,Deathmatch[dmid][dm_xpkill],1);

	if (GetDMWinner(dmid) == playerid)
	{
		UpdateDMScore(dmid);
   	}
   	new string[MAX_STRING];
	format(string, sizeof(string), "Position: %s. Deaths: %d. Kills: %d.",FormatPosition(GetPlayerDMPosition(playerid,dmid)),DMPlayerStats[playerid][dm_player_deaths],DMPlayerStats[playerid][dm_player_kills]);
	PlayerPlaySound(playerid,1056,GetPlayerX(playerid),GetPlayerY(playerid),GetPlayerZ(playerid));
   	GameTextForPlayer(playerid, string,3000,6);
}

public OnPlayerDMDeath(playerid,killerid)
{
	new string[MAX_STRING];
	Player[playerid][Deaths]++;
	PlayerCurrentKills[playerid] = 0;
	if (oGetPlayerHealth(killerid) > 100)
    {
       KickPlayer(killerid,"Invalid health amount. (cheat?)");
	}
	
	new dmid = GetPlayerDM(playerid);
	if ((dmid == INVALID_DM_ID) || (!IsPlayerInDM(playerid,dmid)))
	{
	 	DMResetPlayerStats(playerid);
		return; // player not in a dm
	}
	DMPlayerStats[playerid][dm_player_deaths]++;
	
	GivePlayerXP(playerid,0-Deathmatch[dmid][dm_xpdeath],1);
	DMPlayerSpawn(playerid,dmid);
	format(string, sizeof(string), "Position: %s. Deaths: %d. Kills: %d.",FormatPosition(GetPlayerDMPosition(playerid,dmid)),DMPlayerStats[playerid][dm_player_deaths],DMPlayerStats[playerid][dm_player_kills]);
	PlayerPlaySound(playerid,1057,GetPlayerX(playerid),GetPlayerY(playerid),GetPlayerZ(playerid));
   	GameTextForPlayer(playerid, string,3000,6);
}


public OnPlayerEnterDMCheckpoint(playerid)
{
	new playerdmid = GetPlayerDM(playerid);
	new string[MAX_STRING];
	for (new dmid=1; dmid<=DMCount;dmid++) //  for each dm
	{
	    if (DeathmatchStats[dmid][dm_state] == DM_STATE_DISABLED) break;
		
	    if (DeathmatchStats[dmid][dm_state] == DM_STATE_LINEUP)
		{
	    	if (PlayerQuest[playerid] == 0) // if player not on a quest
	    	{
		  		// if player at startline
				if (oIsPlayerInCheckpoint(playerid,GetDMCPX(dmid),GetDMCPY(dmid),GetDMCPZ(dmid),DMCPSize*3))
				{
					JoinDM(playerid,dmid);
				}
			}
			else if (playerdmid == dmid)
			{
				if (oIsPlayerInCheckpoint(playerid,GetDMCPX(dmid),GetDMCPY(dmid),GetDMCPZ(dmid),DMCPSize*3))
				{
					format(string,sizeof(string),"Wait here! Deathmatch starts in %d seconds.",(Deathmatch[dmid][dm_lineupdelay] - DeathmatchStats[dmid][dm_timer]));
					SendClientMessage(playerid,COLOUR_GREEN, string);
				}
			}
		}
		else if (DeathmatchStats[dmid][dm_state] == DM_STATE_ACTIVE)
		{
	    	if (PlayerQuest[playerid] == 0) // if player not on a quest
	    	{
		  		// if player at startline
				if (oIsPlayerInCheckpoint(playerid,GetDMCPX(dmid),GetDMCPY(dmid),GetDMCPZ(dmid),DMCPSize*3))
				{
					//JoinDM(playerid,dmid);
					format(string,sizeof(string),"This deathmatch: '%s' is currently in progress. You can join this deathmatch by typing '/dm join %d'.",Deathmatch[dmid][dm_name],dmid);
					SendClientMessage(playerid,COLOUR_GREEN, string);
				}
			}
			else if (playerdmid == dmid)
			{
				if (oIsPlayerInCheckpoint(playerid,GetDMCPX(dmid),GetDMCPY(dmid),GetDMCPZ(dmid),DMCPSize*3))
				{
					DMPlayerSpawn(playerid,dmid);
					format(string, sizeof(string), "GO!");
					PlayerPlaySound(playerid,1057,GetPlayerX(playerid),GetPlayerY(playerid),GetPlayerZ(playerid));
   					GameTextForPlayer(playerid, string,1000,6);
				}
				else if (DMPlayerStats[playerid][dm_player_gotcentre] == 0)
				{
					if (oIsPlayerInCheckpoint(playerid,DMCentreCP[dmid][Coord_X],DMCentreCP[dmid][Coord_Y],DMCentreCP[dmid][Coord_Z],DMCPSize*3))
					{
					    new xpbonus = Deathmatch[dmid][dm_xpprize]/3;
						format(string,sizeof(string),"You receive %d experience bonus for reaching the centre of the deathmatch.",xpbonus);
						SendClientMessage(playerid,COLOUR_GREEN,string);
						GivePlayerXP(playerid,xpbonus,1);
						DMPlayerStats[playerid][dm_player_gotcentre] = 1;
					}
				}
			}
		}
	}
}

public DMCommandHandler(playerid,text[]) // process player commands
{
	if (!IsPlayerRegistered(playerid))
	{
		return 0; // non registered players dont use weapon commands
	}

	new cmd[20];
	new idx;
	//new string[MAX_STRING];

	set(cmd,strcharsplit(text, idx,strchar(" ")));
	if (strlen(cmd) == 0) return 0;

    if((strcomp(cmd, "/deathmatches", true) || (strcomp(cmd, "/dms", true)) == 1))
	{

		SendPlayerCurrentDeathmatches(playerid);
     	return 1;
	}

    if(strcomp(cmd, "/dm", true) == 1)
	{
	    set(cmd,strcharsplit(text, idx,strchar(" ")));
	    if(strcomp(cmd, "help", true) == 1)
		{
			SendPlayerScrollingText(playerid,"~g~DM help:");
			SendPlayerScrollingText(playerid,"Deathmatches are randomly running all over the world in GTO.");
			SendPlayerScrollingText(playerid,"Type '/deathmatches' to list all currently available dms.");
			SendPlayerScrollingText(playerid,"Type '/dm join <dmid>' to join an active dm (dmid got from /deathmatches).");
			SendPlayerScrollingText(playerid,"Joining a dm costs money, make sure you have enough on you.");
			SendPlayerScrollingText(playerid,"When you join a dm your red map marker will be set to the dm startline.");
			SendPlayerScrollingText(playerid,"You must get to the startline for the start of the dm. (follow your map marker)");
			SendPlayerScrollingText(playerid,"You can also join a dm by entering the startline.");
			SendPlayerScrollingText(playerid,"To leave a dm type '/dm leave' or '/dm quit'.");
			return 1;
		}

	    if(strcomp(cmd, "join", true) == 1)
		{
			new dmid;
			dmid = strval(strcharsplit(text, idx,strchar(" ")));
			if (PlayerQuest[playerid] != 0)
			{
				SendPlayerFormattedText(playerid,"You are currently on another quest. Leave it before joining another.", 0,COLOUR_RED);
				return 1;
			}
			if ((dmid == 0) || (dmid >= MAX_DM))
			{
				SendPlayerFormattedText(playerid,"Bad dmid, Usage: '/dm <dmid>'", 0,COLOUR_RED);
				return 1;
			}
			if (DeathmatchStats[dmid][dm_state] == DM_STATE_DISABLED)
			{
				SendPlayerFormattedText(playerid,"Bad dmid, Usage: '/dm <dmid>'", 0,COLOUR_RED);
				return 1;
			}
			if ((DeathmatchStats[dmid][dm_state] != DM_STATE_LINEUP) && (DeathmatchStats[dmid][dm_state] != DM_STATE_ACTIVE))
			{
				SendPlayerFormattedText(playerid,"You cannot join that deathmatch at this time.", 0,COLOUR_RED);
				return 1;
			}

			if ((Deathmatch[dmid][dm_activedmjoin] == 0) && (DeathmatchStats[dmid][dm_state] == DM_STATE_ACTIVE))
			{
				SendPlayerFormattedText(playerid,"You cant join that deathmatch while it is running.", 0,COLOUR_RED);
				return 1;
			}
			JoinDM(playerid,dmid);
     		return 1;
		}
		if((strcomp(cmd, "leave", true) == 1) || (strcomp(cmd, "quit", true) == 1))
		{
			if (PlayerQuest[playerid] == 0)
			{
				SendPlayerFormattedText(playerid,"You are not currently in a deathmatch.", 0,COLOUR_RED);
				return 1;
			}
			new dmid = GetPlayerDM(playerid);
			if (dmid == 0)
			{
				SendPlayerFormattedText(playerid,"You are not currently in a deathmatch.", 0,COLOUR_RED);
				return 1;
			}
			PlayerLeaveDM(playerid,dmid);
     		return 1;
		}
     	return 0;
	}
	return 0;
}

DeathmatchLoadAll()
{
    if (ForceOverwrite) return;
	new temp[MAX_STRING];
	if (!dini_Exists(ConfigDB))	dini_Create(ConfigDB);
	set(temp,dini_Get(ConfigDB,"Deathmatch_DB"));
	if (strlen(temp) > 0) set(DeathmatchDB,temp);
	set(temp,dini_Get(ConfigDB,"Deathmatch_Base_DB"));
	if (strlen(temp) > 0) set(DMBaseDB,temp);
	set(temp,dini_Get(ConfigDB,"Deathmatch_Record_DB"));
	if (strlen(temp) > 0) set(DMRecordDB,temp);


	if (!dini_Exists(DeathmatchDB))
	{
		dini_Create(DeathmatchDB);
	}

	for (new dmdbid=0;dmdbid<MAX_DM;dmdbid++)
 	{ // load all our dms from db
 	    new cellname[MAX_STRING];
		format(cellname,sizeof(cellname),"Deathmatch%d",dmdbid);
		set(temp,dini_Get(DeathmatchDB,cellname));
 		if (strlen(temp) == 0) continue;
 		if (!DeathmatchBaseDBExists(temp)) continue;
 		new dmid = RegisterDM(temp);
 		if (dmid == INVALID_DM_ID) continue;
 		DeathmatchLoadBaseDB(dmid);
 		DeathmatchLoadRecordDB(dmid);
	}

	return;
}

DeathmatchBaseDBExists(dmname[MAX_STRING])
{ 
	new rdbname[MAX_STRING];
	format(rdbname,sizeof(rdbname),"%sGTO.Deathmatch.%s.txt",DMBaseDB,dmname);
	if (!dini_Exists(rdbname))
	{
		return 0;
	}
	return 1;
}

DeathmatchLoadBaseDB(dmid)
{ // load dm from db
	if (ForceOverwrite) return INVALID_DM_ID;
	new temp[MAX_STRING];
	new rdbname[MAX_STRING];
	format(rdbname,sizeof(rdbname),"%sGTO.Deathmatch.%s.txt",DMBaseDB,Deathmatch[dmid][dm_name]);
	if (!dini_Exists(rdbname))
	{
		return INVALID_DM_ID;
	}
	set(temp,dini_Get(rdbname,"Name"));
	if (strlen(temp) > 0) set(Deathmatch[dmid][dm_name],temp);
 	set(temp,nullstr);

	if (dmid <= 0)
	{
 		printf("Deathmatch (db): '%s' Failed to load.",Deathmatch[dmid][dm_name]);
 		return INVALID_DM_ID;
	}

 	set(temp,dini_Get(rdbname,"Frequency"));
 	if (strlen(temp) > 0) Deathmatch[dmid][dm_frequency] = strval(temp);
 	set(temp,nullstr);

 	set(temp,dini_Get(rdbname,"Lineup_Delay"));
 	if (strlen(temp) > 0) Deathmatch[dmid][dm_lineupdelay] = strval(temp);
 	set(temp,nullstr);

 	set(temp,dini_Get(rdbname,"Min_Players"));
 	if (strlen(temp) > 0) Deathmatch[dmid][dm_minplayers] = strval(temp);
 	set(temp,nullstr);

 	set(temp,dini_Get(rdbname,"Min_Level"));
 	if (strlen(temp) > 0) Deathmatch[dmid][dm_minlevel] = strval(temp);
 	set(temp,nullstr);

 	set(temp,dini_Get(rdbname,"Cash_Prize"));
 	if (strlen(temp) > 0) Deathmatch[dmid][dm_cashprize] = strval(temp);
 	set(temp,nullstr);

 	set(temp,dini_Get(rdbname,"Cash_Entry"));
 	if (strlen(temp) > 0) Deathmatch[dmid][dm_cashentry] = strval(temp);
 	set(temp,nullstr);

 	set(temp,dini_Get(rdbname,"XP_Prize"));
 	if (strlen(temp) > 0) Deathmatch[dmid][dm_xpprize] = strval(temp);
 	set(temp,nullstr);

 	set(temp,dini_Get(rdbname,"XP_Bonus"));
 	if (strlen(temp) > 0) Deathmatch[dmid][dm_xpbonus] = strval(temp);
 	set(temp,nullstr);

 	set(temp,dini_Get(rdbname,"Max_Time"));
 	if (strlen(temp) > 0) Deathmatch[dmid][dm_maxtime] = strval(temp);
 	set(temp,nullstr);

 	set(temp,dini_Get(rdbname,"XP_Kill"));
 	if (strlen(temp) > 0) Deathmatch[dmid][dm_xpkill] = strval(temp);
 	set(temp,nullstr);

 	set(temp,dini_Get(rdbname,"XP_Death"));
 	if (strlen(temp) > 0) Deathmatch[dmid][dm_xpdeath] = strval(temp);
 	set(temp,nullstr);
 	
 	set(temp,dini_Get(rdbname,"Join_Active"));
 	if (strlen(temp) > 0) Deathmatch[dmid][dm_activedmjoin] = strval(temp);
 	set(temp,nullstr);

 	set(temp,dini_Get(rdbname,"Max_Distance"));
 	if (strlen(temp) > 0) Deathmatch[dmid][dm_distance] = strval(temp);
 	set(temp,nullstr);
 	
 	set(temp,dini_Get(rdbname,"Weapons"));
 	if (strlen(temp) > 0) set(Deathmatch[dmid][dm_weapons],DMDecodeWeaponsDB(temp));
 	set(temp,nullstr);

 	new Float:X;
 	new Float:Y;
 	new Float:Z;

 	set(temp,dini_Get(rdbname,"Start_CP"));
 	if (strlen(temp) != 0)
 	{
 	    new idx=0;
 		X = floatstr(strcharsplit(temp,idx,strchar(",")));
 		Y = floatstr(strcharsplit(temp,idx,strchar(",")));
 		Z = floatstr(strcharsplit(temp,idx,strchar(",")));
 		set(temp,nullstr);
 		if ((X != 0.0) || (Y != 0.0))
 		{
			DMStartCP[dmid][Coord_X] = X;
			DMStartCP[dmid][Coord_Y] = Y;
			DMStartCP[dmid][Coord_Z] = Z;
			X = 0.0;
			Y = 0.0;
			Z = 0.0;
		}
	}
	
	set(temp,dini_Get(rdbname,"Centre_CP"));
 	if (strlen(temp) != 0)
 	{
 	    new idx=0;
 		X = floatstr(strcharsplit(temp,idx,strchar(",")));
 		Y = floatstr(strcharsplit(temp,idx,strchar(",")));
 		Z = floatstr(strcharsplit(temp,idx,strchar(",")));
 		set(temp,nullstr);
 		if ((X != 0.0) || (Y != 0.0))
 		{
			DMCentreCP[dmid][Coord_X] = X;
			DMCentreCP[dmid][Coord_Y] = Y;
			DMCentreCP[dmid][Coord_Z] = Z;
			X = 0.0;
			Y = 0.0;
			Z = 0.0;
		}
	}

 	new spsize;
 	for (new spid=0;spid<MAX_DM_SP;spid++)
 	{
 	    new cellname[MAX_STRING];
		format(cellname,sizeof(cellname),"SP%d",spid);
		set(temp,dini_Get(rdbname,cellname));
 		if (strlen(temp) == 0) break;
 		new idx=0;
 		X = floatstr(strcharsplit(temp,idx,strchar(",")));
 		Y = floatstr(strcharsplit(temp,idx,strchar(",")));
 		Z = floatstr(strcharsplit(temp,idx,strchar(",")));
 		set(temp,nullstr);
 		if ((X == 0.0) && (Y == 0.0)) break;
		DMSpawnPoints[dmid][spid][Coord_X] = X;
		DMSpawnPoints[dmid][spid][Coord_Y] = Y;
		DMSpawnPoints[dmid][spid][Coord_Z] = Z;
		spsize++;
	}

	DMSpawnsSize[dmid] = spsize;
	DeathmatchStats[dmid][dm_state] = DM_STATE_SLEEPING;
	DeathmatchStats[dmid][dm_timer] = MakeDMSleepTime(dmid);
  	printf("Deathmatch (DB): '%s' Loaded.",Deathmatch[dmid][dm_name]);
  	return dmid;
}

DeathmatchLoadRecordDB(dmid)
{
	new rdbname[MAX_STRING];
	new temp[MAX_STRING];
 	format(rdbname,sizeof(rdbname),"%sGTO.Deathmatch.Record.%s.txt",DMRecordDB,Deathmatch[dmid][dm_name]);
 	if (!dini_Exists(rdbname)) return;
	set(temp,dini_Get(rdbname,"Best_Score_Record"));
	if (strlen(temp) > 0) DMBestScore[dmid][dm_score_record] = strval(temp);
	set(temp,nullstr);
	set(temp,dini_Get(rdbname,"Best_Score_Player"));
	if (strlen(temp) > 0) set(DMBestScore[dmid][dm_score_player],temp);
	set(temp,nullstr);
	set(temp,dini_Get(rdbname,"Best_Score_Kills"));
	if (strlen(temp) > 0) DMBestScore[dmid][dm_score_kills] = strval(temp);
	set(temp,nullstr);
	set(temp,dini_Get(rdbname,"Best_Score_Deaths"));
	if (strlen(temp) > 0) DMBestScore[dmid][dm_score_deaths] = strval(temp);
	set(temp,nullstr);
}

DeathmatchSaveAll()
{
	if (!dini_Exists(ConfigDB)) dini_Create(ConfigDB);
	dini_Set(ConfigDB,"Deathmatch_Base_DB",DMBaseDB);
	dini_Set(ConfigDB,"Deathmatch_Record_DB",DMRecordDB);

	if (!dini_Exists(DeathmatchDB)) dini_Create(DeathmatchDB);
	for (new dmid=1;dmid<=DMCount;dmid++)
 	{ // load all our dms from db
 	    if (DeathmatchStats[dmid][dm_state] == DM_STATE_DISABLED) continue;
 	    new cellname[MAX_STRING];
		format(cellname,sizeof(cellname),"Deathmatch%d",dmid);
		dini_Set(DeathmatchDB,cellname,Deathmatch[dmid][dm_name]);

 		DeathmatchSaveBaseDB(dmid);
 		DeathmatchSaveRecordDB(dmid);
	}
}

DeathmatchSaveScores()
{
	if (!dini_Exists(ConfigDB)) dini_Create(ConfigDB);
	dini_Set(ConfigDB,"Deathmatch_Base_DB",DMBaseDB);
	dini_Set(ConfigDB,"Deathmatch_Record_DB",DMRecordDB);

	if (!dini_Exists(DeathmatchDB)) dini_Create(DeathmatchDB);
	for (new dmid=1;dmid<=DMCount;dmid++)
 	{ // load all our dms from db
 	    if (DeathmatchStats[dmid][dm_state] == DM_STATE_DISABLED) continue;
 	    new cellname[MAX_STRING];
		format(cellname,sizeof(cellname),"Deathmatch%d",dmid);
		dini_Set(DeathmatchDB,cellname,Deathmatch[dmid][dm_name]);
 		DeathmatchSaveRecordDB(dmid);
	}
}

DeathmatchSaveBaseDB(dmid)
{ // save dm to db
	if (DeathmatchStats[dmid][dm_state] == DM_STATE_DISABLED) return;
	new temp[MAX_STRING];
	new rdbname[MAX_STRING];
	format(rdbname,sizeof(rdbname),"%sGTO.Deathmatch.%s.txt",DMBaseDB,Deathmatch[dmid][dm_name]);
	if (!dini_Exists(rdbname))
	{
		dini_Create(rdbname);
	}
	dini_Set(rdbname,"Name",Deathmatch[dmid][dm_name]);

	valstr(temp,Deathmatch[dmid][dm_frequency]);
 	dini_Set(rdbname,"Frequency",temp);
 	set(temp,nullstr);

	valstr(temp,Deathmatch[dmid][dm_lineupdelay]);
 	dini_Set(rdbname,"Lineup_Delay",temp);
 	set(temp,nullstr);

	valstr(temp,Deathmatch[dmid][dm_minplayers]);
 	dini_Set(rdbname,"Min_Players",temp);
 	set(temp,nullstr);

	valstr(temp,Deathmatch[dmid][dm_minlevel]);
 	dini_Set(rdbname,"Min_Level",temp);
 	set(temp,nullstr);

	valstr(temp,Deathmatch[dmid][dm_cashprize]);
 	dini_Set(rdbname,"Cash_Prize",temp);
 	set(temp,nullstr);

	valstr(temp,Deathmatch[dmid][dm_cashentry]);
 	dini_Set(rdbname,"Cash_Entry",temp);
 	set(temp,nullstr);

 	valstr(temp,Deathmatch[dmid][dm_xpprize]);
 	dini_Set(rdbname,"XP_Prize",temp);
 	set(temp,nullstr);

 	valstr(temp,Deathmatch[dmid][dm_xpbonus]);
 	dini_Set(rdbname,"XP_Bonus",temp);
 	set(temp,nullstr);

 	valstr(temp,Deathmatch[dmid][dm_maxtime]);
 	dini_Set(rdbname,"Max_Time",temp);
 	set(temp,nullstr);

  	valstr(temp,Deathmatch[dmid][dm_xpkill]);
 	dini_Set(rdbname,"XP_Kill",temp);
 	set(temp,nullstr);

 	valstr(temp,Deathmatch[dmid][dm_xpdeath]);
 	dini_Set(rdbname,"XP_Death",temp);
 	set(temp,nullstr);
 	
 	valstr(temp,Deathmatch[dmid][dm_activedmjoin]);
 	dini_Set(rdbname,"Join_Active",temp);
 	set(temp,nullstr);
 	
 	valstr(temp,Deathmatch[dmid][dm_distance]);
 	dini_Set(rdbname,"Max_Distance",temp);
 	set(temp,nullstr);

 	set(temp,DMEncodeWeaponsDB(dmid));
	dini_Set(rdbname,"Weapons",temp);
 	set(temp,nullstr);

 	format(temp,sizeof(temp),"%f,%f,%f,",DMStartCP[dmid][Coord_X],DMStartCP[dmid][Coord_Y],DMStartCP[dmid][Coord_Z]);
	dini_Set(rdbname,"Start_CP",temp);
 	set(temp,nullstr);
 	
 	format(temp,sizeof(temp),"%f,%f,%f,",DMCentreCP[dmid][Coord_X],DMCentreCP[dmid][Coord_Y],DMCentreCP[dmid][Coord_Z]);
	dini_Set(rdbname,"Centre_CP",temp);
 	set(temp,nullstr);

 	for (new spid=0;spid<DMSpawnsSize[dmid];spid++)
 	{
 	    new cellname[MAX_STRING];
		format(cellname,sizeof(cellname),"SP%d",spid);
		format(temp,sizeof(temp),"%f,%f,%f,",DMSpawnPoints[dmid][spid][Coord_X],DMSpawnPoints[dmid][spid][Coord_Y],DMSpawnPoints[dmid][spid][Coord_Z]);
		dini_Set(rdbname,cellname,temp);
	}

	#if OUTPUTLEVEL > 1
		printf("DM base saved: %s",Deathmatch[dmid][dm_name]);
	#endif
}

DeathmatchSaveRecordDB(dmid)
{
	new temp[MAX_STRING];
	new rdbname[MAX_STRING];
 	format(rdbname,sizeof(rdbname),"%sGTO.Deathmatch.Record.%s.txt",DMRecordDB,Deathmatch[dmid][dm_name]);
	if (!dini_Exists(rdbname)) dini_Create(rdbname);
 	dini_Set(rdbname,"Name",Deathmatch[dmid][dm_name]);
 	set(temp,nullstr);
 	valstr(temp,DMBestScore[dmid][dm_score_record]);
 	dini_Set(rdbname,"Best_Score_Record",temp);
 	set(temp,nullstr);
 	set(temp,DMBestScore[dmid][dm_score_player]);
 	dini_Set(rdbname,"Best_Score_Player",temp);
 	set(temp,nullstr);
 	valstr(temp,DMBestScore[dmid][dm_score_kills]);
 	dini_Set(rdbname,"Best_Score_Kills",temp);
 	set(temp,nullstr);
 	valstr(temp,DMBestScore[dmid][dm_score_deaths]);
 	dini_Set(rdbname,"Best_Score_Deaths",temp);
 	set(temp,nullstr);
	return;
}

DMEncodeWeaponsDB(dmid)
{
	new weps[MAX_DMWEAPONS+1];
	new retstr[MAX_STRING];
	set(weps,Deathmatch[dmid][dm_weapons]);
	for (new i=0;i<strlen(weps);i++)
	{
	    if (weps[i] == 0) break;
	    new tempstr[10];
	    valstr(tempstr,weps[i]);
	    strins(retstr,tempstr,strlen(retstr));
		retstr[strlen(retstr)] = '/';
	}
	return retstr;
}

DMDecodeWeaponsDB(wepstr[])
{
	new weps[MAX_DMWEAPONS];
	new tmpwepstr[20];
	new idx;

	for (new i=0;((i<strlen(wepstr)) && (i<MAX_DMWEAPONS));i++)
	{
		set(tmpwepstr,strcharsplit(wepstr, idx,'/'));
		if (strlen(tmpwepstr) == 0) break;
		weps[i] = strval(tmpwepstr);
		if (weps[i] == 0) break;
	}
	//set(Deathmatch[dmid][dm_weapons],weps);
	return weps;
}


