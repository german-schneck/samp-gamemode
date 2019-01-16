/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       ~~~ Retrylon's new Funktion's Include ~~~~
       ~~~ NEW 35 Functions ! ~~~
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    ~ Description: ~

    Mit dieser Include, habt Ihr neue Funktionen im Spiel, für euer Scripterisches wissen.
    D.h.: Callbacks und andere Funktionen werden abgekürtzt, damit Sie für euch leichter

sind.
    O.u.a.: Neue funktionen erstellt werden.


   ~~ VERSION 6.0 RELEASED ~~

*/
/**********************/
/* BEGIN MIT DENN NATIVE'S */
/**********************/

#include <a_samp>

#define MAX_STRING 255

new afk[MAX_PLAYERS];
new VehicleClass[MAX_PLAYERS];
new VehicleNames[MAX_PLAYERS];

/*
native SetHealthForAll(Float:health);
native SetArmourForAll(Float:armour);
native ExplodeMe(playerid);
native ExplodeAll();
native AdminExplodeAll(userid);
native CreateJetpack(playerid);
native CreateJetpackforAll();
native SetScoreForAll(score);
native PlayerSoundForAll(soundid);
native ClearAnimationsAll();
native FreezePlayer(playerid);
native UnfreezePlayer(playerid);
native FUAll(bool:toggle);
native SetPlayerVehiclePos(playerid,Float:y,Float:x,Float:z,Float:vy,Float:vx,Float:vz);
native GiveAllMoney(money);
native ResetAllMoney(money);
native FullPlayerPower(playerid);
native KillPlayer(playerid);
native KillAllPlayers();
native FallPlayer();
native ForcePlayer(playerid);
native ForceAllPlayers();
native IsAfkPlayer(playerid);
native IsBackPlayer(playerid);
native FallAllPlayers();
native ClearText(playerid);
native ClearTextForAll();
native Text(playerid,const str[]);
native SendRedText(playerid, const str[]);
native SendWhiteText(playerid, const str[]);
native SendGreenText(playerid, const str[]);
native SendCyanText(playerid, const str[]);
native SendAdminText(playerid, const str[]);
native GameText(playerid,const str[],time,style);
native GameTextAll(const str[],time,style);
native GetVehicleName(vehicleid);
native SetAllAmmo(weaponslot,ammo);
native SetAllSkin(skinid);
native GiveAllWeapon(weaponid,ammo);
native PutAllInVehicle(vehicleid,seatid);
native SetAllWantedLevel(level);
native ResetAllWantedLevel(level);
native SetAllWeather(weather);
native ClockEnable();
native ClockDisable();
native SetAllTime(hour,minute);
native SetAllNames(const str[]);
native SetAllTeam(teamid);
native UnlockAllCars();
native LockAllCars();
native SpawnAllPlayers();
native SetAllInterior(interiorid);
native SetAllPos(Float:x,Float:y,Float:z);
native SetAllFacingAngle(Float:ang);
native SetAllColor(color);
native SetAllWorld(worldid);
native DestroyAllPickups();
native DestroyAllVehicles();
native SetPlayerGravity(playerid,Float:gravity);
native IsAllAdmin();
native LinkAllVehiclesToInterior(interiorid);
native SetAllVehicleHealth(Float:health);
*/

/**********************/
/* BEGINN MIT DENN STOCK'S */
/*********************/

stock SetHealthForAll(Float:health){
     for(new i; i<MAX_PLAYERS; i++)
	{
	if(IsPlayerConnected(i))
		{
		new Float:health;
		SetPlayerHealth(i,Float:health);
		}
	}
}


stock SetArmourForAll(Float:armour){
     for(new i; i<MAX_PLAYERS; i++)
	{
	if(IsPlayerConnected(i))
		{
		new Float:armour;
		SetPlayerArmour(i,Float:armour);
		}
	}
}

stock ExplodeMe(playerid){
	if(IsPlayerConnected(playerid))
	{
		new Float:boomY,Float:boomX,Float:boomZ;
		GetPlayerPos(playerid,Float:boomY,Float:boomX,Float:boomZ);
		CreateExplosion(playerid,Float:boomY,Float:boomX,Float:boomZ,10.0);
	}
}

stock ExplodeAll(){
 for(new i; i <MAX_PLAYERS; i++)
	{
	if(IsPlayerConnected(i))
		{
		new Float:boomY,Float:boomX,Float:boomZ;
		new Boom = 10.0;
		GetPlayerPos(i,Float:boomY,Float:boomX,Float:boomZ);
		CreateExplosion(i,Float:boomY,Float:boomX,Float:boomZ,Boom);
		}
	}
}

stock AdminExplodeAll(userid) {
    if (IsPlayerAdmin(userid)) { // Ist der Spieler 'userid' Administrator?
        for (new i = 0 ; i < MAX_PLAYERS ; i++) {
            new Float:boomY,Float:boomX,Float:boomZ;
            new Boom = 10.0;
            GetPlayerPos(i,Float:boomY,Float:boomX,Float:boomZ);
            CreateExplosion(i,Float:boomY,Float:boomX,Float:boomZ,Boom);
        }
        return true;
    }
    return false;
}


stock CreateJetpack(playerid){
if(IsPlayerConnected(playerid))
{
new Float:y,Float:x,Float:z;
GetPlayerPos(playerid,Float:y,Float:x,Float:z);
CreatePickup(307,2,Float:y,Float:x,Float:z);
}
}


stock CreateJetpackForAll(){
for (new i; i<MAX_PLAYERS; i++)
{
if(IsPlayerConnected(i))
{
new Float:y,Float:x,Float:z;
GetPlayerPos(i,Float:y,Float:x,Float:z);
CreatePickup(307,2,Float:y,Float:x,Float:z);
}
}
}

stock SetScoreForAll(score){
 for (new i; i <MAX_PLAYERS; i++)
	{
	if(IsPlayerConnected(i))
		{
		new score;
		SetPlayerScore(i,score);
		}
 	}
}

stock PlayerSoundForAll(soundid){
 for (new i; i <MAX_PLAYERS; i++)
	{
	if(IsPlayerConnected(i))
		{
		new Float:SoundY,Float:SoundX,Float:SoundZ;
		new soundid;
		PlayerPlaySound(i,soundid,Float:SoundY,Float:SoundX,Float:SoundZ);
		}
	}
}

stock ClearAnimationsAll() {
  for (new i; i <MAX_PLAYERS; i++)
	{
	if(IsPlayerConnected(i))
		{
		ClearAnimations(i);
		}
	}
}

stock FreezePlayer(playerid){
if(IsPlayerConnected(playerid))
	{
	TogglePlayerControllable(playerid,1);
	}
}

stock UnfreezePlayer(playerid){
if(IsPlayerConnected(playerid))
	{
	TogglePlayerControllable(playerid,0);
	}
}

stock FUAll(bool:toggle){
for (new i; i <MAX_PLAYERS; i++)
	{
	if(IsPlayerConnected(i))
		{
		new bool:toggle;
		TogglePlayerControllable(i,toggle);
		}
	}
}

stock SetPlayerVehiclePos(playerid,Float:y,Float:x,Float:z,Float:vy,Float:vx,Float:vz){
if(IsPlayerConnected(playerid))
	{
	new Float:y,Float:x,Float:z;
	new Float:vy,Float:vx,Float:vz;
	SetPlayerPos(playerid,Float:y,Float:x,Float:z);
	GetPlayerPos(playerid,Float:y,Float:x,Float:z);
	}
	if(IsPlayerInAnyVehicle(playerid))
	{
	SetVehiclePos(GetPlayerVehicleID(playerid),Float:vy,Float:vx,Float:vz);
	GetVehiclePos(GetPlayerVehicleID(playerid),Float:vy,Float:vx,Float:vz);
	}
	if(!IsPlayerInAnyVehicle(playerid))
	{
	SetVehiclePos(GetPlayerVehicleID(playerid),Float:vy,Float:vx,Float:vz);
	GetVehiclePos(GetPlayerVehicleID(playerid),Float:vy,Float:vx,Float:vz);
	}
}




stock GiveAllMoney(money) {
for (new i; i <MAX_PLAYERS; i++)
	{
	if(IsPlayerConnected(i))
		{
		new money;
		GivePlayerMoney(i,money);
		}
	}
}

stock ResetAllMoney(money) {
for (new i; i <MAX_PLAYERS; i++)
	{
	if(IsPlayerConnected(i))
		{
		new money;
		GivePlayerMoney(i,-money);
		}
	}
}

stock FullPlayerPower(playerid) {
if(IsPlayerConnected(playerid))
	 {
	new weapon = 22,100;
	SetPlayerHealth(playerid,100);
	SetPlayerArmour(playerid,100);
	GivePlayerWeapon(playerid,weapon);
	}
}

stock KillPlayer(playerid){
if(IsPlayerConnected(playerid))
	{
	SetPlayerHealth(playerid,0.0);
	}
}

stock KillAllPlayers()
{
 for (new i; i <MAX_PLAYERS; i++)
	{
	if(IsPlayerConnected(i))
		{
		SetPlayerHealth(i,0.0);
		}
	}
}

stock FallPlayer(playerid){
	if(IsPlayerConnected(playerid))
		{
		new Float:x,Float:y,Float:z;
		SetPlayerPos(playerid,Float:x,Float:y,Float:z+500);
		GetPlayerPos(playerid,Float:x,Float:y,Float:z);
		//Fallschirm ID könnt Ihr selber machen!
		}
}

stock ForcePlayer(playerid) {
if(IsPlayerConnected(playerid))
	{
	ForcePlayerClassSelection(playerid);
	}
}

stock ForcePlayerAll() {
 for (new i; i <MAX_PLAYERS; i++) {
	if(IsPlayerConnected(i))
		{
		ForcePlayerClassSelection(i);
		}
	}
}

stock IsAfkPlayer(playerid){
for (new i = 0; i <MAX_PLAYERS; i++)
	{
	if(IsPlayerConnected(i))
		{
		if(afk[playerid] == 1)
		{
		TogglePlayerControllable(i,1);
		}
		else if(afk[playerid] == 0)
		{
		TogglePlayerControllable(i,1);
		}
	       }
 	}
}

stock IsBackPlayer(playerid){
for (new i = 0; i <MAX_PLAYERS; i++)
	{
	if(IsPlayerConnected(i))
		{
		if(afk[playerid] == 1)
		{
		TogglePlayerControllable(i,0);
		}
		else if(afk[playerid] == 0)
		{
		TogglePlayerControllable(i,0);
		}
	       }
 	}
}

stock Text(playerid,const str[]){
if(IsPlayerConnected(playerid))
	{
	new tmp[256];
	format(tmp, sizeof(tmp), str, 0);
	SendClientMessage(playerid, 0x6495EDAA, tmp);
	}
}

stock SendRedText(playerid, const str[]){
if(IsPlayerConnected(playerid))
	{
	new tmp[256];
	format(tmp,sizeof(tmp), str,0);
	SendClientMessage(playerid, 0xFF0000AA,tmp);
	}
}

stock SendAdminText(playerid, const str[]) {
if(IsPlayerConnected(playerid))
	{
	new tmp[256];
	format(tmp, sizeof(tmp), str, 0);
	for (new i; i < MAX_PLAYERS; i++)
	{
	if (IsPlayerConnected(i) && IsPlayerAdmin(i))
	{
	SendClientMessage(i, 0xFF4500AA, tmp);
	}
	}
}
}

stock SendWhiteText(playerid, const str[]) {
if(IsPlayerConnected(playerid)) {
	new tmp[256];
	format(tmp,sizeof(tmp),str,0);
	SendClientMessage(playerid,0xFFFFFFAA,tmp);
	}
}

stock SendCyanText(playerid, const str[]) {
if (IsPlayerConnected(playerid)) {
	new tmp[256];
	format(tmp,sizeof(tmp),str,0);
	SendClientMessage(playerid,0x99FFFFAA,tmp);
	}
}

stock SendGreenText(playerid, const str[]) {
if (IsPlayerConnected(playerid)) {
	new tmp[256];
	format(tmp,sizeof(tmp),str,0);
	SendClientMessage(playerid,0x33AA33AA,tmp);
	}
}

stock GameText(playerid, const str[], time, style)
{
if (IsPlayerConnected(playerid))
	{
	new tmp[256];
	format(tmp,sizeof(tmp),str,0);
	GameTextForPlayer(playerid,tmp,time,style);
	}
}

stock GameTextAll(const str[], time, style) {
for(new i; i <MAX_PLAYERS; i++)
	{
	if(IsPlayerConnected(i))
	{
	new tmp[256];
	format(tmp,sizeof(tmp),str,0);
	GameTextForPlayer(i,tmp,time,style);
	}
}
}


stock FallAllPlayers(){
for (new i; i <MAX_PLAYERS; i++) {
	if(IsPlayerConnected(i))
		{
		new Float:x,Float:y,Float:z;
		SetPlayerPos(i,Float:x,Float:y,Float:z+500);
		GetPlayerPos(i,Float:x,Float:y,Float:z);
		//Fallschirm ID könnt Ihr selber machen!
		}
	}
}

stock ClearText(playerid) {
for (new c = 1; c<=10; c++)
	{
	SendClientMessage(playerid,0xFFFFFFFF,"\n");
	}
}

stock ClearTextForAll() {
for (new c = 1; c<=10; c++)
{
for (new i; i <MAX_PLAYERS; i++)
       {
if(IsPlayerConnected(i))
 	{
	SendClientMessage(i,0xFFFFFFFF,"\n");
  	}
      }
  }
}

stock GetVehicleName(vehicleid)
{
	new vid, name[MAX_STRING];
	vid = VehicleClass[vehicleid];
	format(name, sizeof(name), "%s", VehicleNames[vid]);
	return name;
}

stock SetAllAmmo(weaponslot,ammo) {
for (new i; i <MAX_PLAYERS; i++)
	{
	if(IsPlayerConnected(i))
		{
		SetPlayerAmmo(i,weaponslot,ammo);
		}
	}
}

stock SetAllSkin(skinid) {
for (new i; i <MAX_PLAYERS; i++)
	{
	if(IsPlayerConnected(i))
		{
		SetPlayerSkin(i,skinid);
		}
	}
}

stock GiveAllWeapon(weaponid,ammo) {
for (new i; i <MAX_PLAYERS; i++) {
	if(IsPlayerConnected(i))
	{
	GivePlayerWeapon(i,weaponid,ammo);
	}
       }
}

stock PutAllInVehicle(vehicleid,seatid) {
for (new i; i <MAX_PLAYERS; i++)
	{
	if(IsPlayerConnected(i))
		{
		PutPlayerInVehicle(i,vehicleid,seatid);
		}
	}
}

stock SetAllWantedLevel(level) {
for (new i; i <MAX_PLAYERS; i++)
	{
	if(IsPlayerConnected(i))
		{
		SetPlayerWantedLevel(i,level);
		}
	}
}

stock ResetAllWantedLevel(level) {
for (new i; i <MAX_PLAYERS; i++)
	{
	if(IsPlayerConnected(i))
		{
		SetPlayerWantedLevel(i,-level);
		}
	}
}

stock SetAllWeather(weather) {
for (new a; a <MAX_PLAYERS; a++)
	{
	if(IsPlayerConnected(a))
		{
		SetPlayerWeather(a,weather);
		}
	}
}

stock ClockEnable() {
for (new c; c <MAX_PLAYERS; c++) {
	if(IsPlayerConnected(c))
		{
		TogglePlayerClock(c,true);
		}
	}
}

stock ClockDisable() {
for (new c; c <MAX_PLAYERS; c++) {
	if(IsPlayerConnected(c))
		{
		TogglePlayerClock(c,false);
		}
	}
}

stock SetAllTime(hour,minute)
{
for (new i; i <MAX_PLAYERS; i++)
	{
	if(IsPlayerConnected(i))
		{
		SetPlayerTime(i,hour,minute);
		}
	}
}

stock SetAllNames(const str[]){
for (new n; n <MAX_PLAYERS; n++)
	{
	if(IsPlayerConnected(n))
		{
		new tmp[256];
		format(tmp,sizeof(tmp),str,0);
		SetPlayerName(n,tmp);
		}
	}
}

stock SetAllTeam(teamid) {
for (new i; i <MAX_PLAYERS; i++)
	{
if(IsPlayerConnected(i))
	{
	SetPlayerTeam(i,teamid);
	}
      }
}

stock UnlockAllCars()
{
for (new i; i < MAX_PLAYERS; i++)
	{
	for (new c; c < 250; c++)
		{
		SetVehicleParamsForPlayer(c,i,0,0);
		}
	}
}

stock LockAllCars()
{
for (new i; i < MAX_PLAYERS; i++)
	{
	for (new c; c < 250; c++)
		{
		SetVehicleParamsForPlayer(c,i,1,1);
		}
	}
}

stock SpawnAllPlayers() {
for (new i; i <MAX_PLAYERS; i++)
	{
	if(IsPlayerConnected(i))
		{
		SpawnPlayer(i);
		}
	}
}

stock SetAllInterior(interiorid) {
 for (new n; n <MAX_PLAYERS; n++)
	{
	if(IsPlayerConnected(n))
		{
		SetPlayerInterior(i,interiorid);
		}
	}
}

stock SetAllPos(Float:x,Float:y,Float:z) {
	for (new i; i <MAX_PLAYERS; i++)
		{
		if(IsPlayerConnected(i))
			{
			SetPlayerPos(i,Float:x,Float:y,Float:z);
			}
		}
}

stock SetAllFacingAngle(Float:ang)
{
 for (new i; i <MAX_PLAYERS; i++)
	{
	if(IsPlayerConnected(i))
		{
		SetPlayerFacingAngle(i,Float:ang);
		}
	}
}

stock SetAllColor(color) {
for (new c; c<MAX_PLAYERS; c++)
	{
	if(IsPlayerConnected(c))
		{
		SetPlayerColor(c,color);
		 }
	}
}

stock SetAllWorld(worldid)
{
for (new i; i <MAX_PLAYERS; i++)
	{
	if(IsPlayerConnected(i))
		{
		SetPlayerVirtualWorld(i,worldid);
		}
	}
}

stock DestroyAllPickups() {
for (new pickup; pickup <MAX_PLAYERS; pickup++)
	{
	if(IsPlayerConnected(pickup))
		{
		DestroyPickup(pickup);
		}
	}
}

stock SetPlayerGravity(playerid,Float:gravity) {
for (new g = playerid; g <MAX_PLAYERS; g++)
	{
	if(IsPlayerConnected(g))
		{
		playerid = SetGravity(Float:gravity);
		}
	}
}

stock IsAllAdmin() {
for (new admin; admin <MAX_PLAYERS; admin++)
	{
	if(IsPlayerConnected(admin))	
		{
		IsPlayerAdmin(admin);
		}
	}
}

stock DestroyAllVehicles() {
for (new i; i <MAX_PLAYERS; i++)
	{
	if(IsPlayerConnected(i))
		{
		DestroyVehicle(i);
		}
	}
}

stock LinkAllVehiclesToInterior(interiorid) {
for (new i; i <MAX_VEHICLES; i++)
	{
	if(IsPlayerConnected(i))
		{
		LinkVehicleToInterior(i,interiorid);
		}
	}
}

stock SetAllVehicleHealth(Float:health) {
for (new i; i <MAX_PLAYERS; i++)
	{
	if(IsPlayerConnected(i))
		{
		SetVehicleHealth(GetPlayerVehicleID(i),Float:health);
		}
	}
}