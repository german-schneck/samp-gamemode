#include <a_samp>

/*               Angelhj's Object Streamer
/                Beta 1 No Quites Creditos
*/

/*
native CrearCarro(modelid,Float:X,Float:Y,Float:Z,Float:R,color1,color2);
native DestruirCarro(Carroid);
native GetCarroPos(Carroid,Float:X,Float:Y,Float:Z);
native SetCarroPos(Carroid,Float:X,Float:Y,Float:Z,Float:Angle);
native LlevarCarroHaInterior(Carroid,interiorid);
native BlockearCarroParaPlayer(Carroid,playerid,objective,puertacerradas);
native AgregarComponenteHaCarro(Carroid,componenteid);
native DarVidaHaCarro(Carroid,Float:vida);
native GetCarroModel(Carroid);
native GetCarroID(Carroid);
native CambiarColoresHaCarro(Carroid,color1,color2);
native Car_OnPlayerExitVehicle(vehicleid);
native Car_Iniciar();
*/
#if !defined Carros_Maximos
    #define Carros_Maximos 1000
#endif

new VI;
new modelidc[Carros_Maximos];
new Float:xc[Carros_Maximos];
new Float:yc[Carros_Maximos];
new Float:zc[Carros_Maximos];
new Float:r[Carros_Maximos];
new col1[Carros_Maximos];
new col2[Carros_Maximos];
new Float:movxc[Carros_Maximos];
new Float:movyc[Carros_Maximos];
new Float:movzc[Carros_Maximos];
new Vehicle[Carros_Maximos];
new VehicleCnt[MAX_PLAYERS];
new TieneVehicle[MAX_PLAYERS][Carros_Maximos];
new NoDestroyTmp[Carros_Maximos];

stock IsPlayerInVehicleArea(playerid,Float:x1,Float:y1,Float:z1,Float:radius)
	{
	if(GetPlayerDistanceToPoint1(playerid,x1,y1,z1) < radius)
	{
	return 1;
	}
	return 0;
}


stock GetPlayerDistanceToPoint1(playerid,Float:x2,Float:y2,Float:z2)
	{
	new Float:x1,Float:y1,Float:z1;
	new Float:tmpdis;
	GetPlayerPos(playerid,x1,y1,z1);
	tmpdis = floatsqroot(floatpower(floatabs(floatsub(Float:x2,x1)),2)+floatpower(floatabs(floatsub(Float:y2,y1)),2)+floatpower(floatabs(floatsub(Float:z2,z1)),2));
	return floatround(tmpdis);
}

stock CrearCarro(modelid1,Float:X,Float:Y,Float:Z,Float:R,color1,color2)
{
	modelidc[VI] = modelid1;
	xc[VI] = X;
	yc[VI] = Y;
	zc[VI] = Z;
	r[VI] = R;
	col1[VI] = color1;
	col2[VI] = color2;
	VI++;
	return VI-1;
}
stock DestruirCarro(Carroid)
{
	modelidc[Carroid] = 0;
	xc[Carroid] = 0;
	yc[Carroid] = 0;
	zc[Carroid] = 0;
	r[Carroid] = 0;
	col1[Carroid] = 0;
	col2[Carroid] = 0;
	for(new i=0; i<MAX_PLAYERS; i++)
	{
	if(TieneVehicle[i][Carroid] == 1)
	{
	DestroyVehicle(Vehicle[Carroid]);
	TieneVehicle[i][Carroid] = 0;
	}
	}
}
stock GetCarroPos(Carroid,&X,&Y,&Z)
{
	for(new i=0; i<MAX_PLAYERS; i++)
	{
	if(TieneVehicle[i][Carroid] == 1)
	{
    GetVehiclePos(Carroid,X,Y,Z);
	}
	}
    return 0;
}
stock SetCarroPos(Carroid,Float:X,Float:Y,Float:Z,Float:A)
{
	for(new i=0; i<MAX_PLAYERS; i++)
	{
	if(TieneVehicle[i][Carroid] == 1)
	{
    SetVehiclePos(Vehicle[Carroid],X,Y,Z);
    SetVehicleZAngle(Vehicle[Carroid],A);
	}
	}
}
stock LlevarCarroHaInterior(Carroid,interiorid)
{
	for(new i=0; i<MAX_PLAYERS; i++)
	{
	if(TieneVehicle[i][Carroid] == 1)
	{
    LinkVehicleToInterior(Vehicle[Carroid],interiorid);
	}
	}
}
stock BlockearCarroParaPlayer(Carroid,playerid,objective,puertacerradas)
{
	for(new i=0; i<MAX_PLAYERS; i++)
	{
	if(TieneVehicle[i][Carroid] == 1)
	{
	SetVehicleParamsForPlayer(Vehicle[Carroid],playerid,objective,puertacerradas);
	}
	}
}
stock AgregarComponenteHaCarro(Carroid,componenteid)
{
	for(new i=0; i<MAX_PLAYERS; i++)
	{
	if(TieneVehicle[i][Carroid] == 1)
	{
	AddVehicleComponent(Vehicle[Carroid],componenteid);
	}
	}
}
stock DarVidaHaCarro(Carroid,Float:vida)
{
	for(new i=0; i<MAX_PLAYERS; i++)
	{
	if(TieneVehicle[i][Carroid] == 1)
	{
	SetVehicleHealth(Vehicle[Carroid],vida);
	}
	}
}
stock GetCarroModel(Carroid)
{
	for(new i=0; i<MAX_PLAYERS; i++)
	{
	if(TieneVehicle[i][Carroid] == 1)
	{
	return modelidc[Carroid];
	}
	}
}
stock GetCarroID(Carroid)
{
	for(new i=0; i<MAX_PLAYERS; i++)
	{
	if(TieneVehicle[i][Carroid] == 1)
	{
	return Vehicle[Carroid];
	}
	}
}
stock CambiarColoresHaCarro(Carroid,color1,color2)
{
	for(new i=0; i<MAX_PLAYERS; i++)
	{
	if(TieneVehicle[i][Carroid] == 1)
	{
	ChangeVehicleColor(Vehicle[Carroid],color1,color2);
	}
	}
}
forward Crear_Cars();
public Crear_Cars()
{
	for(new i=0; i<GetMaxPlayers(); i++)
	{
	if(IsPlayerConnected(i))
	{
	for(new veh=0; veh<VI; veh++)
	{
	if(IsPlayerInAnyVehicle(i))
	{
	new Float:movxc1;
    new Float:movyc1;
    new Float:movzc1;
	GetVehiclePos(veh,movxc1,movyc1,movzc1);
	movxc[veh] = movxc1;
	movyc[veh] = movyc1;
	movzc[veh] = movzc1;
	}
	if(IsPlayerInVehicleArea(i,xc[veh], yc[veh],zc[veh], 200))
	{
	if(VehicleCnt[i] < 690)
	{
	if(TieneVehicle[i][veh] == 0)
	{
	Vehicle[veh] = CreateVehicle(modelidc[veh], xc[veh], yc[veh], zc[veh], r[veh], col1[veh], col2[veh],6666666);
	VehicleCnt[i]++;
	TieneVehicle[i][veh] = 1;
	}
	}
	}
	else
	{
	if(TieneVehicle[i][veh] == 1)
	{
	if(NoDestroyTmp[veh] == 0)
	{
	if(IsPlayerInVehicleArea(i,movxc[veh], movyc[veh],movzc[veh], 200))
	{
	DestroyVehicle(Vehicle[veh]);
	VehicleCnt[i]--;
	TieneVehicle[i][veh] = 0;
	}
	}
	}
	}
	}
	}
	}
	return 1;
}
stock Car_OnPlayerExitVehicle(vehicleid)
{
    NoDestroyTmp[vehicleid] = 1;
    SetTimerEx("SiDestroyTmp",300000,0,"d",vehicleid);
}
stock Car_Iniciar()
{
	print(" Vehicle Streamer By Angelhj Loaded ");
    SetTimer("Crear_Cars", 400, true);
   	for(new veh=0; veh<Carros_Maximos; veh++)
	{
    NoDestroyTmp[veh] = 0;
    }
}
stock SiDestroyTmp(vehicleid)
{
     NoDestroyTmp[vehicleid] = 0;
}
