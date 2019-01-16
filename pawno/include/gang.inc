//
// Created:     14.09.06
// Aurthor:    Iain Gilbert
//

#if defined _gang_included
  #endinput
#endif

#define _gang_included
#pragma library gang
#include "base"

#define MAX_GANGS MAX_PLAYERS // maximum gangs (at runtime), (total maximum gangs is unlimited)
#define MAX_GANG_SIZE 20 // maximum number of ppl can be in any specific gang

new GANG_CREATE_COST = 50000; // money cost to create a gang
new GANG_COLOUR_COST = 10000; // cost to change gang colour
new GangDB[MAX_STRING] = "GTO\\Gang\\";

enum MemberInfo {
	member_active,
	member_online, // bool
	member_name[MAX_NAME],
	member_playerid
}

enum GangInfo {
	gang_active, //bool
	gang_name[MAX_NAME],
    gang_colour,
    gang_kills,
    gang_score
}

enum ColourInfo {
	colour_name[MAX_NAME],
    colour_code
}
#define COLOURS_SIZE 7
new GangColours[COLOURS_SIZE][ColourInfo] = {
{	"Red",     COLOUR_RED},
{	"Orange",    COLOUR_ORANGE},
{	"Yellow",    COLOUR_YELLOW},
{	"Green",    COLOUR_GREEN},
{	"Blue",    COLOUR_BLUE},
{	"LightBlue",    COLOUR_LIGHTBLUE},
{	"White",    COLOUR_WHITE}
};

new GangMemberInfo[MAX_GANGS*MAX_GANG_SIZE][MemberInfo]; //shit way of '3d' array
new GangMembers[MAX_GANGS][MAX_GANG_SIZE]; // shit

new Gangs[MAX_GANGS][GangInfo];
new GangInvite[MAX_PLAYERS];
new tempstring[MAX_STRING];

public GangLoadConfig()
{
    if (ForceOverwrite) return;
	if (!dini_Exists(ConfigDB)) return;
	new temp[MAX_STRING];
	set(temp,dini_Get(ConfigDB,"Gang_DB"));
	if (strlen(temp) > 0) set(GangDB,temp);
	set(temp,nullstr);
	set(temp,dini_Get(ConfigDB,"Gang_Create_Cost"));
	if (strlen(temp) > 0) GANG_CREATE_COST = strval(temp);
	set(temp,nullstr);
	set(temp,dini_Get(ConfigDB,"Gng_Colour_Cost"));
	if (strlen(temp) > 0) GANG_COLOUR_COST =strval(temp);

	return;
}

public GangSaveConfig()
{
	if (!dini_Exists(ConfigDB)) return;
	new temp[MAX_STRING];
	dini_Set(ConfigDB,"Gang_DB",GangDB);
	valstr(temp,GANG_CREATE_COST);
	dini_Set(ConfigDB,"Gang_Create_Cost",temp);
	valstr(temp,GANG_COLOUR_COST);
	dini_Set(ConfigDB,"Gang_Colour_Cost",temp);
	return;
}

public GetFreeMemberID()
{
	for (new memberid = 1;memberid<MAX_GANG_SIZE*MAX_GANGS;memberid++)
	{
	    if (GangMemberInfo[memberid][member_active] == 0)
	    {
	        return memberid;
		}
	}
	return 0;
}

public GangLoad(gangname[])
{

	// search for gang in runtime memory
	for (new id=1;id<MAX_GANGS;id++)
	{
		if (Gangs[id][gang_active] == 1)
		{
			if (strcomp(gangname,Gangs[id][gang_name],false) == 1)
			{
			    return id; // gang found in runtime memory
			}
		}
	}
	
	new gangid;
	for (new id=1;id<MAX_GANGS;id++)
	{
	    if(!Gangs[id][gang_active])
	    {
	    	gangid = id;
	    	Gangs[id][gang_active] = true; // find first free gang slot and andd our gang
	    	break;
		}
	}
	gang_load_db_dini(gangid,gangname);
	
	#if OUTPUTLEVEL > 1
		printf("gang_loaded: %d",gangid);
	#endif
	return gangid;
}

gang_load_db_dini(gangid,gangname[])
{
	// udb
	new udbfilename[MAX_NAME];
	set(udbfilename,gangname);
	strcat(udbfilename,".Gang",sizeof(udbfilename));

	// dini
  	new dinifilename[MAX_STRING];
 	format(dinifilename,sizeof(dinifilename),"%sGTO.Gang.%s.txt",GangDB,gangname);

	new useudb = 0;
 	if ((!udb_Exists(udbfilename)) && (!dini_Exists(dinifilename)))
	{
		return;
	}
	if ((udb_Exists(udbfilename)) && (!dini_Exists(dinifilename)))
	{
	    useudb = 1;
	}
	if ((udb_Exists(udbfilename)) && (dini_Exists(dinifilename)))
	{
			udb_Remove(udbfilename);
	}

	if (useudb)
	{
		new gangdbstring[MAX_DBSTRING];
		set(gangdbstring,udb_Loadfile(udbfilename));
		if (gangdbstring[0] == 0) return;
	  	new idx;

		set(Gangs[gangid][gang_name],gangname);
		Gangs[gangid][gang_colour] = strval(strcharsplit(gangdbstring,idx,DBSeperator));
		Gangs[gangid][gang_kills] = strval(strcharsplit(gangdbstring,idx,DBSeperator));
		Gangs[gangid][gang_score] = strval(strcharsplit(gangdbstring,idx,DBSeperator));

		for (new gangmember = 0;gangmember<MAX_GANG_SIZE;gangmember++)
		{ // foreach member

			GangMembers[gangid][gangmember] = GetFreeMemberID();
			new memberid = GangMembers[gangid][gangmember];
			if (memberid == 0)
			{
				#if OUTPUTLEVEL > 1
					printf("script error: free gang member id not found.");
				#endif
		    	return;
			}
			GangMemberInfo[memberid][member_active] = 1;
			GangMemberInfo[memberid][member_online] = 0;
			set(GangMemberInfo[memberid][member_name],strcharsplit(gangdbstring,idx,DBSeperator));
			GangMemberInfo[memberid][member_playerid] = INVALID_PLAYER_ID;
		}
	}
	else
	{
		set(Gangs[gangid][gang_name],dini_Get(dinifilename,"Name"));
		Gangs[gangid][gang_colour] = strval(dini_Get(dinifilename,"Colour"));
		Gangs[gangid][gang_kills] = strval(dini_Get(dinifilename,"Kills"));
		Gangs[gangid][gang_score] = strval(dini_Get(dinifilename,"Score"));

		for (new gangmember = 0;gangmember<MAX_GANG_SIZE;gangmember++)
		{ // foreach member

			GangMembers[gangid][gangmember] = GetFreeMemberID();
			new memberid = GangMembers[gangid][gangmember];
			if (memberid == 0)
			{
				#if OUTPUTLEVEL > 0
					printf("script error: free gang member id not found.");
				#endif
				break;
			}
			GangMemberInfo[memberid][member_active] = 1;
			GangMemberInfo[memberid][member_online] = 0;
			new dinistring[MAX_STRING];
			format(dinistring,sizeof(dinistring),"Member%d",gangmember);
			set(GangMemberInfo[memberid][member_name],dini_Get(dinifilename,dinistring));
			GangMemberInfo[memberid][member_playerid] = INVALID_PLAYER_ID;
		}
	}

}

public GangCommandHandler(playerid,text[]) // process player commands
{

	new cmd[20];
	new idx;

	set(cmd,strcharsplit(text, idx,strchar(" ")));
	if (strlen(cmd) == 0) return 0;
	
	if(strcomp(cmd, "/g", true) == 1)
	{
	    if (PlayerGangid[playerid] == 0) return 1;
	    new gangmessage[MAX_STRING];
	    
	    set(gangmessage,text);
        strdel(gangmessage, 0, idx);
        if (!strlen(gangmessage)) return 1;
	    format(gangmessage, sizeof(gangmessage), "%s gangchat: %s", oGetPlayerName(playerid),gangmessage);
        SendGangMessage(PlayerGangid[playerid],gangmessage,COLOUR_GANG_CHAT);
        return 1;
	}
        
        
        
    if(strcomp(cmd, "/gang", true) == 1)
	{
	
		if (!IsPlayerRegistered(playerid))
		{
			SendPlayerFormattedText(playerid, "You must login to use gang commands", 0,COLOUR_RED);
			return 1;
		}
	
		set(cmd,strcharsplit(text, idx,strchar(" ")));
		if (strlen(cmd) == 0) return 0;
		
		if(strcomp(cmd, "help", true) == 1)
		{
			SendPlayerScrollingText(playerid, "~g~Gang Information:");
			SendPlayerScrollingText(playerid, "You can create gangs in GTO.");
			SendPlayerScrollingText(playerid, "When in a gang you will share some of your experience gained with your gang members.");
			SendPlayerScrollingText(playerid, "Killing your gang members will gain you no experience.");
			SendPlayerScrollingText(playerid, "Gang kills and score are recorded for top gang ladder.");
			SendPlayerScrollingText(playerid, "Type: '/gang commands' for gang command help.");
			return 1;
		}
		
		if(strcomp(cmd, "commands", true) == 1)
		{
			SendPlayerScrollingText(playerid, "~g~Gang Commands:");
			SendPlayerScrollingText(playerid, "'/Gang Create <colour> <gangname>'	 - Create a new gang (Cost: $50,000). eg. '/gang create red My Gang Name'.");
            SendPlayerScrollingText(playerid, "'/Gang colours' 	- Show a list of colours. (used in 'gang create' and '/gang colour' commands)");
			SendPlayerScrollingText(playerid, "'/g <message>' 	- Send gang message. eg. '/g Hey whats up?'.");
			SendPlayerScrollingText(playerid, "'/Gang Quit' 	- Leave/Quit your current gang.");
			SendPlayerScrollingText(playerid, "'/Gang Accept' 	- Join/Accept an invitation to join a gang");
            SendPlayerScrollingText(playerid, "'/Gang Stats' 	- Show stat info about your gang.");
			SendPlayerScrollingText(playerid, "'/Gang Members' 	- Show member info about your gang.");
			SendPlayerScrollingText(playerid, "'/Gang Invite <playername>' 	- Invite a player to join your gang. (Gangleader only)");
            SendPlayerScrollingText(playerid, "'/Gang Kick <playername>' 	- Kick a player from your gang. (Gangleader only) ");
			SendPlayerScrollingText(playerid, "'/Gang Colour <colour>' 		- Set your gangs colour.  (Gangleader only) (cost: $10,000)");
			return 1;
		}
		
		if((strcomp(cmd, "colours", true) == 1) || (strcomp(cmd, "COLOURs", true) == 1))
		{
			SendPlayerFormattedText(playerid, " ", 0,COLOUR_GREY);
			SendPlayerFormattedText(playerid, "Gang Colours:", 0,COLOUR_GREEN);
			for (new i = 0;i<=COLOURS_SIZE;i++)
			{
				format(tempstring, sizeof(tempstring), "'%s'",GangColours[i][colour_name]);
				SendPlayerFormattedText(playerid, tempstring, 0,COLOUR_GREY);
			}
			return 1;
		}
		
		
		if((strcomp(cmd, "stats", true) == 1) || (strcomp(cmd, "stat", true) == 1) || (strcomp(cmd, "status", true) == 1))
		{

		    if (PlayerGangid[playerid] == 0)
		    {
       			SendPlayerFormattedText(playerid, "You are not in a gang.", 0,COLOUR_RED);
		    	return 1;
		    }
		    new gangid = PlayerGangid[playerid];
		    format(tempstring, sizeof(tempstring), "'%s' Gang Stats:", Gangs[gangid][gang_name]);
		    SendPlayerFormattedText(playerid, tempstring, 0,Gangs[gangid][gang_colour]);
		    format(tempstring, sizeof(tempstring), "Gang Kills: %d", Gangs[gangid][gang_kills]);
			SendPlayerFormattedText(playerid, tempstring, 0,COLOUR_MISC);
			format(tempstring, sizeof(tempstring), "Gang Score: %d", Gangs[gangid][gang_score]);
			SendPlayerFormattedText(playerid, tempstring, 0,COLOUR_MISC);
				
			format(tempstring, sizeof(tempstring), "Online Members Count: %d", GangOnlineCount(gangid));
			SendPlayerFormattedText(playerid, tempstring, 0,COLOUR_MISC);
			return 1;
		}
		
		if(strcomp(cmd, "members", true) == 1)
		{

		    if (PlayerGangid[playerid] == 0)
		    {
		    	SendPlayerFormattedText(playerid, "You are not in a gang.", 0,COLOUR_RED);
		    	return 1;
		    }
		    new gangid = PlayerGangid[playerid];
		    new status[10];
		    format(tempstring, sizeof(tempstring), "'%s' Gang Members: ", Gangs[gangid][gang_name]);
		    SendPlayerFormattedText(playerid, tempstring, 0,Gangs[gangid][gang_colour]);
		    
		    for (new gangmember = 0;gangmember<MAX_GANG_SIZE;gangmember++)
			{ // foreach member
				new memberid = GangMembers[gangid][gangmember];
				if (strlen(GangMemberInfo[memberid][member_name]) > 0)
		        {
		       		if (GangMemberInfo[memberid][member_online])
		        	{
						set(status,"Online");
		    			format(tempstring, sizeof(tempstring), "Name: %s.      Status: %s.      Level: %d.", GangMemberInfo[memberid][member_name],status,GetPlayerLevel(GangMemberInfo[memberid][member_playerid]));
					}
					else
					{
						set(status,"Offline");
						format(tempstring, sizeof(tempstring), "Name: %s.      Status: %s.", GangMemberInfo[memberid][member_name],status);
					}
					SendPlayerFormattedText(playerid, tempstring, 0,COLOUR_MISC);
				}
			}
			return 1;
			
		}
		
		if(strcomp(cmd, "create", true) == 1)
		{
		
		    if (PlayerGangid[playerid] != 0)
		    {
		    	SendPlayerFormattedText(playerid, "You are already in a gang.", 0,COLOUR_RED);
		    	return 1;
		    }
			
		    if (oGetPlayerMoney(playerid) < GANG_CREATE_COST)
		    {
		        format(tempstring, sizeof(tempstring), "You need $%d to create a gang.", GANG_CREATE_COST);
		    	SendPlayerFormattedText(playerid, tempstring, 0,COLOUR_RED);
		    	return 1;
		    }
			new gangname[MAX_STRING];
			new colourname[MAX_NAME];
			new gangcolour=255;
			
			set(colourname,strcharsplit(text, idx,strchar(" ")));
			if(!strlen(colourname))
			{
			    SendPlayerFormattedText(playerid, "BAD COLOUR: Usage: '/gang create <gangcolour> <gangname>'", 0,COLOUR_RED);
                SendPlayerFormattedText(playerid, "Use '/gang colours' for more colour information.", 0,COLOUR_RED);
				return 1;
	        }

	        for (new colourid=0;colourid<COLOURS_SIZE;colourid++)
	        {
	            if (strcomp(colourname,GangColours[colourid][colour_name],true) == 1)
	            {
	            	gangcolour = GangColours[colourid][colour_code];
				}
	        }
	        if (gangcolour == 255)
	        {
	        	SendPlayerFormattedText(playerid, "BAD COLOUR: Usage: '/gang create <gangcolour> <gangname>'", 0,COLOUR_RED);
                SendPlayerFormattedText(playerid, "Use '/gang colours' for more information on gang colours.", 0,COLOUR_RED);
				return 1;
			}
			

	    	set(gangname,text);
        	strdel(gangname, 0, idx);
        	if (strlen(gangname) <3)
			{
   				SendPlayerFormattedText(playerid, "BAD GANG NAME: Gang name must be at least 3 characters long.'", 0,COLOUR_RED);
				return 1;
			}
			if (strlen(gangname) >40)
			{
   				SendPlayerFormattedText(playerid, "BAD GANG NAME: Gang name must be at most 40 characters long. Please choose a shorter name.'", 0,COLOUR_RED);
				return 1;
			}
			new tempname[MAX_STRING];
			set(tempname,gangname);
			if (!StringCharCheck(tempname))
			{
				SendPlayerFormattedText(playerid, "BAD GANG NAME. Please use only a-z,0-9 characters in gangname.", 0,COLOUR_RED);
				return 1;
			}
			
			if (GangCreate(playerid,gangname,gangcolour) != 0)
			{
				oGivePlayerMoney(playerid,0-GANG_CREATE_COST,1);
				SendPlayerFormattedText(playerid, "Gang Created!", 0,COLOUR_GREEN);
			}
			else
			{
				SendPlayerFormattedText(playerid, "Gang Create Failed!", 0,COLOUR_RED);
			}
                
			return 1;
		} // end create
		
		if((strcomp(cmd, "accept", true) == 1) || (strcomp(cmd, "join", true) == 1))
		{
		    if (PlayerGangid[playerid] != 0)
		    {
		    	SendPlayerFormattedText(playerid, "You are already in a gang!", 0,COLOUR_RED);
				return 1;
		    }
		    if (GangInvite[playerid] == 0)
		    {
		    	SendPlayerFormattedText(playerid, "You have not been invited to join a gang!", 0,COLOUR_RED);
				return 1;
		    }
			new gangid = GangInvite[playerid];
			
			if (GangOnlineCount(gangid) >= MAX_GANG_SIZE)
			{
			
				SendPlayerFormattedText(playerid, "That gang is already full. You cannot accept a join invitation from that gang.", 0,COLOUR_RED);
				GangInvite[playerid] = 0;
				return 1;
			}
			
		    
		    if (GangJoinMember(gangid,playerid) == 1)
		    {
		        format(tempstring, sizeof(tempstring), "You have joined '%s' gang.", Gangs[gangid][gang_name]);
				SendPlayerFormattedText(playerid, tempstring, 0,COLOUR_GANG);
				format(tempstring, sizeof(tempstring), "%s has joined your gang.", oGetPlayerName(playerid));
				SendGangMessage(gangid,tempstring,COLOUR_GANG);
				return 1;
			}
			else
			{
		        format(tempstring, sizeof(tempstring), "Gang join failed. Make sure gang members are online.", Gangs[gangid][gang_name]);
				SendPlayerFormattedText(playerid, tempstring, 0,COLOUR_RED);
				return 1;
			}
		}
		
		if (PlayerGangid[playerid] == 0)
		{
			SendPlayerFormattedText(playerid, "You are not in a gang!", 0,COLOUR_RED);
			return 1;
		}
		new gangid = PlayerGangid[playerid];
		new leadermemberid = GangMembers[gangid][0];
		
		
		if((strcomp(cmd, "quit", true) == 1) || (strcomp(cmd, "leave", true) == 1))
		{

		    if (PlayerGangid[playerid] == 0)
		    {
		    	SendPlayerFormattedText(playerid, "You are not in a gang.", 0,COLOUR_RED);
		    	return 1;
		    }
		    GangRemoveMember(gangid,oGetPlayerName(playerid));
		    return 1;
		}
		
		if(strcomp(cmd, "invite", true) == 1)
		{
		    if (strcomp(GangMemberInfo[leadermemberid][member_name],oGetPlayerName(playerid),false) == 0)
		    { // player is not leader of this gang
		    	SendPlayerFormattedText(playerid, "You must be the gang leader to use this command.", 0,COLOUR_RED);
				return 1;
			}
		    new inviteid = INVALID_PLAYER_ID;
		    
		    new inviteplayername[MAX_NAME];
			set(inviteplayername,text);
            strdel(inviteplayername, 0, idx);
            if (!strlen(inviteplayername))
            {
			   	SendPlayerFormattedText(playerid, " Usage: '/gang invite <playername>'", 0,COLOUR_RED);
               	return 1;
	        }
            
            
            for (new i = 0;i<MAX_PLAYERS;i++)
            {
                if (IsPlayerRegistered(i))
                {
                    if (strcomp(oGetPlayerName(i),inviteplayername,true) == 1)
                    {
                    	inviteid = i;
                    	break;
                    }
                }
            }
		    
		    if (inviteid == INVALID_PLAYER_ID)
		    {
		    	SendPlayerFormattedText(playerid, " Usage: '/gang invite <playername>'", 0,COLOUR_RED);
               	return 1;
		    }
		    if (!IsPlayerRegistered(inviteid))
		    {
		        SendPlayerFormattedText(playerid, " Bad playername or not registered.'", 0,COLOUR_RED);
		    	SendPlayerFormattedText(playerid, " Usage: '/gang invite <playername>'", 0,COLOUR_RED);
               	return 1;
			}

			if (PlayerGangid[inviteid] != 0)
	    	{
	    		SendPlayerFormattedText(playerid, "Player is already in a gang.", 0,COLOUR_RED);
				return 1;
	    	}
	        format(tempstring, sizeof(tempstring), "%s has invited you to join gang '%s'.", oGetPlayerName(playerid),Gangs[gangid][gang_name]);
			SendPlayerFormattedText(inviteid, tempstring, 0,COLOUR_GANG);
			format(tempstring, sizeof(tempstring), "You have invited %s to join '%s'.", oGetPlayerName(inviteid),Gangs[gangid][gang_name]);
			SendPlayerFormattedText(playerid, tempstring, 0,COLOUR_GANG);
			GangInvite[inviteid] = gangid;
			return 1;
		}
		
		if(strcomp(cmd, "kick", true) == 1)
		{
		    if (strcomp(GangMemberInfo[leadermemberid][member_name],oGetPlayerName(playerid),false) == 0)
		    {
		    	SendPlayerFormattedText(playerid, "You must be the gang leader to use this command.", 0,COLOUR_RED);
				return 1;
			}
			new kickplayername[MAX_NAME];
			set(kickplayername,text);
            strdel(kickplayername, 0, idx);
            if (!strlen(kickplayername))
            {
            	SendPlayerFormattedText(playerid, "Bad playername.", 0,COLOUR_RED);
				return 1;
            }
            if (GangRemoveMember(gangid,kickplayername))
            {
		    	format(tempstring, sizeof(tempstring), "%s kicked.", kickplayername);
				SendPlayerFormattedText(playerid, tempstring, 0,COLOUR_GREEN);
			}
			else
			{
				format(tempstring, sizeof(tempstring), "Gang member '%s' not found!", kickplayername);
				SendPlayerFormattedText(playerid, tempstring, 0,COLOUR_RED);
			}
			return 1;
			
		}
		
		if((strcomp(cmd, "colour", true) == 1) || (strcomp(cmd, "COLOUR", true) == 1))
		{
		    if (strcomp(GangMemberInfo[leadermemberid][member_name],oGetPlayerName(playerid),false) == 0)
		    {
		    	SendPlayerFormattedText(playerid, "You must be the gang leader to use this command.", 0,COLOUR_RED);
				return 1;
			}
			 if (oGetPlayerMoney(playerid) < GANG_COLOUR_COST)
		    {
		    	SendPlayerFormattedText(playerid, "It costs $%d to use this command.", GANG_COLOUR_COST,COLOUR_RED);
				return 1;
			}
			new colourname[MAX_NAME];
			new gangcolour;
			set(colourname,strcharsplit(text, idx,strchar(" ")));
			if(!strlen(colourname))
			{
			    SendPlayerFormattedText(playerid, "BAD COLOUR: type /gang colours for a list of available colours.", 0,COLOUR_RED);
				return 1;
	        }

	        for (new colourid=0;colourid<COLOURS_SIZE;colourid++)
	        {
	            if (strcomp(colourname,GangColours[colourid][colour_name],true) == 1)
	            {
	            	gangcolour = GangColours[colourid][colour_code];
				}
	        }
	        if (gangcolour == 0)
	        {
	        	SendPlayerFormattedText(playerid, "BAD COLOUR: Usage: '/gang colour <gangcolour>'", 0,COLOUR_RED);
                SendPlayerFormattedText(playerid, "Use '/gang colours' for more information on gang colours.", 0,COLOUR_RED);
				return 1;
			}
			
			SendPlayerFormattedText(playerid, "Gang colour set! (cost: $%d)", GANG_COLOUR_COST,gangcolour);
			SetGangColour(gangid,gangcolour);
			oGivePlayerMoney(playerid,0-GANG_COLOUR_COST,1);
			return 1;
		}
		    
	} // end gang
	return 0;
}

public PlayerGangColour(playerid)
{
	new gangid = PlayerGangid[playerid];
	new newcolour = COLOUR_PLAYER;
	if (gangid != 0)
	{
	    if (Gangs[gangid][gang_colour] != 0)
	    {
	        newcolour = Gangs[gangid][gang_colour];
		}
	}
	return newcolour;
}
	
public GangJoinMember(gangid,playerid)
{
	if (gangid == 0)
	{
		print("script_warning: invalid gang id.");
		return 0;
		
	}
	if (PlayerGangid[playerid] != 0)
    {
	   	print("script_warning: player already in a gang!");
		return 0;
    }

	if (GangOnlineCount(gangid) >= MAX_GANG_SIZE)
	{
		print("script_warning: Gang is already full.");
		return 0;
	}

	for (new gangmember = 0;gangmember<MAX_GANG_SIZE;gangmember++)
	{ // foreach member of the gang
		new memberid = GangMembers[gangid][gangmember]; // get memberid
		if (strlen(GangMemberInfo[memberid][member_name]) == 0) // if member slot free
		{
			set(GangMemberInfo[memberid][member_name],oGetPlayerName(playerid));
	   		GangMemberInfo[memberid][member_playerid] = playerid;
    		GangMemberInfo[memberid][member_online] = 1;
	   		PlayerGangid[playerid] = gangid;
	   		set(PlayerGangName[playerid],Gangs[gangid][gang_name]);
	   		GangMemberLogin(gangid,playerid);
	   		return 1;
		}
	}
	return 0;
}

public GangRemoveMember(gangid,kickplayername[])
{
	new playerid = INVALID_PLAYER_ID;
	
	for (new gangmember = 0;gangmember<MAX_GANG_SIZE;gangmember++)
	{ // foreach member of the gang

		new memberid = GangMembers[gangid][gangmember]; // get memberid
		if (strcomp(GangMemberInfo[memberid][member_name],kickplayername,true) == 1)
		{
			playerid = GangMemberInfo[memberid][member_playerid];
	    	GangMemberInfo[memberid][member_online] = 0;
	    	GangMemberInfo[memberid][member_playerid] = INVALID_PLAYER_ID;
			set(GangMemberInfo[memberid][member_name],nullstr);
			
			format(tempstring, sizeof(tempstring), "%s has been removed from the gang.", kickplayername);
			SendGangMessage(gangid,tempstring,COLOUR_GANG);

			if (playerid != INVALID_PLAYER_ID)
			{
				format(tempstring, sizeof(tempstring), "You have been removed from the gang '%s'.", Gangs[gangid][gang_name]);
				SendClientMessage(playerid,COLOUR_GANG,tempstring);
				PlayerGangid[playerid] = 0;
	 			set(PlayerGangName[playerid],nullstr);
			}
			
			if (GangOnlineCount(gangid) == 0)
    		{
        		GangUnload(gangid);
			}
			return 1;
		}
	}
	return 0;
}


public GangCreate(leaderid,gangname[],gangcolour)
{
	if (!IsPlayerRegistered(leaderid)) return 0;

	new tempname[MAX_STRING];
	set(tempname,gangname);
	if (!StringCharCheck(tempname))
 	{
		SendPlayerFormattedText(leaderid, "ERROR: BAD GANG NAME. Please use only a-z,0-9.", 0,COLOUR_RED);
		return 0;
	}
	
	// udb
	new udbfilename[MAX_NAME];
	set(udbfilename,gangname);
	strcat(udbfilename,".Gang",sizeof(udbfilename));
	
	// dini
  	new dinifilename[MAX_STRING];
 	format(dinifilename,sizeof(dinifilename),"%sGTO.Gang.%s.txt",GangDB,gangname);
	
    if ((udb_Exists(udbfilename)) || (dini_Exists(dinifilename)))
	{
		SendClientMessage(leaderid,COLOUR_RED, "ERROR: A gang by that name already exists.");
	 	return 0;
	}

	// Create the gang
	new gangid;
	for (new id=1;id<MAX_GANGS;id++)
	{
	    if(!Gangs[id][gang_active])
	    {
	    	gangid = id;
	    	Gangs[id][gang_active] = true; // find first free gang slot and andd our gang
	    	break;
		}
	}
	
	
	set(Gangs[gangid][gang_name],gangname);
	Gangs[gangid][gang_colour] = gangcolour;
	Gangs[gangid][gang_kills] = 0;
	Gangs[gangid][gang_score] = 0;
	
	
	for (new gangmember = 0;gangmember<MAX_GANG_SIZE;gangmember++)
	{ // foreach member

		GangMembers[gangid][gangmember] = GetFreeMemberID();
		new memberid = GangMembers[gangid][gangmember];
		if (memberid == 0)
		{
			#if OUTPUTLEVEL > 1
				printf("script error: free gang member id not found.");
			#endif
	    	return 0;
		}

		GangMemberInfo[memberid][member_active] = 1;
		GangMemberInfo[memberid][member_online] = 0;
		GangMemberInfo[memberid][member_playerid] = INVALID_PLAYER_ID;
	}

	new memberid = GangMembers[gangid][0];
	set(GangMemberInfo[memberid][member_name],oGetPlayerName(leaderid));
	GangMemberInfo[memberid][member_playerid] = leaderid;
	GangMemberInfo[memberid][member_online] = 1;
	set(PlayerGangName[leaderid],gangname);
	PlayerGangid[leaderid] = gangid;
	
	GangSave(gangid);
	
	#if OUTPUTLEVEL > 0
		printf("create_gang: success %d  %s",leaderid,oGetPlayerName(leaderid));
	#endif
	return gangid;
}

public GangCleanup(gangid)
{
	if (!Gangs[gangid][gang_active]) return;
	
	for (new gangmember = 0;gangmember<MAX_GANG_SIZE;gangmember++)
	{ // foreach member of the gang

		new memberid = GangMembers[gangid][gangmember]; // get memberid
		if (GangMemberInfo[memberid][member_online])
		{
	    	if (GangMemberInfo[memberid][member_playerid] == INVALID_PLAYER_ID) return;
	    	if (!IsPlayerRegistered(GangMemberInfo[memberid][member_playerid]))
			{
				GangMemberLogout(GangMemberInfo[memberid][member_playerid],gangid);
				GangMemberInfo[memberid][member_online] = 0;
			}
		}
	}
	
	if (GangOnlineCount(gangid) == 0)
    {
        GangUnload(gangid);
	}
}

public GangSaveAll()
{
	for (new i = 1;i<MAX_GANGS;i++)
	{
		if (Gangs[i][gang_active])
		{
		    GangSave(i);
		    GangCleanup(i);
		}
	}

}

public GangMemberLogout(playerid,gangid)
{
	GangInvite[playerid] = 0;
	if (gangid == 0)
	{
		return;
	}
	for (new gangmember = 0;gangmember<MAX_GANG_SIZE;gangmember++)
	{ // foreach member of the gang
		new memberid = GangMembers[gangid][gangmember]; // get memberid
		if (GangMemberInfo[memberid][member_playerid] == playerid)
		{
			GangMemberInfo[memberid][member_online] = 0;
			GangMemberInfo[memberid][member_playerid] = INVALID_PLAYER_ID;
			break;
		}
	}
    if (GangOnlineCount(gangid) == 0)
    {
        GangUnload(gangid);
	}
	else
	{
		format(tempstring, sizeof(tempstring), "Gang member '%s' logged out.", oGetPlayerName(playerid));
		SendGangMessage(gangid,tempstring,COLOUR_GANG);
	}
}

public GangSave(gangid)
{
	if (gangid == 0) return 0;
	if (!Gangs[gangid][gang_active]) return 0;
	if (!strlen(Gangs[gangid][gang_name])) return 0;
	gang_save_db_dini(gangid);
	return 1;
}

gang_save_db_dini(gangid)
{
	new gangname[MAX_STRING];
	set(gangname,Gangs[gangid][gang_name]);
	new dinifilename[MAX_STRING];
 	format(dinifilename,sizeof(dinifilename),"%sGTO.Gang.%s.txt",GangDB,gangname);
	if (!dini_Exists(dinifilename))
	{
		dini_Create(dinifilename);
	}

	new temp[MAX_STRING];

	dini_Set(dinifilename,"Name",gangname);

	valstr(temp,Gangs[gangid][gang_colour]);
	dini_Set(dinifilename,"Colour",temp);

	valstr(temp,Gangs[gangid][gang_kills]);
	dini_Set(dinifilename,"Kills",temp);

	valstr(temp,Gangs[gangid][gang_score]);
	dini_Set(dinifilename,"Score",temp);

	for (new gangmember = 0;gangmember<MAX_GANG_SIZE;gangmember++)
	{ // foreach member of the gang
	    new dinistring[MAX_STRING];
	    format(dinistring,sizeof(dinistring),"Member%d",gangmember);
	    new memberid = GangMembers[gangid][gangmember];
		dini_Set(dinifilename,dinistring,GangMemberInfo[memberid][member_name]);
	}
}

public GangUnload(gangid)
{
	GangSave(gangid);
	for (new gangmember = 0;gangmember<MAX_GANG_SIZE;gangmember++)
	{ // foreach member
		new memberid = GangMembers[gangid][gangmember];
		GangMemberInfo[memberid][member_active] = 0;
		GangMemberInfo[memberid][member_online] = 0;
		GangMemberInfo[memberid][member_playerid] = INVALID_PLAYER_ID;
	}
	Gangs[gangid][gang_active] = 0;
	
}
	
public GangKill(gangid,killerid,victimid,reason)
{
	if (victimid != INVALID_PLAYER_ID)
	{
	    Gangs[gangid][gang_kills]++;
	}
	if (PlayerGangid[killerid] == PlayerGangid[victimid])
    { // killed a gang member
		format(tempstring, sizeof(tempstring), "%s just killed a gang member.", oGetPlayerName(killerid));
		SendGangMessage(PlayerGangid[killerid],tempstring,COLOUR_GANG);
   		return 1;
   	}
   	return 0;
}



public GangMemberLogin(playerid,gangid)
{
	if (PlayerGangid[playerid] != 0)
	{
		PlayerGangid[playerid] = 0;
	}
	if (gangid == 0)
	{
		return 0;
	}
	for (new gangmember = 0;gangmember<MAX_GANG_SIZE;gangmember++)
	{ // foreach member of the gang
		new memberid = GangMembers[gangid][gangmember]; // get memberid
	
		if (strcomp(GangMemberInfo[memberid][member_name],oGetPlayerName(playerid),false) == 1)
		{
			format(tempstring, sizeof(tempstring), "Gang member '%s' logged in.", oGetPlayerName(playerid));
			SendGangMessage(gangid,tempstring,COLOUR_GANG);
			GangMemberInfo[memberid][member_online] = 1;
			GangMemberInfo[memberid][member_playerid] = playerid;
			PlayerGangid[playerid] = gangid;
			set(PlayerGangName[playerid],Gangs[gangid][gang_name]);

	    	format(tempstring, sizeof(tempstring), "You are in gang '%s'. Online members: %d.",Gangs[gangid][gang_name],GangOnlineCount(gangid)-1);
			SendPlayerFormattedText(playerid, tempstring, 0,COLOUR_GANG);
			GangInvite[playerid] = 0;
			SetPlayerColour(playerid,Gangs[gangid][gang_colour]);
			return 1;
		}
	}
	return 0;
}


public SendGangMessage(gangid,message[MAX_STRING],colour)
{
	for (new gangmember = 0;gangmember<MAX_GANG_SIZE;gangmember++)
	{ // foreach member of the gang
		new memberid = GangMembers[gangid][gangmember]; // get memberid
		if(GangMemberInfo[memberid][member_online]) SendPlayerFormattedText(GangMemberInfo[memberid][member_playerid], message, 0,colour);
	}
}

public GangOnlineCount(gangid)
{
	new memberscount;
	for (new gangmember = 0;gangmember<MAX_GANG_SIZE;gangmember++)
	{ // foreach member of the gang
		new memberid = GangMembers[gangid][gangmember]; // get memberid
		if (GangMemberInfo[memberid][member_online]) memberscount++;
	}
    return memberscount;
}

public GangGiveXP(gangid,xpamount,giverid)
{
	Gangs[gangid][gang_score] = Gangs[gangid][gang_score] + xpamount;
	new giveamount;
	giveamount = xpamount / GangOnlineCount(gangid);

	for (new gangmember = 0;gangmember<MAX_GANG_SIZE;gangmember++)
	{ // foreach member of the gang
		new memberid = GangMembers[gangid][gangmember]; // get memberid
		if((GangMemberInfo[memberid][member_online] == 1) && (giverid != GangMemberInfo[memberid][member_playerid]))
		{
			GivePlayerXP(GangMemberInfo[memberid][member_playerid],giveamount,0);
    		new string[MAX_STRING];
			format(string, sizeof(string), "You recieve %d gang experience from %s.",xpamount,oGetPlayerName(giverid));
			SendPlayerFormattedText(GangMemberInfo[memberid][member_playerid], string, 0,COLOUR_XP_GOOD);
		}
	}
}


public SetGangColour(gangid,colour)
{
	Gangs[gangid][gang_colour] = colour;
	for (new gangmember = 0;gangmember<MAX_GANG_SIZE;gangmember++)
	{ // foreach member of the gang
		new memberid = GangMembers[gangid][gangmember]; // get memberid
		if(GangMemberInfo[memberid][member_online] == 1)
		{
			new playerid = GangMemberInfo[memberid][member_playerid];
			SetPlayerColour(playerid,colour);
		}
	}
}


