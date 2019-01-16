//
// Created:     05.09.06
// Aurthor:    Iain Gilbert
//

#if defined _account_included
  #endinput
#endif

#define _account_included
#pragma library account
#include "base"
#include "utils\gtodudb"

new AccountDB[MAX_STRING] = "GTO\\Account\\";
new ENCRYPTION_KEY[MAX_STRING] = "_C)2^K¬RPXjwE8b\\p{Df+=Q3(O*vgu9ZH[!1\"Le0->?/hSF<'xVzm]$4%5a`Jdny¦IUW@G7s6&l:k;i~ YsoM£.cBq#|}NrTtA,";
new PlayerEmail[MAX_PLAYERS][MAX_NAME];
new PlayerPassword[MAX_PLAYERS][MAX_NAME];
new PlayerCreationDate[MAX_PLAYERS];
new PlayerRegistered[MAX_PLAYERS];

public AccountLoadConfig()
{
	if (ForceOverwrite) return;
	if (!dini_Exists(ConfigDB)) return;
	new temp[MAX_STRING];
	set(temp,dini_Get(ConfigDB,"Account_DB"));
	if (strlen(temp) > 0) set(AccountDB,temp);
	set(temp,nullstr);
	set(temp,dini_Get(ConfigDB,"Account_Encryption_Key"));
	if (strlen(temp) > 0) set(ENCRYPTION_KEY,temp);
	
	return;
}

public AccountSaveConfig()
{
	if (!dini_Exists(ConfigDB)) return;
	dini_Set(ConfigDB,"Account_DB",AccountDB);
	dini_Set(ConfigDB,"Account_Encryption_Key",ENCRYPTION_KEY);
	return;
}

public AccountSave(playerid)
{
	if (!IsPlayerRegistered(playerid)) return 0;

	account_save_db_dini(playerid);
	return 1;
}

account_save_db_dini(playerid)
{
	new dinifilename[MAX_STRING];
	format(dinifilename,sizeof(dinifilename),"%sGTO.Account.%s.txt",AccountDB,EncodeName(oGetPlayerName(playerid)));
	if (!dini_Exists(dinifilename))
	{
		dini_Create(dinifilename);
	}
	new temp[MAX_STRING];
	dini_Set(dinifilename,"Name",oGetPlayerName(playerid));
	dini_Set(dinifilename,"Password",PlayerPassword[playerid]);
	dini_Set(dinifilename,"Email",PlayerEmail[playerid]);
	valstr(temp,PlayerCreationDate[playerid]);
	dini_Set(dinifilename,"Creation_Date",temp);
	valstr(temp,Now());
	dini_Set(dinifilename,"Last_Login",temp);
}

public AccountLogin(playerid,password[])
{
	if (PlayerRegistered[playerid])
	{
	    SendClientMessage(playerid,COLOUR_RED, "You are already logged in.");
	    return false;
	}
	
	if (account_login_db_dini(playerid,password) == 0) return 0;
	
 	PlayerLoadStats(playerid);
 	SendClientMessage(playerid,COLOUR_GREEN, "Player login successfull.");
 	#if OUTPUTLEVEL > 0
		printf("player: %d:  %s: login successfull ",playerid,oGetPlayerName(playerid));
	#endif
 	return true;

}

account_login_db_dini(playerid,password[])
{
	// udb
	new udbfilename[MAX_STRING];
	udbfilename = oGetPlayerName(playerid);
	strcat(udbfilename,".Account",sizeof(udbfilename));

	// dini
	new dinifilename[MAX_STRING];
	format(dinifilename,sizeof(dinifilename),"%sGTO.Account.%s.txt",AccountDB,EncodeName(oGetPlayerName(playerid)));

	new useudb = 0;
 	if ((!udb_Exists(udbfilename)) && (!dini_Exists(dinifilename)))
	{
		SendClientMessage(playerid,COLOUR_RED, "That account name does not exist. Use /register [password] [email] to create an account.");
		return 0;
	}
	if ((udb_Exists(udbfilename)) && (!dini_Exists(dinifilename)))
	{
	    useudb = 1;
	}
	if ((udb_Exists(udbfilename)) && (dini_Exists(dinifilename)))
	{
			udb_Remove(udbfilename);
	}

	new dbpassword[MAX_NAME];
	if (useudb)
	{
		new tmppass[MAX_STRING];
		set(tmppass,encryptbykey(password,"GTOModAcctPassKey"));
		new dbstring[MAX_DBSTRING];
		dbstring = udb_Loadfile(udbfilename);
	 	new idx;
	 	strcharsplit(dbstring,idx,DBSeperator); // player name from db
	 	set(dbpassword,strcharsplit(dbstring,idx,DBSeperator));
	 	if (!equal(tmppass, dbpassword,false))
		{
			#if OUTPUTLEVEL > 0
				printf("player_login: failed: incorrect password ID:%d NAME:%s :",playerid,oGetPlayerName(playerid));
			#endif
	 		SendClientMessage(playerid,COLOUR_RED, "Incorrect Password.");
	 		SendClientMessage(playerid,COLOUR_RED, "You will be auto kicked for security.");
	 		KickPlayer(playerid,"Incorrect Password"); // kick them
		 	return false;
	 	}
	 	set(PlayerEmail[playerid],strcharsplit(dbstring,idx,DBSeperator));
	 	PlayerCreationDate[playerid] = Now();
	    //set(PlayerCreationDate[playerid],strcharsplit(dbstring,idx,DBSeperator));
	 	set(PlayerPassword[playerid],encryptbykey(password,ENCRYPTION_KEY));
	 	PlayerRegistered[playerid] = 1;

	}
	else
	{
		set(password,encryptbykey(password,ENCRYPTION_KEY));
		set(dbpassword,dini_Get(dinifilename,"Password"));
		if (!equal(password, dbpassword,false))
		{
			#if OUTPUTLEVEL > 0
				printf("player_login: failed: incorrect password ID:%d NAME:%s :",playerid,oGetPlayerName(playerid));
			#endif
	 		SendClientMessage(playerid,COLOUR_RED, "Incorrect Password.");
	 		SendClientMessage(playerid,COLOUR_RED, "You will be auto kicked for security.");
	 		KickPlayer(playerid,"Incorrect Password"); // kick them
		 	return false;
		}
		set(PlayerEmail[playerid],dini_Get(dinifilename,"Email"));
		set(PlayerCreationDate[playerid],dini_Get(dinifilename,"Creation_Date"));
		set(PlayerPassword[playerid],dbpassword);
	 	PlayerRegistered[playerid] = 1;
	}
	return true;
}

public AccountCommandHandler(playerid,text[]) // process account commands
{
	if (!IsPlayerConnected(playerid)) return 0;
	new cmd[20];
	new idx;
	set(cmd,strcharsplit(text, idx,strchar(" ")));
	
    if(strcomp(cmd, "/register", true) == 1)
	{

	    new password[MAX_NAME];
	    new email[MAX_NAME];
	    set(password,strcharsplit(text, idx,strchar(" "))); 
	    set(email,strcharsplit(text, idx,strchar(" ")));
	    if (strfind(email,charstr(DBSeperator),false) != -1)
		{
			#if OUTPUTLEVEL > 0
				printf("%s: register_account: fail: DB seperator found in email",oGetPlayerName(playerid));
			#endif
			SendClientMessage(playerid, COLOUR_MISC, "ERROR: BAD CHARACTER IN EMAIL.");

			return 1;
		}

  		if(!strlen(password))
		{
			SendClientMessage(playerid, COLOUR_MISC, "USAGE: /register [password] [email]");
			return 1;
		}
		if (PlayerRegistered[playerid])
		{
			SendClientMessage(playerid,COLOUR_RED, "You are already logged in.");
			return 1;
		}
		
		// udb
		new udbfilename[MAX_STRING];
		udbfilename = oGetPlayerName(playerid);
		strcat(udbfilename,".Account",sizeof(udbfilename));

		// dini
		new dinifilename[MAX_STRING];
		format(dinifilename,sizeof(dinifilename),"%sGTO.Account.%s.txt",AccountDB,EncodeName(oGetPlayerName(playerid)));

		if ((udb_Exists(udbfilename)) || (dini_Exists(dinifilename)))
  		{
			SendClientMessage(playerid,COLOUR_RED, "That account name already exists.");
			return 1;
		}

		dini_Create(dinifilename);
		dini_Set(dinifilename,"Name",oGetPlayerName(playerid));
		new temp[MAX_STRING];
		set(temp,encryptbykey(password,ENCRYPTION_KEY));
		dini_Set(dinifilename,"Password",temp);
		dini_Set(dinifilename,"Email",email);
		valstr(temp,Now());
		dini_Set(dinifilename,"Creation_Date",temp);
		dini_Set(dinifilename,"Last_Login",temp);
		
		CreatePlayer(playerid);
		SendClientMessage(playerid,COLOUR_GREEN, "Account created.");
		AccountLogin(playerid,password);
		
		#if OUTPUTLEVEL > 0
			printf("create_account: success %d  %s",playerid,oGetPlayerName(playerid));
		#endif
		return 1;
	}

	if(strcomp(cmd, "/login", true) == 1)
	{
	    new password[MAX_STRING];
	    set(password,strcharsplit(text, idx,strchar(" "))); 
		if(!strlen(password))
		{
			SendClientMessage(playerid, COLOUR_MISC, "USAGE: /login [password]");
			return 1;
		}

		AccountLogin(playerid,password);
		return 1;
	}

	if(strcomp(cmd, "/savechar", true) == 1)
	{

		if (IsPlayerRegistered(playerid))
		{
		    PlayerSave(playerid);
			AccountSave(playerid);
		}
		return 1;
	}
	return 0;
}

