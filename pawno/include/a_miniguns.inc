/*
This Include was made by ME, TheShadow from Germany.
You haven't scripted this, so don't:
- claim it as your own
- remove my credits 
- rerelease this include
- eat my pizza >:D

What is this Include for?:
- You can create mounted Miniguns
- They shoot at everyone who's in their range
- Useful to defend admin areas for example
*/





#include <a_samp>

#define MAX_MINIGUNS 100
#define TIMERDELAY 500 // MILLISECONDS !!!! 500 = half a second


/// --------------------------------------------------------------------------------------------------------------------------------
/// IF IT'S DEFINED YOU'LL SEE INFORMATIONS ABOUT THE SPRING GUNS WHEN YOU START SERVER YOUR AND WHEN YOU ARE IN RANGE OF ONE!!! ///
//#define DEBUG
/// --------------------------------------------------------------------------------------------------------------------------------

/*
native CreateMinigun(Float:x,Float:y,Float:z,Float:rotation,firerange,damage,bool:activated);
native DestroyMinigun(minigunid);
native GetMinigunPosition(minigunid,&Float:x,&Float:y,&Float:z);
native IsMinigunActive(minigunid);
native SetMinigunActive(minigunid,bool:activated);
native IsValidMinigun(minigunid);
native SaveMinigunDataToLog(minigunid,comment[])
*/

enum mInfo
{
	Object,
	Float:Xpos,
	Float:Ypos,
	Float:Zpos,
	Float:Rot,
	Float:Range,
	Damage,
	Activated,
	Created
};

new MinigunData[MAX_MINIGUNS][mInfo];
new MINIGUNS = 0;

forward OnMinigunInit();
forward OnMinigunExit();
forward MinigunCheck();
forward SaveMinigunDataToLog(minigunid,comment[]);

public OnMinigunInit()
{
SetTimer("MinigunCheck",TIMERDELAY,1);
return 1;
}
public OnMinigunExit()
{
for(new i=0;i<MAX_MINIGUNS;i++){
MinigunData[i][Object] = INVALID_OBJECT_ID;
MinigunData[i][Xpos]=0.0;
MinigunData[i][Ypos]=0.0;
MinigunData[i][Zpos]=0.0;
MinigunData[i][Rot]=0.0;
MinigunData[i][Range] =0.0;
MinigunData[i][Damage] = 0;
MinigunData[i][Activated] = false;
MinigunData[i][Created] = false;
MINIGUNS = 0;
}
return 1;
}



public MinigunCheck()
{
for(new i = 0; i < MAX_PLAYERS; i++)
{
for(new j = 0; j < MINIGUNS; j++)
{

if(IsPlayerInRangeOfPoint(i,MinigunData[j][Range],MinigunData[j][Xpos],MinigunData[j][Ypos],MinigunData[j][Zpos]))
{
	#if defined DEBUG
	new string[128];
	format(string,sizeof(string),"Minigun-DEBUG: ~n~ID: ~r~%d ~w~~n~X: ~r~%.4f~w~~n~ Y: ~r~%.4f ~w~~n~Z: ~r~%.4f ~w~~n~DMG: ~r~%d  ~w~RANGE: ~r~%.4f",j,MinigunData[j][Xpos],MinigunData[j][Ypos],MinigunData[j][Zpos],MinigunData[j][Damage],MinigunData[j][Range]);
	GameTextForPlayer(i,string,TIMERDELAY+100,5);
	#endif



	if(!IsPlayerAdmin(i) && MinigunData[j][Activated]){
		new Float:angle, Float:px, Float:py;
		GetPlayerPos(i,px,py,angle); // i know angle isn't right there but so i don't need a pz variable
		GetAngle(px,py,MinigunData[j][Xpos],MinigunData[j][Ypos],angle);
		SetObjectRot(MinigunData[j][Object],0.0,0.0,angle+90.0);
		MinigunData[j][Rot] = angle + 90.0;
		new Float:armour, Float:newarmour;
		GetPlayerArmour(i,armour);
		if(armour > 0){
			newarmour = armour - MinigunData[j][Damage];
			SetPlayerArmour(i,newarmour);		
		}
		else {
		
			new Float:health,Float:newhealth;
			GetPlayerHealth(i,health);
			newhealth = health - MinigunData[j][Damage];
			SetPlayerHealth(i,newhealth);
		}
	}
}
}
}
return 1;
}





stock CreateMinigun(Float:x,Float:y,Float:z,Float:rotation,firerange,damage,bool:activated)
{
for(new i=0;i<MAX_MINIGUNS;i++){
if(!MinigunData[i][Created]){
	MinigunData[i][Xpos] = x;
	MinigunData[i][Ypos] = y;
	MinigunData[i][Zpos] = z;
	MinigunData[i][Rot] = rotation;
	MinigunData[i][Range] = firerange;
	MinigunData[i][Damage] = damage;
	MinigunData[i][Activated] = activated;
	MinigunData[i][Object] = CreateObject(2985,x,y,z,0.0,0.0,rotation);
	MinigunData[i][Created] = true;
	#if defined DEBUG
	printf("Minigun created - ID: %d - X: %.4f - Y: %.4f - Z: %.4f", i, x,y,z);
	#endif
	MINIGUNS++;
	return i;
}//end of if
}//end of loop
return -1;
}//end of stock

stock GetAngle(Float:X, Float:Y, Float:CurrentX, Float:CurrentY, &Float:Angle)
{
    Angle = atan2(Y-CurrentY, X-CurrentX);
    Angle = floatsub(Angle, 90.0);
    if(Angle < 0.0){
	Angle = floatadd(Angle, 360.0);
	}
}

stock DestroyMinigun(minigunid)
{
if(IsValidMinigun(minigunid)){
	#if defined DEBUG
	printf("Minigun destroyed - ID: %d - X: %.4f - Y: %.4f - Z: %.4f", i, x,y,z);
	#endif
	DestroyObject(MinigunData[minigunid][Object]); 
	MinigunData[minigunid][Object] = INVALID_OBJECT_ID;
	MinigunData[minigunid][Xpos]=0.0;
	MinigunData[minigunid][Ypos]=0.0;
	MinigunData[minigunid][Zpos]=0.0;
	MinigunData[minigunid][Rot]=0.0;
	MinigunData[minigunid][Range] =0.0;
	MinigunData[minigunid][Damage] = 0;
	MinigunData[minigunid][Activated] = false;
	MinigunData[minigunid][Created] = false;
	MINIGUNS = MINIGUNS - 1;
}
}

stock GetMinigunPosition(minigunid,&Float:x,&Float:y,&Float:z)
{
x = MinigunData[minigunid][Xpos];
y = MinigunData[minigunid][Ypos];
z = MinigunData[minigunid][Zpos];
}

stock IsMinigunActive(minigunid){
return MinigunData[minigunid][Activated];
}


stock SetMinigunActive(minigunid,bool:activated){
if(IsValidMinigun(minigunid) MinigunData[minigunid][Activated] = activated;
}

stock IsValidMinigun(minigunid)
{
if(MinigunData[minigunid][Created]) return true;
return false;
}

public SaveMinigunDataToLog(minigunid,comment[])
{
	new entry[256];
	format(entry, sizeof(entry), "CreateMinigun(%.4f,%.4f,%.4f,%.4f,%.4f,%d,%d);// %s\r\n",MinigunData[minigunid][Xpos],MinigunData[minigunid][Ypos],MinigunData[minigunid][Zpos],MinigunData[minigunid][Rot],MinigunData[minigunid][Range],MinigunData[minigunid][Damage],MinigunData[minigunid][Activated], comment);
	new File:hFile;
	hFile = fopen("miniguns.txt", io_append);
	if (hFile)
	{
	fwrite(hFile, entry);
	fclose(hFile);
	}
		
}

