//
// Created:     17.09.06
// Aurthor:    Iain Gilbert
//


#if defined _bank_included
  #endinput
#endif

#define _bank_included
#pragma library bank
#include "base"
#include "player"

#define MAX_BANK 10000000
#define BanksCount 4

new Banks[BanksCount][CoordInfo] = {
{-22.9578,-54.8951,1003.5469}, // LV 24/7 bank
{371.2316,-125.5778,1001.4995}, // LS pizza bank
{368.7201,-72.7097,1001.5078}, // LS burger bank7
{364.9761,-8.5396,1001.8516} // LS chicken bank5
}; 

public BankInit()
{
	for (new bankid=0;bankid<BanksCount;bankid++)
	{
		AddActiveCheckpoint(Banks[bankid][Coord_X],Banks[bankid][Coord_Y],Banks[bankid][Coord_Z],20,2);
	}
}

public IsPlayerAtBank(playerid)
{
	for (new bankid=0;bankid<BanksCount;bankid++)
	{
		if (oIsPlayerInCheckpoint(playerid,Banks[bankid][Coord_X],Banks[bankid][Coord_Y],Banks[bankid][Coord_Z],10))
		{
		    return 1;
		}
	}
 return 0;
}

public OnPlayerEnterBankCheckpoint(playerid)
{
	if (playerid == INVALID_PLAYER_ID) return;
	if (!IsPlayerConnected(playerid)) return;
	if (!IsPlayerAtBank(playerid)) return;
	SendPlayerFormattedText(playerid, "You are at a bank. To deposit money type '/bank <amount>'. To withdraw money type '/withdraw <amount>'." , 0,COLOUR_GREEN);
	SendPlayerFormattedText(playerid, "Your current bank balance is $%d." , Player[playerid][Bank],COLOUR_GREEN);
}



public BankCommandHandler(playerid,text[]) // process player commands
{
	if (!IsPlayerConnected(playerid)) return 0;

	new cmd[20];
	new idx;

	set(cmd,strcharsplit(text, idx,strchar(" ")));
	if (strlen(cmd) == 0) return 0;

    if(strcomp(cmd, "/withdraw", true) == 1)
	{
	    if (!IsPlayerAtBank(playerid))
	    {
	    	SendPlayerFormattedText(playerid, "You must be at a bank to withdraw money." , 0,COLOUR_RED);
			return 1;
	    }
	    
		set(cmd,strcharsplit(text, idx,strchar(" ")));
		if (strlen(cmd) == 0)
		{
			SendPlayerFormattedText(playerid, "Command usage: '/withdraw <amount>'" , 0,COLOUR_RED);
			return 1;
		}
  		new amount = strval(cmd);
  		if (amount <= 0)
  		{
  			SendPlayerFormattedText(playerid, "Command usage: /withdraw <amount>" , 0,COLOUR_RED);
  		    return 1;
		}
		if (amount > Player[playerid][Bank])
		{
			amount = Player[playerid][Bank];
		}
			
		oGivePlayerMoney(playerid,amount,0);
		Player[playerid][Bank] = Player[playerid][Bank] - amount;
		new string[MAX_STRING];
		format(string,sizeof(string),"$%d withdrawn. Current balance: $%d." ,amount,Player[playerid][Bank]);
		SendPlayerFormattedText(playerid, string,0,COLOUR_GREEN);
		new Float:playerx,Float:playery,Float:playerz;
		GetPlayerPos(playerid,playerx,playery,playerz);
     	PlayerPlaySound(playerid,1084,playerx,playery,playerz);
     	return 1;
	}
		
		
    if((strcomp(cmd, "/bank", true) == 1) || (strcomp(cmd, "/deposit", true) == 1))
	{
	 	if (!IsPlayerAtBank(playerid))
	    {
	    	SendPlayerFormattedText(playerid, "You must be at a bank to deposit money." , 0,COLOUR_RED);
			return 1;
	    }

		set(cmd,strcharsplit(text, idx,strchar(" ")));
		if (strlen(cmd) == 0)
		{
			SendPlayerFormattedText(playerid, "Command usage: '/bank <amount>'" , 0,COLOUR_RED);
			return 1;
		}
  		new amount = strval(cmd);
  		if (amount <= 0)
  		{
  			SendPlayerFormattedText(playerid, "Command usage: /bank <amount>" , 0,COLOUR_RED);
  		    return 1;
		}
		if (oGetPlayerMoney(playerid) < amount)
		{
		    amount = oGetPlayerMoney(playerid);
		}
		if (Player[playerid][Bank] + amount > MAX_BANK)
		{
			amount = MAX_BANK - Player[playerid][Bank];
		}
		oGivePlayerMoney(playerid,0 - amount,0);
		Player[playerid][Bank] = Player[playerid][Bank] + amount;
		new string[MAX_STRING];
		format(string,sizeof(string),"$%d deposited. Current balance: $%d." ,amount,Player[playerid][Bank]);
		SendPlayerFormattedText(playerid, string,0,COLOUR_GREEN);
		new Float:playerx,Float:playery,Float:playerz;
		GetPlayerPos(playerid,playerx,playery,playerz);
     	PlayerPlaySound(playerid,1083,playerx,playery,playerz);
		if (Player[playerid][Bank] == MAX_BANK)
		{
			SendPlayerFormattedText(playerid, "Your bank is full!" , 0,COLOUR_RED);
		}
		return 1;
	}
	return 0;
}

