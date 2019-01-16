#if defined esecurity
	#endinput
#endif
#define esecurity
#define MAX_ICPS 500
/*
	native CreateICp(Float:x,Float:y,Float:z,Float:siz);
	native IsValidICp(icp);
	native DestroyICp(icpid);
	native PosChecker(playerid);
	native ToggleICpsForPlayer(playerid,itoggle);
	native ToggleICpsForAll(playerid,itoggle);
	native IsInICp(pid);
	native GetPlayerICp(pid);
	native IsPlayerInICp(pid,icpid);
	native IsPlayerInAnyICp(playerid);
*/
forward OnPlayerEnterInvisibleCP(playerid,icpid);
forward OnPlayerLeaveInvisibleCP(playerid,icpid);
new Float:MainVar[500][4],act[MAX_PLAYERS], picp[MAX_PLAYERS] = -1, cps = 1;
stock CreateICp(Float:x,Float:y,Float:z,Float:siz)
{
	new icpid = GetFreeICpSlot();
	if(icpid == -1 || icpid > cps) return -1;
	MainVar[icpid][0] = x;
	MainVar[icpid][1] = y;
	MainVar[icpid][2] = z;
	MainVar[icpid][3] = siz;
	cps ++;
	return icpid;
}
stock IsValidICp(icp)
{
	for(new o = 0; o < 4; o++) if(MainVar[icp][o] == 0) return false;
	return true;
}
stock GetFreeICpSlot()
{
	for(new o = 1, i = MAX_ICPS; o < i; o++) if(!IsValidICp(o)) return o;
	return -1;
}
stock ToggleICpsForAll(bool: itoggle)
{
	for(new o = 0; o < GetMaxPlayers(); o++) ToggleICpsForPlayer(o,itoggle);
	return 1;
}
forward PosChecker(playerid);
public PosChecker(playerid)
{
    new Float:X, Float:Y, Float:Z;
    if(!act[playerid]) return -1;
    GetPlayerPos( playerid, X, Y, Z );
	if(X == 0.0 && Y == 0.0 && Z == 0.0) return -1;
	for(new e = 0; e < cps; e++)
	{
		if(IsValidICp(e) && IsPlayerInRangeOfPoint(playerid,MainVar[e][3],MainVar[e][0],MainVar[e][1],MainVar[e][2]))
		{
			if(picp[playerid] == -1)
			{
				picp[playerid] = e;
				OnPlayerEnterInvisibleCP(playerid,e);
			}
			return 1;
		}
	}
	if(picp[playerid] != -1)
	{
		OnPlayerLeaveInvisibleCP(playerid,picp[playerid]);
		picp[playerid] = -1;
	}
	return 1;
}
stock IsPlayerInAnyICp(playerid) return IsValidICp(picp[playerid]);
stock DestroyICp(icpid) return MainVar[icpid][0] = 0, 1;
stock GetPlayerICp(pid) return picp[pid];
stock IsPlayerInICp(pid,icpid)	if(picp[pid] == icpid) return true; else return false;
stock ToggleICpsForPlayer(playerid,bool: itoggle)
{
	KillTimer(act[playerid]);
	if(itoggle) act[playerid] = SetTimerEx("PosChecker",500,1,"%i",playerid);
	return picp[playerid] = -1;
}
forward ICPM_OnPlayerConnect(playerid);
public OnPlayerConnect(playerid)
{
    ToggleICpsForPlayer(playerid,true);
	ICPM_OnPlayerConnect(playerid);
	return 1;
}
forward ICPM_OnPlayerDisconnect(playerid, reason);
public OnPlayerDisconnect(playerid, reason)
{
    ToggleICpsForPlayer(playerid,false);
	return ICPM_OnPlayerDisconnect(playerid, reason);
}
#define OnPlayerDisconnect ICPM_OnPlayerDisconnect
#define OnPlayerConnect ICPM_OnPlayerConnect