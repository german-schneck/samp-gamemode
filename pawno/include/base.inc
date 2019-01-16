//
// Created:     05.09.06
// Aurthor:    Iain Gilbert
//

#if defined _base_included
  #endinput
#endif

#define _base_included
#pragma library base

#include <a_samp>
#include <core>
#include <float>
#include "utils\dini"

#define VERSION "0.5.7"

#define debug 0

#define MAX_STRING 255
#define MAX_NAME 40 // number of char's a name/password/misc_word can be
#define INACTIVE_PLAYER_ID 255
#define INVALID_QUEST_ID 0
#define MAX_QUESTS 255
#define MAX_WIN 500000 // Maximum gambling win
#define MAX_SPAWNPOINTS 50
#define MAX_COUNTDOWN 5

#define TimerTick 1000 // used for how often timer function is called

#define COLOUR_GREY 0xAFAFAFAA // grey
#define COLOUR_GREEN 0x33AA33AA // green
#define COLOUR_RED 0xAA3333AA // red
#define COLOUR_YELLOW 0xFFFF00AA // yellow
#define COLOUR_WHITE 0xFFFFFFAA // white
#define COLOUR_BLUE 0x33AAFFAA // blue
#define COLOUR_LIGHTBLUE 0x33CCFFAA
#define COLOUR_ORANGE 0xFF9900AA

// TODO: more colours
#define COLOUR_MISC 0xAFAFAFAA // Grey - Misc
#define COLOUR_CHAT 0xFFFFFFAA // White - Chat
#define COLOUR_PLAYER 0xAAAAAAAA // White - Player
#define COLOUR_XP_GOOD 0x00C7FFAA // Blue - XP
#define COLOUR_XP_BAD 0x00008BAA // Blue - XP
#define COLOUR_COMBAT_GOOD 0xAA3333AA // Red - Combat
#define COLOUR_COMBAT_BAD 0xBB3333AA // Red - Combat
#define COLOUR_MONEY_GOOD 0xFFFF00AA // Yellow - Money
#define COLOUR_MONEY_BAD 0xDAA520AA // Yellow - Money
#define COLOUR_RACE 0x005407AA // green - dark
#define COLOUR_RACE_BAD 0x545407AA // yellow-green-dark
#define COLOUR_GANG 0xFF8C00AA // orange
#define COLOUR_GANG_CHAT 0xFFA500AA // orange
#define COLOUR_DM 0xFF0066AA // red - purple
#define COLOUR_DM_BAD 0xFF0066AA // red - purple

#define MAX_XP  730000
#define MAX_LEVEL 20
#define MIN_HEALTH 50
#define MAX_HEALTH 100
#define NUMVALUES 4	

#define SOUND_MUSIC_CLASSSELECT      1187
#define SOUND_MUSIC_RACEFINISH       1183
#define SOUND_MUSIC_RACERECORD       1097
#define SOUND_MUSIC_MISSIONCOMPLETE  1185
#define SOUND_OFF                    1184
#define SOUND_BLIP1                  1056
#define SOUND_BLIP2                  1057
#define SOUND_EXPLOSION              1159
#define SOUND_PURCHASE               1149
#define SOUND_CHECKPOINT             1058
#define SOUND_DEATH                 1057
#define SOUND_DMKILL                 1056
#define SOUND_DMDEATH                 1057

#define OUTPUTLEVEL 0 // Amount of imformation outputted to console
//              0   -   off, no output
//              1   -   + Minimal output
//              2   -   + DB saves, etc
//              3   -   + XP/Level/Money changes output

#define DBTYPE 0 //	Database type (olny flat file ATM)
//				0	-	dini - flat file
//				1	-	TODO: SQL

new ConfigDB[MAX_STRING] = "GTO\\Config\\GTO.Config.Base.txt";
new LevelDB[MAX_STRING] = "GTO\\Config\\GTO.Config.Levels.txt";
new VerboseSave=-1; // do we save extra un-needed db info like weapons, races, vehicels, deathmatches, etc
new ForceOverwrite = 0;

// xyz coord info
enum CoordInfo {
    Float:Coord_X,
    Float:Coord_Y,
    Float:Coord_Z
}

new KickList[MAX_PLAYERS];
new WorldTime;
new DBSeperator= 124; // seperate db fields.atm for db writing im just sending a string, which is written to a file.
new nullstr[MAX_STRING];

enum LevelInfo {
	level_xp,
    level_name[MAX_NAME]
}

// level rank names by Baby Face / Cool
new LevelList[MAX_LEVEL+1][LevelInfo] = { // experience required for each level
{  0,		"Wannabe" },
{  400,		"Balla" },
{  1000,	"Foot Criminal" },
{  2000,	"Foot Soldier" },
{  4000,	"Foot Lieutenant" },
{  8000,	"Foot Captain" },
{  14000,	"Street Criminal" },
{  24000,	"Street Soldier" },
{  38000,	"Street Lieutenant" },
{  54000,	"Street Captain" },
{  71000,	"HardCore Soldier" },
{  90000,	"1st Star General" },
{  115000,	"2nd Star General" },
{  145000,	"3rd Star General" },
{  190000,	"4th Star General" },
{  250000,	"5th Star General" },
{  330000,	"Set Leader" },
{  390000,	"Body Guard" },
{  480000,	"Left Hand Man" },
{  590000,	"Right Hand Man" },
{  720000, 	"GodFather" }
};

BaseLoadConfig()
{
	if (ForceOverwrite) return;
	new temp[MAX_STRING];
	if (!dini_Exists(ConfigDB))
	{
		dini_Create(ConfigDB);
	}
	set(temp,dini_Get(ConfigDB,"Level_DB"));
	if (strlen(temp) > 0) set(LevelDB,temp);
	
	set(temp,dini_Get(ConfigDB,"Verbose_Save"));
	if (strlen(temp) > 0) VerboseSave = strval(temp);
	
	if (!dini_Exists(LevelDB))
	{
		BaseSaveConfig();
	}
	for (new i=0;i<=MAX_LEVEL;i++)
	{
		new tempname[MAX_STRING];
	    format(tempname,sizeof(tempname),"Level%d_Rankname",i);
		set(temp,dini_Get(LevelDB,tempname));
		if (strlen(temp) > 0) set(LevelList[i][level_name],temp);
		
		format(tempname,sizeof(tempname),"Level%d_Experience",i);
		set(temp,dini_Get(LevelDB,tempname));
		if (strlen(temp) > 0) LevelList[i][level_xp] = strval(temp);
	}
	return;
}

BaseSaveConfig()
{
	new temp[MAX_STRING];
	if (dini_Exists(ConfigDB))
	{
		dini_Set(ConfigDB,"Level_DB",LevelDB);
		
		valstr(temp,VerboseSave);
		dini_Set(ConfigDB,"Verbose_Save",temp);
		
	}
	
	if (!dini_Exists(LevelDB))
	{
		dini_Create(LevelDB);
	}
	for (new i=0;i<=MAX_LEVEL;i++)
	{
		new tempname[MAX_STRING];
	    format(tempname,sizeof(tempname),"Level%d_Rankname",i);
		dini_Set(LevelDB,tempname,LevelList[i][level_name]);
		
		format(tempname,sizeof(tempname),"Level%d_Experience",i);
		valstr(temp,LevelList[i][level_xp]);
		dini_Set(LevelDB,tempname,temp);
	}
	return;
}

GetLevelName(level)
{
	new name[MAX_NAME];
	if ((level < 0) || (level > MAX_LEVEL+1)) return name;
	set(name,LevelList[level][level_name]);
	return name;
}
