//
// Created:     05.09.06
// Aurthor:    Iain Gilbert
//

#if defined _commandhandler_included
  #endinput
#endif

#define _commandhandler_included
#pragma library commandhandler
#include "base"
#include "utils\gtoutils"
#include "player"
#include "account"

public CommandHandler(playerid,text[]) // process player commands
{
	if (!IsPlayerConnected(playerid)) return 0;
	new cmd[20];
	new idx;
	set(cmd,strcharsplit(text, idx,strchar(" ")));
	
	if(strcomp(cmd, "/sound", true) == 1)
	{
	    new soundid;
	    soundid = strval(strcharsplit(text, idx,strchar(" ")));
	    if (soundid <= 0) return 1;
	    new Float:playerx,Float:playery,Float:playerz;
		GetPlayerPos(playerid,playerx,playery,playerz);
     	PlayerPlaySound(playerid,soundid,playerx,playery,playerz);
		return 1;
	}
	
	
	
	
	if(strcomp(cmd, "/help", true) == 1)
	{
		SendPlayerScrollingText(playerid,"~g~SA:MP: Grand Theft Online gamemode");
		SendPlayerScrollingText(playerid,"Type: /objective : to find out what to do in this gamemode.");
		SendPlayerScrollingText(playerid,"Type: /register [password] <email>: to create an account.");
		SendPlayerScrollingText(playerid,"Type: /login [password]: to login to your account.");
		SendPlayerScrollingText(playerid,"Type: /level : to display level information.");
		SendPlayerScrollingText(playerid,"Type: /status : to display character information.");
		SendPlayerScrollingText(playerid,"Type: /givecash [playerid] [money-amount] : to send money to other players.");
        SendPlayerScrollingText(playerid,"Type: /gang help : to see help on gangs.");
        SendPlayerScrollingText(playerid,"Type: /commands : for a list of all commands.");
        
        

		return 1;
	}

	if(strcomp(cmd, "/objective", true) == 1)
	{
		SendPlayerScrollingText(playerid,"This gamemode is open, there's no specific win / endgame conditions to meet.");
		SendPlayerScrollingText(playerid,"In SA:MP:GTO, when you kill a player, you will receive experience points & steal the money they are carrying.");
		SendPlayerScrollingText(playerid,"Increasing experience points increases your level, which effects your spawn weapons and health and cashflow.");
		SendPlayerScrollingText(playerid,"Experience points can be gained by killing people, winning races, holding ground, and more.");
		SendPlayerScrollingText(playerid,"Bank your money at 24/7's so you dont loose it all when you die.");
		SendPlayerScrollingText(playerid,"Buy extra weapons from ammunation.");
		SendPlayerScrollingText(playerid,"Type /level to see level information.");
		SendPlayerScrollingText(playerid,"Players can create gangs to team up against opposing gangs nad players.");

		return 1;
	}

	
	if(strcomp(cmd, "/commands", true) == 1)
	{
		SendPlayerScrollingText(playerid,"~g~GTO Commands:");
		SendPlayerScrollingText(playerid,"'/objective'		- Discription of what to do in this gamemode.");
		SendPlayerScrollingText(playerid,"'/register [password] [email]'	- create an account.");
		SendPlayerScrollingText(playerid,"'/login [password]'	- login to your account.");
		SendPlayerScrollingText(playerid,"'/level'			- display level information.");
		SendPlayerScrollingText(playerid,"'/status'			- display character information.");
		SendPlayerScrollingText(playerid,"'/version'		- display gto version information.");
		SendPlayerScrollingText(playerid,"'/givecash [playerid] [money-amount]'	- to send money to other players.");
		SendPlayerScrollingText(playerid,"'/bank <amount>'	- Deposit amount of money in bank.");
		SendPlayerScrollingText(playerid,"'/withdraw <amount>'	- Withdraw amount of money from bank.");
	    SendPlayerScrollingText(playerid,"'/gang help'		- see help on gangs.");
        SendPlayerScrollingText(playerid,"'/Gang Create <colour> <gangname>'	- Create a new gang (Cost $50,000).");
		SendPlayerScrollingText(playerid,"'/Gang colours'	- Show a list of colours.");
		SendPlayerScrollingText(playerid,"'/g <message>'	- Send gang message.");
		SendPlayerScrollingText(playerid,"'/Gang Quit'		- Leave/Quit your current gang.");
		SendPlayerScrollingText(playerid,"'/Gang Accept'	- Join/Accept an invitation to join a gang");
		SendPlayerScrollingText(playerid,"'/Gang Stats'		- Show stat info about your gang.");
		SendPlayerScrollingText(playerid,"'/Gang Members'	- Show member info about your gang.");
		SendPlayerScrollingText(playerid,"'/Gang Invite <playername>'	- Invite a player to join your gang. (Gangleader only) ");
		SendPlayerScrollingText(playerid,"'/Gang Kick <playername>'		- Kick a player from your gang. (Gangleader only) ");
		SendPlayerScrollingText(playerid,"'/Gang Colour <colour>'		- Set your gangs colour. (Gangleader only)(cost: $10,000)");
		SendPlayerScrollingText(playerid,"'/weapons'		- Show a list of all the weapons you have.");
		SendPlayerScrollingText(playerid,"'/weapon buy'		- Show a list of weapons for sale at ammunation.");
		SendPlayerScrollingText(playerid,"'/weapon buy <weaponid> <bullets>' 	- buy weapon from Ammunation.");

		SendPlayerScrollingText(playerid,"'/races'			- Show a list of all races currently running.");
  		//SendPlayerScrollingText(playerid,"'/race'			- Join current race. (in checkpoint only)");
		//SendPlayerScrollingText(playerid,"'/race join'		- Join current race. (in checkpoint only)");
		SendPlayerScrollingText(playerid,"'/race join <raceid>'		- Join race, raceid is got from '/races' command");
		SendPlayerScrollingText(playerid,"'/race quit'		- Leave current race.");
		//SendPlayerScrollingText(playerid,"'/race time'		- Show time left till current race starts/ends.");
		return 1;
	}
	
	if((strcomp(cmd, "/stats", true) == 1) || (strcomp(cmd, "/status", true) == 1) || (strcomp(cmd, "/stat", true) == 1))
	{
		new string[MAX_STRING];
  		SendClientMessage(playerid,COLOUR_GREEN, "Player Status");
		format(string, sizeof(string), "Level: %d ", Player[playerid][Level]);
		SendPlayerScrollingText(playerid,string);
		format(string, sizeof(string), "XP: %d ", Player[playerid][XP]);
		SendPlayerScrollingText(playerid,string);
		format(string, sizeof(string), "Rank: %s.", GetLevelName(Player[playerid][Level]));
		SendPlayerScrollingText(playerid,string);
		format(string, sizeof(string), "Gang: %s.", PlayerGangName[playerid]);
		SendPlayerScrollingText(playerid,string);
		format(string, sizeof(string), "Money: %d ", GetPlayerTotalMoney(playerid));
		SendPlayerScrollingText(playerid,string);
		format(string, sizeof(string), "Deaths: %d ", Player[playerid][Deaths]);
		SendPlayerScrollingText(playerid,string);
		format(string, sizeof(string), "Kills: %d ", Player[playerid][Kills]);
		SendPlayerScrollingText(playerid,string);
		
    	return 1;
	}
	
	if(strcomp(cmd, "/level", true) == 1)
	{
	    CheckPlayerLevel(playerid);
		new string[256];
  		SendClientMessage(playerid,COLOUR_GREEN, "Player Level Information");
		format(string, sizeof(string), "Current Level: %d ", Player[playerid][Level]);
		SendClientMessage(playerid,COLOUR_XP_GOOD, string);
		format(string, sizeof(string), "Current XP: %d ", Player[playerid][XP]);
		SendClientMessage(playerid,COLOUR_XP_GOOD, string);
		format(string, sizeof(string), "XP to level: %d ", GetXPToLevel(playerid, Player[playerid][Level] + 1));
		SendClientMessage(playerid,COLOUR_XP_BAD, string);
    	return 1;
	}

	if(strcomp(cmd, "/version", true) == 1)
	{
	    new string[MAX_STRING];
		SendClientMessage(playerid, COLOUR_MISC, "This server is running:");
		format(string, sizeof(string), "SA:MP Grand Theft Online %s", VERSION);
		SendClientMessage(playerid, COLOUR_GREEN,string);
		SendClientMessage(playerid, COLOUR_MISC, "Created by Iain Gilbert");
		return 1;
	}

	if(strcomp(cmd, "/givecash", true) == 1)
	{
		new string[256];
		new giveplayerid, moneys;
		new sendername[MAX_PLAYER_NAME];
		new playermoney;
		new giveplayer[MAX_PLAYER_NAME];
	    new tmp[256];
		tmp = strcharsplit(text, idx,strchar(" "));

		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOUR_MISC, "USAGE: /givecash [playerid] [amount]");
			return 1;
		}
		giveplayerid = strval(tmp);

		tmp = strcharsplit(text, idx,strchar(" "));
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOUR_MISC, "USAGE: /givecash [playerid] [amount]");
			return 1;
		}
 		moneys = strval(tmp);

		if (IsPlayerConnected(giveplayerid))
		{
			GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
			GetPlayerName(playerid, sendername, sizeof(sendername));
			playermoney = oGetPlayerMoney(playerid);
			if (moneys > 0 && playermoney >= moneys)
			{
				oGivePlayerMoney(playerid, (0 - moneys),1);
				oGivePlayerMoney(giveplayerid, moneys,1);
				format(string, sizeof(string), "You have sent %s(player: %d), $%d.", giveplayer,giveplayerid, moneys);
				SendClientMessage(playerid, COLOUR_MONEY_GOOD, string);
				format(string, sizeof(string), "You have recieved $%d from %s(player: %d).", moneys, sendername, playerid);
				SendClientMessage(giveplayerid, COLOUR_MONEY_GOOD, string);
				printf("%s(playerid:%d) has transfered %d to %s(playerid:%d)",sendername, playerid, moneys, giveplayer, giveplayerid);
			}
			else
			{
				SendClientMessage(playerid, COLOUR_MISC, "Invalid transaction amount.");
			}
		}
		else
		{
			format(string, sizeof(string), "%d is not an active player.", giveplayerid);
			SendClientMessage(playerid, COLOUR_MISC, string);
		}
		return 1;
	}
	return 0;
}
