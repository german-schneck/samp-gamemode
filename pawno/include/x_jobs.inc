/* PeaTon^ Include 2008.
Credits:
PeaToN^, Scripting, Bug Fixes, Testing
Leopard, Scripting, Bug Fixes, Testing*/
#include <a_samp>
//==================================================
#define swat_payment 1337
#define cop_payment 1337
#define medic_payment 1337
#define army_payment 1337
#define groove_payment 1337
#define ballas_payment 1337
#define drugdel_payment 1337
#define president_payment 1337
#define driveins_payment 1337
#define hacker_payment 0
#define trucker_payment 1337
#define carjack_payment 0
//=====================================================
#define copskin 281
#define medicskin 275
#define armyskin 287
#define swatskin 285
#define grooveskin 107
#define ballasskin 104
#define drugdelskin 67
#define presidentskin 147
#define driveinsskin 153
#define hackerskin 223
#define truckerskin 223
#define carjackskin 223
//=====================================================
//==================================================
/*//=================================================
native SetJob(playerid, jobid);
native SetPayment(jobid, Payment);
native Removejob(playerid);
native PaymentTime(time);
native TeamKillOn(true/false);
native SetSkin(Jobid, SkinID);
native GetPlayerJobID(playerid);
*///==================================================
//==================================================
new COP[MAX_PLAYERS];
new ARMY[MAX_PLAYERS];
new MEDIC[MAX_PLAYERS];
new swat[MAX_PLAYERS];
new groove[MAX_PLAYERS];
new ballas[MAX_PLAYERS];
new drugdel[MAX_PLAYERS];
new president[MAX_PLAYERS];
new driveins[MAX_PLAYERS];
new hacker[MAX_PLAYERS];
new trucker[MAX_PLAYERS];
new carjack[MAX_PLAYERS];
//===============================================

//===============================================
new skincop = copskin;
new skinmedic = medicskin;
new skinarmy = armyskin;
new skinswat = swatskin;
new skingroove = grooveskin;
new skinballas = ballasskin;
new skindrugdel = drugdelskin;
new skinpresident = presidentskin;
new skindriveins = driveinsskin;
new skinhacker = hackerskin;
new skintrucker = truckerskin;
new skincarjack = carjackskin;
//==================================================
new payment_cop = cop_payment;
new payment_medic = medic_payment;
new payment_army = army_payment;
new payment_swat = swat_payment;
new payment_groove = groove_payment;
new payment_ballas = ballas_payment;
new payment_drugdel = drugdel_payment;
new payment_president = president_payment;
new payment_driveins = driveins_payment;
new payment_hacker = hacker_payment;
new payment_trucker = trucker_payment;
new payment_carjack = carjack_payment;
//==================================================
forward SetJob(playerid, jobid);
forward SetPayment(jobid, Payment);
forward Removejob(playerid);
forward Payment();
forward PaymentTime(time);
forward TeamKillOn(option);
forward SetSkin(Jobid, Skinid);
forward GetPlayerJobId(playerid);
//==================================================

//==================================================
stock GetPlayerJobID(playerid)
{
	if(COP[playerid] == 1) return 1;
	if(MEDIC[playerid] == 1)  return 2;
	if(ARMY[playerid] == 1) return 3;
	if(swat[playerid] == 1) return 4;
	if(groove[playerid] == 1) return 5;
	if(ballas[playerid] == 1) return 6;
	if(drugdel[playerid] == 1) return 7;
	if(president[playerid] == 1) return 8;
	if(driveins[playerid] == 1) return 9;
	if(hacker[playerid] == 1) return 10;
	if(trucker[playerid] == 1) return 11;
	if(carjack[playerid] == 1) return 12;
	else return 0;
}
//==================================================
public Removejob(playerid)
{
	COP[playerid] = 0;
	MEDIC[playerid] = 0;
	ARMY[playerid] = 0;
	swat[playerid] = 0;
	groove[playerid] = 0;
	ballas[playerid] = 0;
	drugdel[playerid] = 0;
	president[playerid] = 0;
	driveins[playerid] = 0;
	hacker[playerid] = 0;
	trucker[playerid] = 0;
	carjack[playerid] = 0;
}
//=====================================================
public SetSkin(Jobid, Skinid)
{
	if(Jobid == 1)
	{
		skincop = Skinid;
	}
	else if(Jobid == 2)
	{
		skinmedic = Skinid;
	}
	else if(Jobid == 3)
	{
		skinarmy = Skinid;
	}
	else if(Jobid == 4)
	{
		skinswat = Skinid;
	}
	else if(Jobid == 5)
	{
		skingroove = Skinid;
	}
	else if(Jobid == 6)
	{
		skinballas = Skinid;
	}
	else if(Jobid == 7)
	{
		skindrugdel = Skinid;
	}
	else if(Jobid == 8)
	{
		skinpresident = Skinid;
	}
	else if(Jobid == 9)
	{
		skindriveins = Skinid;
	}
	else if(Jobid == 10)
	{
		skinhacker = Skinid;
	}
	else if(Jobid == 11)
	{
		skintrucker = Skinid;
	}
	else if(Jobid == 12)
	{
		skincarjack = Skinid;
	}
}
//==================================================
public PaymentTime(time)
{
	SetTimer("Payment" , time * 1000, true);
}
//==================================================
public SetJob(playerid, jobid)
{
	if(jobid == 1)
	{
	    SetPlayerSkin(playerid, skincop);
	    COP[playerid] = 1;
	    SendClientMessage(playerid,0xFFFFF,"SERVER: Your now a Police officer!");
	}
	else if(jobid == 2)
	{
		MEDIC[playerid] = 1;
		SendClientMessage(playerid,0xFFFFF,"SERVER: Your now a Paramedic!");
		SetPlayerSkin(playerid,skinmedic);
	}
	else if(jobid == 3)
	{
	    ARMY[playerid] = 1;
	    SendClientMessage(playerid,0xFFFFF,"SERVER: Your now a army Officer!");
	    SetPlayerSkin(playerid,skinarmy);
	}
	else if(jobid == 4)
	{
	    swat[playerid] = 1;
	    SendClientMessage(playerid,0xFFFFF,"SERVER: Your now a Swat Officer!");
	    SetPlayerSkin(playerid,skinswat);
	}
	else if(jobid == 5)
	{
	    groove[playerid] = 1;
	    SendClientMessage(playerid,0xFFFFF,"SERVER: Your now a brove Member!");
	    SetPlayerSkin(playerid,skingroove);
	}
	else if(jobid == 6)
	{
	    ballas[playerid] = 1;
	    SendClientMessage(playerid,0xFFFFF,"SERVER: Your now a Ballas Member!");
	    SetPlayerSkin(playerid,skinballas);
	}
	else if(jobid == 7)
	{
	    drugdel[playerid] = 1;
	    SendClientMessage(playerid,0xFFFFF,"SERVER: Your now a drug dealer");
	    SetPlayerSkin(playerid,skindrugdel);
	}
	else if(jobid == 8)
	{
	    president[playerid] = 1;
	    SendClientMessage(playerid,0xFFFFF,"SERVER: Your the president now!");
	    SetPlayerSkin(playerid,skinpresident);
	}
	else if(jobid == 9)
	{
	    driveins[playerid] = 1;
	    SendClientMessage(playerid,0xFFFFF,"SERVER: Your now a Driving instructor");
	    SetPlayerSkin(playerid,skindriveins);
	}
	else if(jobid == 10)
	{
	    hacker[playerid] = 1;
	    SendClientMessage(playerid,0xFFFFF,"SERVER: Your now a Hacker!");
	    SetPlayerSkin(playerid,skinhacker);
	}
	else if(jobid == 11)
	{
	    trucker[playerid] = 1;
	    SendClientMessage(playerid,0xFFFFF,"SERVER: Your now a Trucker");
	    SetPlayerSkin(playerid,skintrucker);
	}
	else if(jobid == 12)
	{
	    trucker[playerid] = 1;
	    SendClientMessage(playerid,0xFFFFF,"SERVER: Your now Car Jacker!");
	    SetPlayerSkin(playerid,skincarjack);
	}
}
//==================================================
public SetPayment(jobid, Payment)
{
	if(jobid == 1)
	{
		payment_cop = Payment;
	}
	else if(jobid == 2)
	{
		payment_medic = Payment;
	}
	else if(jobid == 3)
	{
		payment_army = Payment;
	}
	else if(jobid == 4)
	{
		payment_swat = Payment;
	}
	else if(jobid == 5)
	{
		payment_groove = Payment;
	}
	else if(jobid == 6)
	{
		payment_ballas = Payment;
	}
	else if(jobid == 7)
	{
		payment_drugdel = Payment;
	}
	else if(jobid == 8)
	{
		payment_president = Payment;
	}
	else if(jobid == 9)
	{
		payment_driveins = Payment;
	}
	else if(jobid == 10)
	{
		payment_hacker = Payment;
	}
	else if(jobid == 11)
	{
		payment_trucker = Payment;
	}
	else if(jobid == 12)
	{
		payment_carjack = Payment;
	}
}
//==================================================
public Payment()
{
    new str[100];
    for(new i=0;i<MAX_PLAYERS;i++)
    {
		if(COP[i] == 1)
		{
			GivePlayerMoney(i, payment_cop);
			format(str, 100, "SERVER: You got payment (%d)", payment_cop);
			SendClientMessage(i, 0x000FFF, str);
		}
		if(MEDIC[i] == 1)
		{
			GivePlayerMoney(i, payment_medic);
			format(str, 100, "SERVER: You got payment (%d)", payment_medic);
			SendClientMessage(i, 0x000FFF, str);
		}
		if(ARMY[i] == 1)
		{
			GivePlayerMoney(i, payment_army);
			format(str, 100, "SERVER: You got payment (%d)", payment_army);
			SendClientMessage(i, 0x000FFF, str);
		}
		if(swat[i] == 1)
		{
			GivePlayerMoney(i, payment_swat);
			format(str, 100, "SERVER: You got payment (%d)", payment_swat);
			SendClientMessage(i, 0x000FFF, str);
		}
		if(groove[i] == 1)
		{
			GivePlayerMoney(i, payment_groove);
			format(str, 100, "SERVER: You got payment (%d)", payment_groove);
			SendClientMessage(i, 0x000FFF, str);
		}
		if(ballas[i] == 1)
		{
			GivePlayerMoney(i, payment_ballas);
			format(str, 100, "SERVER: You got payment (%d)", payment_ballas);
			SendClientMessage(i, 0x000FFF, str);
		}
		if(drugdel[i] == 1)
		{
			GivePlayerMoney(i, payment_drugdel);
			format(str, 100, "SERVER: You got payment (%d)", payment_drugdel);
			SendClientMessage(i, 0x000FFF, str);
		}
		if(president[i] == 1)
		{
			GivePlayerMoney(i, payment_president);
			format(str, 100, "SERVER: You got payment (%d)", payment_president);
			SendClientMessage(i, 0x000FFF, str);
		}
		if(driveins[i] == 1)
		{
			GivePlayerMoney(i, payment_driveins);
			format(str, 100, "SERVER: You got payment (%d)", payment_driveins);
			SendClientMessage(i, 0x000FFF, str);
		}
		if(hacker[i] == 1)
		{
			GivePlayerMoney(i, payment_hacker);
			format(str, 100, "SERVER: You got payment (%d)", payment_hacker);
			SendClientMessage(i, 0x000FFF, str);
		}
		if(trucker[i] == 1)
		{
			GivePlayerMoney(i, payment_hacker);
			format(str, 100, "SERVER: You got payment (%d)", payment_trucker);
			SendClientMessage(i, 0x000FFF, str);
		}
		if(carjack[i] == 1)
		{
			GivePlayerMoney(i, payment_carjack);
			format(str, 100, "SERVER: You got payment (%d)", payment_carjack);
			SendClientMessage(i, 0x000FFF, str);
		}


    }
}
//==================================================
public TeamKillOn(option)
{
    for(new i=0;i<MAX_PLAYERS;i++)
    {
		if(option == 1)
		{
		    if(COP[i] == 1)
		    {
		    	SetPlayerTeam(i, 1);
			}
   			if(MEDIC[i] == 1)
		    {
		    	SetPlayerTeam(i, 2);
			}
			if(ARMY[i] == 1)
		    {
		    	SetPlayerTeam(i, 3);
			}
			if(swat[i] == 1)
		    {
		    	SetPlayerTeam(i, 4);
			}
			if(groove[i] == 1)
		    {
		    	SetPlayerTeam(i, 5);
			}
			if(ballas[i] == 1)
		    {
		    	SetPlayerTeam(i, 6);
			}
			if(drugdel[i] == 1)
		    {
		    	SetPlayerTeam(i, 7);
			}
			if(president[i] == 1)
		    {
		    	SetPlayerTeam(i, 8);
			}
			if(driveins[i] == 1)
		    {
		    	SetPlayerTeam(i, 9);
			}
			if(hacker[i] == 1)
		    {
		    	SetPlayerTeam(i, 10);
			}
			if(trucker[i] == 1)
		    {
		    	SetPlayerTeam(i, 11);
			}
			if(carjack[i] == 1)
		    {
		    	SetPlayerTeam(i, 12);
			}
		}
		else if (option == 0)
		{
		    SetPlayerTeam(i,0);
		}
	}
}
