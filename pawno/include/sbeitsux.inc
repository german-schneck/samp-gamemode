#include <a_samp>

/*s0beit Detection v.0.04
	  	  ® Jason_Gregory - 2009
	  	  
	  	  
Copyright © 2007 Free Software Foundation, Inc. <http://fsf.org/>
Everyone is permitted to copy and distribute verbatim copies of this license document, but changing it is not allowed.
Preamble
The GNU General Public License is a free, copyleft license for software and other kinds of works.
The licenses for most software and other practical works are designed to take away your freedom to share and change the works. By contrast, the GNU General Public License is intended to guarantee your freedom to share and change all versions of a program--to make sure it remains free software for all its users. We, the Free Software Foundation, use the GNU General Public License for most of our software;
it applies also to any other work released this way by its authors. You can apply it to your programs, too.
When we speak of free software, we are referring to freedom, not price. Our General Public Licenses are designed to make sure that you have the freedom to distribute copies of free software (and charge for them if you wish), that you receive source code or can get it if you want it, that you can change the software or use pieces of it in new free programs, and that you know you can do these things.
To protect your rights, we need to prevent others from denying you these rights or asking you to surrender the rights. Therefore, you have certain responsibilities if you distribute copies of the software, or if you modify it: responsibilities to respect the freedom of others.
For example, if you distribute copies of such a program, whether gratis or for a fee, you must pass on to the recipients the same freedoms that you received. You must make sure that they, too, receive or can get the source code. And you must show them these terms so they know their rights.
Developers that use the GNU GPL protect your rights with two steps: (1) assert copyright on the software, and (2) offer you this License giving you legal permission to copy, distribute and/or modify it.
For the developers' and authors' protection, the GPL clearly explains that there is no warranty for this free software. For both users' and authors' sake, the GPL requires that modified versions be marked as changed, so that their problems will not be attributed erroneously to authors of previous versions.
Some devices are designed to deny users access to install or run modified versions of the software inside them, although the manufacturer can do so. This is fundamentally incompatible with the aim of protecting users' freedom to change the software. The systematic pattern of such abuse occurs in the area of products for individuals to use, which is precisely where it is most unacceptable. Therefore, we have designed this version of the GPL to prohibit the practice for those products.
If such problems arise substantially in other domains, we stand ready to extend this provision to those domains in future versions of the GPL, as needed to protect the freedom of users.
Finally, every program is threatened constantly by software patents. States should not allow patents to restrict development and use of software on general-purpose computers, but in those that do, we wish to avoid the special danger that patents applied to a free program could make it effectively proprietary. To prevent this, the GPL assures that patents cannot be used to render the program non-free.
__________________________________________________

*/

#define ServerSlots 100
#define AntiSyncrobugAmount 20
#define Distancecheck 200
#define Minimumhealth 0
#define Defaulthpchecks 10
#define DefaultQuickturnChecks 5
#define DefaultVehicleNosHackChecks 3
#define DefaultAnimationHackChecks 10
#define DefaultCheckpointHack 4
#define CreateLog 1

new
	TimerValue[ 0 ] = 5000,
	Weaponshot[ ServerSlots ],
	Ammunationcheck[ ServerSlots ],
	x_sobcheck[13][2],
	x_gun[ ServerSlots ],
	x_ammo[ ServerSlots ],
	Float: Portcheck[ ServerSlots ],
	Float: cur_x, Float: cur_y, Float: cur_z,
	s0beit_name[ MAX_PLAYER_NAME ],
	Float: x_health,
	Healthhackcheck[ ServerSlots ],
	Float: x_oldangle,
	x_Quickturn[ ServerSlots ],
	x_Animationhack[ ServerSlots ],
	x_VehicleNosHack[ ServerSlots ],
	bool: x_Animationcheck[ ServerSlots ],
	bool: x_VehicleMod[ ServerSlots ],
	x_AntiPortCheckpoint[ ServerSlots ],
	Ammucheck[ ServerSlots ];
	

forward Anticheat();
forward OnAntiCheatInit();
forward OnAntiCheatPlayerKeyStateChange(playerid, newkeys, oldkeys);
forward CheckPositions();
forward OnAntiCheatPlayerDisconnect(playerid);
forward OnAntiCheatPlayerConnect(playerid);
forward OnAntiCheatVehicleMod(playerid,vehicleid,componentid);
forward OnAntiCheatEnterCheckpoint(playerid);
forward AntiCheatLog(string[]);
forward OnAntiCheatPlayerText(playerid, text[]);

public OnAntiCheatInit()
{
	SetTimer("Anticheat", TimerValue[ 0 ], true);
	SetTimer("CheckPositions", TimerValue[ 0 ]*5, true);
	return 1;
}

stock SetPlayerSavePos(playerid, Float: sob_x, Float: sob_y, Float: sob_z)
{
	GetPlayerPos(playerid, cur_x, cur_y,  cur_x);
	new Float:oldpos_all = floatadd(cur_x, cur_y, cur_x);
	SetPlayerPos(playerid, sob_x, sob_y, sob_z);
	new Float:newpos_all = floatadd(sob_x, sob_y, sob_z);
	new Float:difference_newposoldpos = floatsub(oldpos_all, newpos_all);
	Portcheck[ playerid ] = difference_newposoldpos;
	return 1;
}

stock SetPlayerSaveSpecialAction(playerid, actionid)
{
    x_Animationcheck[ playerid ] = true;
    SetPlayerSpecialAction(playerid, actionid);
    return 1;
}

public OnAntiCheatEnterCheckpoint(playerid)
{
	if(x_AntiPortCheckpoint[ playerid ] >= DefaultCheckpointHack) { SendClientMessage(playerid, 0xB4B5B7FF, "     U have been kicked cause of an s0beit Checkpoint Cheat"); Kick(playerid);}
	x_AntiPortCheckpoint[ playerid ]++;
	return 1;
}

public CheckPositions()
{
    for(new x_anti = 0; x_anti < ServerSlots; x_anti++)
	{
		GetPlayerPos(x_anti, cur_x, cur_y,  cur_z);
		GetPlayerHealth(x_anti, x_health);
		new x_veh = GetPlayerVehicleID(x_anti);
		GetVehicleZAngle(x_veh, x_oldangle);
		x_AntiPortCheckpoint[ x_anti ]--;
		if(GetPlayerSpecialAction(x_anti) == SPECIAL_ACTION_NONE) { x_Animationcheck[ x_anti ] = false; }
	}
	return 1;
}

public OnAntiCheatPlayerDisconnect(playerid)
{
	GetPlayerName(playerid, s0beit_name, sizeof(s0beit_name));
	return 1;
}

public OnAntiCheatPlayerText(playerid, text[])
{
	return 1;
}

public AntiCheatLog(string[])
{
	if(CreateLog > 0)
	{
		new x_string[120];
		format(x_string, sizeof(x_string), "%s\n",x_string);
		new File:hFile;
		hFile = fopen("sbeitsux.log", io_append);
		fwrite(hFile, x_string);
		fclose(hFile);
	}
}

public OnAntiCheatPlayerConnect(playerid)
{
    new
	    quickconnect_name[ MAX_PLAYER_NAME ],
	    string[ MAX_PLAYER_NAME ];
	 /*=======================================================================*/
    GetPlayerName(playerid, quickconnect_name, sizeof(quickconnect_name));
	if(format(string, sizeof(string), "%s", s0beit_name) == format(string, sizeof(string),"%s", quickconnect_name))
	{
        SendClientMessage(playerid, 0xB4B5B7FF, "     U have been kicked cause of an s0beit Quick Connect Cheat/Flood");
		Kick(playerid);
	}
    return 1;
}

public OnAntiCheatVehicleMod(playerid,vehicleid,componentid)
{
	if(componentid == 1008 || componentid == 1009 || componentid == 1010 )
	{
	    if(x_VehicleMod[ playerid ] == false && x_VehicleNosHack[ playerid ] < DefaultVehicleNosHackChecks) { x_VehicleNosHack[ playerid ]++; }
	    else if(x_VehicleMod[ playerid ] == false && x_VehicleNosHack[ playerid ] >= DefaultVehicleNosHackChecks) { SendClientMessage(playerid, 0xB4B5B7FF, "     U have been kicked cause of an s0beit Nos Cheat"); Kick(playerid); }
	}
	return 1;
}

public Anticheat()
{
	for(new x_anti = 0; x_anti < ServerSlots; x_anti++)
	{
	    new Float: x_newangle, Float: CurrentPos_X, Float: CurrentPos_Y, Float: CurrentPos_Z, Float: CurrentPos_Angle, Float: AllPos_Angle[ ServerSlots ], Float: x_statichealth;
	    GetPlayerPos(x_anti, CurrentPos_X, CurrentPos_Y, CurrentPos_Z);
	    GetPlayerWeaponData(x_anti, 0, x_sobcheck[0][0], x_sobcheck[0][1]);
	    x_sobcheck[0][1] = Ammucheck[ x_anti ];
	    Ammucheck[ x_anti ] = GetPlayerAmmo(x_anti);
	    GetPlayerFacingAngle(x_anti, AllPos_Angle[ x_anti ]);
	    GetPlayerHealth(x_anti, x_statichealth);
	    new x_veh = GetPlayerVehicleID(x_anti);
	    /*====================================================================*/
	    if(GetPlayerSpecialAction(x_anti) == SPECIAL_ACTION_DANCE1 || GetPlayerSpecialAction(x_anti) == SPECIAL_ACTION_DANCE2 || GetPlayerSpecialAction(x_anti) == SPECIAL_ACTION_DANCE3 || GetPlayerSpecialAction(x_anti) == SPECIAL_ACTION_DANCE4) { if(x_Animationcheck[ x_anti ] == false) { x_Animationhack[ x_anti ]++; } }
	    if(x_Animationhack[ x_anti ] >= DefaultAnimationHackChecks) { SendClientMessage(x_anti, 0xB4B5B7FF, "     U have been kicked cause of an s0beit Special Dance Cheat"); Kick(x_anti); }
	    /*====================================================================*/
	    if(x_newangle != x_oldangle && x_newangle-x_oldangle > 135 || x_newangle-x_oldangle < 135 && x_Quickturn[ x_anti ] < DefaultQuickturnChecks) { x_Quickturn[ x_anti ]++;}
	    /*====================================================================*/
	    if(Minimumhealth > x_health-x_statichealth && Healthhackcheck[ x_anti ] < Defaulthpchecks) { Healthhackcheck[ x_anti ]++; }
		else if(Healthhackcheck[ x_anti ] > Defaulthpchecks) { SendClientMessage(x_anti, 0xB4B5B7FF, "     U have been kicked cause of an s0beit Hp-Regeneration Cheat"); Kick(x_anti); }
	    /*====================================================================*/
	    if(GetPlayerState(x_anti) == 1) { if(Portcheck[ x_anti ] > 30 || Portcheck[ x_anti ] < -30) { SendClientMessage(x_anti, 0xB4B5B7FF, "     U have been kicked cause of an s0beit Airbreak Cheat"); Kick(x_anti); } }
	    /*====================================================================*/
	    if(GetPlayerFacingAngle(x_anti, CurrentPos_Angle) == AllPos_Angle[ x_anti]) { SendClientMessage(x_anti, 0xB4B5B7FF, "     U have been kicked cause of an s0beit Aim Cheat"); Kick(x_anti); }
	    /*====================================================================*/
	    if(Portcheck[ x_anti ] < 100 || Portcheck[ x_anti ] > -100)
	    {
			if(CurrentPos_X - cur_x > Distancecheck || CurrentPos_X - cur_x < Distancecheck) { }
			else { Portcheck[ x_anti ] += CurrentPos_X - cur_x; }
	    }
	    else if(Portcheck[ x_anti ] > 100 || Portcheck[ x_anti ] < -100) { SendClientMessage(x_anti, 0xB4B5B7FF, "     U have been kicked cause of an s0beit Teleport Cheat"); Kick(x_anti); }
	    /*====================================================================*/
	    if(Weaponshot[ x_anti ] > 5)
	    {
			if(Ammucheck[ x_anti ] < Ammucheck[ x_anti ] - AntiSyncrobugAmount) { SendClientMessage(x_anti, 0xB4B5B7FF, "     U have been kicked cause of an s0beit Weapon Cheat"); Kick(x_anti); }
		}
		else
		{
		    Weaponshot[ x_anti ] = 0;
		}
	}
	return 1;
}

public OnAntiCheatPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
    x_gun[ playerid ] = GetPlayerWeapon(playerid);
    x_ammo[ playerid ] = GetPlayerAmmo(playerid);
	if(newkeys == KEY_FIRE && x_gun[ playerid ] > 15 && x_gun[ playerid ] < 44 && x_ammo[ playerid ] == Ammucheck[ playerid ])
	{
	    new x_sobcheck[13][2];
	    GetPlayerWeaponData(playerid, 0, x_sobcheck[0][0], x_sobcheck[0][1]);
	    x_sobcheck[0][1] = Ammucheck[ playerid ];
	    Ammucheck[ playerid ]--;
	    Ammunationcheck[ playerid ] = x_sobcheck[0][1];
	}
	else if(x_ammo[ playerid ] != Ammucheck[ playerid ])
	{
	    Weaponshot[ playerid ]++;
	    x_ammo[ playerid ] = Ammucheck[ playerid ];
	}
	return 1;
}
