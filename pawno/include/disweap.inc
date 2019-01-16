/*
									Deshabilitar armas by alvaro
*/
/*x---------------------------------Important-------------------------------------x*/
//**INCLUDES**//
#include <a_samp>
/*x---------------------------------Defining-------------------------------------x*/
//**VARIABLES**//
new g_disabledweapons[47];
new p_disabledweapons[MAX_PLAYERS][47];
/*x---------------------------------CallBacks-------------------------------------x*/
public OnPlayerUpdate(playerid)
{
	for(new w; w < 47; w++)
	{
		if ((GetPlayerWeapon(playerid) == g_disabledweapons[w] || GetPlayerWeapon(playerid) == p_disabledweapons[playerid][w]) && GetPlayerWeapon(playerid) != 0)
		{
		    GivePlayerWeapon(playerid, GetPlayerWeapon(playerid), -GetPlayerAmmo(playerid));
		    return 0;
		}
	}
	return OnPlayerUpdate_WeapDis(playerid);
}

forward OnPlayerUpdate_WeapDis(playerid);

#define OnPlayerUpdate OnPlayerUpdate_WeapDis

stock SetDisabledWeapons(...)
{
    new arg;
	new argcount = numargs();
	new argument;
	for(new a = 0; a < argcount; a++)
	{
	    arg = getarg(a);
	    if (!(a+1 > argcount)) setarg(a, arg, a+1);
	    g_disabledweapons[argument] = arg;
	    argument++;
	}
}
stock ReEnableWeapons(...)
{
	new arg;
	new argcount = numargs();
	for(new a = 0; a < argcount; a++)
	{
	    arg = getarg(a);
	    if (!(a+1 > argcount)) setarg(a, arg, a+1);
	    for(new w; w < 47; w++) if (g_disabledweapons[w] == arg) g_disabledweapons[w] = 0;
	}
}

stock SetDisabledPlayerWeapons(playerid, ...)
{
    new arg;
	new argcount = numargs();
	new argument;
	for(new a = 1; a < argcount; a++)
	{
	    arg = getarg(a);
	    if (!(a+1 > argcount)) setarg(a, arg, a+1);
	    p_disabledweapons[playerid][argument] = arg;
	    argument++;
	}
}
stock SetReEnabledPlayerWeapons(playerid, ...)
{
    new arg;
	new argcount = numargs();
	for(new a = 1; a < argcount; a++)
	{
	    arg = getarg(a);
	    if (!(a+1 > argcount)) setarg(a, arg, a+1);
	    for(new w; w < 47; w++) if (p_disabledweapons[playerid][w] == arg) p_disabledweapons[playerid][w] = 0;
	}
}
