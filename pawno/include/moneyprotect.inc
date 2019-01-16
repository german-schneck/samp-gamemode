/****

==========================
    Money Protect v1.1    
==========================

Author: Jones N. Sperandio
Release date: 26/02/2010

__________________________
Description/Descrição

PT:
Provê proteção contra money hack, sem que seja preciso alterar várias linhas de
um script.

EN:
Provides protection against money hacking, without having to change several lines
of code.                 
__________________________
Notes/Notas

PT:
Caso seja usado em um filterscript, o mesmo deve conter a diretiva
#define FILTERSCRIPT, antes da diretiva #include, e o gamemode precisa ter sido
compilado com o include também.

EN:
In case of a filterscript, it must contain the directive #define FILTERSCRIPT
before the #include directive, and the gamemode script must be compiled with
the include, too.

****/

#if defined __MONEY_PROTECT__
    #endinput    
#endif

#define __MONEY_PROTECT__

#if defined FILTERSCRIPT
    #define FUNC::%1(%2) stock %1(%2)    
#else
    #define FUNC::%1(%2) forward %1(%2); public %1(%2)    
#endif

#if !defined FILTERSCRIPT

#if !defined foreach
    #tryinclude <foreach>
#endif

#if !defined foreach
    #define foreach(%1,%2) for(new %2; %2 < MAX_PLAYERS; %2++) if(IsPlayerConnected(%2))    
    #define __MP_FOREACH    
#endif

#if !defined MP_TIMER_INTERVAL
    #define MP_TIMER_INTERVAL 500    
#endif

forward MoneyProtectTimer();

new
    __MP_Money[MAX_PLAYERS];    

static
    bool:__MP_HAS_OPC,
    bool:__MP_HAS_OMCD;

public MoneyProtectTimer()
{
    foreach(Player, playerid)
    {
        if(GetPlayerMoney(playerid) > __MP_Money[playerid])
        {
            if(__MP_HAS_OMCD)
                CallLocalFunction("OnMoneyCheatDetect", "dd", playerid, GetPlayerMoney(playerid)-__MP_Money[playerid]);
            GivePlayerMoney(playerid, __MP_Money[playerid]-GetPlayerMoney(playerid));
        }
        else
        {
            __MP_Money[playerid] = GetPlayerMoney(playerid);
        }
    }
}

public OnGameModeInit()
{
    SetTimer("MoneyProtectTimer", MP_TIMER_INTERVAL, true);
    if(funcidx("__MP_OnGameModeInit") != -1)
        CallLocalFunction("__MP_OnGameModeInit", "");
    __MP_HAS_OPC = (funcidx("__MP_OnPlayerConnect") != -1);
    __MP_HAS_OMCD = (funcidx("OnMoneyCheatDetect") != -1);  
}

public OnPlayerConnect(playerid)
{
    __MP_ResetPlayerMoney(playerid);    
    if(__MP_HAS_OPC)
        CallLocalFunction("__MP_OnPlayerConnect", "d", playerid); 
}

#endif
                        
FUNC::__MP_GivePlayerMoney(playerid, amount)
{
    #if defined FILTERSCRIPT    
        return CallRemoteFunction("__MP_GivePlayerMoney", "dd", playerid, amount);        
    #else
        __MP_Money[playerid] += amount;    
        return GivePlayerMoney(playerid, amount);        
    #endif
}
                        
FUNC::__MP_ResetPlayerMoney(playerid)
{
    #if defined FILTERSCRIPT    
        return CallRemoteFunction("__MP_ResetPlayerMoney", "d", playerid);        
    #else
        __MP_Money[playerid] = 0;    
        return ResetPlayerMoney(playerid);        
    #endif
}   
                        
FUNC::__MP_GetPlayerMoney(playerid)
{
    #if defined FILTERSCRIPT    
        return CallRemoteFunction("__MP_GetPlayerMoney", "d", playerid);        
    #else
        return __MP_Money[playerid];
    #endif
}

#define GivePlayerMoney __MP_GivePlayerMoney
#define ResetPlayerMoney __MP_ResetPlayerMoney
#define GetPlayerMoney __MP_GetPlayerMoney 

#if defined FILTERSCRIPT
    #endinput    
#endif

#if defined _ALS_OnGameModeInit
    #undef OnGameModeInit
#else
    #define _ALS_OnGameModeInit
#endif

#if defined _ALS_OnPlayerConnect
    #undef OnPlayerConnect
#else
    #define _ALS_OnPlayerConnect
#endif

#define OnGameModeInit __MP_OnGameModeInit     
#define OnPlayerConnect __MP_OnPlayerConnect

forward OnGameModeInit();
forward OnPlayerConnect(playerid);
forward OnMoneyCheatDetect(playerid, amount);

#if defined __MP_FOREACH
    #undef foreach
    #undef __MP_FOREACH    
#endif
