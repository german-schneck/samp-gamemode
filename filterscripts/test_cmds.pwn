//-------------------------------------------------
//
//  SA-MP 0.3 commands for testing
//  Don't load this script on a public server
//  it could break your existing scripts.
//  Kye 2009-2010
//
//-------------------------------------------------

#pragma tabsize 0

#include <a_samp>
#include <core>
#include <float>

#include "../include/gl_common.inc"

new Text3D:textid;
new PlayerText3D:playertextid;

new savanna=0;
new blade=0;

//-------------------------------------------------

public OnPlayerCommandText(playerid, cmdtext[])
{
	new cmd[256];
	new idx;
	cmd = strtok(cmdtext, idx);
	new engine,lights,alarm,doors,bonnet,boot,objective;
	
	//if(!IsPlayerAdmin(playerid)) return 0; // this is an admin only script

	if(strcmp(cmd, "/player2v", true) == 0)
	{
  		new tmp[256];
	  	new tmp2[256];
		tmp = strtok(cmdtext,idx);
		tmp2 = strtok(cmdtext,idx);
		PutPlayerInVehicle(strval(tmp),strval(tmp2),0);
	    return 1;
	}

	if(strcmp( cmd, "/vc", true ) == 0 )
	{
		new Float:X, Float:Y, Float:Z;
		new tmp[256];
		new created_vehicle_id;
		tmp = strtok( cmdtext, idx );

		GetPlayerPos( playerid, X, Y, Z );

		created_vehicle_id = CreateVehicle( strval(tmp), X+2, Y+2, Z, 0, 0, 0, -1 );

		new msg[256];
		format(msg,256,"Created vehicle: %d",created_vehicle_id);
		SendClientMessage(playerid,0xAAAAAAAA,msg);

		return 1;
	}
	

	if(strcmp( cmd, "/weap", true ) == 0 )
	{
		new tmp[256];
		tmp = strtok( cmdtext, idx );
		GivePlayerWeapon(playerid, strval(tmp), 9999);
		return 1;
	}

	if(strcmp( cmd, "/dvehicle", true ) == 0 )
	{
		new tmp[256];
		tmp = strtok( cmdtext, idx );

		DestroyVehicle( strval(tmp) );

		new msg[256];
		format(msg,256,"Destroyed vehicle: %d",strval(tmp));
		SendClientMessage(playerid,0xAAAAAAAA,msg);

		return 1;
	}

	if(strcmp( cmd, "/goto", true ) == 0)
	{
	    new tmp[256];

	    tmp = strtok(cmdtext,idx);
	    if(!strlen(tmp)) { return 1; }

	    new Float:X, Float:Y, Float:Z;

	    if(GetPlayerVehicleID(playerid))
	    {
		    GetPlayerPos( strval(tmp), X, Y, Z );
		    SetVehiclePos( GetPlayerVehicleID(playerid), X+2, Y+2, Z );
	    } else {
		    GetPlayerPos( strval(tmp), X, Y, Z );
		    SetPlayerPos( playerid, X+2, Y+2, Z );
	    }

	    return 1;
	}

	if(strcmp(cmd, "/bring", true) == 0)
	{
	    new tmp[256];

	    tmp = strtok(cmdtext, idx);

	    if(!strlen(tmp)) { return 1; }

	    new Float:X, Float:Y, Float:Z;

	    if(GetPlayerVehicleID(strval(tmp)))
	    {
		    GetPlayerPos(playerid, X, Y, Z);
		    SetVehiclePos(GetPlayerVehicleID(strval(tmp)), X+2, Y+2, Z);
	    } else {
		    GetPlayerPos(playerid, X, Y, Z);
		    SetPlayerPos(strval(tmp), X+2, Y+2, Z);
	    }
	    
	    return 1;
	}

	if(strcmp(cmd, "/me2v", true) == 0)
	{
	  	new tmp[256];
		tmp = strtok(cmdtext,idx);
		PutPlayerInVehicle(playerid,strval(tmp),0);
	    return 1;
	}

	if(strcmp(cmd, "/tpzero", true) == 0)
	{
	  	new vid = GetPlayerVehicleID(playerid);
	  	if(vid != INVALID_VEHICLE_ID) {
			SetVehiclePos(vid,0.0,0.0,10.0);
		}
	    return 1;
	}

	if(strcmp(cmd, "/myvw", true) == 0)
	{
        new tmp[256];
		tmp = strtok(cmdtext,idx);
		SetPlayerVirtualWorld(playerid,strval(tmp));
	    return 1;
	}

	if(strcmp( cmd, "/fight", true ) == 0)
	{
		new tmp[256];
		new name[128];

		tmp = strtok(cmdtext, idx);
		new style = strval(tmp);
		SetPlayerFightingStyle(playerid, style);
		GetPlayerName(playerid,name,128);
		format(tmp, 256, "(%s) fighting style changed to %d", name, style);
		SendClientMessageToAll(0x4499CCFF,tmp);
		return 1;
	}

	if(strcmp( cmd, "/myfacingangle", true ) == 0)
	{
	    new Float:angle;
	    new tmp[256];
	    GetPlayerFacingAngle(playerid,angle);
		format(tmp, 256, "Facing: %f",angle);
		SendClientMessage(playerid,0x4499CCFF,tmp);
		return 1;
	}

	if(strcmp(cmd, "/crime", true) == 0) {
	    new tmp[256];
	  	new tmp2[256];
		tmp = strtok(cmdtext,idx);
		tmp2 = strtok(cmdtext,idx);
		PlayCrimeReportForPlayer(playerid, strval(tmp), strval(tmp2));
		return 1;
	}

	if(strcmp(cmd, "/repairmycar", true) == 0) {
	    new vid = GetPlayerVehicleID(playerid);
	    if (vid) RepairVehicle(vid);
		return 1;
	}

    if(strcmp(cmd, "/bv", true) == 0)
	{
		new tmp[128], iCar, string[128];

		tmp = strtok(cmdtext, idx);

		if(strlen(tmp) == 0) return SendClientMessage(playerid, 0xFFFFFFFF, "DO: /bv [vehicleid]");

		iCar = strval(tmp);

		new File:file = fopen("badvehicles.txt",io_append);
		format(string,sizeof(string),"%d\r\n", iCar);
		fwrite(file,string);
		fclose(file);

		GetPlayerName(playerid,tmp,128);
		format(string, sizeof(string), "Veh ID %i marked as bad vehicle by %s", iCar, tmp);
		SendClientMessageToAll(0xFFFFFFFF, string);
		return 1;
	}

	if(strcmp(cmd, "/weapskill", true) == 0) {
	    new tmp[256];
	  	new tmp2[256];
		tmp = strtok(cmdtext,idx);
		tmp2 = strtok(cmdtext,idx);
		SetPlayerSkillLevel(playerid, strval(tmp), strval(tmp2));
		return 1;
	}

	if(strcmp(cmd, "/labelonvehicle", true) == 0) {
	    new vid = GetPlayerVehicleID(playerid);
	    textid = Create3DTextLabel("My Vehicle\nOwned by me\nNo Fuel\nRunning on vapour",0xEEEEEE50,0.0,0.0,0.0,15.0,0);
	    Attach3DTextLabelToVehicle(textid, vid, 0.0, -1.6, -0.35); // tail of the vehicle toward the ground
		return 1;
	}

	if(strcmp(cmd, "/labelonplayer", true) == 0) {
		new tmp[256];
		tmp = strtok(cmdtext,idx);
 		textid = Create3DTextLabel("Player Label",0xFFFFFFFF,0.0,0.0,0.0,40.0,0);
	    Attach3DTextLabelToPlayer(textid, strval(tmp), 0.0, 0.0, -0.4);
		return 1;
	}

	if(strcmp(cmd, "/manylabels", true) == 0) {
	    new Float:X, Float:Y, Float:Z;
	    GetPlayerPos(playerid, X, Y, Z);
	    new x=0;
	    while(x!=50) {
 			Create3DTextLabel("Mah Labels",0xFFFFFFFF,X,Y,Z,100.0,0);
 			Z = Z + 0.1;
 			x++;
		}
		return 1;
	}

    if(strcmp(cmd, "/dellabel", true) == 0) {
	    Delete3DTextLabel(textid);
		return 1;
	}

	if(strcmp(cmd, "/playerlabel", true) == 0) {
	    new Float:X, Float:Y, Float:Z;
	    GetPlayerPos( playerid, X, Y, Z );
	    playertextid = CreatePlayer3DTextLabel(playerid,"Hello\nI'm at your position",0x008080FF,X,Y,Z,40.0);
	    SendClientMessage(playerid, 0xFFFFFFFF, "I created a player label at your position.");
		return 1;
	}

	if(strcmp(cmd, "/playerlabelveh", true) == 0) {
	    new vid = GetPlayerVehicleID(playerid);
	    playertextid = CreatePlayer3DTextLabel(playerid,"im in your vehicles\nand hiding behind the walls",0x008080FF,0.0,-1.6,-0.35,20.0,INVALID_PLAYER_ID,vid,1);
		return 1;
	}

	if(strcmp(cmd, "/playerlabelpl", true) == 0) {
	    new tmp[256];
		tmp = strtok(cmdtext,idx);
	    playertextid = CreatePlayer3DTextLabel(playerid,"Hello Testing",0x008080FF,0.0,0.0,0.0,30.0,strval(tmp));
		return 1;
	}

    if(strcmp(cmd, "/delplayerlabel", true) == 0) {
	    DeletePlayer3DTextLabel(playerid, playertextid);
		return 1;
	}

	if(strcmp(cmd, "/updateplayerlabel", true) == 0) {
	    UpdatePlayer3DTextLabelText(playerid, playertextid, 0xFFFFFFFF, "");
		return 1;
	}

	if(strcmp(cmd, "/carmodtest", true) == 0) {
	    // spawns a couple of cars in Grove with mods applied
	   	savanna = CreateVehicle(567,2509.1343,-1686.2330,13.2296,47.3679,16,16,10000);
		AddVehicleComponent(savanna,1189); //Front Bumper
		AddVehicleComponent(savanna,1187); //Rear Bumper
		AddVehicleComponent(savanna,1129); //Exhaust
		AddVehicleComponent(savanna,1102); //Left Side Skirt
		AddVehicleComponent(savanna,1133); //Right Side Skirt
		AddVehicleComponent(savanna,1078); //Wheels
		AddVehicleComponent(savanna,1010); //Nitro 10x
		AddVehicleComponent(savanna,1087); //Hydrolics

		blade = CreateVehicle(536,2509.8462,-1671.8666,13.1510,348.3512,16,16,10000);
		AddVehicleComponent(blade,1182); //Front Bumper
		AddVehicleComponent(blade,1184); //Rear Bumper
		AddVehicleComponent(blade,1104); //Exhaust
		AddVehicleComponent(blade,1108); //Left Side Skirt
		AddVehicleComponent(blade,1107); //Right Side Skirt
		AddVehicleComponent(blade,1078); //Wheels
		AddVehicleComponent(blade,1010); //Nitro 10x
		AddVehicleComponent(blade,1087); //Hydrolics
  		return 1;
	}

	if(strcmp(cmd, "/addnitro", true) == 0) {
	    new vid = GetPlayerVehicleID(playerid);
	    AddVehicleComponent(vid, 1010);
	    return 1;
	}


	if(strcmp(cmd, "/remnitro", true) == 0) {
        new vid = GetPlayerVehicleID(playerid);
	    RemoveVehicleComponent(vid, 1010);
	    return 1;
	}

	if(strcmp(cmd, "/paintjob", true) == 0) {
	    new tmp[256];
		tmp = strtok(cmdtext,idx);
	    new vid = GetPlayerVehicleID(playerid);
		ChangeVehiclePaintjob(vid,strval(tmp));
		return 1;
	}

	if(strcmp(cmd, "/longtd", true) == 0) {
  		new st4[256];
  		new st5[256];
		new st6[256];
		new st7[1024];

		format(st4,sizeof(st4),"0123456789012345678901234567890123456789~n~012345678901234567890123456789~n~01234567890123456789~n~0123456789~n~0123456789012345678901234567890123456789~n~01234567890123456789~n~01234567890123456789~n~01234567890123456789~n~");
		format(st5,sizeof(st5),"0123456789012345678901234567890123456789~n~012345678901234567890123456789~n~01234567890123456789~n~0123456789~n~0123456789012345678901234567890123456789~n~01234567890123456789~n~01234567890123456789~n~01234567890123456789~n~");
		format(st6,sizeof(st6),"0123456789012345678901234567890123456789~n~012345678901234567890123456789~n~01234567890123456789~n~0123456789~n~0123456789012345678901234567890123456789~n~01234567890123456789~n~01234567890123456789~n~01234567890123456789");
		format(st7,sizeof(st7),"%s %s %s~n~LEN(%d)",st4,st5,st6,strlen(st4)+strlen(st5)+strlen(st6));

        new Text:Stats = TextDrawCreate(10.0, 10.0, st7);
		TextDrawTextSize(Stats, 400.0, 400.0);
		TextDrawUseBox(Stats,0);
		TextDrawBoxColor(Stats,0xFFFFFFFF);
		TextDrawFont(Stats,1);
		TextDrawLetterSize(Stats,0.5,0.5);
		TextDrawShowForPlayer(playerid,Stats);
		return 1;
	}
	
	if(strcmp(cmd, "/testmsgbox", true) == 0) {
		ShowPlayerDialog(playerid,0,DIALOG_STYLE_MSGBOX,"Welcome","Welcome to the SA-MP 0.3 server. This is test_cmds.pwn /testmsgbox\nHope it's useful to you.","OK","");
        return 1;
	}
	
	if(strcmp(cmd, "/testmsgbox2", true) == 0) {
		ShowPlayerDialog(playerid,0,DIALOG_STYLE_MSGBOX,"Welcome","Welcome:\tInfo\nTest:\t\tTabulated\nLine:\t\tHello","OK","Cancel");
        return 1;
	}

	if(strcmp(cmd, "/testinputbox", true) == 0) {
	    new loginmsg[256+1];
	    new loginname[MAX_PLAYER_NAME+1];
	    GetPlayerName(playerid,loginname,MAX_PLAYER_NAME);
	    format(loginmsg,256,"Welcome to the SA-MP 0.3 server.\n\n{EEEE88}Account:\t{FFFFFF}%s\n\n{FFFFFF}Please enter your password below:",loginname);
		ShowPlayerDialog(playerid,1,DIALOG_STYLE_INPUT,"{EE7777}Login to SA-MP",loginmsg,"Login","Cancel");
        return 1;
	}
	
	if(strcmp(cmd, "/testlistbox", true) == 0) {
	    new listitems[] = "{FFFFFF}1\t{55EE55}Deagle\n{FFFFFF}2\t{55EE55}Sawnoff\n{FFFFFF}3\t{55EE55}Pistol\n{FFFFFF}4\t{55EE55}Grenade\n{FFFFFF}5\t{55EE55}Parachute\n6\t{55EE55}Lorikeet";
	    ShowPlayerDialog(playerid,2,DIALOG_STYLE_LIST,"{448844}List of weapons:",listitems,"Select","Cancel");
        return 1;
	}
	
    if(strcmp(cmd, "/testclosebox", true) == 0) {
	    ShowPlayerDialog(playerid,-1,0,"","","","");
        return 1;
	}

    if(strcmp(cmd, "/setfacingzero", true) == 0) {
	    SetPlayerFacingAngle(playerid, 0.0);
        return 1;
	}

    if(strcmp(cmd, "/detachtrailer", true) == 0) {
        new vid = GetPlayerVehicleID(playerid);
	    DetachTrailerFromVehicle(vid);
        return 1;
	}
	
	if(strcmp(cmd, "/testformat", true) == 0) {
	    new strtest[256];
	    new File:f = fopen("test.txt",io_write);
	    format(strtest,256,"[chat] %d %s\r\n",24,"þÿÿþ");
	    SendClientMessage(playerid,0xFFFFFFFF,strtest);
	    fwrite(f,strtest);
	    format(strtest,256,"[chat] %d %s\r\n",34," þÿÿþ");
	    SendClientMessage(playerid,0xFFFFFFFF,strtest);
	    fwrite(f,strtest);
	    fclose(f);
	    return 1;
	}

	if(strcmp(cmd, "/setskin", true) == 0) {
        new tmp[256];
		tmp = strtok(cmdtext,idx);
		SetPlayerSkin(playerid,strval(tmp));
	    return 1;
	}
	
	if(strcmp(cmd, "/setvars", true) == 0) {
		SetPVarInt(playerid,"num_test",7001);
		SetPVarString(playerid,"additional_tag","Hello World");
		SetPVarFloat(playerid,"some_float",1001.0);
		SendClientMessage(playerid,0xFFFFFFFF, "Vars set");
	    return 1;
	}
	
	if(strcmp(cmd, "/modvars", true) == 0) {
		SetPVarInt(playerid,"num_test",8001);
		SetPVarString(playerid,"additional_tag","World Hello");
		SetPVarFloat(playerid,"some_float",6901.0);
		SendClientMessage(playerid,0xFFFFFFFF, "Vars modded");
	    return 1;
	}
	
	if(strcmp(cmd, "/getvars", true) == 0) {
	
		new tst_IntRet;
		new Float:tst_FloatRet;
		new tst_StrRet[256];
		new tst_DispStr[256];
		
		tst_IntRet = GetPVarInt(playerid,"num_test");
		tst_FloatRet = GetPVarFloat(playerid,"some_float");
 		GetPVarString(playerid,"additional_tag",tst_StrRet,256);
 		
		format(tst_DispStr,256,"num_test: %d some_float: %f additional_tag: %s",tst_IntRet,tst_FloatRet,tst_StrRet);
		SendClientMessage(playerid,0xFFFFFFFF, tst_DispStr);
		
	    return 1;
	}
	
	if(strcmp(cmd, "/delvars", true) == 0) {
		DeletePVar(playerid,"num_test");
		DeletePVar(playerid,"additional_tag");
		DeletePVar(playerid,"some_float");
		SendClientMessage(playerid,0xFFFFFFFF, "Vars deleted");
	    return 1;
	}

	if(strcmp(cmd, "/pvarlist", true) == 0) {
		SendPVarListToPlayer(playerid);
	    return 1;
	}

	if(strcmp(cmd, "/kill",true) == 0) {
	    SetPlayerHealth(playerid,0.0);
	    return 1;
	}
	
	if(strcmp(cmd, "/kickallnpc",true) == 0) {
		new p=0;
		while(p!=MAX_PLAYERS) {
			if(IsPlayerConnected(p) && IsPlayerNPC(p)) Kick(p);
			p++;
		}
	    return 1;
	}
	
	if(strcmp(cmd, "/startengine",true) == 0) {
        new vid = GetPlayerVehicleID(playerid);
	  	if(vid != INVALID_VEHICLE_ID) {
	  	    GetVehicleParamsEx(vid,engine,lights,alarm,doors,bonnet,boot,objective);
	  	    SetVehicleParamsEx(vid,VEHICLE_PARAMS_ON,lights,alarm,doors,bonnet,boot,objective);
		}
	    return 1;
	}
	if(strcmp(cmd, "/stopengine",true) == 0) {
        new vid = GetPlayerVehicleID(playerid);
	  	if(vid != INVALID_VEHICLE_ID) {
	  	    GetVehicleParamsEx(vid,engine,lights,alarm,doors,bonnet,boot,objective);
	  	    SetVehicleParamsEx(vid,VEHICLE_PARAMS_OFF,lights,alarm,doors,bonnet,boot,objective);
		}
	    return 1;
	}
	
	if(strcmp(cmd, "/openboot",true) == 0) {
        new vid = GetPlayerVehicleID(playerid);
	  	if(vid != INVALID_VEHICLE_ID) {
	  	    GetVehicleParamsEx(vid,engine,lights,alarm,doors,bonnet,boot,objective);
	  	    SetVehicleParamsEx(vid,engine,lights,alarm,doors,bonnet,VEHICLE_PARAMS_ON,objective);
		}
	    return 1;
	}
	if(strcmp(cmd, "/closeboot",true) == 0) {
        new vid = GetPlayerVehicleID(playerid);
	  	if(vid != INVALID_VEHICLE_ID) {
	  	    GetVehicleParamsEx(vid,engine,lights,alarm,doors,bonnet,boot,objective);
	  	    SetVehicleParamsEx(vid,engine,lights,alarm,doors,bonnet,VEHICLE_PARAMS_OFF,objective);
		}
	    return 1;
	}
	if(strcmp(cmd, "/openbonnet",true) == 0) {
        new vid = GetPlayerVehicleID(playerid);
	  	if(vid != INVALID_VEHICLE_ID) {
	  	    GetVehicleParamsEx(vid,engine,lights,alarm,doors,bonnet,boot,objective);
	  	    SetVehicleParamsEx(vid,engine,lights,alarm,doors,VEHICLE_PARAMS_ON,boot,objective);
		}
	    return 1;
	}
	if(strcmp(cmd, "/closebonnet",true) == 0) {
        new vid = GetPlayerVehicleID(playerid);
	  	if(vid != INVALID_VEHICLE_ID) {
	  	    GetVehicleParamsEx(vid,engine,lights,alarm,doors,bonnet,boot,objective);
	  	    SetVehicleParamsEx(vid,engine,lights,alarm,doors,VEHICLE_PARAMS_OFF,boot,objective);
		}
	    return 1;
	}
	if(strcmp(cmd, "/alarmon",true) == 0) {
        new vid = GetPlayerVehicleID(playerid);
	  	if(vid != INVALID_VEHICLE_ID) {
	  	    GetVehicleParamsEx(vid,engine,lights,alarm,doors,bonnet,boot,objective);
	  	    SetVehicleParamsEx(vid,engine,lights,VEHICLE_PARAMS_ON,doors,bonnet,boot,objective);
		}
	    return 1;
	}
	if(strcmp(cmd, "/alarmoff",true) == 0) {
        new vid = GetPlayerVehicleID(playerid);
	  	if(vid != INVALID_VEHICLE_ID) {
	  	    GetVehicleParamsEx(vid,engine,lights,alarm,doors,bonnet,boot,objective);
	  	    SetVehicleParamsEx(vid,engine,lights,VEHICLE_PARAMS_OFF,doors,bonnet,boot,objective);
		}
	    return 1;
	}
	if(strcmp(cmd, "/lightson",true) == 0) {
        new vid = GetPlayerVehicleID(playerid);
	  	if(vid != INVALID_VEHICLE_ID) {
	  	    GetVehicleParamsEx(vid,engine,lights,alarm,doors,bonnet,boot,objective);
	  	    SetVehicleParamsEx(vid,engine,VEHICLE_PARAMS_ON,alarm,doors,bonnet,boot,objective);
		}
	    return 1;
	}
	if(strcmp(cmd, "/lightsoff",true) == 0) {
        new vid = GetPlayerVehicleID(playerid);
	  	if(vid != INVALID_VEHICLE_ID) {
	  	    GetVehicleParamsEx(vid,engine,lights,alarm,doors,bonnet,boot,objective);
	  	    SetVehicleParamsEx(vid,engine,VEHICLE_PARAMS_OFF,alarm,doors,bonnet,boot,objective);
		}
	    return 1;
	}

	if(strcmp(cmd, "/holdobjectid",true) == 0) {
	    new tmp[256];
		tmp = strtok(cmdtext,idx);
		SetPlayerAttachedObject(playerid,0,strval(tmp),6);
		SetPlayerAttachedObject(playerid,1,strval(tmp),5);
		//SetPlayerAttachedObject(playerid, 0, 1254,2, 0.1,0.05,0,0,90,0);
	    return 1;
	}

	if(strcmp(cmd, "/removeheld",true) == 0) {
		new zz=0;
		while(zz!=MAX_PLAYER_ATTACHED_OBJECTS) {
		    if(IsPlayerAttachedObjectSlotUsed(playerid, zz)) {
		        RemovePlayerAttachedObject(playerid, zz);
			}
			zz++;
		}
	    return 1;
	}

	if(strcmp(cmd, "/attachobj",true) == 0) {
	    new tmp[256];
		tmp = strtok(cmdtext,idx);
		new obj = CreateObject(strval(tmp),0.0,0.0,0.0,0.0,0.0,0.0,200.0);
		AttachObjectToVehicle(obj,GetPlayerVehicleID(playerid),0.0,0.0,1.0,0.0,0.0,0.0);
		return 1;
	}
	
	if(strcmp(cmd, "/attachtome",true) == 0) {
	    new tmp[256];
		tmp = strtok(cmdtext,idx);
		new obj = CreateObject(strval(tmp),0.0,0.0,0.0,0.0,0.0,0.0,200.0);
		AttachObjectToPlayer(obj,playerid,0.0,0.0,2.0,0.0,0.0,0.0);
		return 1;
	}

	if(strcmp(cmd, "/mapicontest",true) == 0) {
	    new Float:X, Float:Y, Float:Z;
 		GetPlayerPos(playerid, X, Y, Z);
 		SetPlayerCheckpoint(playerid,X,Y,Z,5.0);
	   	SetPlayerMapIcon(playerid, 1, X+50.0, Y, Z, 52, 0, MAPICON_LOCAL_CHECKPOINT);
	   	SetPlayerMapIcon(playerid, 2, X+100.0, Y, Z, 53, 0, MAPICON_LOCAL_CHECKPOINT);
	   	SetPlayerMapIcon(playerid, 3, X+150.0, Y, Z, 54, 0, MAPICON_LOCAL_CHECKPOINT);
	   	SetPlayerMapIcon(playerid, 4, X+200.0, Y, Z, 55, 0, MAPICON_LOCAL_CHECKPOINT);
	   	SetPlayerMapIcon(playerid, 5, X+250.0, Y, Z, 0, 0x00FF00FF);
		return 1;
	}
	
	if(strcmp(cmd, "/mapicondel",true) == 0) {
        RemovePlayerMapIcon(playerid, 1);
        RemovePlayerMapIcon(playerid, 2);
        RemovePlayerMapIcon(playerid, 3);
        RemovePlayerMapIcon(playerid, 4);
        RemovePlayerMapIcon(playerid, 5);
     	return 1;
	}
	
	if(strcmp(cmd, "/mapicontest2",true) == 0) {
	    new Float:X, Float:Y, Float:Z;
 		GetPlayerPos(playerid, X, Y, Z);
		RemovePlayerMapIcon(playerid, 0);
		SetPlayerMapIcon(playerid, 0, X, Y, Z, 33, 0, MAPICON_GLOBAL);
		RemovePlayerMapIcon(playerid, 2);
		SetPlayerMapIcon(playerid, 2, X+100.0, Y, Z, 55, 0, MAPICON_LOCAL);
  		return 1;
	}
	
	if(strcmp(cmd, "/setweap",true) == 0) {
	    new tmp[256];
		tmp = strtok(cmdtext,idx);
		SetPlayerArmedWeapon(playerid,strval(tmp));
  		return 1;
	}

	if(strcmp(cmd, "/jetpack",true) == 0) {
	    SetPlayerSpecialAction(playerid,SPECIAL_ACTION_USEJETPACK);
		return 1;
	}
	
	if(strcmp(cmd, "/crobj",true) == 0) {
	    new Float:X, Float:Y, Float:Z;
	   	new tmp[256];
 		GetPlayerPos(playerid, X, Y, Z);
 		tmp = strtok(cmdtext,idx);
		new obj = CreateObject(strval(tmp),X+1.0,Y+1.0,Z+0.5,0.0,0.0,0.0,200.0);
		return 1;
	}

	return 0;
}

//-------------------------------------------
// Sends a list of all PVars to the player as
// client messages.

SendPVarListToPlayer(playerid)
{
    new ubound = GetPVarsUpperIndex(playerid);
	new x=0;
	new name[40+1];
	new line[128+1];
	
    SendClientMessage(playerid,0xF000F0F0, "---Player Vars List---");
	while(x != ubound) {
		if(GetPVarNameAtIndex(playerid,x,name,40)) {
			if(Util_GetPVarEntryAsString(playerid,name,line,128)) {
                 SendClientMessage(playerid,0xFFFFFFFF,line);
			}
		}
		x++;
	}
}

//-------------------------------------------
// return PVar entry as 'name'='value' string

stock Util_GetPVarEntryAsString(playerid, name[], ret[], len)
{
	new Float:fValue;
	new iValue;
	new szStrValue[1024+1]; // this might require greater size if you store large strings in PVars
	new type;
    ret[0] = EOS;
    
  	type = GetPVarType(playerid, name);
	if(type != PLAYER_VARTYPE_NONE) {
		switch(type)
		{
			case PLAYER_VARTYPE_STRING:
			{
				GetPVarString(playerid,name,szStrValue,1024);
				format(ret,len,"%s=%s",name,szStrValue);
			}
			case PLAYER_VARTYPE_INT:
			{
				iValue = GetPVarInt(playerid,name);
				format(ret,len,"%s=%d",name,iValue);
			}
			case PLAYER_VARTYPE_FLOAT:
			{
			    fValue = GetPVarFloat(playerid,name);
				format(ret,len,"%s=%f",name,fValue);
			}
		}
		return 1;
	}
	return 0;
}

//-------------------------------------------
// Fills the provided string with all the player's PVars
// seperated by the specified 'delimiter'

stock Util_CreatePVarList(playerid, retstr[], len, delimiter[])
{
	if(!IsPlayerConnected(playerid)) return 0;
	
	new x=0;
	new remaining_string=len;
	new line[2048+1];
	new name[40+1];
	retstr[0] = EOS;

	new ubound = GetPVarsUpperIndex(playerid);
	
	while(x != ubound) {
		if(GetPVarNameAtIndex(playerid,x,name,40)) {
			if(Util_GetPVarEntryAsString(playerid,name,line,2048)) {
				// if there is enough space, concat this line to the return string
				if(remaining_string > (strlen(line) + strlen(delimiter))) {
			    	strcat(retstr,line);
			    	strcat(retstr,delimiter);
					remaining_string -= (strlen(line) + strlen(delimiter));
				}
			}
		}
		x++;
	}
	
	return 1;
}

//-------------------------------------------
// Test reapplying vehicle mods on respawn

public OnVehicleSpawn(vehicleid)
{
	if(vehicleid == savanna) {
	    AddVehicleComponent(savanna,1189); //Front Bumper
		AddVehicleComponent(savanna,1187); //Rear Bumper
		AddVehicleComponent(savanna,1129); //Exhaust
		AddVehicleComponent(savanna,1102); //Left Side Skirt
		AddVehicleComponent(savanna,1133); //Right Side Skirt
		AddVehicleComponent(savanna,1078); //Wheels
		AddVehicleComponent(savanna,1010); //Nitro 10x
		AddVehicleComponent(savanna,1087); //Hydraulics
	}
	else if(vehicleid == blade) {
	    AddVehicleComponent(blade,1182); //Front Bumper
		AddVehicleComponent(blade,1184); //Rear Bumper
		AddVehicleComponent(blade,1104); //Exhaust
		AddVehicleComponent(blade,1108); //Left Side Skirt
		AddVehicleComponent(blade,1107); //Right Side Skirt
		AddVehicleComponent(blade,1078); //Wheels
		AddVehicleComponent(blade,1010); //Nitro 10x
		AddVehicleComponent(blade,1087); //Hydraulics
	}
}

//-------------------------------------------
// Example of handling dialog responses.

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    if(!IsPlayerAdmin(playerid)) return 0; // this is an admin only script
    
	if(dialogid == 0) { // Our example msgbox
		if(response) {
		    SendClientMessage(playerid,0xFFFFFFFF,"You selected OK");
		} else {
		    SendClientMessage(playerid,0xFFFFFFFF,"You selected Cancel");
		}
		return 1; // we processed this. no need for other filterscripts to process it.
	}
	
	if(dialogid == 1) { // Our example inputbox
		if(response) {
			new message[256+1];
			format(message, 256, "You replied: %s", inputtext);
		    SendClientMessage(playerid, 0xFFFFFFFF, message);
		} else {
		    SendClientMessage(playerid, 0xFFFFFFFF, "You selected Cancel");
		}
		return 1; // we processed it.
	}
	
	if(dialogid == 2) { // Our example listbox
		if(response) {
			new message[256+1];
			if(listitem != 5) {
				format(message, 256, "You selected item %d:", listitem);
		    	SendClientMessage(playerid, 0xFFFFFFFF, message);
		    	SendClientMessage(playerid, 0xFFFFFFFF, inputtext);
			} else {
			    SendClientMessage(playerid, 0x5555FFFF, "A Lorikeet is NOT a weapon!");
			}
		} else {
		    SendClientMessage(playerid, 0xFFFFFFFF, "You selected Cancel");
		}
		return 1; // we processed it.
	}
	
	return 0; // we didn't handle anything.
}

//-------------------------------------------
// Example of handling scoreboard click.

public OnPlayerClickPlayer(playerid, clickedplayerid, source)
{
	if(!IsPlayerAdmin(playerid)) return 0; // this is an admin only script
	
    new message[256+1];
	format(message, 256, "You clicked on player %d", clickedplayerid);
	SendClientMessage(playerid, 0xFFFFFFFF, message);
	return 1;
}

//-------------------------------------------
/*
public OnEnterExitModShop(playerid, enterexit, interiorid)
{
    new message[256+1];
    if(enterexit) {
		format(message, 256, "You entered modshop at interior %d", interiorid);
		SendClientMessage(playerid, 0xFFFFFFFF, message);
	} else {
	   	format(message, 256, "You exited the modshop");
		SendClientMessage(playerid, 0xFFFFFFFF, message);
	}
	return 1;
}
*/
//-------------------------------------------

public OnVehicleDamageStatusUpdate(vehicleid, playerid)
{
	new panel, doors, lights, tires;
	new update_msg[128+1];
	
	if(!IsPlayerAdmin(playerid)) return 0;
	
	GetVehicleDamageStatus(vehicleid,panel,doors,lights,tires);
	format(update_msg,128,"VehicleDamage[ID:%d PN:0x%x DR:0x%x LT:0x%x TR:0x%x]",vehicleid,panel,doors,lights,tires);
	SendClientMessage(playerid,0xFFFFFFFF,update_msg);
	
	return 1;
}

//-------------------------------------------

stock Float:AngleBetweenPoints(Float:fX1, Float:fY1, Float:fX2, Float:fY2)
{
	new Float:angle = atan2(fY1 - fY2, fX1 - fX2) * 180.0 / 3.14;
	return angle;
}

//-------------------------------------------
