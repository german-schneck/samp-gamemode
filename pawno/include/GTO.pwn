

/*
	Project Name:		San Andreas: Multiplayer: Grand Theft Online.

	Testserver:         http://gto.samp.ahoh.de/

	Author:				Iain Gilbert (Bogart) (Roach)

	Contact:			iain.gilbert@gmail.com

	Date Created:		12 August 2006

	Version:			0.5.7

	Compatable
	SA-MP Versions:		0.1b

	Description:		GTO is a gamemode for SA:MP server (http:sa-mp.com/).
						GTO introduces Experience and Level based character development system and saving of stats and
						items for persistent online world style of gameplay in San Andreas: Multiplayer.
						Very much a WIP, probably very buggy, Just a fun side project, no real plans development wise.


						Features:

						* Level System - Character XP/Levels gain systenm.
										 Higher level = more health, more money, better weapons, etc.
						* Gangs - players can create and join gangs which are saved. Some XP is shared among gang members.
						* Weapons - players must purchase thier weapon upgrades from ammunation
									with more weapons becoming available as they increase levels.
						* Race Modes - Gain experience & money from winning races or beating race records.
						* Deathmatch Modes - Gain experience and money in deathmatch battles.
						* Database system for saving of stats and config.
						* Gain money/xp for holding and protecting turf (pirate ship, etc).
						* Tracking of kills and deaths.
						* Passive health regen, based on level.
						* Pay system, constant income of money.
						* health/money cheat protection
						* Account system.
						* Totaly original and custom ideas and script

						
						Shoutouts to the SA-MP team, http:/sa-mp.com/. Cheers guys, i love the work and look forward to seeing updates.
						And everyone on the SA-MP forums, lots of good info and help there by too many peaple to mention here.


  Gameplay:

  						This gamemode is open, there's no specific win / endgame conditions to meet.
  						In Grand Theft Online you must gain experience in order to increase your level.
						Increasing experience points increases your level, which effects your spawn weapons, health, cashflow and much more.
						Experience points can be gained by killing people, winning races, holding ground, and more.
						Bank your money at 24/7's so you dont loose it all when you die.
						Players can create gangs to team up against opposing gangs and players.
						When in a gang some of your experience gained will be given to your gang members.
						Particapating in races and events can be a good way to earn money and experience.
						

 Installation:

						To run precompiled .amx file:
							Put GTO.amx in your \samp\gamemodes\ directory and change gamemode in server.cfg to GTO.

						To compile GTO yourself:
							Extract gto.pwn to wherever you want, and put all the include files in the same directory as gto.pwn (keeping original directory structure).
							Then just open gto.pwn in pawno and hit Build>Compile (or press F5).
							Ignore the warning messages (warning 208). It will creat gto.amx file in same directory as gto.pwn.

						Scriptfiles:
						    GTO relies upon certain directories it uses to store database information to be present.
						    If they dont exist then GTO will crash, it cant create them itself (not possible with samp 0.1b?).
						    You must copy the whole scriptfiles directory structure (included with GTO release) into your samp folder.

							Or if you wish to manualy create them yourself, this is what folders GTO needs (in your samp directory):
						    'scriptfiles\'
						    'scriptfiles\GTO\'
						    'scriptfiles\GTO\Config\'
						    'scriptfiles\GTO\Player\'
						    'scriptfiles\GTO\Account\'
						    'scriptfiles\GTO\Gang\'
						    'scriptfiles\GTO\Weapon\'
						    'scriptfiles\GTO\Vehicle\'
						    'scriptfiles\GTO\Race\
						    'scriptfiles\GTO\Race\Record\'
						    'scriptfiles\GTO\Deathmatch\'
						    'scriptfiles\GTO\Deathmatch\Record\'
						    'scriptfiles\GTO\Housing\'
						    'scriptfiles\GTO\Business\'
						    
						    If just one of those folders doesnt exist GTO will crash. So make sure they are correct.
						    
						    

 Configuration:
 
                     Database:
 				        Many configurable options in gto are held in database or config files.
						All database and config files are held in 'scriptfiles\GTO\' folders.
						Ive no time to explain them all here, so just have a look around for yourself.
						Most is prety self explaneratory anyway.
 
                    Source:
 				        Some configurable options in gto are currently held in the source code, so you must find them then recompile after changing them.
						Usualy if its a simple configurable option, you will find what you want to change at the top of the most relevently named *.inc file.
						Feel free to change whatever you want.



  Changelog:
    					08.11.06: 0.5.7:
    					    * fixed: crash bug from non a-z payernames
    					    * fixed: players get thier weapons back after deathmatch.
    					    * fixed: bug with disconnected players not being removed from the deathmatch
    					    * fixed: i raised speedcheat vehicle speeds as a temp fix for antispeedcheat detecting planes
    					    * fixed: admin /givexp command reporting bad playerid on playerid of 0
    					
    					06.11.06: 0.5.6:
    					    * added: deathmatch: Blue Mountains - a stealthy assasination with katana and silenced pistol
							* added: deathmatch: The Bad and the Ugly - Combat shotguns in the wild west.
							* changed: more work on deathmatch handler
							* added: Anti Speed, Anti Teleport, and Anti Fly Cheats, all included in antispeedcheat.inc.
							
						05.11.06: 0.5.5:
                            * added: deathmatch handler
                            * added: deathmatch: Minigun Madness - crazy minigun mayhem on a construction site
                            * fixed: players dont receive gang experience if it was them that gained the xp in the first place.
  
  						04.11.06: 0.5.4:
  						    * added: admin commands: '/race create <racename>', '/race cp', '/race cpremove', '/race save'. for creating races easy.
  						    * added: admin command: '/race start <raceid>' to manualy start a race
							* added: admin command: '/admin givexp <playerid> <xpamount' - give (or take) experience points to player
  						    * added: admin command: '/admin givecash <playerid> <cashamount' - give (or take) money to player
							* fixed: admins not to be auto kicked, ever.
							* fixed: health regen rate, i had accidently added it to wrong timer, set it too high, and i forgot constraints... lol
  						    * fixed: race sleep time was not randomizing properly , so i made it automaticly set race sleep time based on a frequency value, and the number of races, for smoother races distribution

  						
  						03.11.06: 0.5.3:
  						    * changed: db handling to Dini, moved db's to subdirectiories in scriptfiles.
							* added: Config db files for easy configuration of GTO.
							* changed: moved races over from script files to db for easy addition/modification.
							* added: db files for configuring vehicles and weapons
							* changed: update to new versions of dini and dutils by DracoBlue.
							* fixed: bug that could cause players to receive a bad gangmemberid, resulting in gang members switching around and being placed in wrong gang
  
                        27.10.06: 0.5.2:
                            * fixed: antiidle, antispawnkill, antidriveby. They all broke a while back and i didnt notice. Shame on anyone who abused by leaving afk at groundhold point ;/.
                            * added: min player level required to enter race.
                            * changed: most races now only require 1 racer to run, min racers requirement was annoying, threres still a few that have requirement though
							* changed: race messages to reflect race changes, they are a bit more informative now.
							* changed: you can not go down a level now. You can only loose xp until the start of your level.
							* changed: player can join race if they dont have a car, they will be warned they cant race until they get the correct car, but allowed to join so they can check where it starts..
                        
                        26.10.06: 0.5.1:
                            * added: 3 new bank locations and 2 new ammunations, in los Santos (i put banks in food joints cos 24/7s arnt marked on map)
                            * added: 2 new turf locations in los santos. Grove Street and Glen Park. (these are for lower level players as they dont gain nearly as much as pirate ship)
                            * added: races - 'Tearin Up The Grove' (low level race)
                            * added: races - 'Mullholland Getaway' (levels > 5)
                            * fixed: passive health regeneration, as it had broke. May still need a bit o tweaking
									Regen amount is based on level, so this makes higher level players a lot tougher, as they should be ;).
                            * changed: i played around with health/money desync kicker a bit, let me know if you get kicked incorrectly.
  
  						25.10.06: 0.5.0:
  						    * added: Vehicle handler - to automaticly handle vehicle spawns so i dont have to wory about 250/50 limit.
									If model limit is reached then vehicle model will be changed, if total vehicle limit is reached then vehicle will not spawn.
							* added: Leveled vehicles spawner - to randomly spawn vehicles by level, not model
  						    * added: Over 160 new vehicle spawns all over Los Santos (fucking!) Vehicle spawns from LVDM are sacrificed (until dynamic spawning).
  						    * added: Player spawn points by level, levels 0-12 spawns done. 38 new spawnpoints added.
  
						23.10.06: 0.4.9:
						    * added: level rank names - by Baby Face
						    * added: show level players rank and gang on /stats command
                            * changed: cleaned up race handler a bit.
                            * fixed: join race cost money
                            * added: race commands: '/races' - show available races, '/race join <raceid>' - join a race, '/race quit/leave' - leave current race.
                            * added: race - Countryside Cruise
                            * added: race - Monstertruck Madness
                            * added: a few vehicle spawns areound new races
                            
  						22.10.06: 0.4.8:
						    * added: race - Murderhorn - by |Insane|
						    * added: race - Airport Round We Go - by |Insane|
						    * added: race - Strip Tease - by |Insane|
						    * notes: Thanks to Insane for the new races.
						    * changed: but more tweaking to xp/money gained from winning all races, more gained now.
                            * added: show max money/xp gain for groundhold when entering gh ground.
  
  						18.10.06: 0.4.7:
						    * added: race - Flying High
						    * added: race - Backstreet Bang
						    * fixed: /gang create bug where money would be taken but no gang created if gang already exists
						    * fixed: cost $10,000 to change your gangs colour.
  
                        17.10.06: 0.4.6:
						    * added: weapon system. You must now purchase weapons from store, which became available to you as you increase levels.
		  					  		 bought weapons are saved with player, you will spawn with them. Each time you kill someone with that weapon you will loose some bullets.
		   					* added: Weapon cheat protection.
		   					* fixed: possible money desync issue when withdrawing money from bank.
  
						13.10.06: 0.4.5:
						    * added: admin system by mabako and yellowblood. added as .inc file compiled with gto gamemode.
									 it should work alongside admin filterscripts with no problems.
									 this is just a temporary fix/test, it will be moved back to filterscript in the future.
									 to enable this you must uncomment line "#include "admin"' in gto.pwn.
									 use /admin-shelp for commands list. admin command prefix '/admin-'.
									 look to adminscript documentation by mabako and yellowblood for more information. (in \admin\ folder included with GTO)
  
                        09.10.06: 0.4.4:
                            * added: restrict car types that can compete in a race
                            * fixed: xp capped at level 20, not 10 (i thought i fixed this already).
  
                        06.10.06: 0.4.3:
                            * fixed: Race lineup checkpoint now visible on map from further away.
                            * fixed: Player checkpoint disabled when no active checkpoints for player found.
                            * fixed: kick players who win too much money over time in casino.
                            * fixed: xp lost on death is now half as much (was previously a bit high methinks)
  
                        05.10.06: 0.4.2:
                            * added: /gang colour/color command, was previusly accidently left out.
                            * fixed: Non a-z characters in playernames are fixed now. Yay can finaly put clantag in names, damn bug.
  
    					03.10.06: 0.4.1:
                            * added: player gangs, players can now create gangs which are saved to db. Create cost 50,000
							* changed: players no longer have to login to play. Stats wont be saved if not logged in.
							* fixed: More money/experience gained from winning races.

                        18.09.06: 0.4.0:
                            * added: race sounds, countdown, checkpoint, finish.
                            * added: more levels, max level now 20 (was previesly bugged and stuck at 8)
                            * fixed: Max bank balance now 1,000,000
                            * fixed: xp gain, xp is now much harder to gain, more xp is required per level now.
                            * fixed: checkpoint size in races

                        17.09.06: 0.3.9:
                            * added: Banks in 24/7, you must now bank your cash or loose it when killed.
                            * fixed: Gambling in casino's fixed. Four dragons and caligula's.

                        16.09.06: 0.3.8:
                            * added: groundhold. (Pirate ship, etc) Hold specific turf from other players for money/xp.
                            * added: Save X,Y,Z and load on login. XYZ wont be saved if indoors.
                            * added: Anti Idle. Kick players afk for more than 10 minutes (after warning).
                            * changed: moved class select screen location.
                            * changed: Tab menu now shows player level instead of score.

                        13.09.06: 0.3.7:
                            * added: Activecheckpoint manager, to set automaticly players checkpoint to
  									 closest world checkpoint (due to only one active CP possible at a time)
							* added: race - Lost in Smoke - a quick race around the city.
							* fixed: bug where acct password would incorrectly chang
                            * fixed: more misc fixes to race handler
                            * fixed: crash bug with playername

  						12.09.06: 0.3.6:
 						    * added: race - Riverside Run - a dirt tack race along the riverbank, the clock is ticking, dont dawdle.
							* fixed: a few misc bugs with race handler

                        11.09.06: 0.3.5:
 						    * added: Race mode handler. Rasces can now easily be added to GTO.
					  				 Only handles sprint races ATM. No car restrictions possible ATM.
							* added: race - Drag The Strip - A strait drag down The Strip and back.
							* added: Anti Drive-by.
							* added: Anti Spawn kill.

 						08.09.06: 0.3.0:
 						    * notes: nothing much to report, releasing new version for bugfix, due to no progress.

                        06.09.06: 0.2.5:
 						    * changed: few more misc changes/fixes. continued moving code over to inc files.

						05.09.06: 0.2.4:
							* added: return what zone player is in, by name or id. Created by mabako.
					        * changed: restructure of whole script, moved much to include files for modular layout
							* fixed: crash bug due to too many variables? i hope.

					  22.08.06: 0.2.2:
					        * added: simple detection for health cheat
							* fixed: issue with players getting kicked wrongly (i hope)
							* fixed: issue with money not always being being given.
							* fixed: Connection lost message wasnt being displayed on kick when not loggged in

                      21.08.06: 0.2.0:
							* added: passive health regeneration, based on player level
							* added: basic cheat detection for money cheats
							* added: /version command, just displays gamemode version to player
							* changed: freeze player on Auto Kick
							* changed: auto kick player on bad password, for security against brute force;
							* changed: '/save' changed to '/savechar' due to /save already being restricted as samp debug command
							* changed: player colours no longer set to grey
							* changed: level xp list harder, more xp needed for each level
							* fixed: stupid bug that caused no one to gain any experience at all.. fuck hey
							* fixed: static debugcode checks to check at compile, not runtime (thanks Y_Less)
							* fixed: a money sync issue with money cheat protection (no gambling support yet)

                      19.08.06: 0.1.0:
							* First release.
							I havnt been working on this much so decided to fix bugs and release a working version so i can test with other players.
							Thus we have version 0.1 release. Extremely untested, but hopefully working ;p. Please give feedback.

                      12.08.06: 0.0.1:
                          * Started development, aiming for few simple additions for first release:
							XP/Level system, Saving XP & Money to DB, etc.

	Notes:
					All spawn points for player,items,cars,etc are copied from gamemodes released by SA:MP team. Eventualy i will change them, to be more level based.
					I have used a few functions and lines of code from forum posts and such, where permision is given,
					sometimes after a bit of modification. Credits for them go to thier respective aurthor
					who will be listed in a comment just before the function/code snippet.

                  	Anyone can freely contact me with questions, changes, additions, suggestions, bugs, etc
                  	I have no patience for tech support though.
                  	Sorry about any messy code, lack of comments and quick hacks. If you see anything particularly bad then let me know and i will fix it.



	Licence:			This work is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 2.5 License.
						To view a copy of this license, visit http:creativecommons.org/licenses/by-nc-sa/2.5/au/
						or send a letter to Creative Commons, 543 Howard Street, 5th Floor, San Francisco, California, 94105, USA.

                      Feel free to use, modify, copy, distribute, etc.
                      Give credit where due.
                      No using for commercial purposes.
*/



#include <a_samp> 				// samp
#include <core> 				// core samp
#include <float> 				// float minipulation


// many values and functions are in included scripts
// some need to be ran from a timer, or at specific events

#include "base" 				// holds base script values
#include "utils\gtoutils" 			// misc used utils
#include "utils\gtodudb" 				// old db handler
#include "utils\dini"                 // db handler
#include "utils\dutils" 				// more used tools
#include "utils\uf"                   // Usefull functions from forum, compiled by Sacky

#include "account" 				// account handler
#include "player"				// holds player values
#include "weapons" 				// weapons and ammunation shop
#include "vehicles"             // vehicles
#include "world"				// functions for zone, location, world, etc
#include "commandhandler" 		// TODO: command handler
#include "gang"                 // Gang handler

#include "race" 				// race handler, manages and runs all rasces
#include "deathmatch"           // TODO: deathmatch handler
#include "bank"            		// bank money to keep it on death
#include "payday" 				// pay players money based on level
#include "groundhold"            // hold ground to gain money, pirate ship, etc

#include "admin\admin_commands"      // admin commands
#include "admin\admin_commands_race"      // admin commands for race creation/minipulation
#include "admin\admin_commands_dm"      // admin commands for race creation/minipulation

#include "anticheat\antispawnkill" 		// kick players who spawnkill abuse
#include "anticheat\antidriveby" 			// kick players who driveby abuse
#include "anticheat\antiidle"              // kick player AFK for over 10 mins
#include "anticheat\antispeedcheat"           // kick players moving too fast

//#tryinclude "testserver"        // testserver specific functions
#tryinclude "races\race_monstertruck" 	// Race: Monstertruck Madness
// Races
#tryinclude "races\race_thestrip" 		// Race: Burnin Down The Strip. - Just a strait sprint down the strip and back
#tryinclude "races\race_riversiderun" 	// Race: Riverside Run. - Beat the clock down a riverside dirt track.
#tryinclude "races\race_fleethecity" 		// Race: Flee The City. - race to air strip
#tryinclude "races\race_lostinsmoke" 		// Race: Lost in Smoke - a quick race around the city.
#tryinclude "races\race_backstreetbang"   // Race: Backstreet bang
#tryinclude "races\race_flyingfree"    	// Race: Flying Free
#tryinclude "races\race_murderhorn"    	// Race: Murderhorn - by |Insane|
#tryinclude "races\race_roundwego"    	// Race: Airport Round We Go - by |Insane|
#tryinclude "races\race_striptease"    	// Race: Strip Tease - by |Insane|
#tryinclude "races\race_countrycruise" 	// Race: Countryside cruise
#tryinclude "races\race_thegrove" 		// Race: Tearin Up The Grove
#tryinclude "races\race_mullholland" 	// Race: Mullholland Getaway

#include "deathmatches\dm_minigunmadness" 	// Deathmatch - Minigun Madness
#include "deathmatches\dm_bluemountains" 	// Deathmatch - Blue Mountains
#include "deathmatches\dm_badandugly" 		// Deathmatch - The Bad and the Ugly

main()
{
	// we will init on gamemode init,
}


public OnGameModeInit()
{
	new gamemode[MAX_NAME];
	format(gamemode,sizeof(gamemode),"Grand Theft Online %s",VERSION);
	SetGameModeText(gamemode);
//-------
	print(" ");
	print(" ");
	print("\n----------------------------------");
	printf("Running %s.\n",gamemode);
	print(" ");
	print(" 	Created By");
	print("     	Iain Gilbert");
	print("----------------------------------\n");

//-----------------------------------------
//  Initialize everything that needs it

	BaseLoadConfig();
	AccountLoadConfig();
	PlayerLoadConfig();
	GangLoadConfig();
	PaydayLoadConfig();
	AntiDrivebyLoadConfig();
	AntiSpawnkillLoadConfig();
	AntiIdleLoadConfig();
	AntiSpeedcheatLoadConfig();
	
	WeaponLoadAll();
	VehicleLoadAll();
	RaceLoadAll();
	DeathmatchLoadAll();
	
	AmmunationInit();
	BankInit();
	GroundholdInit();
	
//---------------
// and the races
	#if defined _race_thestrip_included
		race_thestrip_init();
	#endif
	#if defined _race_riversiderun_included
		race_riversiderun_init();
	#endif
	#if defined _race_fleethecity_included
		race_fleethecity_init();
	#endif
	#if defined _race_lostinsmoke_included
		race_lostinsmoke_init();
	#endif
	#if defined _race_backstreetbang_included
		race_backstreetbang_init();
	#endif
	#if defined _race_flyingfree_included
		race_flyingfree_init();
	#endif
	#if defined _race_murderhorn_included
		race_murderhorn_init();
	#endif
	#if defined _race_roundwego_included
		race_roundwego_init();
	#endif
	#if defined _race_striptease_included
		race_striptease_init();
	#endif
	#if defined _race_monstertruck_included
		race_monstertruck_init();
	#endif
	#if defined _race_countrycruise_included
		race_countrycruise_init();
	#endif
	#if defined _race_thegrove_included
		race_thegrove_init();
	#endif
	#if defined _race_mullholland_included
		race_mullholland_init();
	#endif
	
	//---------------
	
	//#if defined _dm_minigunmadness_included
		dm_minigunmadness_init();
	//#endif
	
	//#if defined _dm_bluemountains_included
		dm_bluemountains_init();
	//#endif

	//#if defined _dm_badandugly_included
		dm_badandugly_init();
	//#endif
	
	//---------------------------------------------------
	
	// Set timers for anything that needs constan checking
	
	SetTimer("SpawnTimer", 1000, 1);
	SetTimer("SyncPlayers", PLAYER_SYNC_DELAY, 1);
	SetTimer("PlayerHealthRegen", HEALTH_REGEN_SPEED, 1);
	SetTimer("TextScroller",TEXT_SCROLL_SPEED,1);
	SetTimer("WorldSave", WorldSaveDelay, 1);
	SetTimer("SyncTime", 120000, 1);
	SetTimer("SyncActiveCP", 2500, 1);
	SetTimer("CheckRace", 1000, 1);
	SetTimer("CheckDM", 1000, 1);
	SetTimer("PayDay", PayDayDelay, 1);
	SetTimer("CheckAllGround", GROUNDHOLD_DELAY, 1);

	#if defined _antiidle_included
		SetTimer("AntiIdle", 30000, 1);
	#endif
	#if defined _antispeedcheat_included
		SetTimer("AntiSpeedCheat", ANTISPEEDCHEAT_DELAY, 1);
	#endif
	
	SetTimer("ufctimer",1000,1);
	SetTimer("TIMER_DCallbacks",1000,1);
	
	//----------------------------------------
	// spawn the world

	ShowPlayerMarkers(1);
	ShowNameTags(1);
	SpawnWorld();
	WorldTime = 12;
	
 	if ((VerboseSave == 1) || (VerboseSave == -1))
	{
	    WorldSave();
		if (VerboseSave == -1) VerboseSave = 0;
	}
	
 	printf("%s initialization complete.",gamemode);
	
	return 1;
}


public OnPlayerConnect(playerid)
{
	player_Connect(playerid);
	
	new string[MAX_STRING];
 	format(string, sizeof(string),"Grand Theft Online. %s", VERSION);
	GameTextForPlayer(playerid,string,5000,5);
	SendClientMessage(playerid, COLOUR_GREEN, string);
	SendClientMessage(playerid, COLOUR_MISC, "Welcome to SA-MP: Grand Theft Online gamemode, Created by Iain Gilbert.");
	SendClientMessage(playerid, COLOUR_MISC, "For help type /help. For objectives type /objective.");
	SendClientMessage(playerid, COLOUR_RED, "This server requires registration.");
	SendClientMessage(playerid, COLOUR_RED, "To login type '/login [password]' or register with '/register [password] <email>'.");
	SendClientMessage(playerid, COLOUR_MISC, " ");

	#if defined _testserver_included
		testserver_playerconnect(playerid);
	#endif
	return 1;
}

public OnPlayerDisconnect(playerid)
{
	if (playerid == INVALID_PLAYER_ID) return;
	if (IsPlayerRegistered(playerid))
	{
		PlayerSave(playerid);
		AccountSave(playerid);
	}
	DMPlayerDisconnect(playerid);
	player_Disconnect(playerid);
}

public OnPlayerEnterCheckpoint(playerid)
{
	OnPlayerEnterAmmoCheckpoint(playerid);
	OnPlayerEnterRaceCheckpoint(playerid);
	OnPlayerEnterDMCheckpoint(playerid);
	OnPlayerEnterBankCheckpoint(playerid);
}

public OnPlayerDeath(playerid, killerid, reason) // loose xp, give money, deaths++
{
 	if (!IsPlayerConnected(playerid)) {return 1;}
	SendDeathMessage(killerid,playerid,reason);
	
	if (!IsPlayerInAnyDM(playerid))
	{
		PlayerDeath(playerid, killerid, reason);
	}
	else
	{
		OnPlayerDMDeath(playerid,killerid);
	}
	if (killerid == INVALID_PLAYER_ID) return 1;
	
	if (!IsPlayerInAnyDM(playerid))
	{
		PlayerKill(killerid, playerid, reason);
	}
	else
	{
		OnPlayerDMKill(killerid,playerid,reason);
	}
	
	#if defined _antidriveby_included
		AntiDriveBy(playerid, killerid, reason);
	#endif
	#if defined _antispawnkill_included
		AntiSpawnKill(playerid, killerid, reason);
	#endif
	
	return 1;
}

public OnPlayerSpawn(playerid) // set health and money on spawn
{
    if (!IsPlayerConnected(playerid)) {return 1;}
    
    new dmid = GetPlayerDM(playerid);
    if ((dmid == INVALID_DM_ID) || (DMPlayerStats[playerid][dm_player_active] == 0))
	{
    	player_Spawn(playerid);
	}
	else
	{
	    DMPlayerSpawn(playerid,dmid);
	}
    
	SetPlayerColour(playerid,PlayerGangColour(playerid));
	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
	PlayerSkin[playerid] = classid;
	Skin[playerid] = classid; // for usefull functions include
	SetupPlayerForClassSelection(playerid);
	return 1;
}

public SetupPlayerForClassSelection(playerid)
{
	// <Club3>
 		SetPlayerInterior(playerid,11);
		SetPlayerPos(playerid,508.2252,-84.8755,998.9609);
		SetPlayerFacingAngle(playerid,10.7533);

		SetPlayerCameraPos(playerid,508.5678,-80.1576,1000.00);
		SetPlayerCameraLookAt(playerid,508.2252,-84.8755,998.9609);
	// </Club3>
}

public OnPlayerCommandText(playerid,text[]) // process commands
{
	if (!IsPlayerConnected(playerid)) return 1;
	new cmdfound;
	cmdfound += CommandHandler(playerid,text);
	cmdfound += AccountCommandHandler(playerid,text);
	cmdfound += GangCommandHandler(playerid,text);
	cmdfound += AmmunationCommandHandler(playerid,text);
	cmdfound += BankCommandHandler(playerid,text);
	cmdfound += RaceCommandHandler(playerid,text);
	cmdfound += AdminRaceCommandHandler(playerid,text);
	cmdfound += AdminCommandHandler(playerid,text);
	cmdfound += DMCommandHandler(playerid,text);
	cmdfound += AdminDMCommandHandler(playerid,text);
	if (cmdfound > 0) return 1;
	return 0;
}

public GameModeExitFunc()
{
	WorldSave();
	GameModeExit();
}


/*
public OnPlayerStateChange()
{

	if(oldstate == PLAYER_STATE_DRIVER && newstate == PLAYER_STATE_ONFOOT)
	{
		vehiclespawn[vehicleid] = 120;
	}
	if(oldstate == PLAYER_STATE_ONFOOT && newstate == PLAYER_STATE_DRIVER)
	{
		vehiclespawn[vehicleid] = 999;
	}

}
public OnPlayerPrivmsg(senderid, playerid, text[])
{
    #if defined _admin_included
		admin_OnPlayerPrivmsg(senderid, playerid, text);
	#endif
	return 1;
}

public OnPlayerText(playerid, text[])
{
	#if defined _admin_included
		admin_OnPlayerText(playerid, text);
	#endif
	return 1;
}
*/

/*
public OnVehicleDeath(vehicleid, killerid) // earn xp, CarKills++, NON FUNCTIONAL
{
    if (!IsPlayerConnected(killerid)) {return 1;}
 	new earnedXP;
	earnedXP = 50;
	GivePlayerXP(killerid, earnedXP,true);
	Player[killerid][CarKills]++;
	return 1;
}
*/





