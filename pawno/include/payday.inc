//
// Created:     06.09.06
// Aurthor:    Iain Gilbert
//

#if defined _payday_included
  #endinput
#endif

#define _payday_included
#pragma library payday
#include "base"
#include "player"

#define PayDayDelay 200000 // Delay between pays

static BasePay = 200; // Base amount player recieves each pay (pay = PocketMoney + (PocketMoney * level ))
static PayCutoff = 1000000; // amount of money player can horde before they stop getting payed (they can still get money by killing)


// timer needs to run this.
// gives players money.
public PayDay()
{
	for (new id = 0; id < MAX_PLAYERS; id++)
	{
		 if (IsPlayerConnected(id))
		 {
			if (GetPlayerTotalMoney(id) < PayCutoff)
			{
			    new string[MAX_STRING];
			    format(string, sizeof(string), "Payday: $%d.", BasePay+(BasePay*Player[id][Level]));
				SendClientMessage(id, COLOUR_MONEY_GOOD, string);
			    oGivePlayerMoney(id,BasePay+(BasePay*Player[id][Level]),0);
			}
		}
	}
}

PaydayLoadConfig()
{
	if (ForceOverwrite) return;
	if (!dini_Exists(ConfigDB)) return;
	new temp[MAX_STRING];
	set(temp,dini_Get(ConfigDB,"Payday_Base"));
	if (strlen(temp) > 0) BasePay = strval(temp);
	set(temp,nullstr);
	set(temp,dini_Get(ConfigDB,"Payday_Cutoff"));
	if (strlen(temp) > 0) PayCutoff = strval(temp);

	return;
}

PaydaySaveConfig()
{
	if (!dini_Exists(ConfigDB)) return;
	new temp[MAX_STRING];
	valstr(temp,BasePay);
	dini_Set(ConfigDB,"Payday_Base",temp);
	valstr(temp,PayCutoff);
	dini_Set(ConfigDB,"Payday_Cutoff",temp);
	return;
}
