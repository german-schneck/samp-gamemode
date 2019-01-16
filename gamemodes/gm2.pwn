/** ====================================
	San Andreas Multiplayer Gamemode #2

	@author Germán D. Schneck <german.schneck@gmail.com>
	@license Creative Common
	@copyright 2011 (Edited: 2019)
    ==================================== */

#include <a_samp>
#include <a_players>
#include <a_vehicles>
#include <a_objects>
#include <a_mysql>
#include <a_http>
#include <a_npc>
#include <a_sampdb>
#include <core>
#include <progress>
#include <dini>
#include <utils>
#include <streamer>
#include <ColorVehiculo>


#pragma tabsize 0
#define dcmd(%1,%2,%3) if ((strcmp((%3)[1], #%1, true, (%2)) == 0) && ((((%3)[(%2) + 1] == 0) && (dcmd_%1(playerid, "")))||(((%3)[(%2) + 1] == 32) && (dcmd_%1(playerid, (%3)[(%2) + 2]))))) return 1
main() { print(" "); print("Copyright 2011 ~ 2012 (c) All rights reserved"); print("http://127.0.0.1"); }
stock strvalEx( const string[] ) { if( strlen( string ) >= 50 ) return 0; return strval(string); }
AntiDeAMX() { new a[][] = { "Unarmed (Fist)","Brass K" };
#pragma unused a
}

/* -= Dialogs =- */
#define Registro 					0
#define Logueo 						1
#define Terminos                    2
#define TRol               		    3
#define TRol2                 		4
#define TRol3                 		5
#define TRol4                 		6
#define TRol5                 		7
#define TRol6                       8
#define TRol7                       9
#define TRol8                       10
#define TRol9               		11
#define TRol10              		12
#define SEXO              			13
#define EDAD              			14
#define PERSONALIDAD              	15
#define SIGNO              			16
#define AFICION            			17
#define ORIGEN            			18
#define Guia                        19
#define Reporte                     20
#define AdminClick                  21
#define UserRoot                  	22
#define Asensor     				23
#define MSN                         24
#define EquipoSAPD                  25
#define TerminosBancarios           26
#define EleccionTarjeta            	27
#define DBanco                      28
#define DepositoBancario            29
#define RetiroBancario              30
#define TransferenciaBancaria       31
#define InformacionBancaria         32
#define TransferenciaBancaria2      33
#define VPanel              		34
#define VLuces             		 	35
#define VCapo              		 	36
#define VPuertas           		 	37
#define VMaletero          			38
#define Multa                       39
#define PrestamoSangre              40
#define ODNI                        41
#define Embargado                   42
#define Vehiculos                   43
#define VPapeles                    44
#define OLive                       45
#define SolicitudLice               46
#define CLlamada                    47
#define RentaVehiculo               48
#define OMecanico           		49
#define OGanzua                     50
#define PrestamoGanzuas             51
#define EJob1                       52
#define Tienda                      53

/* -= Colores =- */
#define BLANCO 				0xFFFFFFFF
#define CELESTE 			0x00BBFFFF
#define ROSA 				0xFF8DFFFF
#define AMARILLO 			0xFFFF51FF
#define AZUL 				0x4666FFFF
#define VIOLETA 			0xA084FFFF
#define VERDE 				0x00AB00FF
#define MARRON		 		0xC28900FF
#define OLIVO 				0xBFFF00FF
#define ROJO 				0xAA0000FF
#define NARANJA 			0xFF8D00FF
#define GRIS 				0x9C9C9CFF
#define SINCOLOR 			0xFFFFFF00
#define FLUOR 				0x97FF00FF
#define ROJIZO 				0xFF8282AA
#define AZULCLARO 			0x33CCFFAA
#define VERDECLARO 			0x9ACD32AA
#define PURPURA 			0xC2A2DAAA
#define CAZULV 				0x4E76B1FF
#define CROJOV  			0xF40B74FF
#define DORADO 				0xFEB800FF
#define ROJOCREMA 			0xCE6062FF
#define PURPURASUAVE 		0x817DC5FF
#define VIOLETAFUERTE 		0x8100B4FF
#define MARRONADO 			0x817870FF
#define FLUORESENTE 		0x81FF0CFF
#define ROJOFUERTE 			0xFF0000FF
#define AZULFUERTE 			0x0000FFFF
#define VERDEFUERTE 		0x00FF00FF
#define CELESTEFUERTE 		0x00FFFFFF
#define COLOR_MACHO         0x0095DAFF
#define COLOR_HEMBRA        0xFFBDFFFF

/* -= General =- */
#define CONGELADO  					0
#define DESCONGELADO 				1
#define TituloT Tutorial[0][i]
#define Linea1T Tutorial[1][i]
#define Linea2T Tutorial[2][i]
#define Linea3T Tutorial[3][i]
#define SetPlayerHoldingObject(%1,%2,%3,%4,%5,%6,%7,%8,%9) \
SetPlayerAttachedObject(%1,MAX_PLAYER_ATTACHED_OBJECTS-1,%2,%3,%4,%5,%6,%7,%8,%9)
#define StopPlayerHoldingObject(%1) RemovePlayerAttachedObject(%1,MAX_PLAYER_ATTACHED_OBJECTS-1)
#define IsPlayerHoldingObject(%1) IsPlayerAttachedObjectSlotUsed(%1,MAX_PLAYER_ATTACHED_OBJECTS-1)
#define PRESSED(%0) (((newkeys & (%0)) == (%0)) && ((oldkeys & (%0)) != (%0)))
#define HOLDING(%0) ((newkeys & (%0)) == (%0))
#define PICKUP_VIDA 		1240
#define PICKUP_BLINDAJE     1242
#define PICKUP_Informacion	1239
#define PICKUP_PASTILLA     1241
#define PICKUP_POLICIA      1247
#define PICKUP_DINERO       1274
#define PICKUP_FLECHA       1318
#define MAPICON_AEREO       5
#define MAPICON_AMMU        6
#define MAPICON_PORT        9
#define MAPICON_BURGER      10
#define MAPICON_FIRE        20
#define MAPICON_HOSPITAL    21
#define MAPICON_ILEGAL      23
#define MAPICON_CASINO      25
#define MAPICON_REPAIR      27
#define MAPICON_POLICE      30
#define MAPICON_BUSSINE     52
#define MAPICON_SPRAY       63
#define INT_AVIONPRIVADO    1
#define INT_AMMUNATION      1
#define INT_HOTEL           15
#define INT_FACTORY         1
#define INT_BINCO           15
#define INT_DIDIER          14
#define INT_DISCO           17
#define INT_BAR             11
#define INT_RESTAURANT      4
#define INT_BURGERSHOT      10
#define INT_AYUNTAMIENTO    3
#define INT_GANTOM          5
#define INT_MADDDOG         5
#define INT_JOHNSON         3
#define INT_CRACKFACTORY    2
#define INT_PORNROOM        3
#define INT_RESTAURANTLC    1
#define INT_CIVILDEP        10
#define INT_LSPDHQ          6
#define INT_UNIVERSITY      18
#define GUN_OFF             0
#define GUN_PU�OAMERICANO   1
#define GUN_PORRA           3
#define GUN_KNIFE           4
#define GUN_FLOWERS         14
#define GUN_SHOTGUN         15
#define GUN_GRANADA         16
#define GUN_SMOKE           16
#define GUN_MOLOTOV         18
#define GUN_PISTOL          22
#define GUN_CDPISTOL        23
#define GUN_DESERT          24
#define GUN_AUTOSHOTGUN     27
#define GUN_UZI             28
#define GUN_MP5             29
#define GUN_AK47            30
#define GUN_M4              31
#define GUN_SNIPER          34
#define GUN_SPRAY           41
#define GUN_EXTINTOR        42
#define GUN_CAMERA          43
#define GUN_PARACHUTE       56
#define MAX_HOUSES 500
#define TOTAL_VEH 232
#define VV_DESDE 152
#define FIRE_POS_MARKER 60

/* -= Facciones =- */
#define SAPD	1
#define SAMD    2
#define PRES    3
#define TAXI    4
#define SATV    5
#define LICE    6
#define MECA    7

/* -= Forwards =- */
forward CrearCuenta(playerid);
forward CargarDatos(playerid);
forward DetenerMusica();
forward LimpiarChat(playerid, lineas);
forward PlayerToPoint(Float:radi, playerid, Float:x, Float:y, Float:z);
forward ProcesandoRol(playerid);
forward TimerGeneral();
forward TimerVectorial();
forward ProcesoFinal(playerid);
forward FinalDelTutorial(playerid);
forward MensajeSAPD(color, string[]);
forward MensajeGOB(color, string[]);
forward MensajeSAMD(color, string[]);
forward MensajeTAXI(color, string[]);
forward MensajeADMIN(color, string[]);
forward MensajeMECA(color, string[]);
forward MensajeSATV(color, string[]);
forward MensajeLICE(color, string[]);
forward RangoCercano(Float:radi, playerid, string[],col1,col2,col3,col4,col5);
forward RangoCercanoS(Float:radi, playerid, targetid);
forward JugadoresCerca(p1);
forward Float:DistanciaEntreDosJugadores(p1,p2);
forward AnimacionCaido(playerid);
forward TiempoLimipiar(playerid);
forward GuardarEstadisticas();
forward CargarEstadisticas();
forward split(const strsrc[], strdest[][], delimiter);
forward ArrancandoV(playerid);
forward Lotteria(number);
forward CargarValores();
forward GuardarValores();
forward VehiculoCercano(p1);
forward Float:DistanciaEntreCarPer(c1,p2);
forward TogglearMatricula(playerid);
forward VehiculosVenta(carid);
forward CargarVehiculos();
forward ActualizarVehiculos();
forward Float:GetDistanceBetweenPlayers(p1,p2);
forward CargarSatelites();
forward GuardarSatelites();
forward VehiculosSAPD(carid);
forward VehiculosSAMD(carid);
forward VehiculosSAGO(carid);
forward VehiculosTAXI(carid);
forward VehiculosSATV(carid);
forward VehiculosMECA(carid);
forward VehiculosLICE(carid);
forward VehiculosRENT(carid);
forward VehiculosJOB1(carid);
forward CargandoProductos(playerid);
forward CargandoProductos2(playerid);
forward CargandoProductos3(playerid);
forward CargandoProductos4(playerid);
forward GuardarTiendas();
forward CargarTiendas();
forward TimerAnuncios();
forward Unloading(playerid);
forward PayDay();
forward SyncTime();
forward SyncUp();
forward GameModeExitFunc();
forward FixHour(hour);
forward DollahScoreUpdate();

/* -= PlayerVars =- */
new Conexion[MAX_PLAYERS];
new TimerTutorial[MAX_PLAYERS];
new IDReporte[MAX_PLAYERS];
new AdminService[MAX_PLAYERS];
new Amplificador[MAX_PLAYERS];
new TazerMano[MAX_PLAYERS];
new JugadorEsposado[MAX_PLAYERS];
new BloqueoWhispeos[MAX_PLAYERS];
new AntiBug[MAX_PLAYERS];
new encendiendo[MAX_VEHICLES];
new Motor[MAX_PLAYERS] = 0;
new MotorS[MAX_PLAYERS];
new MotorZ[MAX_PLAYERS];
new VArrancado[MAX_VEHICLES];
new engine, lights, alarm, doors, bonnet, boot, objective;
new ServicioSAPD[MAX_PLAYERS];
new TieneMascara[MAX_PLAYERS];
new transferido;
new PedidoRefuerzos[MAX_PLAYERS];
new TransmisionGobierno[MAX_PLAYERS];
new EmisorMulta[MAX_PLAYERS];
new PrecioMulta[MAX_PLAYERS];
new VozMegafono[MAX_PLAYERS];
new EmisorDNI[MAX_PLAYERS];
new PrecioDNI[MAX_PLAYERS];
new VehiculoEmbargado[MAX_VEHICLES];
new CarMatricula[MAX_VEHICLES];
new OfertaCoche[MAX_PLAYERS];
new PrecioCoche[MAX_PLAYERS];
new IDcCoche[MAX_PLAYERS];
new CarPuenteado[MAX_VEHICLES];
new Shock[MAX_PLAYERS];
new ServicioSAMD[MAX_PLAYERS];
new O_FIRE_1, O_FIRE_2, O_FIRE_3, O_FIRE_4, O_FIRE_5, O_FIRE_6, O_FIRE_7, O_FIRE_8, O_FIRE_9, O_FIRE_10;
new O_FIRE_11, O_FIRE_12, O_FIRE_13, O_FIRE_14, O_FIRE_15, O_FIRE_16, O_FIRE_17, O_FIRE_18, O_FIRE_19, O_FIRE_20;
new ModoServicioTAXI[MAX_PLAYERS];
new ValorTransporte[MAX_PLAYERS];
new TransportMoney[MAX_PLAYERS];
new ConsumingMoney[MAX_PLAYERS];
new CostoTAXI[MAX_PLAYERS];
new ConductorTAXI[MAX_PLAYERS];
new TiempoViaje[MAX_PLAYERS];
new VozSATV[MAX_PLAYERS];
new ProgresoReparacion[MAX_PLAYERS];
new OfreserEntrevista[MAX_PLAYERS];
new Entrevistado[MAX_PLAYERS];
new Linea[MAX_PLAYERS];
new RingTone[MAX_PLAYERS];
new CellTime[MAX_PLAYERS];
new Rentable[MAX_VEHICLES];
new Rentado[MAX_VEHICLES];
new LeccionIniciada[MAX_PLAYERS];
new RepairOffer[MAX_PLAYERS];
new RepairPrice[MAX_PLAYERS];
new RepairCar[MAX_PLAYERS];
new GanzuaOferta[MAX_PLAYERS];
new GanzuaPrecio[MAX_PLAYERS];
new GanzuaCantidad[MAX_PLAYERS];
new BloquearVelocimetro[MAX_PLAYERS];
new PasosTrabajo[MAX_PLAYERS];
new Float:TelePos[MAX_PLAYERS][6];
new synctimer;
new shifthour;
new ActivarCheckeador[MAX_PLAYERS];

/* -= TextDraws =- */
new Text:Barra1;
new Text:Barra2;
new Text:Tutorial[4][MAX_PLAYERS];
new Text:Motor_Box;
new Text:Motor_Titulo;
new Text:Velocimetro_Box[MAX_PLAYERS];
new Text:Velocimetro_Vel[MAX_PLAYERS];
new Text:Velocimetro_HP[MAX_PLAYERS];
new Text:Velocimetro_GAS[MAX_PLAYERS];
new Text:M_Fondo;
new Text:M_Fondo2;
new Text:M_Titulo;
new Text:M_Texto[MAX_PLAYERS];
new Text:Taxi_Box;
new Text:Taxi_Titulo;
new Text:Taxi_Leter[MAX_PLAYERS];
new Text:Repair_Box;
new Text:Repair_Text;
new Text:V_BOX;
new Text:V_TITLE;
new Text:V_TEXT[MAX_PLAYERS];
new Text:V_ANUNCIO;
new Text:L_FONDO;
new Text:L_TITULO;
new Text:L_VERSION;
new Text:L_CARGANDO;

/* -= Variables Numericas =- */
new ChatGeneral = 1;
new BloqueoOOC = 1;
new ReportesTotales = 0;
new ConexionesEntrantes = 0;
new UsuariosMasculinos = 0;
new UsuariosFemeninos = 0;
new UsuariosLS = 0;
new UsuariosSF = 0;
new UsuariosLV = 0;
new Actualizaciones = 0;
new ChatsIngresados = 0;
new Debug = 0;
new NumeroLoterico = 0;
new ResAntiDebug = 0;
new CajaGobierno = 0;
new Impuestos = 0;
new BancoSangre = 0;
new DepositoSangre = 0;
new RetiroSangre = 0;
new PrestamoViceCityS = 0;
new PrestamoLibertyCityS = 0;
new matriculainit = 1111;
new AntenaG1 = 0;
new AntenaG2 = 0;
new AntenaG3 = 0;
new AntenaG4 = 0;
new AntenaG5 = 0;
new BancoGanzuas = 0;
new ProductosTienda1 = 0;
new ProductosTienda2 = 0;
new ProductosTienda3 = 0;
new AnunciosActivados = 1;
new TiempoAnuncio = 60000;
new realtime = 1;
new wtime = 15;
new ghour = 0;
new gminute = 0;
new gsecond = 0;
new timeshift = -1;

// ~ Progress Bar ~
new Bar:CarHealth[MAX_PLAYERS];
new Bar:CarGasoil[MAX_PLAYERS];
new Bar:CarMotor[MAX_PLAYERS];
new Bar:RepairConexion[MAX_PLAYERS];

public GameModeExitFunc()
{
	KillTimer(synctimer);
	GameModeExit();
}
// ~ Namestirngs ~
new VehicleName[212][] = {
"Landstalker", "Bravura", "Buffalo", "Linerunner", "Perrenial", "Sentinel", "Dumper", "Firetruck", "Trashmaster", "Stretch", "Manana",
"Infernus", "Voodoo", "Pony", "Mule", "Cheetah", "Ambulance", "Leviathan", "Moonbeam", "Esperanto", "Taxi", "Washington", "Bobcat",
"Whoopee", "BF Injection", "Hunter", "Premier", "Enforcer", "Securicar", "Banshee", "Predator", "Bus", "Rhino", "Barracks", "Hotknife",
"Trailer 1", "Previon", "Coach", "Cabbie", "Stallion", "Rumpo", "RC Bandit", "Romero", "Packer", "Monster", "Admiral", "Squalo",
"Seasparrow", "Pizzaboy", "Tram", "Trailer 2", "Turismo", "Speeder", "Reefer", "Tropic", "Flatbed", "Yankee", "Caddy", "Solair",
"Berkley's RC Van", "Skimmer", "PCJ-600", "Faggio", "Freeway", "RC Baron", "RC Raider", "Glendale", "Oceanic", "Sanchez", "Sparrow",
"Patriot", "Quad", "Coastguard", "Dinghy", "Hermes", "Sabre", "Rustler", "ZR-350", "Walton", "Regina", "Comet", "BMX", "Burrito",
"Camper", "Marquis", "Baggage", "Dozer", "Maverick", "News Chopper", "Rancher", "FBI Rancher", "Virgo", "Greenwood", "Jetmax", "Hotring",
"Sandking", "Blista Compact", "Police Maverick", "Boxvillde", "Benson", "Mesa", "RC Goblin", "Hotring Racer A", "Hotring Racer B",
"Bloodring Banger", "Rancher", "Super GT", "Elegant", "Journey", "Bike", "Mountain Bike", "Beagle", "Cropduster","Stunt",  "Tanker",
"Roadtrain", "Nebula", "Majestic", "Buccaneer", "Shamal", "Hydra", "FCR-900", "NRG-500", "HPV1000", "Cement Truck", "Tow Truck", "Fortune",
"Cadrona", "FBI Truck", "Willard", "Forklift", "Tractor", "Combine", "Feltzer", "Remington", "Slamvan", "Blade", "Freight", "Streak",
"Vortex", "Vincent", "Bullet", "Clover", "Sadler", "Firetruck LA", "Hustler", "Intruder", "Primo", "Cargobob", "Tampa", "Sunrise", "Merit",
"Utility", "Nevada", "Yosemite", "Windsor", "Monster A", "Monster B", "Uranus", "Jester", "Sultan", "Stratum", "Elegy", "Raindance",
"RC Tiger", "Flash", "Tahoma", "Savanna", "Bandito", "Freight Flat", "Streak Carriage", "Kart", "Mower", "Dune", "Sweeper", "Broadway",
"Tornado", "AT-400", "DFT-30", "Huntley", "Stafford", "BF-400", "News Van", "Tug", "Trailer 3", "Emperor", "Wayfarer", "Euros", "Hotdog",
"Club", "Freight Carriage", "Trailer 4", "Andromada", "Dodo", "RC Cam", "Launch", "Police Car (LSPD)", "Police Car (SFPD)",
"Police Car (LVPD)", "Police Ranger", "Picador", "S.W.A.T", "Alpha", "Phoenix", "Glendale", "Sadler", "Luggage Trailer A",
"Luggage Trailer B", "Stairs", "Boxville", "Tiller", "Utility Trailer" };

/* -= Enumeradores =- */
enum pInfo
{
	Nivel,
	Sexo,
	Edad,
	Origen,
	Skin,
	Personalidad,
	Signo,
	Aficion,
	TestRol,
	Experiencia,
	Registrado,
	Bloqueo,
	Interior,
	MundoVirtual,
	Dinero,
	Posicion,
	Faccion,
	Rango,
	Admin,
	Busqueda,
	Mascara,
	DNI,
	CBancaria,
	NCBancaria,
	TarjetaCredito,
	DineroBanco,
	Multas,
	RegSAPD,
	Loteria,
	Coche,
	Sangre,
	Tumor,
	Alcoholemia,
	NTelefono,
	TTelefono,
	STelefono,
	Ingles,
	Aleman,
	Frances,
	Italiano,
	Japones,
	Ruso,
	VRentado,
	HeRentado,
	LCoche,
	LVuelo,
	LBote,
	LArmas,
	Herramientas,
	Trabajo,
	CompletadoTrabajo1,
	Lider,
	Premium,
}
new Informacion[MAX_PLAYERS][pInfo];

enum cInfo
{
	cModel,
	Float:cLocationx,
	Float:cLocationy,
	Float:cLocationz,
	Float:cAngle,
	cColorOne,
	cColorTwo,
	cNameD[24],
 	cValue,
	cMod1,
	cMod2,
	cMod3,
	cPaint,
	cVenta,
	cLock,
	cTComprado,
	cGPS,
	cPaintJob,
	cNitro,
	cLlantas,
	cAleron,
	cParachoDelan,
	cParachoTrase,
	cHidraulica,
	cTecho,
	cEscape,
	cParachoDesco,
	cEmbellecedor,
	cEmbellecedor2,
};

new CInformacion[TOTAL_VEH][cInfo];

enum Infoc
{
  	 cModelo,
	 Float:cX,
	 Float:cY,
	 Float:cZ,
	 Float:cA,
	 cColor,
	 cColor2,
	 cFaccion
};
new VehFactionInfo[Infoc];

/* -= Callbacks =- */
public OnPlayerText(playerid, text[])
{
	new string[256];
	if(Linea[playerid] != 255)
	{
		new idx;
		new tmp[256];
		tmp = strtok(text, idx);
		format(string, sizeof(string), "[TELEFONO] %s dice: %s", NombreEx(playerid), text);
		RangoCercano(20.0, playerid, string, BLANCO,BLANCO,BLANCO,BLANCO,BLANCO);
		if(IsPlayerConnected(Linea[playerid]))
		{
		    if(Linea[Linea[playerid]] == playerid)
		    {
				SendClientMessage(Linea[playerid], BLANCO, string);
			}
		}
		return 0;
	}
	if(Entrevistado[playerid] != 255)
	{
	    if(Informacion[playerid][Faccion] == SATV)
		{
			new RangoSATV[64];
			if(Informacion[playerid][Sexo] == 1)
			{
				if(Informacion[playerid][Rango] == 1) { RangoSATV = "Chofer"; }
				else if(Informacion[playerid][Rango] == 2) { RangoSATV = "Tecnica"; }
				else if(Informacion[playerid][Rango] == 3) { RangoSATV = "Critico"; }
				else if(Informacion[playerid][Rango] == 4) { RangoSATV = "Escritor de Esquelas"; }
				else if(Informacion[playerid][Rango] == 5) { RangoSATV = "Escritor de Horoscopos"; }
				else if(Informacion[playerid][Rango] == 6) { RangoSATV = "Columnista Deportivo"; }
				else if(Informacion[playerid][Rango] == 7) { RangoSATV = "Periodista de Investigaci�n"; }
				else if(Informacion[playerid][Rango] == 8) { RangoSATV = "Editor de Revistas"; }
				else if(Informacion[playerid][Rango] == 9) { RangoSATV = "Manager General"; }
				else if(Informacion[playerid][Rango] == 10) { RangoSATV = "Jefe del personal"; }
				else if(Informacion[playerid][Rango] == 11) { RangoSATV = "Ministro de Comunicaci�n"; }
				else { RangoSATV = "Cadete"; }
				format(string, sizeof(string), "[Conexion] %s %s dice: {FFFFFF}%s", RangoSATV, NombreEx(playerid), text);
				SendClientMessageToAll(COLOR_MACHO, string);
			}
			else if(Informacion[playerid][Sexo] == 2)
			{
				if(Informacion[playerid][Rango] == 1) { RangoSATV = "Chofer"; }
				else if(Informacion[playerid][Rango] == 2) { RangoSATV = "Tecnica"; }
				else if(Informacion[playerid][Rango] == 3) { RangoSATV = "Critica"; }
				else if(Informacion[playerid][Rango] == 4) { RangoSATV = "Escritora de Esquelas"; }
				else if(Informacion[playerid][Rango] == 5) { RangoSATV = "Escritora de Horoscopos"; }
				else if(Informacion[playerid][Rango] == 6) { RangoSATV = "Columnista Deportivo"; }
				else if(Informacion[playerid][Rango] == 7) { RangoSATV = "Periodista de Investigaci�n"; }
				else if(Informacion[playerid][Rango] == 8) { RangoSATV = "Editora de Revistas"; }
				else if(Informacion[playerid][Rango] == 9) { RangoSATV = "Manager General"; }
				else if(Informacion[playerid][Rango] == 10) { RangoSATV = "Jefa del personal"; }
				else if(Informacion[playerid][Rango] == 11) { RangoSATV = "Ministra de Comunicaci�n"; }
				else { RangoSATV = "Cadete"; }
				format(string, sizeof(string), "[Conexion] %s %s dice: {FFFFFF}%s", RangoSATV, NombreEx(playerid), text);
				SendClientMessageToAll(COLOR_HEMBRA, string);
			}
		}
	    else if(Informacion[playerid][Faccion] != SATV)
		{
			if(Informacion[playerid][Sexo] == 1)
			{
				format(string, sizeof(string), "[Conexion] Entrevistado %s dice: {FFFFFF}%s", NombreEx(playerid), text);
				SendClientMessageToAll(COLOR_MACHO, string);
			}
			else if(Informacion[playerid][Sexo] == 2)
			{
				format(string, sizeof(string), "[Conexion] Entrevistada %s dice: {FFFFFF}%s", NombreEx(playerid), text);
				SendClientMessageToAll(COLOR_HEMBRA, string);
			}
		}
		return 0;
	}
	if(VozSATV[playerid] == 1)
	{
		new RangoSATV[64];
		if(Informacion[playerid][Sexo] == 1)
		{
			if(Informacion[playerid][Rango] == 1) { RangoSATV = "Chofer"; }
			else if(Informacion[playerid][Rango] == 2) { RangoSATV = "Tecnica"; }
			else if(Informacion[playerid][Rango] == 3) { RangoSATV = "Critico"; }
			else if(Informacion[playerid][Rango] == 4) { RangoSATV = "Escritor de Esquelas"; }
			else if(Informacion[playerid][Rango] == 5) { RangoSATV = "Escritor de Horoscopos"; }
			else if(Informacion[playerid][Rango] == 6) { RangoSATV = "Columnista Deportivo"; }
			else if(Informacion[playerid][Rango] == 7) { RangoSATV = "Periodista de Investigaci�n"; }
			else if(Informacion[playerid][Rango] == 8) { RangoSATV = "Editor de Revistas"; }
			else if(Informacion[playerid][Rango] == 9) { RangoSATV = "Manager General"; }
			else if(Informacion[playerid][Rango] == 10) { RangoSATV = "Jefe del personal"; }
			else if(Informacion[playerid][Rango] == 11) { RangoSATV = "Ministro de Comunicaci�n"; }
			else { RangoSATV = "Cadete"; }
			format(string, sizeof(string), "[Radio] %s %s dice: {FFFFFF}%s", RangoSATV, NombreEx(playerid), text);
			SendClientMessageToAll(COLOR_MACHO, string);
		}
		else if(Informacion[playerid][Sexo] == 2)
		{
			if(Informacion[playerid][Rango] == 1) { RangoSATV = "Chofer"; }
			else if(Informacion[playerid][Rango] == 2) { RangoSATV = "Tecnica"; }
			else if(Informacion[playerid][Rango] == 3) { RangoSATV = "Critica"; }
			else if(Informacion[playerid][Rango] == 4) { RangoSATV = "Escritora de Esquelas"; }
			else if(Informacion[playerid][Rango] == 5) { RangoSATV = "Escritora de Horoscopos"; }
			else if(Informacion[playerid][Rango] == 6) { RangoSATV = "Columnista Deportivo"; }
			else if(Informacion[playerid][Rango] == 7) { RangoSATV = "Periodista de Investigaci�n"; }
			else if(Informacion[playerid][Rango] == 8) { RangoSATV = "Editora de Revistas"; }
			else if(Informacion[playerid][Rango] == 9) { RangoSATV = "Manager General"; }
			else if(Informacion[playerid][Rango] == 10) { RangoSATV = "Jefa del personal"; }
			else if(Informacion[playerid][Rango] == 11) { RangoSATV = "Ministra de Comunicaci�n"; }
			else { RangoSATV = "Cadete"; }
			format(string, sizeof(string), "[Radio] %s %s dice: {FFFFFF}%s", RangoSATV, NombreEx(playerid), text);
			SendClientMessageToAll(COLOR_HEMBRA, string);
		}
  		return 0;
	}
	if(VozMegafono[playerid] == 1)
	{
		if(Informacion[playerid][Faccion] == SAPD)
		{
			new RangoSAPD[64];
			if(Informacion[playerid][Rango] == 1) { RangoSAPD = "Guardia de Seguridad"; }
			else if(Informacion[playerid][Rango] == 2) { RangoSAPD = "Cadete"; }
			else if(Informacion[playerid][Rango] == 3) { RangoSAPD = "Oficial de Patrulla"; }
			else if(Informacion[playerid][Rango] == 4) { RangoSAPD = "Sargento de Oficinas"; }
			else if(Informacion[playerid][Rango] == 5) { RangoSAPD = "Patrulla Antivicio"; }
			else if(Informacion[playerid][Rango] == 6) { RangoSAPD = "Inspector"; }
			else if(Informacion[playerid][Rango] == 7) { RangoSAPD = "Teniente"; }
			else if(Informacion[playerid][Rango] == 8) { RangoSAPD = "Jefe de Operaci�nes"; }
			else if(Informacion[playerid][Rango] == 9) { RangoSAPD = "Jefe de Policia"; }
			else if(Informacion[playerid][Rango] == 10) { RangoSAPD = "Ministro de Seguridad"; }
			else { RangoSAPD = "Cadete"; }
			format(string, sizeof(string), "{CE6062}[MEGAFONO] %s %s dice: {FFFFFF}%s", RangoSAPD, NombreEx(playerid), text);
			RangoCercano(55, playerid, string, BLANCO, BLANCO, BLANCO, BLANCO, BLANCO);
		}
		else if(Informacion[playerid][Faccion] == SAMD)
		{
			new RangoSAMD[64];
			if(Informacion[playerid][Rango] == 1) { RangoSAMD = "Auxiliar medico de Urgencias"; }
			else if(Informacion[playerid][Rango] == 2) { RangoSAMD = "Paramedico"; }
			else if(Informacion[playerid][Rango] == 3) { RangoSAMD = "Enfermero"; }
			else if(Informacion[playerid][Rango] == 4) { RangoSAMD = "Interno"; }
			else if(Informacion[playerid][Rango] == 5) { RangoSAMD = "Residente"; }
			else if(Informacion[playerid][Rango] == 6) { RangoSAMD = "Medico de Cabezera"; }
			else if(Informacion[playerid][Rango] == 7) { RangoSAMD = "Especialista"; }
			else if(Informacion[playerid][Rango] == 8) { RangoSAMD = "Cirujano"; }
			else if(Informacion[playerid][Rango] == 9) { RangoSAMD = "Jefe del Personal"; }
			else if(Informacion[playerid][Rango] == 10) { RangoSAMD = "Ministro de Salud"; }
			else { RangoSAMD = "Cadete"; }
			format(string, sizeof(string), "{CE6062}[MEGAFONO] %s %s dice: {FFFFFF}%s", RangoSAMD, NombreEx(playerid), text);
			RangoCercano(55, playerid, string, BLANCO, BLANCO, BLANCO, BLANCO, BLANCO);
		}
		return 0;
	}
	if(TransmisionGobierno[playerid] == 1)
	{
		if(Informacion[playerid][Faccion] == SAPD)
		{
		    new RangoSAPD[64];
			if(Informacion[playerid][Rango] == 10) { RangoSAPD = "Ministro de Seguridad"; }
			else { RangoSAPD = "Cadete"; }
			format(string, sizeof(string), "{909FBE}[SAPD]> %s %s: {FFFFFF}%s", RangoSAPD, NombreEx(playerid), text);
			SendClientMessageToAll(BLANCO, string);
		}
		return 0;
	}
	if(ChatGeneral)
	{
		ChatsIngresados += 1;
		if(TieneMascara[playerid] == 1)
		{
			format(string, sizeof(string), "Desconocido dice: %s", text);
			RangoCercano(20.0, playerid, string, BLANCO,BLANCO,BLANCO,BLANCO,BLANCO);
		}
		else if(TieneMascara[playerid] == 0)
		{
			format(string, sizeof(string), "%s dice: %s", NombreEx(playerid), text);
			RangoCercano(20.0, playerid, string, BLANCO,BLANCO,BLANCO,BLANCO,BLANCO);
		}
		return 0;
	}
	return 1;
}

public OnPlayerEnterCheckpoint(playerid)
{
	if(PasosTrabajo[playerid] == 1)
	{
		GameTextForPlayer(playerid, "~w~Cargando...", 10000, 4);
		SendClientMessage(playerid, PURPURA, "Espera 10 segundos hasta que se carge el deposito de tu vehiculo");
		SetTimerEx("CargandoProductos", 10000, false, "i", playerid);
		TogglePlayerControllable(playerid, CONGELADO);
		DisablePlayerCheckpoint(playerid);
	}
	if(PasosTrabajo[playerid] == 2)
	{
		GameTextForPlayer(playerid, "~w~Cargando...", 10000, 4);
		SendClientMessage(playerid, PURPURA, "Espera 10 segundos hasta que se se almacenen los 100 productos en la tienda");
		SetTimerEx("CargandoProductos2", 10000, false, "i", playerid);
		TogglePlayerControllable(playerid, CONGELADO);
		DisablePlayerCheckpoint(playerid);
	}
	if(PasosTrabajo[playerid] == 3)
	{
		GameTextForPlayer(playerid, "~w~Cargando...", 10000, 4);
		SendClientMessage(playerid, PURPURA, "Espera 10 segundos hasta que se se almacenen los 100 productos en la tienda");
		SetTimerEx("CargandoProductos3", 10000, false, "i", playerid);
		TogglePlayerControllable(playerid, CONGELADO);
		DisablePlayerCheckpoint(playerid);
	}
	if(PasosTrabajo[playerid] == 4)
	{
		GameTextForPlayer(playerid, "~w~Cargando...", 10000, 4);
		SendClientMessage(playerid, PURPURA, "Espera 10 segundos hasta que se se almacenen los 100 productos en la tienda");
		SetTimerEx("CargandoProductos4", 10000, false, "i", playerid);
		TogglePlayerControllable(playerid, CONGELADO);
		DisablePlayerCheckpoint(playerid);
	}
	if(PasosTrabajo[playerid] == 5)
	{
		SetVehicleToRespawn(GetPlayerVehicleID(playerid));
		TogglePlayerControllable(playerid, DESCONGELADO);
		SendClientMessage(playerid, VERDE, "�Felicidades!, has completado el trabajo, has ganado $1000");
		PasosTrabajo[playerid] = 0;
		GivePlayerMoney(playerid, 1000);
		Informacion[playerid][CompletadoTrabajo1] = 1;
	}
	return 1;
}

public OnPlayerStateChange(playerid,newstate,oldstate)
{
	new vehiculo = GetPlayerVehicleID(playerid);
	new vehicleid = GetPlayerVehicleID(playerid);
	GetVehicleParamsEx(vehiculo, engine, lights, alarm, doors, bonnet, boot, objective);
	new string[256];
	if(newstate == PLAYER_STATE_ONFOOT)
	{
		BloquearVelocimetro[playerid] = 1;
		TextDrawHideForPlayer(playerid,Text:Velocimetro_Box[playerid]);
	   	TextDrawHideForPlayer(playerid,Text:Velocimetro_Vel[playerid]);
	    TextDrawHideForPlayer(playerid,Text:Velocimetro_HP[playerid]);
		TextDrawHideForPlayer(playerid,Text:Velocimetro_GAS[playerid]);
		HideProgressBarForPlayer(playerid, CarHealth[playerid]);
	    HideProgressBarForPlayer(playerid, CarGasoil[playerid]);
		if(PasosTrabajo[playerid] != 0)
		{
		    SendClientMessage(playerid, GRIS, "Has cancelado el trabajo por salir del vehiculo");
		    SetVehicleToRespawn(GetPlayerVehicleID(playerid));
			TogglePlayerControllable(playerid, DESCONGELADO);
			PasosTrabajo[playerid] = 0;
		}
  		if(ModoServicioTAXI[playerid] > 0)
		{
			ModoServicioTAXI[playerid] = 0;
			format(string, sizeof(string), "* Est�s fuera de servicio y has ganado en total: $%d.", TransportMoney[playerid]);
			SendClientMessage(playerid, GRIS, string);
			GivePlayerMoney(playerid, TransportMoney[playerid]);
			ConsumingMoney[playerid] = 1; ValorTransporte[playerid] = 0; TransportMoney[playerid] = 0;
		    TextDrawHideForPlayer(playerid, Text: Taxi_Box);
		    TextDrawHideForPlayer(playerid, Text: Taxi_Leter[playerid]);
			TextDrawHideForPlayer(playerid, Text:Taxi_Titulo);
		}
		if(CostoTAXI[playerid] > 0 && ConductorTAXI[playerid] < 999)
		{
		    if(IsPlayerConnected(ConductorTAXI[playerid]))
			{
			    TransportMoney[ConductorTAXI[playerid]] += CostoTAXI[playerid];
			    TiempoViaje[ConductorTAXI[playerid]] = 0;
			    CostoTAXI[ConductorTAXI[playerid]] = 0;
			    format(string, sizeof(string), "~w~El viaje costo~n~~r~$%d",CostoTAXI[playerid]);
			    GameTextForPlayer(playerid, string, 5000, 1);
			    format(string, sizeof(string), "~w~El pasajero ha bajado~n~~g~Obtenido: $%d",CostoTAXI[playerid]);
			    GameTextForPlayer(ConductorTAXI[playerid], string, 5000, 4);
				GivePlayerMoney(playerid, -CostoTAXI[playerid]);
				CostoTAXI[playerid] = 0;
				TiempoViaje[playerid] = 0;
				ConductorTAXI[playerid] = 999;
				TextDrawHideForPlayer(ConductorTAXI[playerid], Taxi_Box);
				TextDrawHideForPlayer(ConductorTAXI[playerid], Taxi_Leter[playerid]);
			    TextDrawHideForPlayer(playerid, Text: Taxi_Box);
			    TextDrawHideForPlayer(playerid, Text: Taxi_Leter[playerid]);
				TextDrawHideForPlayer(playerid, Text:Taxi_Titulo);
			}
		}
	}
	if(newstate == PLAYER_STATE_PASSENGER)
	{
		BloquearVelocimetro[playerid] = 1;
		TextDrawHideForPlayer(playerid,Text:Velocimetro_Box[playerid]);
	   	TextDrawHideForPlayer(playerid,Text:Velocimetro_Vel[playerid]);
	    TextDrawHideForPlayer(playerid,Text:Velocimetro_HP[playerid]);
		TextDrawHideForPlayer(playerid,Text:Velocimetro_GAS[playerid]);
		HideProgressBarForPlayer(playerid, CarHealth[playerid]);
	    HideProgressBarForPlayer(playerid, CarGasoil[playerid]);
		new name[MAX_PLAYER_NAME];
	    GetPlayerName(playerid, name, sizeof(name));
	    for(new i = 0; i < MAX_PLAYERS; i++)
	    {
	        if(IsPlayerConnected(i))
	        {
	            if(IsPlayerInVehicle(i, vehicleid) && GetPlayerState(i) == 2 && ModoServicioTAXI[i] > 0)
	            {
	                if(GetPlayerMoney(playerid) < ValorTransporte[i])
	                {
	                    format(string, sizeof(string), "* Lo siento, necesitas $%d para entrar al Taxi", ValorTransporte[i]);
						SendClientMessage(playerid, GRIS, string);
						RemovePlayerFromVehicle(playerid);
	                }
	                else
	                {
	                    if(ModoServicioTAXI[i] == 1)
	                    {
	                        format(string, sizeof(string), "* Has pagado $%d al conductor de taxi.", ValorTransporte[i]);
							SendClientMessage(playerid, VERDE, string);
							format(string, sizeof(string), "* El pasajero %s ha entrado al taxi.", name);
							SendClientMessage(i, VERDE, string);
							TiempoViaje[i] = 1;
	                    	TiempoViaje[playerid] = 1;
	                    	CostoTAXI[playerid] = ValorTransporte[i];
	                    	CostoTAXI[i] = ValorTransporte[i];
	                    	ConductorTAXI[playerid] = i;
	                    }
	                    else if(ModoServicioTAXI[i] == 2)
	                    {
	                        format(string, sizeof(string), "* Has pagado $%d al conductor de bus.", ValorTransporte[i]);
							SendClientMessage(playerid, VERDE, string);
							format(string, sizeof(string), "* El pasajero %s ha entrado al bus.", name);
							SendClientMessage(i, VERDE, string);
							TiempoViaje[i] = 1;
	                    	TiempoViaje[playerid] = 1;
	                    	CostoTAXI[playerid] = ValorTransporte[i];
	                    	CostoTAXI[i] = ValorTransporte[i];
	                    	ConductorTAXI[playerid] = i;
				       }
						GivePlayerMoney(playerid, - ValorTransporte[i]);
						TransportMoney[i] += ValorTransporte[i];
	                }
	            }
	        }
	    }
	}
	if(newstate == PLAYER_STATE_DRIVER)
	{
		if(VehiculosVenta(vehiculo))
		{
		    if(CInformacion[vehiculo][cVenta] != 1)
		    {
				new GPSs[64];
				if(CInformacion[vehiculo][cGPS] == 0) { GPSs = "No"; }
				else if(CInformacion[vehiculo][cGPS] == 1) { GPSs = "Si"; }
				else { GPSs = "Quizas"; }
			    TogglePlayerControllable(playerid, CONGELADO);
				format(string, sizeof(string), "~g~Modelo: ~w~%s~n~~g~Matricula: ~w~%d~n~~g~GPS: ~w~%s", VehicleName[GetVehicleModel(vehiculo)-400], CarMatricula[vehiculo], GPSs);
				TextDrawSetString(Text:V_TEXT[playerid], string);
				TextDrawShowForPlayer(playerid, Text:V_BOX);
				TextDrawShowForPlayer(playerid, Text:V_TITLE);
				TextDrawShowForPlayer(playerid, Text:V_TEXT[playerid]);
				TextDrawShowForPlayer(playerid, Text:V_ANUNCIO);
				SendClientMessage(playerid, VERDE, "Para salir del vehiculo utiliza /salirveh");
			}
		}
		if(VehiculosSAPD(vehicleid))
		{
			if(Informacion[playerid][Faccion] != SAPD)
			{
				SendClientMessage(playerid, GRIS, "Lo siento, no puedes utilizar este coche porque no pertenece a tu faccion");
				SendClientMessage(playerid, AMARILLO, "Has cometido un crimen: {FFFFFF}Intento de robo de vehiculo gobernamental");
				Informacion[playerid][Busqueda] = 2;
				SetPlayerWantedLevel(playerid, 2);
	            RemovePlayerFromVehicle(playerid);
				TogglePlayerControllable(playerid, DESCONGELADO);
          		return 1;
		    }
		}
 		if(VehiculosSAMD(vehicleid))
		{
			if(Informacion[playerid][Faccion] != SAMD)
			{
				SendClientMessage(playerid, GRIS, "Lo siento, no puedes utilizar este coche porque no pertenece a tu faccion");
				SendClientMessage(playerid, AMARILLO, "Has cometido un crimen: {FFFFFF}Intento de robo de vehiculo gobernamental");
				Informacion[playerid][Busqueda] = 2;
				SetPlayerWantedLevel(playerid, 2);
	            RemovePlayerFromVehicle(playerid);
				TogglePlayerControllable(playerid, DESCONGELADO);
          		return 1;
		    }
		}
 		if(VehiculosSAGO(vehicleid))
		{
			if(Informacion[playerid][Faccion] != PRES)
			{
				SendClientMessage(playerid, GRIS, "Lo siento, no puedes utilizar este coche porque no pertenece a tu faccion");
				SendClientMessage(playerid, AMARILLO, "Has cometido un crimen: {FFFFFF}Intento de robo de vehiculo gobernamental");
				Informacion[playerid][Busqueda] = 2;
				SetPlayerWantedLevel(playerid, 2);
	            RemovePlayerFromVehicle(playerid);
				TogglePlayerControllable(playerid, DESCONGELADO);
          		return 1;
		    }
		}
 		if(VehiculosTAXI(vehicleid))
		{
			if(Informacion[playerid][Faccion] != TAXI)
			{
				SendClientMessage(playerid, GRIS, "Lo siento, no puedes utilizar este coche porque no pertenece a tu faccion");
	            RemovePlayerFromVehicle(playerid);
				TogglePlayerControllable(playerid, DESCONGELADO);
          		return 1;
		    }
		}
 		if(VehiculosSATV(vehicleid))
		{
			if(Informacion[playerid][Faccion] != SATV)
			{
				SendClientMessage(playerid, GRIS, "Lo siento, no puedes utilizar este coche porque no pertenece a tu faccion");
	            RemovePlayerFromVehicle(playerid);
				TogglePlayerControllable(playerid, DESCONGELADO);
          		return 1;
		    }
		}
		if(VehiculosJOB1(vehicleid))
		{
			if(Informacion[playerid][Trabajo] != 1 )
			{
				RemovePlayerFromVehicle(playerid);
				TogglePlayerControllable(playerid, DESCONGELADO);
				SendClientMessage(playerid, GRIS, "Lo siento, usted no tiene el trabajo de repartidor");
			}
			else if(Informacion[playerid][CompletadoTrabajo1] == 1)
			{
				RemovePlayerFromVehicle(playerid);
				TogglePlayerControllable(playerid, DESCONGELADO);
				SendClientMessage(playerid, GRIS, "Lo siento, ya has echo una entrega por hoy, espera hasta el siguiente payday");
			}
			else
			{
				ShowPlayerDialog(playerid, EJob1, DIALOG_STYLE_MSGBOX, " ","{FFFFFF}�Deseas empezar a repartir productos a los 24/7?","Si","No");
			}
			return 1;
		}
 		if(VehiculosMECA(vehicleid))
		{
			if(Informacion[playerid][Faccion] != MECA)
			{
				SendClientMessage(playerid, GRIS, "Lo siento, no puedes utilizar este coche porque no pertenece a tu faccion");
	            RemovePlayerFromVehicle(playerid);
				TogglePlayerControllable(playerid, DESCONGELADO);
          		return 1;
		    }
		}
 		if(VehiculosLICE(vehicleid))
		{
			if(Informacion[playerid][Faccion] != LICE && LeccionIniciada[playerid] == 0)
			{
				SendClientMessage(playerid, GRIS, "Lo siento, no puedes utilizar este coche porque no pertenece a tu faccion");
	            RemovePlayerFromVehicle(playerid);
				TogglePlayerControllable(playerid, DESCONGELADO);
          		return 1;
		    }
		}
 		if(engine == VEHICLE_PARAMS_OFF || engine == VEHICLE_PARAMS_UNSET)
        {
		    SendClientMessage(playerid, BLANCO, "El motor del vehiculo se encuentra apagado, manten presionado el bot�n {FF0000}2 {FFFFFF}para encenderlo. ");
        }
        if(engine == VEHICLE_PARAMS_ON)
        {
            SendClientMessage(playerid, AMARILLO, "�El motor del vehiculo ya se encuentra encendido!");
        }
		if(VehiculoEmbargado[GetPlayerVehicleID(playerid)] == 1)
		{
			new DialogText[968];
			strcat(DialogText, "{FEB800}* * * -= {FFFFFF}San Andreas State {FEB800}=- * * *\n\n");
			strcat(DialogText, "{FFFFFF}Lo siento, este vehiculo se encuentra embargado por el estado de San Andreas\n");
			strcat(DialogText, "{FFFFFF}La causa puede asimilarse por faltas de pagos o deudas hacia el estado\n");
			strcat(DialogText, "{FFFFFF}Si necesitas mas informaci�n comuniquese al 551-3264\n");
			ShowPlayerDialog(playerid, Embargado, DIALOG_STYLE_MSGBOX, " ", DialogText, "Aceptar", "");
		    TogglePlayerControllable(playerid, 0);
		}
	 	if(VehiculosRENT(vehicleid))
		{
	        if(Informacion[playerid][HeRentado] == 0)
 			{
		 		if(Rentado[GetPlayerVehicleID(playerid)] == 0)
		 		{
					Rentable[GetPlayerVehicleID(playerid)] = 1;
					ShowPlayerDialog(playerid, RentaVehiculo, DIALOG_STYLE_MSGBOX, " ", "{FFFFFF}�Quieres rentar este vehiculo por $200?", "Rentar", "Cancelar");
				}
			}
			else
			{
			    if(Informacion[playerid][VRentado] != GetPlayerVehicleID(playerid))
			    {
				    SendClientMessage(playerid, GRIS, "Ya tienes un vehiculo rentado! Si quieres otro entra en tu vehiculo rentado y usa /vdesrentar.");
				    RemovePlayerFromVehicle(playerid);
			    }
			}
			if(Rentado[GetPlayerVehicleID(playerid)] == 1)
			{
				if(Informacion[playerid][VRentado] != GetPlayerVehicleID(playerid))
				{
				    SendClientMessage(playerid, GRIS, "El veh�culo est� rentado por otra persona!");
				    RemovePlayerFromVehicle(playerid);
				}
				else
				{
				    if(engine == VEHICLE_PARAMS_OFF || engine == VEHICLE_PARAMS_UNSET)
			        {
			        	SendClientMessage(playerid, BLANCO, "El motor del vehiculo se encuentra apagado, manten presionado el bot�n {FF0000}2 {FFFFFF}para encenderlo.");
					}
					else if(engine == VEHICLE_PARAMS_ON)
					{
					    SendClientMessage(playerid, AMARILLO, "El motor ya esta encendido, utiliza /vcontrol y selecciona �-> Apagar Motor�.");
					}
				    SendClientMessage(playerid, BLANCO, "Siempre que desees desrentar el auto usa /vdesrentar.");
				}
			}
		}
		return 1;
	}
	return 1;
}

public OnPlayerConnect(playerid)
{
	CargarDatos(playerid);
	ConexionesEntrantes += 1;
 	Conexion[playerid] = 1;
 	TazerMano[playerid] = 0;
	JugadorEsposado[playerid] = 0;
	BloqueoWhispeos[playerid] = 0;
	AntiBug[playerid] = 0;
	Motor[playerid] = 0;
	MotorZ[playerid] = 0;
	TieneMascara[playerid] = 0;
	PedidoRefuerzos[playerid] = 0;
	TransmisionGobierno[playerid] = 0;
 	EmisorMulta[playerid] = 999;
	PrecioMulta[playerid] = 0;
 	EmisorDNI[playerid] = 999;
	PrecioDNI[playerid] = 0;
	OfertaCoche[playerid] = 999;
	PrecioCoche[playerid] = 0;
	IDcCoche[playerid] = 9999;
	Shock[playerid] = 0;
	ServicioSAMD[playerid] = 0;
	ModoServicioTAXI[playerid] = 0;
	ValorTransporte[playerid] = 0;
	TransportMoney[playerid] = 0;
	ConsumingMoney[playerid] = 0;
	TiempoViaje[playerid] = 0;
	CostoTAXI[playerid] = 0;
	ConductorTAXI[playerid] = 999;
	VozSATV[playerid] = 0;
	ProgresoReparacion[playerid] = 0;
    IDReporte[playerid] = 999;
	Entrevistado[playerid] = 255;
	OfreserEntrevista[playerid] = 999;
	SetPlayerColor(playerid, FLUOR);
	Linea[playerid] = 255;
	Informacion[playerid][VRentado] = 0;
	Informacion[playerid][HeRentado]= 0;
	RepairOffer[playerid] = 999;
	RepairPrice[playerid] = 0;
	GanzuaOferta[playerid] = 999;
	GanzuaPrecio[playerid] = 0;
	GanzuaCantidad[playerid] = 0;
	BloquearVelocimetro[playerid] = 0;
	PasosTrabajo[playerid] = 0;
	ActivarCheckeador[playerid] = 0;
	
	V_BOX = TextDrawCreate(479.000000,366.000000,"a");
	V_TITLE = TextDrawCreate(307.000000,364.000000,"~y~-= ~w~Los Santos Vehicle Shop~y~=-");
	V_TEXT[playerid] = TextDrawCreate(285.000000,382.000000,"~g~Modelo: ~w~Cheetath~n~~g~Matricula: ~w~9999~n~~g~Modificaciones: ~w~SI");
	V_ANUNCIO = TextDrawCreate(286.000000,428.000000,"~w~Para adquirirlo consulte con un ~b~SA:GOB");
	TextDrawUseBox(V_BOX,1);
	TextDrawBoxColor(V_BOX,0x00000066);
	TextDrawTextSize(V_BOX,278.000000,0.000000);
	TextDrawAlignment(V_BOX,0);
	TextDrawAlignment(V_TITLE,0);
	TextDrawAlignment(V_TEXT[playerid],0);
	TextDrawAlignment(V_ANUNCIO,0);
	TextDrawBackgroundColor(V_BOX,0x000000ff);
	TextDrawBackgroundColor(V_TITLE,0x000000ff);
	TextDrawBackgroundColor(V_TEXT[playerid],0x000000ff);
	TextDrawBackgroundColor(V_ANUNCIO,0x000000ff);
	TextDrawFont(V_BOX,3);
	TextDrawLetterSize(V_BOX,-0.000000,8.600002);
	TextDrawFont(V_TITLE,2);
	TextDrawLetterSize(V_TITLE,0.199999,1.100000);
	TextDrawFont(V_TEXT[playerid],2);
	TextDrawLetterSize(V_TEXT[playerid],0.299999,1.400000);
	TextDrawFont(V_ANUNCIO,2);
	TextDrawLetterSize(V_ANUNCIO,0.199999,1.000000);
	TextDrawColor(V_BOX,0xffffffff);
	TextDrawColor(V_TITLE,0xffffffff);
	TextDrawColor(V_TEXT[playerid],0xffffffff);
	TextDrawColor(V_ANUNCIO,0xffffffff);
	TextDrawSetOutline(V_BOX,1);
	TextDrawSetOutline(V_TITLE,1);
	TextDrawSetOutline(V_TEXT[playerid],1);
	TextDrawSetOutline(V_ANUNCIO,1);
	TextDrawSetProportional(V_BOX,1);
	TextDrawSetProportional(V_TITLE,1);
	TextDrawSetProportional(V_TEXT[playerid],1);
	TextDrawSetProportional(V_ANUNCIO,1);
	TextDrawSetShadow(V_BOX,1);
	TextDrawSetShadow(V_TITLE,1);
	TextDrawSetShadow(V_TEXT[playerid],1);
	TextDrawSetShadow(V_ANUNCIO,1);

	RepairConexion[playerid] = CreateProgressBar(473.00, 145.00, 134.50, 3.50, 11206911, 100.0);
	Repair_Box = TextDrawCreate(618.000000,113.000000,"a");
	Repair_Text = TextDrawCreate(500.000000,118.000000,"Reparando...");
	TextDrawUseBox(Repair_Box,1);
	TextDrawBoxColor(Repair_Box,0x00000066);
	TextDrawTextSize(Repair_Box,463.000000,0.000000);
	TextDrawAlignment(Repair_Box,0);
	TextDrawAlignment(Repair_Text,0);
	TextDrawBackgroundColor(Repair_Box,0x000000ff);
	TextDrawBackgroundColor(Repair_Text,0x000000ff);
	TextDrawFont(Repair_Box,3);
	TextDrawLetterSize(Repair_Box,-0.000000,5.499999);
	TextDrawFont(Repair_Text,2);
	TextDrawLetterSize(Repair_Text,0.299999,1.400000);
	TextDrawColor(Repair_Box,0xffffffff);
	TextDrawColor(Repair_Text,0xffffffff);
	TextDrawSetOutline(Repair_Box,1);
	TextDrawSetOutline(Repair_Text,1);
	TextDrawSetProportional(Repair_Box,1);
	TextDrawSetProportional(Repair_Text,1);
	TextDrawSetShadow(Repair_Box,1);
	TextDrawSetShadow(Repair_Text,1);

	Taxi_Box = TextDrawCreate(632.000000,276.000000,"a");
	Taxi_Titulo = TextDrawCreate(497.000000,274.000000,"~y~] ~w~Transporte ~y~]");
	Taxi_Leter[playerid] = TextDrawCreate(483.000000,306.000000,"~g~Chofer: ~w~Jack_Kennedy~n~~g~Linea: ~w~1111~n~~g~Tarifa: ~w~$25~n~~g~Tiempo: ~w~10/10~n~~g~Gasto: ~w~$9999");
	TextDrawUseBox(Taxi_Box,1);
	TextDrawBoxColor(Taxi_Box,0x00000066);
	TextDrawTextSize(Taxi_Box,474.000000,0.000000);
	TextDrawAlignment(Taxi_Box,0);
	TextDrawAlignment(Taxi_Titulo,0);
	TextDrawAlignment(Taxi_Leter[playerid],0);
	TextDrawBackgroundColor(Taxi_Box,0x000000ff);
	TextDrawBackgroundColor(Taxi_Titulo,0x000000ff);
	TextDrawBackgroundColor(Taxi_Leter[playerid],0x000000ff);
	TextDrawFont(Taxi_Box,3);
	TextDrawLetterSize(Taxi_Box,0.000000,8.999988);
	TextDrawFont(Taxi_Titulo,0);
	TextDrawLetterSize(Taxi_Titulo,0.499999,1.600000);
	TextDrawFont(Taxi_Leter[playerid],2);
	TextDrawLetterSize(Taxi_Leter[playerid],0.199999,1.000000);
	TextDrawColor(Taxi_Box,0xffffffff);
	TextDrawColor(Taxi_Titulo,0xffffffff);
	TextDrawColor(Taxi_Leter[playerid],0xffffffff);
	TextDrawSetOutline(Taxi_Box,1);
	TextDrawSetOutline(Taxi_Titulo,1);
	TextDrawSetOutline(Taxi_Leter[playerid],1);
	TextDrawSetProportional(Taxi_Box,1);
	TextDrawSetProportional(Taxi_Titulo,1);
	TextDrawSetProportional(Taxi_Leter[playerid],1);
	TextDrawSetShadow(Taxi_Box,1);
	TextDrawSetShadow(Taxi_Titulo,1);
	TextDrawSetShadow(Taxi_Leter[playerid],1);
	
	M_Fondo = TextDrawCreate(373.000000,369.000000,"a");
	M_Fondo2 = TextDrawCreate(372.000000,371.000000,"a");
	M_Titulo = TextDrawCreate(223.000000,369.000000,"~y~San Andreas City");
	M_Texto[playerid] = TextDrawCreate(251.000000,393.000000,"1111");
	TextDrawUseBox(M_Fondo,1);
	TextDrawBoxColor(M_Fondo,0xffffff66);
	TextDrawTextSize(M_Fondo,188.000000,0.000000);
	TextDrawUseBox(M_Fondo2,1);
	TextDrawBoxColor(M_Fondo2,0x00000099);
	TextDrawTextSize(M_Fondo2,189.000000,1.000000);
	TextDrawAlignment(M_Fondo,0);
	TextDrawAlignment(M_Fondo2,0);
	TextDrawAlignment(M_Titulo,0);
	TextDrawAlignment(M_Texto[playerid],0);
	TextDrawBackgroundColor(M_Fondo,0x000000ff);
	TextDrawBackgroundColor(M_Fondo2,0x000000ff);
	TextDrawBackgroundColor(M_Titulo,0x000000ff);
	TextDrawBackgroundColor(M_Texto[playerid],0x000000ff);
	TextDrawFont(M_Fondo,3);
	TextDrawLetterSize(M_Fondo,-0.000000,7.499998);
	TextDrawFont(M_Fondo2,3);
	TextDrawLetterSize(M_Fondo2,-0.000000,7.000000);
	TextDrawFont(M_Titulo,0);
	TextDrawLetterSize(M_Titulo,0.499999,1.800000);
	TextDrawFont(M_Texto[playerid],3);
	TextDrawLetterSize(M_Texto[playerid],0.699999,2.699999);
	TextDrawColor(M_Fondo,0xffffffff);
	TextDrawColor(M_Fondo2,0xffffffff);
	TextDrawColor(M_Titulo,0xffffffff);
	TextDrawColor(M_Texto[playerid],0xffffffff);
	TextDrawSetOutline(M_Fondo,1);
	TextDrawSetOutline(M_Fondo2,1);
	TextDrawSetOutline(M_Titulo,1);
	TextDrawSetOutline(M_Texto[playerid],1);
	TextDrawSetProportional(M_Fondo,1);
	TextDrawSetProportional(M_Fondo2,1);
	TextDrawSetProportional(M_Titulo,1);
	TextDrawSetProportional(M_Texto[playerid],1);
	TextDrawSetShadow(M_Fondo,1);
	TextDrawSetShadow(M_Fondo2,1);
	TextDrawSetShadow(M_Titulo,1);
	TextDrawSetShadow(M_Texto[playerid],1);
  	TextDrawAlignment(Tutorial[1][playerid],2);
	Tutorial[0][playerid] = TextDrawCreate(321.000000,66.000000,"Binco de LS");
	Tutorial[1][playerid] = TextDrawCreate(316.000000,99.000000,"En el binco podras cambiar tus ropas iniciales");
	Tutorial[2][playerid] = TextDrawCreate(316.000000,114.000000,"Podras cambiar tus ropas usando /ropas");
	Tutorial[3][playerid] = TextDrawCreate(321.000000,131.000000,"Recuerda que tambien la vestimensta tiene su precio");
	TextDrawAlignment(Tutorial[0][playerid],2);
	TextDrawAlignment(Tutorial[1][playerid],2);
	TextDrawAlignment(Tutorial[2][playerid],2);
	TextDrawAlignment(Tutorial[3][playerid],2);
	TextDrawBackgroundColor(Tutorial[0][playerid],0x000000ff);
	TextDrawBackgroundColor(Tutorial[1][playerid],0x000000ff);
	TextDrawBackgroundColor(Tutorial[2][playerid],0x000000ff);
	TextDrawBackgroundColor(Tutorial[3][playerid],0x000000ff);
	TextDrawFont(Tutorial[0][playerid],0);
	TextDrawLetterSize(Tutorial[0][playerid],0.899999,2.499999);
	TextDrawFont(Tutorial[1][playerid],2);
	TextDrawLetterSize(Tutorial[1][playerid],0.299999,1.600000);
	TextDrawFont(Tutorial[2][playerid],2);
	TextDrawLetterSize(Tutorial[2][playerid],0.299999,1.700000);
	TextDrawFont(Tutorial[3][playerid],2);
	TextDrawLetterSize(Tutorial[3][playerid],0.299999,1.700000);
	TextDrawColor(Tutorial[0][playerid],0xffffffff);
	TextDrawColor(Tutorial[1][playerid],0xffffffff);
	TextDrawColor(Tutorial[2][playerid],0xffffffff);
	TextDrawColor(Tutorial[3][playerid],0xffffffff);
	TextDrawSetOutline(Tutorial[0][playerid],1);
	TextDrawSetOutline(Tutorial[1][playerid],1);
	TextDrawSetOutline(Tutorial[2][playerid],1);
	TextDrawSetOutline(Tutorial[3][playerid],1);
	TextDrawSetProportional(Tutorial[0][playerid],1);
	TextDrawSetProportional(Tutorial[1][playerid],1);
	TextDrawSetProportional(Tutorial[2][playerid],1);
	TextDrawSetProportional(Tutorial[3][playerid],1);
	TextDrawSetShadow(Tutorial[0][playerid],1);
	TextDrawSetShadow(Tutorial[1][playerid],1);
	TextDrawSetShadow(Tutorial[2][playerid],1);
	TextDrawSetShadow(Tutorial[3][playerid],1);
	CarHealth[playerid] = CreateProgressBar(484.00, 390.00, 122.50, 3.50, -16776961, 100.0);
	CarGasoil[playerid] = CreateProgressBar(485.00, 404.00, 118.50, 3.20, -1029514582, 100.0);
	CarMotor[playerid] = CreateProgressBar(485.00, 431.00, 135.50, 3.20, -21495553, 100.0);
	Velocimetro_Box[playerid] = TextDrawCreate(632.000000,366.000000,"a");
	Velocimetro_Vel[playerid] = TextDrawCreate(583.000000,365.000000,"300 km/h");
	Velocimetro_HP[playerid] = TextDrawCreate(613.000000,386.000000,"HP");
	Velocimetro_GAS[playerid] = TextDrawCreate(609.000000,400.000000,"gas");
	TextDrawUseBox(Velocimetro_Box[playerid],1);
	TextDrawBoxColor(Velocimetro_Box[playerid],0x00000066);
	TextDrawTextSize(Velocimetro_Box[playerid],474.000000,2.000000);
	TextDrawAlignment(Velocimetro_Box[playerid],0);
	TextDrawAlignment(Velocimetro_Vel[playerid],0);
	TextDrawAlignment(Velocimetro_HP[playerid],0);
	TextDrawAlignment(Velocimetro_GAS[playerid],0);
	TextDrawBackgroundColor(Velocimetro_Box[playerid],0x000000ff);
	TextDrawBackgroundColor(Velocimetro_Vel[playerid],0x000000ff);
	TextDrawBackgroundColor(Velocimetro_HP[playerid],0x000000ff);
	TextDrawBackgroundColor(Velocimetro_GAS[playerid],0x000000ff);
	TextDrawFont(Velocimetro_Box[playerid],3);
	TextDrawLetterSize(Velocimetro_Box[playerid],-0.000000,5.799999);
	TextDrawFont(Velocimetro_Vel[playerid],2);
	TextDrawLetterSize(Velocimetro_Vel[playerid],0.199999,1.100000);
	TextDrawFont(Velocimetro_HP[playerid],2);
	TextDrawLetterSize(Velocimetro_HP[playerid],0.199999,1.000000);
	TextDrawFont(Velocimetro_GAS[playerid],2);
	TextDrawLetterSize(Velocimetro_GAS[playerid],0.199999,1.000000);
	TextDrawColor(Velocimetro_Box[playerid],0xffffffff);
	TextDrawColor(Velocimetro_Vel[playerid],0xffffffff);
	TextDrawColor(Velocimetro_HP[playerid],0xffffffff);
	TextDrawColor(Velocimetro_GAS[playerid],0xffffffff);
	TextDrawSetOutline(Velocimetro_Box[playerid],1);
	TextDrawSetOutline(Velocimetro_Vel[playerid],1);
	TextDrawSetOutline(Velocimetro_HP[playerid],1);
	TextDrawSetOutline(Velocimetro_GAS[playerid],1);
	TextDrawSetProportional(Velocimetro_Box[playerid],1);
	TextDrawSetProportional(Velocimetro_Vel[playerid],1);
	TextDrawSetProportional(Velocimetro_HP[playerid],1);
	TextDrawSetProportional(Velocimetro_GAS[playerid],1);
	TextDrawSetShadow(Velocimetro_Box[playerid],1);
	TextDrawSetShadow(Velocimetro_Vel[playerid],1);
	TextDrawSetShadow(Velocimetro_HP[playerid],1);
	TextDrawSetShadow(Velocimetro_GAS[playerid],1);
	SendClientMessage(playerid, DORADO, "Conectando con el servidor...");
	if(Informacion[playerid][Bloqueo] == 1)
	{
		SendClientMessage(playerid, ROJO, "Conexion abortada, la cuenta se encuentra bloqueada");
		Ban(playerid);
		return 1;
	}
	return 1;
}

public OnPlayerSpawn(playerid)
{
	TextDrawHideForPlayer(playerid, Barra1);
	TextDrawHideForPlayer(playerid, Barra2);
	LimpiarChat(playerid, 20);
	SetPlayerSkin(playerid, Informacion[playerid][Skin]);
	SetPlayerWantedLevel(playerid, Informacion[playerid][Busqueda]);
	GivePlayerMoney(playerid, Informacion[playerid][Dinero]);
	if(Informacion[playerid][Faccion] == 0 || Informacion[playerid][Rango] == 0)
	{
		if(Informacion[playerid][Posicion] == 1)
		{
		    LimpiarChat(playerid, 20);
		    SendClientMessage(playerid, VERDE, "** Has aparecido en la �ltima posici�n en la que te quedaste! **");
		    new archivo[256], usuario[MAX_PLAYER_NAME];
	     	GetPlayerName(playerid, usuario, MAX_PLAYER_NAME);
	     	format(archivo, 256, "Res/Userdata/%s.ini", usuario);
			SetPlayerInterior(playerid, dini_Int(archivo, "Interior"));
			SetPlayerPos(playerid, dini_Int(archivo, "UltimaPosX"), dini_Int(archivo, "UltimaPosY"), dini_Int(archivo, "UltimaPosZ"));
    		Informacion[playerid][Posicion] = 0;
		}
	}
	if(Informacion[playerid][Registrado] == 0)
	{
		new DialogText[968];
		TextDrawShowForPlayer(playerid, Barra1);
		TextDrawShowForPlayer(playerid, Barra2);
		strcat(DialogText, "{FEB800}Terminos del Servidor:\n\n");
		strcat(DialogText, "{FFFFFF}Se prohibe el comercio dentro real dentro del servidor, foro o cualquier otro medio relacionado a nosotros\n");
		strcat(DialogText, "{FFFFFF}No admitimos faltas de respeto personales hacia miembros del staff o usuarios del servidor\n");
		strcat(DialogText, "{FFFFFF}No tendremos ninguna responsabilidad si usted es estafado por hacer comercio OOC\n");
		strcat(DialogText, "{FFFFFF}Quedan prohibidos cualquier hack para beneficios propios dentro del servidor\n");
		strcat(DialogText, "{FFFFFF}No admitimos faltas de respeto sexual hacia otros miembros, tanto genero masculino como femenino\n");
		strcat(DialogText, "{FFFFFF}Queda totalmente prohibido hacer amenazas OOC, no tendremos responsabilidad si hay consecuencias\n\n");
		strcat(DialogText, "{FFFFFF}Copyright � 2011 ~ 2012 Todos los derechos reservados - www..net");
		ShowPlayerDialog(playerid, Terminos, DIALOG_STYLE_MSGBOX, " ", DialogText, "Acepto", "No acepto");
		SetPlayerCameraPos(playerid, 2431.0598,-2246.3496,38.0473);
		SetPlayerCameraLookAt(playerid, 2556.9719,-2265.8542,38.0473);
		SetPlayerPos(playerid, 429.8188,-2255.7197,13.194);
	}
    return 1;
}

public OnPlayerClickPlayer(playerid, clickedplayerid, source)
{
	if(clickedplayerid == playerid)
	{
		ShowPlayerDialog(playerid, UserRoot, DIALOG_STYLE_LIST, "�Que deseas hacer?","-> Establecer mi interior a 0\n-> Establecer mi mundo virtual a 0","Seleccionar","Cancelar");
	}
	else if(Informacion[clickedplayerid][Admin] == 0)
	{
		ShowPlayerDialog(playerid, Reporte, DIALOG_STYLE_LIST, "�C�al de estas causas reportas al usuario?", "-> Deathmatch\n-> Metagaming\n-> Powergaming\n-> CarJacking\n-> TrainKill\n-> DriveBy\n-> HeliKill\n-> Flood\n-> Insultos OOC\n-> Abuso de bugs\n-> Cheats/Hacks\n-> SPAM","Seleccionar","Cancelar");
		IDReporte[playerid] = clickedplayerid;
	}
	else if(Informacion[clickedplayerid][Admin] >= 1)
	{
		if(AdminService[clickedplayerid] == 0) { SendClientMessage(playerid, GRIS, "Lo siento, el miembro del staff se encuentra OFFDUTY"); return 1; }
		ShowPlayerDialog(playerid, AdminClick, DIALOG_STYLE_LIST, "�Cual de estas causas solicitas un admin?","-> Solicitar una ayuda\n-> Informar una queja","Seleccionar","Cancelar");
		IDReporte[playerid] = clickedplayerid;
	}
	return 1;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
	new tmp[256];
	new cmd[256], giveplayerid, idx;
	cmd = strtok(cmdtext, idx);
	new string[256];
	new Precio;
 	/* =============================[Idiomas]================================== */
	if(strcmp(cmd, "/rus", true) == 0 || strcmp(cmd, "/Ruso", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
	        if(Informacion[playerid][Ruso] == 1)
	        {
				new length = strlen(cmdtext);
				while ((idx < length) && (cmdtext[idx] <= ' ')) { idx++; } new offset = idx; new result[64];
				while ((idx < length) && ((idx - offset) < (sizeof(result) - 1))) {	result[idx - offset] = cmdtext[idx]; idx++; }
				result[idx - offset] = EOS;
				if(!strlen(result)) { SendClientMessage(playerid, DORADO, "Comando: {FFFFFF}/Ruso [Texto]"); return 1; }
				new Float:x, Float:y, Float:z; GetPlayerPos(playerid,x,y,z);
				for(new i = 0; i < MAX_PLAYERS; i++)
				{
					if(IsPlayerConnected(i))
					{
					    if(PlayerToPoint(20, i, x, y, z))
					    {
							if(Informacion[i][Ruso] == 1)
							{
					    		format(string, sizeof(string), "[RUSO] %s dice: %s", NombreEx(playerid), result);
					    		SendClientMessage(i, BLANCO, string);
							}
							else
							{
					    		format(string, sizeof(string), "%s dice: [Lenguaje Desconocido]", NombreEx(playerid));
					    		SendClientMessage(i, BLANCO, string);
							}
						}
					}
				}
			}
			else
			{
			    SendClientMessage(playerid, GRIS, "Lo siento, usted no sabe hablar Ruso, recurre a un profesor de idiomas");
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/jap", true) == 0 || strcmp(cmd, "/Japones", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
	        if(Informacion[playerid][Japones] == 1)
	        {
				new length = strlen(cmdtext);
				while ((idx < length) && (cmdtext[idx] <= ' ')) { idx++; } new offset = idx; new result[64];
				while ((idx < length) && ((idx - offset) < (sizeof(result) - 1))) {	result[idx - offset] = cmdtext[idx]; idx++; }
				result[idx - offset] = EOS;
				if(!strlen(result)) { SendClientMessage(playerid, DORADO, "Comando: {FFFFFF}/Japones [Texto]"); return 1; }
				new Float:x, Float:y, Float:z; GetPlayerPos(playerid,x,y,z);
				for(new i = 0; i < MAX_PLAYERS; i++)
				{
					if(IsPlayerConnected(i))
					{
					    if(PlayerToPoint(20, i, x, y, z))
					    {
							if(Informacion[i][Japones] == 1)
							{
					    		format(string, sizeof(string), "[JAPONES] %s dice: %s", NombreEx(playerid), result);
					    		SendClientMessage(i, BLANCO, string);
							}
							else
							{
					    		format(string, sizeof(string), "%s dice: [Lenguaje Desconocido]", NombreEx(playerid));
					    		SendClientMessage(i, BLANCO, string);
							}
						}
					}
				}
			}
			else
			{
			    SendClientMessage(playerid, GRIS, "Lo siento, usted no sabe hablar Japones, recurre a un profesor de idiomas");
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/ita", true) == 0 || strcmp(cmd, "/Italiano", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
	        if(Informacion[playerid][Italiano] == 1)
	        {
				new length = strlen(cmdtext);
				while ((idx < length) && (cmdtext[idx] <= ' ')) { idx++; } new offset = idx; new result[64];
				while ((idx < length) && ((idx - offset) < (sizeof(result) - 1))) {	result[idx - offset] = cmdtext[idx]; idx++; }
				result[idx - offset] = EOS;
				if(!strlen(result)) { SendClientMessage(playerid, DORADO, "Comando: {FFFFFF}/Italiano [Texto]"); return 1; }
				new Float:x, Float:y, Float:z; GetPlayerPos(playerid,x,y,z);
				for(new i = 0; i < MAX_PLAYERS; i++)
				{
					if(IsPlayerConnected(i))
					{
					    if(PlayerToPoint(20, i, x, y, z))
					    {
							if(Informacion[i][Italiano] == 1)
							{
					    		format(string, sizeof(string), "[ITALIANO] %s dice: %s", NombreEx(playerid), result);
					    		SendClientMessage(i, BLANCO, string);
							}
							else
							{
					    		format(string, sizeof(string), "%s dice: [Lenguaje Desconocido]", NombreEx(playerid));
					    		SendClientMessage(i, BLANCO, string);
							}
						}
					}
				}
			}
			else
			{
			    SendClientMessage(playerid, GRIS, "Lo siento, usted no sabe hablar Italiano, recurre a un profesor de idiomas");
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/fra", true) == 0 || strcmp(cmd, "/Frances", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
	        if(Informacion[playerid][Frances] == 1)
	        {
				new length = strlen(cmdtext);
				while ((idx < length) && (cmdtext[idx] <= ' ')) { idx++; } new offset = idx; new result[64];
				while ((idx < length) && ((idx - offset) < (sizeof(result) - 1))) {	result[idx - offset] = cmdtext[idx]; idx++; }
				result[idx - offset] = EOS;
				if(!strlen(result)) { SendClientMessage(playerid, DORADO, "Comando: {FFFFFF}/Frances [Texto]"); return 1; }
				new Float:x, Float:y, Float:z; GetPlayerPos(playerid,x,y,z);
				for(new i = 0; i < MAX_PLAYERS; i++)
				{
					if(IsPlayerConnected(i))
					{
					    if(PlayerToPoint(20, i, x, y, z))
					    {
							if(Informacion[i][Frances] == 1)
							{
					    		format(string, sizeof(string), "[FRANCES] %s dice: %s", NombreEx(playerid), result);
					    		SendClientMessage(i, BLANCO, string);
							}
							else
							{
					    		format(string, sizeof(string), "%s dice: [Lenguaje Desconocido]", NombreEx(playerid));
					    		SendClientMessage(i, BLANCO, string);
							}
						}
					}
				}
			}
			else
			{
			    SendClientMessage(playerid, GRIS, "Lo siento, usted no sabe hablar Frances, recurre a un profesor de idiomas");
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/ale", true) == 0 || strcmp(cmd, "/Aleman", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
	        if(Informacion[playerid][Aleman] == 1)
	        {
				new length = strlen(cmdtext);
				while ((idx < length) && (cmdtext[idx] <= ' ')) { idx++; } new offset = idx; new result[64];
				while ((idx < length) && ((idx - offset) < (sizeof(result) - 1))) {	result[idx - offset] = cmdtext[idx]; idx++; }
				result[idx - offset] = EOS;
				if(!strlen(result)) { SendClientMessage(playerid, DORADO, "Comando: {FFFFFF}/Aleman [Texto]"); return 1; }
				new Float:x, Float:y, Float:z; GetPlayerPos(playerid,x,y,z);
				for(new i = 0; i < MAX_PLAYERS; i++)
				{
					if(IsPlayerConnected(i))
					{
					    if(PlayerToPoint(20, i, x, y, z))
					    {
							if(Informacion[i][Aleman] == 1)
							{
					    		format(string, sizeof(string), "[ALEMAN] %s dice: %s", NombreEx(playerid), result);
					    		SendClientMessage(i, BLANCO, string);
							}
							else
							{
					    		format(string, sizeof(string), "%s dice: [Lenguaje Desconocido]", NombreEx(playerid));
					    		SendClientMessage(i, BLANCO, string);
							}
						}
					}
				}
			}
			else
			{
			    SendClientMessage(playerid, GRIS, "Lo siento, usted no sabe hablar Aleman, recurre a un profesor de idiomas");
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/ing", true) == 0 || strcmp(cmd, "/ingles", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
	        if(Informacion[playerid][Ingles] == 1)
	        {
				new length = strlen(cmdtext);
				while ((idx < length) && (cmdtext[idx] <= ' ')) { idx++; } new offset = idx; new result[64];
				while ((idx < length) && ((idx - offset) < (sizeof(result) - 1))) {	result[idx - offset] = cmdtext[idx]; idx++; }
				result[idx - offset] = EOS;
				if(!strlen(result)) { SendClientMessage(playerid, DORADO, "Comando: {FFFFFF}/Ingles [Texto]"); return 1; }
				new Float:x, Float:y, Float:z; GetPlayerPos(playerid,x,y,z);
				for(new i = 0; i < MAX_PLAYERS; i++)
				{
					if(IsPlayerConnected(i))
					{
					    if(PlayerToPoint(20, i, x, y, z))
					    {
							if(Informacion[i][Ingles] == 1)
							{
					    		format(string, sizeof(string), "[INGLES] %s dice: %s", NombreEx(playerid), result);
					    		SendClientMessage(i, BLANCO, string);
							}
							else
							{
					    		format(string, sizeof(string), "%s dice: [Lenguaje Desconocido]", NombreEx(playerid));
					    		SendClientMessage(i, BLANCO, string);
							}
						}
					}
				}
			}
			else
			{
			    SendClientMessage(playerid, GRIS, "Lo siento, usted no sabe hablar ingles, recurre a un profesor de idiomas");
			}
		}
		return 1;
	}
   	/* ===========================[Faccion Global]============================== */
	if (strcmp(cmd, "/miembros", true) == 0)
	{
        if(IsPlayerConnected(playerid))
	    {
			SendClientMessage(playerid, DORADO, "-= {FFFFFF}Miembros de Faccion {FEB800}=-");
			if(Informacion[playerid][Faccion] == SAPD)
			{
				for(new i = 0; i < MAX_PLAYERS; i++)
				{
					if(IsPlayerConnected(i))
					{
					    if(Informacion[i][Faccion] == SAPD)
					    {
			    			new NombreJugador[MAX_PLAYER_NAME];
							GetPlayerName(i, NombreJugador, sizeof(NombreJugador));
							new RangoSAPD[64];
							if(Informacion[i][Rango] == 1) { RangoSAPD = "Guardia de Seguridad"; }
							else if(Informacion[i][Rango] == 2) { RangoSAPD = "Cadete"; }
							else if(Informacion[i][Rango] == 3) { RangoSAPD = "Oficial de Patrulla"; }
							else if(Informacion[i][Rango] == 4) { RangoSAPD = "Sargento de Oficinas"; }
							else if(Informacion[i][Rango] == 5) { RangoSAPD = "Patrulla Antivicio"; }
							else if(Informacion[i][Rango] == 6) { RangoSAPD = "Inspector"; }
							else if(Informacion[i][Rango] == 7) { RangoSAPD = "Teniente"; }
							else if(Informacion[i][Rango] == 8) { RangoSAPD = "Jefe de Operaci�nes"; }
							else if(Informacion[i][Rango] == 9) { RangoSAPD = "Jefe de Policia"; }
							else if(Informacion[i][Rango] == 10) { RangoSAPD = "Ministro de Seguridad"; }
							else { RangoSAPD = "Cadete"; }
							format(string, 256, "{FEB800}| {FFFFFF}Rango: %d {FEB800}| {FFFFFF}Nombre: %d {FEB800}| {FFFFFF}Categoria: %s {FEB800}|", Informacion[i][Rango], NombreJugador, RangoSAPD);
							SendClientMessage(playerid, BLANCO, string);
						}
					}
				}
			}
			else if(Informacion[playerid][Faccion] == SAMD)
			{
				for(new i = 0; i < MAX_PLAYERS; i++)
				{
					if(IsPlayerConnected(i))
					{
					    if(Informacion[i][Faccion] == SAMD)
					    {
			    			new NombreJugador[MAX_PLAYER_NAME];
							GetPlayerName(i, NombreJugador, sizeof(NombreJugador));
							new RangoSAMD[64];
							if(Informacion[i][Rango] == 1) { RangoSAMD = "Auxiliar medico de Urgencias"; }
							else if(Informacion[i][Rango] == 2) { RangoSAMD = "Paramedico"; }
							else if(Informacion[i][Rango] == 3) { RangoSAMD = "Enfermero"; }
							else if(Informacion[i][Rango] == 4) { RangoSAMD = "Interno"; }
							else if(Informacion[i][Rango] == 5) { RangoSAMD = "Residente"; }
							else if(Informacion[i][Rango] == 6) { RangoSAMD = "Medico de Cabezera"; }
							else if(Informacion[i][Rango] == 7) { RangoSAMD = "Especialista"; }
							else if(Informacion[i][Rango] == 8) { RangoSAMD = "Cirujano"; }
							else if(Informacion[i][Rango] == 9) { RangoSAMD = "Jefe del Personal"; }
							else if(Informacion[i][Rango] == 10) { RangoSAMD = "Ministro de Salud"; }
							else { RangoSAMD = "Cadete"; }
							format(string, 256, "{FEB800}| {FFFFFF}Rango: %d {FEB800}| {FFFFFF}Nombre: %d {FEB800}| {FFFFFF}Categoria: %s {FEB800}|", Informacion[i][Rango], NombreJugador, RangoSAMD);
							SendClientMessage(playerid, BLANCO, string);
						}
					}
				}
			}
			else if(Informacion[playerid][Faccion] == PRES)
			{
				for(new i = 0; i < MAX_PLAYERS; i++)
				{
					if(IsPlayerConnected(i))
					{
					    if(Informacion[i][Faccion] == PRES)
					    {
			    			new NombreJugador[MAX_PLAYER_NAME];
							GetPlayerName(i, NombreJugador, sizeof(NombreJugador));
							new RangoPRES[64];
							if(Informacion[i][Rango] == 1) { RangoPRES = "Chofer"; }
							else if(Informacion[i][Rango] == 2) { RangoPRES = "Interno"; }
							else if(Informacion[i][Rango] == 3) { RangoPRES = "Activista"; }
							else if(Informacion[i][Rango] == 4) { RangoPRES = "Director de Campa�a"; }
							else if(Informacion[i][Rango] == 5) { RangoPRES = "Miembro del consejo municipal"; }
							else if(Informacion[i][Rango] == 6) { RangoPRES = "Asambleista estatal"; }
							else if(Informacion[i][Rango] == 7) { RangoPRES = "Congresista"; }
							else if(Informacion[i][Rango] == 8) { RangoPRES = "Juez"; }
							else if(Informacion[i][Rango] == 9) { RangoPRES = "Senador"; }
							else if(Informacion[i][Rango] == 10) { RangoPRES = "Vice Presidente"; }
							else if(Informacion[i][Rango] == 11) { RangoPRES = "Presidente"; }
							else { RangoPRES = "Cadete"; }
							format(string, 256, "{FEB800}| {FFFFFF}Rango: %d {FEB800}| {FFFFFF}Nombre: %d {FEB800}| {FFFFFF}Categoria: %s {FEB800}|", Informacion[i][Rango], NombreJugador, RangoPRES);
							SendClientMessage(playerid, BLANCO, string);
						}
					}
				}
			}
			else if(Informacion[playerid][Faccion] == TAXI)
			{
				for(new i = 0; i < MAX_PLAYERS; i++)
				{
					if(IsPlayerConnected(i))
					{
					    if(Informacion[i][Faccion] == TAXI)
					    {
			    			new NombreJugador[MAX_PLAYER_NAME];
							GetPlayerName(i, NombreJugador, sizeof(NombreJugador));
							new RangoTAXI[64];
							if(Informacion[i][Rango] == 1) { RangoTAXI = "Maquinista"; }
							else if(Informacion[i][Rango] == 2) { RangoTAXI = "Chofer de Bus"; }
							else if(Informacion[i][Rango] == 3) { RangoTAXI = "Taxista de Radiollamada"; }
							else if(Informacion[i][Rango] == 4) { RangoTAXI = "Taxista Libre"; }
							else if(Informacion[i][Rango] == 5) { RangoTAXI = "Chofer Personal"; }
							else if(Informacion[i][Rango] == 6) { RangoTAXI = "Chofer VIP"; }
							else if(Informacion[i][Rango] == 7) { RangoTAXI = "Secretario"; }
							else if(Informacion[i][Rango] == 8) { RangoTAXI = "Ayudante Inspector"; }
							else if(Informacion[i][Rango] == 9) { RangoTAXI = "Inspector Jefe"; }
							else if(Informacion[i][Rango] == 10) { RangoTAXI = "Jefe del personal"; }
							else if(Informacion[i][Rango] == 11) { RangoTAXI = "Ministro de Transporte"; }
							else { RangoTAXI = "Cadete"; }
							format(string, 256, "{FEB800}| {FFFFFF}Rango: %d {FEB800}| {FFFFFF}Nombre: %d {FEB800}| {FFFFFF}Categoria: %s {FEB800}|", Informacion[i][Rango], NombreJugador, RangoTAXI);
							SendClientMessage(playerid, BLANCO, string);
						}
					}
				}
			}
			else if(Informacion[playerid][Faccion] == SATV)
			{
				for(new i = 0; i < MAX_PLAYERS; i++)
				{
					if(IsPlayerConnected(i))
					{
					    if(Informacion[i][Faccion] == SATV)
					    {
			    			new NombreJugador[MAX_PLAYER_NAME];
							GetPlayerName(i, NombreJugador, sizeof(NombreJugador));
							new RangoSATV[64];
							if(Informacion[i][Rango] == 1) { RangoSATV = "Chofer"; }
							else if(Informacion[i][Rango] == 2) { RangoSATV = "Tecnica"; }
							else if(Informacion[i][Rango] == 3) { RangoSATV = "Critico"; }
							else if(Informacion[i][Rango] == 4) { RangoSATV = "Escritor de Esquelas"; }
							else if(Informacion[i][Rango] == 5) { RangoSATV = "Escritor de Horoscopos"; }
							else if(Informacion[i][Rango] == 6) { RangoSATV = "Columnista Deportivo"; }
							else if(Informacion[i][Rango] == 7) { RangoSATV = "Periodista de Investigaci�n"; }
							else if(Informacion[i][Rango] == 8) { RangoSATV = "Editor de Revistas"; }
							else if(Informacion[i][Rango] == 9) { RangoSATV = "Manager General"; }
							else if(Informacion[i][Rango] == 10) { RangoSATV = "Jefe del personal"; }
							else if(Informacion[i][Rango] == 11) { RangoSATV = "Ministro de Comunicaci�n"; }
							else { RangoSATV = "Cadete"; }
							format(string, 256, "{FEB800}| {FFFFFF}Rango: %d {FEB800}| {FFFFFF}Nombre: %d {FEB800}| {FFFFFF}Categoria: %s {FEB800}|", Informacion[i][Rango], NombreJugador, RangoSATV);
							SendClientMessage(playerid, BLANCO, string);
						}
					}
				}
			}
			else if(Informacion[playerid][Faccion] == LICE)
			{
				for(new i = 0; i < MAX_PLAYERS; i++)
				{
					if(IsPlayerConnected(i))
					{
					    if(Informacion[i][Faccion] == LICE)
					    {
			    			new NombreJugador[MAX_PLAYER_NAME];
							GetPlayerName(i, NombreJugador, sizeof(NombreJugador));
							new RangoLICE[64];
							if(Informacion[i][Rango] == 1) { RangoLICE = "Asistente"; }
							else if(Informacion[i][Rango] == 2) { RangoLICE = "Licenciero de vehiculos terrestres"; }
							else if(Informacion[i][Rango] == 3) { RangoLICE = "Licenciero de vehiculos aereos"; }
							else if(Informacion[i][Rango] == 4) { RangoLICE = "Licenciero de vehiculos maritimos"; }
							else if(Informacion[i][Rango] == 5) { RangoLICE = "Licneciero de armamento personal"; }
							else if(Informacion[i][Rango] == 6) { RangoLICE = "Profesor de idiomas"; }
							else if(Informacion[i][Rango] == 7) { RangoLICE = "Asistente Inspector"; }
							else if(Informacion[i][Rango] == 8) { RangoLICE = "Inspector General"; }
							else if(Informacion[i][Rango] == 9) { RangoLICE = "Encargado del personal"; }
							else if(Informacion[i][Rango] == 10) { RangoLICE = "Director"; }
							else if(Informacion[i][Rango] == 11) { RangoLICE = "Ministro de educaci�n"; }
							else { RangoLICE = "Cadete"; }
							format(string, 256, "{FEB800}| {FFFFFF}Rango: %d {FEB800}| {FFFFFF}Nombre: %d {FEB800}| {FFFFFF}Categoria: %s {FEB800}|", Informacion[i][Rango], NombreJugador, RangoLICE);
							SendClientMessage(playerid, BLANCO, string);
						}
					}
				}
			}
			else if(Informacion[playerid][Faccion] == MECA)
			{
				for(new i = 0; i < MAX_PLAYERS; i++)
				{
					if(IsPlayerConnected(i))
					{
					    if(Informacion[i][Faccion] == MECA)
					    {
			    			new NombreJugador[MAX_PLAYER_NAME];
							GetPlayerName(i, NombreJugador, sizeof(NombreJugador));
							new RangoMECA[64];
							if(Informacion[i][Rango] == 1) { RangoMECA = "Asistente"; }
							else if(Informacion[i][Rango] == 2) { RangoMECA = "Vendedor de Ganzuas"; }
							else if(Informacion[i][Rango] == 3) { RangoMECA = "Mecanico auxiliar"; }
							else if(Informacion[i][Rango] == 4) { RangoMECA = "Mecanico Avanzado"; }
							else if(Informacion[i][Rango] == 5) { RangoMECA = "Mecanico Profesional"; }
							else if(Informacion[i][Rango] == 6) { RangoMECA = "Asistente Inspector"; }
							else if(Informacion[i][Rango] == 7) { RangoMECA = "Inspector"; }
							else if(Informacion[i][Rango] == 8) { RangoMECA = "Secretario de Industria"; }
							else if(Informacion[i][Rango] == 9) { RangoMECA = "Encargado del personal"; }
							else if(Informacion[i][Rango] == 10) { RangoMECA = "Representante tecnico"; }
							else if(Informacion[i][Rango] == 11) { RangoMECA = "Ministro de asistencias"; }
							else { RangoMECA = "Cadete"; }
							format(string, 256, "{FEB800}| {FFFFFF}Rango: %d {FEB800}| {FFFFFF}Nombre: %d {FEB800}| {FFFFFF}Categoria: %s {FEB800}|", Informacion[i][Rango], NombreJugador, RangoMECA);
							SendClientMessage(playerid, BLANCO, string);
						}
					}
				}
			}
			else
			{
			    SendClientMessage(playerid, GRIS, "Comando no disponible, requiere ser miembro de alguna faccion");
			 }
		}
		return 1;
	}
	if(strcmp(cmd, "/faccion", true) == 0 || strcmp(cmd, "/f", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			new length = strlen(cmdtext);
			while ((idx < length) && (cmdtext[idx] <= ' ')) { idx++; } new offset = idx; new result[64];
			while ((idx < length) && ((idx - offset) < (sizeof(result) - 1))) { result[idx - offset] = cmdtext[idx]; idx++;	}
			result[idx - offset] = EOS;
			if(!strlen(result)) { SendClientMessage(playerid, DORADO, "Comando: {FFFFFF}(/f)accion [Texto]"); return 1; }
			if(Informacion[playerid][Faccion] == SAPD)
			{
				new RangoSAPD[64];
				if(Informacion[playerid][Rango] == 1) { RangoSAPD = "Guardia de Seguridad"; }
				else if(Informacion[playerid][Rango] == 2) { RangoSAPD = "Cadete"; }
				else if(Informacion[playerid][Rango] == 3) { RangoSAPD = "Oficial de Patrulla"; }
				else if(Informacion[playerid][Rango] == 4) { RangoSAPD = "Sargento de Oficinas"; }
				else if(Informacion[playerid][Rango] == 5) { RangoSAPD = "Patrulla Antivicio"; }
				else if(Informacion[playerid][Rango] == 6) { RangoSAPD = "Inspector"; }
				else if(Informacion[playerid][Rango] == 7) { RangoSAPD = "Teniente"; }
				else if(Informacion[playerid][Rango] == 8) { RangoSAPD = "Jefe de Operaci�nes"; }
				else if(Informacion[playerid][Rango] == 9) { RangoSAPD = "Jefe de Policia"; }
				else if(Informacion[playerid][Rango] == 10) { RangoSAPD = "Ministro de Seguridad"; }
				else { RangoSAPD = "Cadete"; }
				format(string, sizeof(string), "(( [F] %s %s dice: {FFFFFF}%s ))", RangoSAPD, NombreEx(playerid), (result));
				MensajeSAPD(0x57A24EFF, string);
            	printf("[F:SAPD] %s", string);
			}
			else if(Informacion[playerid][Faccion] == SAMD)
			{
				new RangoSAMD[64];
				if(Informacion[playerid][Rango] == 1) { RangoSAMD = "Auxiliar medico de Urgencias"; }
				else if(Informacion[playerid][Rango] == 2) { RangoSAMD = "Paramedico"; }
				else if(Informacion[playerid][Rango] == 3) { RangoSAMD = "Enfermero"; }
				else if(Informacion[playerid][Rango] == 4) { RangoSAMD = "Interno"; }
				else if(Informacion[playerid][Rango] == 5) { RangoSAMD = "Residente"; }
				else if(Informacion[playerid][Rango] == 6) { RangoSAMD = "Medico de Cabezera"; }
				else if(Informacion[playerid][Rango] == 7) { RangoSAMD = "Especialista"; }
				else if(Informacion[playerid][Rango] == 8) { RangoSAMD = "Cirujano"; }
				else if(Informacion[playerid][Rango] == 9) { RangoSAMD = "Jefe del Personal"; }
				else if(Informacion[playerid][Rango] == 10) { RangoSAMD = "Ministro de Salud"; }
				else { RangoSAMD = "Cadete"; }
				format(string, sizeof(string), "(( [F] %s %s dice: {FFFFFF}%s ))", RangoSAMD, NombreEx(playerid), (result));
				MensajeSAMD(0x57A24EFF, string);
            	printf("[F:SAMD] %s", string);
			}
			else if(Informacion[playerid][Faccion] == PRES)
			{
				new RangoPRES[64];
				if(Informacion[playerid][Rango] == 1) { RangoPRES = "Chofer"; }
				else if(Informacion[playerid][Rango] == 2) { RangoPRES = "Interno"; }
				else if(Informacion[playerid][Rango] == 3) { RangoPRES = "Activista"; }
				else if(Informacion[playerid][Rango] == 4) { RangoPRES = "Director de Campa�a"; }
				else if(Informacion[playerid][Rango] == 5) { RangoPRES = "Miembro del consejo municipal"; }
				else if(Informacion[playerid][Rango] == 6) { RangoPRES = "Asambleista estatal"; }
				else if(Informacion[playerid][Rango] == 7) { RangoPRES = "Congresista"; }
				else if(Informacion[playerid][Rango] == 8) { RangoPRES = "Juez"; }
				else if(Informacion[playerid][Rango] == 9) { RangoPRES = "Senador"; }
				else if(Informacion[playerid][Rango] == 10) { RangoPRES = "Vice Presidente"; }
				else if(Informacion[playerid][Rango] == 11) { RangoPRES = "Presidente"; }
				else { RangoPRES = "Cadete"; }
				format(string, sizeof(string), "(( [F] %s %s dice: {FFFFFF}%s ))", RangoPRES, NombreEx(playerid), (result));
				MensajeGOB(0x57A24EFF, string);
            	printf("[F:SAGOB] %s", string);
			}
			else if(Informacion[playerid][Faccion] == TAXI)
			{
				new RangoTAXI[64];
				if(Informacion[playerid][Rango] == 1) { RangoTAXI = "Maquinista"; }
				else if(Informacion[playerid][Rango] == 2) { RangoTAXI = "Chofer de Bus"; }
				else if(Informacion[playerid][Rango] == 3) { RangoTAXI = "Taxista de Radiollamada"; }
				else if(Informacion[playerid][Rango] == 4) { RangoTAXI = "Taxista Libre"; }
				else if(Informacion[playerid][Rango] == 5) { RangoTAXI = "Chofer Personal"; }
				else if(Informacion[playerid][Rango] == 6) { RangoTAXI = "Chofer VIP"; }
				else if(Informacion[playerid][Rango] == 7) { RangoTAXI = "Secretario"; }
				else if(Informacion[playerid][Rango] == 8) { RangoTAXI = "Ayudante Inspector"; }
				else if(Informacion[playerid][Rango] == 9) { RangoTAXI = "Inspector Jefe"; }
				else if(Informacion[playerid][Rango] == 10) { RangoTAXI = "Jefe del personal"; }
				else if(Informacion[playerid][Rango] == 11) { RangoTAXI = "Ministro de Transporte"; }
				else { RangoTAXI = "Cadete"; }
				format(string, sizeof(string), "(( [F] %s %s dice: {FFFFFF}%s ))", RangoTAXI, NombreEx(playerid), (result));
				MensajeTAXI(0x57A24EFF, string);
            	printf("[F:TAXI] %s", string);
			}
			else if(Informacion[playerid][Faccion] == SATV)
			{
				new RangoSATV[64];
				if(Informacion[playerid][Rango] == 1) { RangoSATV = "Chofer"; }
				else if(Informacion[playerid][Rango] == 2) { RangoSATV = "Tecnica"; }
				else if(Informacion[playerid][Rango] == 3) { RangoSATV = "Critico"; }
				else if(Informacion[playerid][Rango] == 4) { RangoSATV = "Escritor de Esquelas"; }
				else if(Informacion[playerid][Rango] == 5) { RangoSATV = "Escritor de Horoscopos"; }
				else if(Informacion[playerid][Rango] == 6) { RangoSATV = "Columnista Deportivo"; }
				else if(Informacion[playerid][Rango] == 7) { RangoSATV = "Periodista de Investigaci�n"; }
				else if(Informacion[playerid][Rango] == 8) { RangoSATV = "Editor de Revistas"; }
				else if(Informacion[playerid][Rango] == 9) { RangoSATV = "Manager General"; }
				else if(Informacion[playerid][Rango] == 10) { RangoSATV = "Jefe del personal"; }
				else if(Informacion[playerid][Rango] == 11) { RangoSATV = "Ministro de Comunicaci�n"; }
				else { RangoSATV = "Cadete"; }
				format(string, sizeof(string), "(( [F] %s %s dice: {FFFFFF}%s ))", RangoSATV, NombreEx(playerid), (result));
				MensajeSATV(0x57A24EFF, string);
            	printf("[F:SATV] %s", string);
			}
			else if(Informacion[playerid][Faccion] == LICE)
			{
				new RangoLICE[64];
				if(Informacion[playerid][Rango] == 1) { RangoLICE = "Asistente"; }
				else if(Informacion[playerid][Rango] == 2) { RangoLICE = "Licenciero de vehiculos terrestres"; }
				else if(Informacion[playerid][Rango] == 3) { RangoLICE = "Licenciero de vehiculos aereos"; }
				else if(Informacion[playerid][Rango] == 4) { RangoLICE = "Licenciero de vehiculos maritimos"; }
				else if(Informacion[playerid][Rango] == 5) { RangoLICE = "Licneciero de armamento personal"; }
				else if(Informacion[playerid][Rango] == 6) { RangoLICE = "Profesor de idiomas"; }
				else if(Informacion[playerid][Rango] == 7) { RangoLICE = "Asistente Inspector"; }
				else if(Informacion[playerid][Rango] == 8) { RangoLICE = "Inspector General"; }
				else if(Informacion[playerid][Rango] == 9) { RangoLICE = "Encargado del personal"; }
				else if(Informacion[playerid][Rango] == 10) { RangoLICE = "Director"; }
				else if(Informacion[playerid][Rango] == 11) { RangoLICE = "Ministro de educaci�n"; }
				else { RangoLICE = "Cadete"; }
				format(string, sizeof(string), "(( [F] %s %s dice: {FFFFFF}%s ))", RangoLICE, NombreEx(playerid), (result));
				MensajeLICE(0x57A24EFF, string);
            	printf("[F:LICE] %s", string);
			}
			else if(Informacion[playerid][Faccion] == MECA)
			{
				new RangoMECA[64];
				if(Informacion[playerid][Rango] == 1) { RangoMECA = "Asistente"; }
				else if(Informacion[playerid][Rango] == 2) { RangoMECA = "Vendedor de Ganzuas"; }
				else if(Informacion[playerid][Rango] == 3) { RangoMECA = "Mecanico auxiliar"; }
				else if(Informacion[playerid][Rango] == 4) { RangoMECA = "Mecanico Avanzado"; }
				else if(Informacion[playerid][Rango] == 5) { RangoMECA = "Mecanico Profesional"; }
				else if(Informacion[playerid][Rango] == 6) { RangoMECA = "Asistente Inspector"; }
				else if(Informacion[playerid][Rango] == 7) { RangoMECA = "Inspector"; }
				else if(Informacion[playerid][Rango] == 8) { RangoMECA = "Secretario de Industria"; }
				else if(Informacion[playerid][Rango] == 9) { RangoMECA = "Encargado del personal"; }
				else if(Informacion[playerid][Rango] == 10) { RangoMECA = "Representante tecnico"; }
				else if(Informacion[playerid][Rango] == 11) { RangoMECA = "Ministro de asistencias"; }
				else { RangoMECA = "Cadete"; }
				format(string, sizeof(string), "(( [F] %s %s dice: {FFFFFF}%s ))", RangoMECA, NombreEx(playerid), (result));
				MensajeMECA(0x57A24EFF, string);
            	printf("[F:MECA] %s", string);
			}
			else
			{
			    SendClientMessage(playerid, GRIS, "Comando no disponible, requiere ser miembro de alguna faccion");
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/radio", true) == 0 || strcmp(cmd, "/r", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			new length = strlen(cmdtext);
			while ((idx < length) && (cmdtext[idx] <= ' ')) { idx++; } new offset = idx; new result[64];
			while ((idx < length) && ((idx - offset) < (sizeof(result) - 1))) { result[idx - offset] = cmdtext[idx]; idx++;	}
			result[idx - offset] = EOS;
			if(!strlen(result)) { SendClientMessage(playerid, DORADO, "Comando: {FFFFFF}(/r)adio [Texto]"); return 1; }
			if(Informacion[playerid][Faccion] == SAPD)
			{
				new RangoSAPD[64];
				if(Informacion[playerid][Rango] == 1) { RangoSAPD = "Guardia de Seguridad"; }
				else if(Informacion[playerid][Rango] == 2) { RangoSAPD = "Cadete"; }
				else if(Informacion[playerid][Rango] == 3) { RangoSAPD = "Oficial de Patrulla"; }
				else if(Informacion[playerid][Rango] == 4) { RangoSAPD = "Sargento de Oficinas"; }
				else if(Informacion[playerid][Rango] == 5) { RangoSAPD = "Patrulla Antivicio"; }
				else if(Informacion[playerid][Rango] == 6) { RangoSAPD = "Inspector"; }
				else if(Informacion[playerid][Rango] == 7) { RangoSAPD = "Teniente"; }
				else if(Informacion[playerid][Rango] == 8) { RangoSAPD = "Jefe de Operaci�nes"; }
				else if(Informacion[playerid][Rango] == 9) { RangoSAPD = "Jefe de Policia"; }
				else if(Informacion[playerid][Rango] == 10) { RangoSAPD = "Ministro de Seguridad"; }
				else { RangoSAPD = "Cadete"; }
				format(string, sizeof(string), "[R] %s %s dice: {FFFFFF}%s", RangoSAPD, NombreEx(playerid), (result));
				MensajeSAPD(0x006AC4FF, string);
            	printf("[R:SAPD] %s", string);
			}
			else if(Informacion[playerid][Faccion] == SAMD)
			{
				new RangoSAMD[64];
				if(Informacion[playerid][Rango] == 1) { RangoSAMD = "Auxiliar medico de Urgencias"; }
				else if(Informacion[playerid][Rango] == 2) { RangoSAMD = "Paramedico"; }
				else if(Informacion[playerid][Rango] == 3) { RangoSAMD = "Enfermero"; }
				else if(Informacion[playerid][Rango] == 4) { RangoSAMD = "Interno"; }
				else if(Informacion[playerid][Rango] == 5) { RangoSAMD = "Residente"; }
				else if(Informacion[playerid][Rango] == 6) { RangoSAMD = "Medico de Cabezera"; }
				else if(Informacion[playerid][Rango] == 7) { RangoSAMD = "Especialista"; }
				else if(Informacion[playerid][Rango] == 8) { RangoSAMD = "Cirujano"; }
				else if(Informacion[playerid][Rango] == 9) { RangoSAMD = "Jefe del Personal"; }
				else if(Informacion[playerid][Rango] == 10) { RangoSAMD = "Ministro de Salud"; }
				else { RangoSAMD = "Cadete"; }
				format(string, sizeof(string), "[R] %s %s dice: {FFFFFF}%s", RangoSAMD, NombreEx(playerid), (result));
				MensajeSAMD(0x006AC4FF, string);
            	printf("[R:SAMD] %s", string);
			}
			else if(Informacion[playerid][Faccion] == PRES)
			{
				new RangoPRES[64];
				if(Informacion[playerid][Rango] == 1) { RangoPRES = "Chofer"; }
				else if(Informacion[playerid][Rango] == 2) { RangoPRES = "Interno"; }
				else if(Informacion[playerid][Rango] == 3) { RangoPRES = "Activista"; }
				else if(Informacion[playerid][Rango] == 4) { RangoPRES = "Director de Campa�a"; }
				else if(Informacion[playerid][Rango] == 5) { RangoPRES = "Miembro del consejo municipal"; }
				else if(Informacion[playerid][Rango] == 6) { RangoPRES = "Asambleista estatal"; }
				else if(Informacion[playerid][Rango] == 7) { RangoPRES = "Congresista"; }
				else if(Informacion[playerid][Rango] == 8) { RangoPRES = "Juez"; }
				else if(Informacion[playerid][Rango] == 9) { RangoPRES = "Senador"; }
				else if(Informacion[playerid][Rango] == 10) { RangoPRES = "Vice Presidente"; }
				else if(Informacion[playerid][Rango] == 11) { RangoPRES = "Presidente"; }
				else { RangoPRES = "Cadete"; }
				format(string, sizeof(string), "[R] %s %s dice: {FFFFFF}%s", RangoPRES, NombreEx(playerid), (result));
				MensajeGOB(0x006AC4FF, string);
            	printf("[R:SAGOB] %s", string);
			}
			else if(Informacion[playerid][Faccion] == TAXI)
			{
				new RangoTAXI[64];
				if(Informacion[playerid][Rango] == 1) { RangoTAXI = "Maquinista"; }
				else if(Informacion[playerid][Rango] == 2) { RangoTAXI = "Chofer de Bus"; }
				else if(Informacion[playerid][Rango] == 3) { RangoTAXI = "Taxista de Radiollamada"; }
				else if(Informacion[playerid][Rango] == 4) { RangoTAXI = "Taxista Libre"; }
				else if(Informacion[playerid][Rango] == 5) { RangoTAXI = "Chofer Personal"; }
				else if(Informacion[playerid][Rango] == 6) { RangoTAXI = "Chofer VIP"; }
				else if(Informacion[playerid][Rango] == 7) { RangoTAXI = "Secretario"; }
				else if(Informacion[playerid][Rango] == 8) { RangoTAXI = "Ayudante Inspector"; }
				else if(Informacion[playerid][Rango] == 9) { RangoTAXI = "Inspector Jefe"; }
				else if(Informacion[playerid][Rango] == 10) { RangoTAXI = "Jefe del personal"; }
				else if(Informacion[playerid][Rango] == 11) { RangoTAXI = "Ministro de Transporte"; }
				else { RangoTAXI = "Cadete"; }
				format(string, sizeof(string), "[R] %s %s dice: {FFFFFF}%s", RangoTAXI, NombreEx(playerid), (result));
				MensajeTAXI(0x006AC4FF, string);
            	printf("[R:TAXI] %s", string);
			}
			else if(Informacion[playerid][Faccion] == SATV)
			{
				new RangoSATV[64];
				if(Informacion[playerid][Rango] == 1) { RangoSATV = "Chofer"; }
				else if(Informacion[playerid][Rango] == 2) { RangoSATV = "Tecnica"; }
				else if(Informacion[playerid][Rango] == 3) { RangoSATV = "Critico"; }
				else if(Informacion[playerid][Rango] == 4) { RangoSATV = "Escritor de Esquelas"; }
				else if(Informacion[playerid][Rango] == 5) { RangoSATV = "Escritor de Horoscopos"; }
				else if(Informacion[playerid][Rango] == 6) { RangoSATV = "Columnista Deportivo"; }
				else if(Informacion[playerid][Rango] == 7) { RangoSATV = "Periodista de Investigaci�n"; }
				else if(Informacion[playerid][Rango] == 8) { RangoSATV = "Editor de Revistas"; }
				else if(Informacion[playerid][Rango] == 9) { RangoSATV = "Manager General"; }
				else if(Informacion[playerid][Rango] == 10) { RangoSATV = "Jefe del personal"; }
				else if(Informacion[playerid][Rango] == 11) { RangoSATV = "Ministro de Comunicaci�n"; }
				else { RangoSATV = "Cadete"; }
				format(string, sizeof(string), "[R] %s %s dice: {FFFFFF}%s", RangoSATV, NombreEx(playerid), (result));
				MensajeSATV(0x006AC4FF, string);
            	printf("[R:SATV] %s", string);
			}
			else if(Informacion[playerid][Faccion] == LICE)
			{
				new RangoLICE[64];
				if(Informacion[playerid][Rango] == 1) { RangoLICE = "Asistente"; }
				else if(Informacion[playerid][Rango] == 2) { RangoLICE = "Licenciero de vehiculos terrestres"; }
				else if(Informacion[playerid][Rango] == 3) { RangoLICE = "Licenciero de vehiculos aereos"; }
				else if(Informacion[playerid][Rango] == 4) { RangoLICE = "Licenciero de vehiculos maritimos"; }
				else if(Informacion[playerid][Rango] == 5) { RangoLICE = "Licneciero de armamento personal"; }
				else if(Informacion[playerid][Rango] == 6) { RangoLICE = "Profesor de idiomas"; }
				else if(Informacion[playerid][Rango] == 7) { RangoLICE = "Asistente Inspector"; }
				else if(Informacion[playerid][Rango] == 8) { RangoLICE = "Inspector General"; }
				else if(Informacion[playerid][Rango] == 9) { RangoLICE = "Encargado del personal"; }
				else if(Informacion[playerid][Rango] == 10) { RangoLICE = "Director"; }
				else if(Informacion[playerid][Rango] == 11) { RangoLICE = "Ministro de educaci�n"; }
				else { RangoLICE = "Cadete"; }
				format(string, sizeof(string), "[R] %s %s dice: {FFFFFF}%s", RangoLICE, NombreEx(playerid), (result));
				MensajeLICE(0x006AC4FF, string);
            	printf("[R:LICE] %s", string);
			}
			else if(Informacion[playerid][Faccion] == MECA)
			{
				new RangoMECA[64];
				if(Informacion[playerid][Rango] == 1) { RangoMECA = "Asistente"; }
				else if(Informacion[playerid][Rango] == 2) { RangoMECA = "Vendedor de Ganzuas"; }
				else if(Informacion[playerid][Rango] == 3) { RangoMECA = "Mecanico auxiliar"; }
				else if(Informacion[playerid][Rango] == 4) { RangoMECA = "Mecanico Avanzado"; }
				else if(Informacion[playerid][Rango] == 5) { RangoMECA = "Mecanico Profesional"; }
				else if(Informacion[playerid][Rango] == 6) { RangoMECA = "Asistente Inspector"; }
				else if(Informacion[playerid][Rango] == 7) { RangoMECA = "Inspector"; }
				else if(Informacion[playerid][Rango] == 8) { RangoMECA = "Secretario de Industria"; }
				else if(Informacion[playerid][Rango] == 9) { RangoMECA = "Encargado del personal"; }
				else if(Informacion[playerid][Rango] == 10) { RangoMECA = "Representante tecnico"; }
				else if(Informacion[playerid][Rango] == 11) { RangoMECA = "Ministro de asistencias"; }
				else { RangoMECA = "Cadete"; }
				format(string, sizeof(string), "[R] %s %s dice: {FFFFFF}%s", RangoMECA, NombreEx(playerid), (result));
				MensajeMECA(0x006AC4FF, string);
            	printf("[R:MECA] %s", string);
			}
			else
			{
			    SendClientMessage(playerid, GRIS, "Comando no disponible, requiere ser miembro de alguna faccion");
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/departamento", true) == 0 || strcmp(cmd, "/d", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			new length = strlen(cmdtext);
			while ((idx < length) && (cmdtext[idx] <= ' ')) { idx++; } new offset = idx; new result[64];
			while ((idx < length) && ((idx - offset) < (sizeof(result) - 1))) { result[idx - offset] = cmdtext[idx]; idx++;	}
			result[idx - offset] = EOS;
			if(!strlen(result)) { SendClientMessage(playerid, DORADO, "Comando: {FFFFFF}(/d)epartamento [Texto]"); return 1; }
			if(Informacion[playerid][Faccion] == SAPD)
			{
				new RangoSAPD[64];
				if(Informacion[playerid][Rango] == 1) { RangoSAPD = "Guardia de Seguridad"; }
				else if(Informacion[playerid][Rango] == 2) { RangoSAPD = "Cadete"; }
				else if(Informacion[playerid][Rango] == 3) { RangoSAPD = "Oficial de Patrulla"; }
				else if(Informacion[playerid][Rango] == 4) { RangoSAPD = "Sargento de Oficinas"; }
				else if(Informacion[playerid][Rango] == 5) { RangoSAPD = "Patrulla Antivicio"; }
				else if(Informacion[playerid][Rango] == 6) { RangoSAPD = "Inspector"; }
				else if(Informacion[playerid][Rango] == 7) { RangoSAPD = "Teniente"; }
				else if(Informacion[playerid][Rango] == 8) { RangoSAPD = "Jefe de Operaci�nes"; }
				else if(Informacion[playerid][Rango] == 9) { RangoSAPD = "Jefe de Policia"; }
				else if(Informacion[playerid][Rango] == 10) { RangoSAPD = "Ministro de Seguridad"; }
				else { RangoSAPD = "Cadete"; }
				format(string, sizeof(string), "[R] %s %s dice: {FFFFFF}%s", RangoSAPD, NombreEx(playerid), (result));
				MensajeSAPD(0x8FAABBFF, string); MensajeGOB(0x8FAABBFF, string); MensajeSAMD(0x8FAABBFF, string);
				MensajeTAXI(0x8FAABBFF, string); MensajeMECA(0x8FAABBFF, string); MensajeSATV(0x8FAABBFF, string);
				MensajeLICE(0x8FAABBFF, string);
            	printf("[R:GLOBAL] %s", string);
			}
			else if(Informacion[playerid][Faccion] == SAMD)
			{
				new RangoSAMD[64];
				if(Informacion[playerid][Rango] == 1) { RangoSAMD = "Auxiliar medico de Urgencias"; }
				else if(Informacion[playerid][Rango] == 2) { RangoSAMD = "Paramedico"; }
				else if(Informacion[playerid][Rango] == 3) { RangoSAMD = "Enfermero"; }
				else if(Informacion[playerid][Rango] == 4) { RangoSAMD = "Interno"; }
				else if(Informacion[playerid][Rango] == 5) { RangoSAMD = "Residente"; }
				else if(Informacion[playerid][Rango] == 6) { RangoSAMD = "Medico de Cabezera"; }
				else if(Informacion[playerid][Rango] == 7) { RangoSAMD = "Especialista"; }
				else if(Informacion[playerid][Rango] == 8) { RangoSAMD = "Cirujano"; }
				else if(Informacion[playerid][Rango] == 9) { RangoSAMD = "Jefe del Personal"; }
				else if(Informacion[playerid][Rango] == 10) { RangoSAMD = "Ministro de Salud"; }
				else { RangoSAMD = "Cadete"; }
				format(string, sizeof(string), "[R] %s %s dice: {FFFFFF}%s", RangoSAMD, NombreEx(playerid), (result));
				MensajeSAPD(0x8FAABBFF, string); MensajeGOB(0x8FAABBFF, string); MensajeSAMD(0x8FAABBFF, string);
				MensajeTAXI(0x8FAABBFF, string); MensajeMECA(0x8FAABBFF, string); MensajeSATV(0x8FAABBFF, string);
				MensajeLICE(0x8FAABBFF, string);
            	printf("[R:GLOBAL] %s", string);
			}
			else if(Informacion[playerid][Faccion] == PRES)
			{
				new RangoPRES[64];
				if(Informacion[playerid][Rango] == 1) { RangoPRES = "Chofer"; }
				else if(Informacion[playerid][Rango] == 2) { RangoPRES = "Interno"; }
				else if(Informacion[playerid][Rango] == 3) { RangoPRES = "Activista"; }
				else if(Informacion[playerid][Rango] == 4) { RangoPRES = "Director de Campa�a"; }
				else if(Informacion[playerid][Rango] == 5) { RangoPRES = "Miembro del consejo municipal"; }
				else if(Informacion[playerid][Rango] == 6) { RangoPRES = "Asambleista estatal"; }
				else if(Informacion[playerid][Rango] == 7) { RangoPRES = "Congresista"; }
				else if(Informacion[playerid][Rango] == 8) { RangoPRES = "Juez"; }
				else if(Informacion[playerid][Rango] == 9) { RangoPRES = "Senador"; }
				else if(Informacion[playerid][Rango] == 10) { RangoPRES = "Vice Presidente"; }
				else if(Informacion[playerid][Rango] == 11) { RangoPRES = "Presidente"; }
				else { RangoPRES = "Cadete"; }
				format(string, sizeof(string), "[R] %s %s dice: {FFFFFF}%s", RangoPRES, NombreEx(playerid), (result));
				MensajeSAPD(0x8FAABBFF, string); MensajeGOB(0x8FAABBFF, string); MensajeSAMD(0x8FAABBFF, string);
				MensajeTAXI(0x8FAABBFF, string); MensajeMECA(0x8FAABBFF, string); MensajeSATV(0x8FAABBFF, string);
				MensajeLICE(0x8FAABBFF, string);
            	printf("[R:GLOBAL] %s", string);
			}
			else if(Informacion[playerid][Faccion] == TAXI)
			{
				new RangoTAXI[64];
				if(Informacion[playerid][Rango] == 1) { RangoTAXI = "Maquinista"; }
				else if(Informacion[playerid][Rango] == 2) { RangoTAXI = "Chofer de Bus"; }
				else if(Informacion[playerid][Rango] == 3) { RangoTAXI = "Taxista de Radiollamada"; }
				else if(Informacion[playerid][Rango] == 4) { RangoTAXI = "Taxista Libre"; }
				else if(Informacion[playerid][Rango] == 5) { RangoTAXI = "Chofer Personal"; }
				else if(Informacion[playerid][Rango] == 6) { RangoTAXI = "Chofer VIP"; }
				else if(Informacion[playerid][Rango] == 7) { RangoTAXI = "Secretario"; }
				else if(Informacion[playerid][Rango] == 8) { RangoTAXI = "Ayudante Inspector"; }
				else if(Informacion[playerid][Rango] == 9) { RangoTAXI = "Inspector Jefe"; }
				else if(Informacion[playerid][Rango] == 10) { RangoTAXI = "Jefe del personal"; }
				else if(Informacion[playerid][Rango] == 11) { RangoTAXI = "Ministro de Transporte"; }
				else { RangoTAXI = "Cadete"; }
				format(string, sizeof(string), "[R] %s %s dice: {FFFFFF}%s", RangoTAXI, NombreEx(playerid), (result));
				MensajeSAPD(0x8FAABBFF, string); MensajeGOB(0x8FAABBFF, string); MensajeSAMD(0x8FAABBFF, string);
				MensajeTAXI(0x8FAABBFF, string); MensajeMECA(0x8FAABBFF, string); MensajeSATV(0x8FAABBFF, string);
				MensajeLICE(0x8FAABBFF, string);
            	printf("[R:GLOBAL] %s", string);
			}
			else if(Informacion[playerid][Faccion] == SATV)
			{
				new RangoSATV[64];
				if(Informacion[playerid][Rango] == 1) { RangoSATV = "Chofer"; }
				else if(Informacion[playerid][Rango] == 2) { RangoSATV = "Tecnica"; }
				else if(Informacion[playerid][Rango] == 3) { RangoSATV = "Critico"; }
				else if(Informacion[playerid][Rango] == 4) { RangoSATV = "Escritor de Esquelas"; }
				else if(Informacion[playerid][Rango] == 5) { RangoSATV = "Escritor de Horoscopos"; }
				else if(Informacion[playerid][Rango] == 6) { RangoSATV = "Columnista Deportivo"; }
				else if(Informacion[playerid][Rango] == 7) { RangoSATV = "Periodista de Investigaci�n"; }
				else if(Informacion[playerid][Rango] == 8) { RangoSATV = "Editor de Revistas"; }
				else if(Informacion[playerid][Rango] == 9) { RangoSATV = "Manager General"; }
				else if(Informacion[playerid][Rango] == 10) { RangoSATV = "Jefe del personal"; }
				else if(Informacion[playerid][Rango] == 11) { RangoSATV = "Ministro de Comunicaci�n"; }
				else { RangoSATV = "Cadete"; }
				format(string, sizeof(string), "[R] %s %s dice: {FFFFFF}%s", RangoSATV, NombreEx(playerid), (result));
				MensajeSAPD(0x8FAABBFF, string); MensajeGOB(0x8FAABBFF, string); MensajeSAMD(0x8FAABBFF, string);
				MensajeTAXI(0x8FAABBFF, string); MensajeMECA(0x8FAABBFF, string); MensajeSATV(0x8FAABBFF, string);
				MensajeLICE(0x8FAABBFF, string);
            	printf("[R:GLOBAL] %s", string);
			}
			else if(Informacion[playerid][Faccion] == LICE)
			{
				new RangoLICE[64];
				if(Informacion[playerid][Rango] == 1) { RangoLICE = "Asistente"; }
				else if(Informacion[playerid][Rango] == 2) { RangoLICE = "Licenciero de vehiculos terrestres"; }
				else if(Informacion[playerid][Rango] == 3) { RangoLICE = "Licenciero de vehiculos aereos"; }
				else if(Informacion[playerid][Rango] == 4) { RangoLICE = "Licenciero de vehiculos maritimos"; }
				else if(Informacion[playerid][Rango] == 5) { RangoLICE = "Licneciero de armamento personal"; }
				else if(Informacion[playerid][Rango] == 6) { RangoLICE = "Profesor de idiomas"; }
				else if(Informacion[playerid][Rango] == 7) { RangoLICE = "Asistente Inspector"; }
				else if(Informacion[playerid][Rango] == 8) { RangoLICE = "Inspector General"; }
				else if(Informacion[playerid][Rango] == 9) { RangoLICE = "Encargado del personal"; }
				else if(Informacion[playerid][Rango] == 10) { RangoLICE = "Director"; }
				else if(Informacion[playerid][Rango] == 11) { RangoLICE = "Ministro de educaci�n"; }
				else { RangoLICE = "Cadete"; }
				format(string, sizeof(string), "[R] %s %s dice: {FFFFFF}%s", RangoLICE, NombreEx(playerid), (result));
				MensajeSAPD(0x8FAABBFF, string); MensajeGOB(0x8FAABBFF, string); MensajeSAMD(0x8FAABBFF, string);
				MensajeTAXI(0x8FAABBFF, string); MensajeMECA(0x8FAABBFF, string); MensajeSATV(0x8FAABBFF, string);
				MensajeLICE(0x8FAABBFF, string);
            	printf("[R:GLOBAL] %s", string);
			}
			else if(Informacion[playerid][Faccion] == MECA)
			{
				new RangoMECA[64];
				if(Informacion[playerid][Rango] == 1) { RangoMECA = "Asistente"; }
				else if(Informacion[playerid][Rango] == 2) { RangoMECA = "Vendedor de Ganzuas"; }
				else if(Informacion[playerid][Rango] == 3) { RangoMECA = "Mecanico auxiliar"; }
				else if(Informacion[playerid][Rango] == 4) { RangoMECA = "Mecanico Avanzado"; }
				else if(Informacion[playerid][Rango] == 5) { RangoMECA = "Mecanico Profesional"; }
				else if(Informacion[playerid][Rango] == 6) { RangoMECA = "Asistente Inspector"; }
				else if(Informacion[playerid][Rango] == 7) { RangoMECA = "Inspector"; }
				else if(Informacion[playerid][Rango] == 8) { RangoMECA = "Secretario de Industria"; }
				else if(Informacion[playerid][Rango] == 9) { RangoMECA = "Encargado del personal"; }
				else if(Informacion[playerid][Rango] == 10) { RangoMECA = "Representante tecnico"; }
				else if(Informacion[playerid][Rango] == 11) { RangoMECA = "Ministro de asistencias"; }
				else { RangoMECA = "Cadete"; }
				format(string, sizeof(string), "[R] %s %s dice: {FFFFFF}%s", RangoMECA, NombreEx(playerid), (result));
				MensajeSAPD(0x8FAABBFF, string); MensajeGOB(0x8FAABBFF, string); MensajeSAMD(0x8FAABBFF, string);
				MensajeTAXI(0x8FAABBFF, string); MensajeMECA(0x8FAABBFF, string); MensajeSATV(0x8FAABBFF, string);
				MensajeLICE(0x8FAABBFF, string);
            	printf("[R:GLOBAL] %s", string);
			}
			else
			{
			    SendClientMessage(playerid, GRIS, "Comando no disponible, requiere ser miembro de alguna faccion");
			}
		}
		return 1;
	}
   	/* ============================[Generales]================================= */
	if(strcmp(cmd, "/comprar", true) == 0)
	{
     	if(PlayerToPoint(5, playerid, -28.3918,-184.7443,1003.5469))
	    {
	        if(ProductosTienda1 == 0) { SendClientMessage(playerid, GRIS, "Lo siento, no hay productos dentro del 24/7"); return 1; }
	        ShowPlayerDialog(playerid, Tienda, DIALOG_STYLE_LIST," ", "$150]- Telefono Celular\n[$200]- Carga de saldo telefonico\n[$250]- Camara fotografica\n[$300]- Tickets Raspa y Gana","Aceptar","Cancelar");
		}
	    else if(PlayerToPoint(5, playerid, 2.7929,-28.6153,1003.5494))
	    {
	        if(ProductosTienda2 == 0) { SendClientMessage(playerid, GRIS, "Lo siento, no hay productos dentro del 24/7"); return 1; }
	        ShowPlayerDialog(playerid, Tienda, DIALOG_STYLE_LIST," ", "$150]- Telefono Celular\n[$200]- Carga de saldo telefonico\n[$250]- Camara fotografica\n[$300]- Tickets Raspa y Gana","Aceptar","Cancelar");
		}
	    else if(PlayerToPoint(5, playerid, -27.1513,-89.7159,1003.5469))
	    {
	        if(ProductosTienda3 == 0) { SendClientMessage(playerid, GRIS, "Lo siento, no hay productos dentro del 24/7"); return 1; }
	        ShowPlayerDialog(playerid, Tienda, DIALOG_STYLE_LIST," ", "$150]- Telefono Celular\n[$200]- Carga de saldo telefonico\n[$250]- Camara fotografica\n[$300]- Tickets Raspa y Gana","Aceptar","Cancelar");
		}
		else
		{
		    SendClientMessage(playerid, GRIS, "Lo siento, debes estar dentro de algun 24/7");
		}
		return 1;
	}
 	if(strcmp(cmd, "/anuncio", true) == 0 || strcmp(cmd, "/an", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			if(Informacion[playerid][TTelefono] == 0) { SendClientMessage(playerid, GRIS, "Lo siento, no poses ningun telefono"); return 1; }
			new length = strlen(cmdtext);
			while ((idx < length) && (cmdtext[idx] <= ' ')) { idx++; }
			new offset = idx; new result[64];
			while ((idx < length) && ((idx - offset) < (sizeof(result) - 1))) { result[idx - offset] = cmdtext[idx]; idx++; }
			result[idx - offset] = EOS;
			if(!strlen(result)) { SendClientMessage(playerid, DORADO, "Comando: {FFFFFF}(/an)uncio [Texto]"); return 1; }
			new dinero = idx + 15;
			if(GetPlayerMoney(playerid) < dinero) { format(string, sizeof(string), "* Estas utilizando %d caracteres en tu mensaje, necesitas $%d para pagarlos", offset, dinero); SendClientMessage(playerid, GRIS, string); return 1; }
			if(AnunciosActivados == 0)
			{
				format(string, sizeof(string), "Lo siento, debes esperar %d segundos para volver a poner un anuncio", TiempoAnuncio/1000);
				SendClientMessage(playerid, GRIS, string);
				return 1;
			}
			GivePlayerMoney(playerid, -dinero);
			CajaGobierno += dinero;
			AnunciosActivados = 0;
			format(string, sizeof(string), "[ANUNCIO] %s | TLF: %d",  result, Informacion[playerid][NTelefono]);
			SendClientMessageToAll(VERDECLARO, string);
	        format(string, sizeof(string), "Anunciante: %s ID: %d", NombreEx(playerid), playerid);
		 	MensajeADMIN(DORADO, string);
			SetTimer("TimerAnuncios", TiempoAnuncio, 0);
		}
		return 1;
	}
	if (strcmp(cmd, "/admins", true) == 0)
	{
        if(IsPlayerConnected(playerid))
	    {
			SendClientMessage(playerid, DORADO, "-= {FFFFFF}Miembros del Staff {FEB800}=-");
			for(new i = 0; i < MAX_PLAYERS; i++)
			{
				if(IsPlayerConnected(i))
				{
				    if(Informacion[i][Admin] >= 1 && Informacion[i][Admin] <= 1338)
				    {
						new NombreJugador[MAX_PLAYER_NAME];
						GetPlayerName(i, NombreJugador, sizeof(NombreJugador));
						new RangoSTAFF[64];
					    if(Informacion[i][Admin] == 1338) { RangoSTAFF = "Programador/Desbugger"; }
				        else if(Informacion[i][Admin] == 1337) { RangoSTAFF = "Administrador Lider"; }
						else if(Informacion[i][Admin] == 4) { RangoSTAFF = "Administrador Avanzado"; }
						else if(Informacion[i][Admin] == 3) { RangoSTAFF = "Moderador Global"; }
						else if(Informacion[i][Admin] == 2) { RangoSTAFF = "Moderador"; }
						else if(Informacion[i][Admin] == 1) { RangoSTAFF = "Ayudante"; }
						else { RangoSTAFF = "Moderador Nivel 1"; }
						format(string, 256, "{FEB800}| {FFFFFF}Rango: %d {FEB800}| {FFFFFF}Nombre: %d {FEB800}| {FFFFFF}Categoria: %s {FEB800}|", Informacion[i][Admin], NombreJugador, RangoSTAFF);
						SendClientMessage(playerid, BLANCO, string);
					}
				}
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/colgar", true) == 0 || strcmp(cmd, "/c", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
		{
			new caller = Linea[playerid];
			if(IsPlayerConnected(caller))
			{
			    if(caller != INVALID_PLAYER_ID)
			    {
					if(caller != 255)
					{
						if(caller < 255)
						{
							SendClientMessage(caller,  GRIS, "Han colgado la linea telefonica");
							CellTime[caller] = 0;
							CellTime[playerid] = 0;
							SendClientMessage(playerid,  GRIS, "Has colgado la linea telefonica");
							Linea[caller] = 255;
						}
						Linea[playerid] = 255;
						CellTime[playerid] = 0;
						RingTone[playerid] = 0;
						return 1;
					}
				}
			}
			SendClientMessage(playerid,  GRIS, "Tu telefono ya esta colgado");
		}
		return 1;
	}
	if(strcmp(cmd, "/llamar", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
		{
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, SF_GREY, "Comando: /llamar [Telefono]");
				return 1;
			}
			if(Informacion[playerid][TTelefono] == 0)
			{
				SendClientMessage(playerid, GRIS, "No dispones de un telefono movil");
				return 1;
			}
			format(string, sizeof(string), "%s saca su telefono movil del bolsillo", NombreEx(playerid));
			RangoCercano(30.0, playerid, string, VIOLETA,VIOLETA,VIOLETA,VIOLETA,VIOLETA);
			new ntelefono = strval(tmp);
			if(ntelefono == Informacion[playerid][NTelefono])
			{
				SendClientMessage(playerid, GRIS, "No puedes llamarte a ti mismo");
				return 1;
			}
			if(Linea[playerid] != 255)
			{
				SendClientMessage(playerid, GRIS, "Ya estas en una llamada");
				return 1;
			}
			for(new i = 0; i < MAX_PLAYERS; i++)
			{
				if(IsPlayerConnected(i))
				{
					if(Informacion[i][NTelefono] == ntelefono && ntelefono != 0)
					{
						giveplayerid = i;
						Linea[playerid] = giveplayerid;
						if(IsPlayerConnected(giveplayerid))
						{
						    if(giveplayerid != INVALID_PLAYER_ID)
						    {
								if(Linea[giveplayerid] == 255)
								{
									SendClientMessage(playerid, GRIS, "Tu telefono esta sonando, utiliza el comando /atender para contestar");
									RingTone[giveplayerid] = 10;
									format(string, sizeof(string), "%s le suena su telefono movil", NombreEx(playerid));
									SendClientMessage(playerid, BLANCO, "Espera hasta que te contesten, para finalizar la llamda utiliza /colgar");
									RangoCercano(30.0, i, string, VIOLETA,VIOLETA,VIOLETA,VIOLETA,VIOLETA);
									CellTime[playerid] = 1;
									return 1;
								}
							}
						}
					}
				}
			}
			SendClientMessage(playerid, GRIS, "Acabas de obtener un tono ocupado");
		}
		return 1;
	}
	if(strcmp(cmd, "/guia", true) == 0)
	{
		if(IsPlayerConnected(playerid))
		{
			if(!PlayerToPoint(3, playerid, 1479.9637,-1724.6628,13.5469)) { SendClientMessage(playerid, GRIS, "Lo siento, debes estar en la cabina de ayuda"); return 1; }
			ShowPlayerDialog(playerid,  Guia, DIALOG_STYLE_LIST, " ","-> Facciones\n-> Trabajos\n-> Comandos\n-> Staff\n-> Vehiculo\n-> Propiedades\n-> Objetos\n-> Proximamente","Seleccionar","Cerrar");
			return 1;
		}
		return 1;
	}
	if(strcmp(cmd, "/ooc", true) == 0 || strcmp(cmd, "/o", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
   			if((BloqueoOOC) && Informacion[playerid][Admin] < 1) { SendClientMessage(playerid, GRIS, "Lo siento, el canal OOC [/o] se encuentra desactivado"); return 1; }
			new length = strlen(cmdtext);
			while ((idx < length) && (cmdtext[idx] <= ' '))	{ idx++; }
			new offset = idx;
			new result[64];
			while ((idx < length) && ((idx - offset) < (sizeof(result) - 1))) { result[idx - offset] = cmdtext[idx]; idx++; }
			result[idx - offset] = EOS;
			if(!strlen(result)) {
			SendClientMessage(playerid, DORADO, "Comando: {FFFFFF}/o: [Texto OOC]");
			SendClientMessage(playerid, BLANCO, "Recuerda que este canal es solo para dudas");
			return 1; }
	        new RangosUser[64];
	        if(Informacion[playerid][Admin] == 1338) { RangosUser = "Programador/Desbugger"; }
	        else if(Informacion[playerid][Admin] == 1337) { RangosUser = "Administrador Lider"; }
			else if(Informacion[playerid][Admin] == 4) { RangosUser = "Administrador Avanzado"; }
			else if(Informacion[playerid][Admin] == 3) { RangosUser = "Moderador Global"; }
			else if(Informacion[playerid][Admin] == 2) { RangosUser = "Moderador"; }
			else if(Informacion[playerid][Admin] == 1) { RangosUser = "Ayudante"; }
			else if(Informacion[playerid][Admin] == 0) { RangosUser = "Usuario"; }
			else { RangosUser = "Moderador Nivel 1"; }
   			format(string, sizeof(string),"{FF977E}[GOOC] %s %s dice: {FFFFFF}%s", RangosUser, NombreEx(playerid), result);
			SendClientMessageToAll(0xFF977EFF, string);
			printf("[GOOC] %s",string);
		}
		return 1;
	}
	if(strcmp(cmd, "/b", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			new length = strlen(cmdtext);
			while ((idx < length) && (cmdtext[idx] <= ' '))	{ idx++; }
			new offset = idx;
			new result[64];
			while ((idx < length) && ((idx - offset) < (sizeof(result) - 1))) {	result[idx - offset] = cmdtext[idx]; idx++;	}
			result[idx - offset] = EOS;
			if(!strlen(result)) { SendClientMessage(playerid, DORADO, "Comando: {FFFFFF}/b [Texto]"); return 1;	}
			format(string, sizeof(string), "{3B840A}[OOC] %s dice: {FFFFFF}(( %s ))", NombreEx(playerid), result);
			RangoCercano(20.0, playerid, string, BLANCO,BLANCO,BLANCO,BLANCO,BLANCO);
			printf("[OOC] %s", string);
		}
		return 1;
	}
	if(strcmp(cmd, "/me", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			new length = strlen(cmdtext);
			while ((idx < length) && (cmdtext[idx] <= ' ')) { idx++; }
			new offset = idx;
			new result[64];
			while ((idx < length) && ((idx - offset) < (sizeof(result) - 1))) {	result[idx - offset] = cmdtext[idx]; idx++;	}
			result[idx - offset] = EOS;
			if(!strlen(result))
			{
				SendClientMessage(playerid, DORADO, "Comando: {FFFFFF}/me [Accion]");
				return 1;
			}
			if(TieneMascara[playerid] == 1)
   			{
				format(string, sizeof(string), "* Desconocido %s", result);
				RangoCercano(30.0, playerid, string, VIOLETA,VIOLETA,VIOLETA,VIOLETA,VIOLETA);
			}
			else if(TieneMascara[playerid] == 0)
   			{
				format(string, sizeof(string), "* %s %s", NombreEx(playerid), result);
				RangoCercano(30.0, playerid, string, VIOLETA,VIOLETA,VIOLETA,VIOLETA,VIOLETA);
			}
			printf("%s", string);
		}
		return 1;
	}
	if(strcmp(cmd, "/do", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			new length = strlen(cmdtext);
			while ((idx < length) && (cmdtext[idx] <= ' ')) { idx++; }
			new offset = idx;
			new result[64];
			while ((idx < length) && ((idx - offset) < (sizeof(result) - 1))) {	result[idx - offset] = cmdtext[idx]; idx++;	}
			result[idx - offset] = EOS;
			if(!strlen(result))
			{
				SendClientMessage(playerid, DORADO, "Comando: {FFFFFF}/do [Accion]");
				return 1;
			}
			if(TieneMascara[playerid] == 1)
   			{
				format(string, sizeof(string), "* %s [ID: 999]", result, playerid);
				RangoCercano(30.0, playerid, string, VIOLETA,VIOLETA,VIOLETA,VIOLETA,VIOLETA);
			}
			else if(TieneMascara[playerid] == 0)
   			{
				format(string, sizeof(string), "* %s [ID: %d]", result, playerid);
				RangoCercano(30.0, playerid, string, VIOLETA,VIOLETA,VIOLETA,VIOLETA,VIOLETA);
			}
			printf("%s", string);
		}
		return 1;
	}
	if(strcmp(cmd, "/intentar", true) == 0)
	{
		if(IsPlayerConnected(playerid))
	    {
			new length = strlen(cmdtext);
			while ((idx < length) && (cmdtext[idx] <= ' '))	{ idx++; } new offset = idx; new result[64];
			while ((idx < length) && ((idx - offset) < (sizeof(result) - 1))) { result[idx - offset] = cmdtext[idx]; idx++; }
			result[idx - offset] = EOS;
			if(!strlen(result))
			{
				SendClientMessage(playerid, DORADO, "Comando: {FFFFFF}/intentar [Accion]");
				return 1;
			}
			new randa = random(2)+1;
		    if(randa == 1) format(string, sizeof(string), "* %s intenta %s y lo logra", NombreEx(playerid), result);
			else format(string, sizeof(string), "* %s intenta %s, pero a fallado", NombreEx(playerid), result);
			RangoCercano(30.0, playerid, string, VIOLETA,VIOLETA,VIOLETA,VIOLETA,VIOLETA);
			printf("%s", string);
		}
		return 1;
	}
	if(strcmp(cmd, "/susurrar", true) == 0 || strcmp(cmd, "/s", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {

			new length = strlen(cmdtext);
			while ((idx < length) && (cmdtext[idx] <= ' ')) { idx++; }
			new offset = idx;
			new result[64];
			while ((idx < length) && ((idx - offset) < (sizeof(result) - 1))) { result[idx - offset] = cmdtext[idx]; idx++;	}
			result[idx - offset] = EOS;
			if(!strlen(result)) { SendClientMessage(playerid, DORADO, "Comando: {FFFFFF}/sussurar [Texto]"); return 1; }
			if(TieneMascara[playerid] == 1)
   			{
				format(string, sizeof(string), "Desconocido sussura: %s", result);
				RangoCercano(10.0, playerid, string, BLANCO,BLANCO,BLANCO,BLANCO,BLANCO);
			}
			else if(TieneMascara[playerid] == 0)
   			{
				format(string, sizeof(string), "%s sussura: %s", NombreEx(playerid), result);
				RangoCercano(10.0, playerid, string, BLANCO,BLANCO,BLANCO,BLANCO,BLANCO);
			}
			printf("[SUSSURO] %s", string);
		}
		return 1;
	}
	if(strcmp(cmd, "/gritar", true) == 0 || strcmp(cmd, "/g", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			new length = strlen(cmdtext);
			while ((idx < length) && (cmdtext[idx] <= ' ')) { idx++; }
			new offset = idx;
			new result[64];
			while ((idx < length) && ((idx - offset) < (sizeof(result) - 1))) { result[idx - offset] = cmdtext[idx]; idx++;	}
			result[idx - offset] = EOS;
			if(!strlen(result)) { SendClientMessage(playerid, DORADO, "Comando: {FFFFFF}/gritar [Texto]"); return 1; }
			if(TieneMascara[playerid] == 1)
   			{
				format(string, sizeof(string), "Desconocido grita: �%s!", result);
				RangoCercano(50.0, playerid, string, BLANCO,BLANCO,BLANCO,BLANCO,BLANCO);
			}
			else if(TieneMascara[playerid] == 0)
   			{
				format(string, sizeof(string), "%s grita: �%s!", NombreEx(playerid), result);
				RangoCercano(50.0, playerid, string, BLANCO,BLANCO,BLANCO,BLANCO,BLANCO);
			}
			printf("[GRITO] %s", string);
		}
		return 1;
	}
	if(strcmp(cmd, "/mp", true) == 0 || strcmp(cmd, "/mprivados", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) { SendClientMessage(playerid, DORADO, "Comando: {FFFFFF}(/mp)rivados [ID] [Texto]"); return 1;	}
			giveplayerid = ReturnUser(tmp);
			if (IsPlayerConnected(giveplayerid))
			{
			    if(giveplayerid != INVALID_PLAYER_ID)
			    {
			        if(BloqueoWhispeos[giveplayerid] > 0) { SendClientMessage(playerid, GRIS, "Lo siento, el usuario tiene las entradas privadas bloqueadas"); return 1; }
					new length = strlen(cmdtext);
					while ((idx < length) && (cmdtext[idx] <= ' ')) { idx++; }
					new offset = idx;
					new result[64];
					while ((idx < length) && ((idx - offset) < (sizeof(result) - 1))) { result[idx - offset] = cmdtext[idx]; idx++;	}
					result[idx - offset] = EOS;
					if(!strlen(result))	{ SendClientMessage(playerid, DORADO, "Comando: {FFFFFF}(/mp)rivados [ID] [Texto]"); return 1; }
					if(Informacion[giveplayerid][Admin] == 0 && Informacion[playerid][Admin] == 0) { SendClientMessage(playerid, GRIS, "Lo siento, solo puedes enviarle mensajes privados a miembros del staff"); return 1; }
					format(string, sizeof(string), "[MP] %s dice: {FFFFFF}%s", NombreEx(playerid), (result));
					SendClientMessage(giveplayerid, AMARILLO, string);
					format(string, sizeof(string), "[MP] Enviado a %s: {FFFFFF}%s", NombreEx(giveplayerid), (result));
					SendClientMessage(playerid,  AMARILLO, string);
					return 1;
				}
			}
			else
			{
					SendClientMessage(playerid, GRIS, "Lo siento, el usuario esta desconectado");
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/pasamonta�as", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
	        if(Informacion[playerid][Mascara] == 0) { SendClientMessage(playerid, GRIS, "Lo siento, no tienes un pasamonta�as en tu inventario"); return 1; }
			if(TieneMascara[playerid] == 0)
			{
			    TieneMascara[playerid] = 1;
			    SendClientMessage(playerid, AZULCLARO, "Te has colocado tu pasamonta�as, ahora nadie sabra quien eres");
			    format(string, sizeof(string), "* %s saca su pasamonta�as del bolsillo y se lo coloca en su rostro",NombreEx(playerid));
			    RangoCercano(30, playerid, string, VIOLETA, VIOLETA, VIOLETA, VIOLETA, VIOLETA);
				for(new i = 0; i < MAX_PLAYERS; i++)
	   			{
	   		    	if(IsPlayerConnected(i))
	   		    	{
			   			ShowPlayerNameTagForPlayer(i, playerid, 0);
					}
				}
			}
			else if(TieneMascara[playerid] == 1)
			{
			    TieneMascara[playerid] = 0;
			    SendClientMessage(playerid, AZULCLARO, "Te has quitado tu pasamonta�as, ahora podran saber quien eres");
			    format(string, sizeof(string), "* %s retira su pasamonta�as de su cabeza y lo guarda en su bolsillo",NombreEx(playerid));
			    RangoCercano(30, playerid, string, VIOLETA, VIOLETA, VIOLETA, VIOLETA, VIOLETA);
		    	for(new i = 0; i < MAX_PLAYERS; i++)
	   			{
	   		    	if(IsPlayerConnected(i))
	   		    	{
			   			ShowPlayerNameTagForPlayer(i, playerid, 1);
					}
				}
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/solicitar", true) == 0)
	{
		if(!PlayerToPoint(5, playerid, -2033.1423,-117.3941,1035.1719)) { SendClientMessage(playerid, GRIS, "Lo siento, debes estar en las oficinas del departamento de licencias"); return 1; }
		ShowPlayerDialog(playerid, SolicitudLice, DIALOG_STYLE_LIST, "�Qu� desea solicitar?", "-> Licenciero de vehiculos terrestres\n-> Licenciero de vehiculos aereos\n-> Licenciero de vehiculos maritimos\n-> Licenciero de armamento personal\n-> Profesor de Idiomas","Seleccionar","Cancelar");
		return 1;
	}
	if(strcmp(cmd, "/bug", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			new length = strlen(cmdtext);
			while ((idx < length) && (cmdtext[idx] <= ' ')) { idx++; }
			new offset = idx; new result[64];
			while ((idx < length) && ((idx - offset) < (sizeof(result) - 1))) { result[idx - offset] = cmdtext[idx]; idx++;	}
			result[idx - offset] = EOS;
			if(!strlen(result))	{ SendClientMessage(playerid, DORADO, "Comando: {FFFFFF}/bug [Descipcion]"); return 1; }
			format(string, sizeof(string), "Aviso, un nuevo bug ha sido almacenado en la base de datos, avisar al programador", result, playerid);
			MensajeADMIN(PURPURA, string);
			SendClientMessage(playerid, VERDE, "Envio satisfactorio, su reporte ha sido enviado a la base de datos para que sea revisado");
			SendClientMessage(playerid, BLANCO,"Aviso, los Mensajes que ingrese aqui no seran leidos por administradores, solo por el programador OOC");
	    }
	    return 1;
	}
 	/* ===============================[Vehiculo]================================ */
 	if(strcmp(cmd, "/vcontrol", true) == 0)
	{
  		if(!IsPlayerInAnyVehicle(playerid) && !PLAYER_STATE_DRIVER) { SendClientMessage(playerid, GRIS, "Lo siento, debes estar dentro de un vehiculo como conductor"); return 1; }
		ShowPlayerDialog(playerid, VPanel, DIALOG_STYLE_LIST, "{FEB800}- Panel Vehiculo","-> Luces\n-> Capo\n-> Maletero\n-> Apagar Motor\n-> Ejectarme","Seleccionar","Cancelar");
		return 1;
	}
	if(strcmp(cmd, "/vdesrentar", true) == 0)
	{
	    if(IsPlayerInAnyVehicle(playerid))
	    {
	        if(GetPlayerVehicleID(playerid) == Informacion[playerid][VRentado])
	        {
			    if(Informacion[playerid][VRentado] == GetPlayerVehicleID(playerid))
			    {
			        if(Informacion[playerid][HeRentado] == 1)
			        {
						Informacion[playerid][VRentado] = 0;
						Rentado[GetPlayerVehicleID(playerid)] = 0;
					 	Informacion[playerid][HeRentado] = 0;
						GameTextForPlayer(playerid, "~n~~n~~n~~n~~n~~r~Has desrentado el vehiculo", 4000, 3);
						SetVehicleToRespawn(GetPlayerVehicleID(playerid));
						TogglePlayerControllable(playerid, DESCONGELADO);
					}
					else
					{
					    SendClientMessage(playerid, GRIS, "Lo siento, usted no tiene ningun vehiculo rentado");
					}
				}
			}
			else
			{
			    SendClientMessage(playerid, GRIS, "Este vehiculo no lo has rentado");
			}
		}
		else
		{
		    SendClientMessage(playerid, GRIS, "Lo siento, debes estar dentro del vehiculo para desrentarlo");
		}
	    return 1;
	}
	if(strcmp(cmd, "/vermatricula", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
	        new carv = VehiculoCercano(playerid);
	        if(DistanciaEntreCarPer(carv,playerid) < 5)
			{
			    if(carv >= TOTAL_VEH)
			    {
			        SendClientMessage(playerid, GRIS, "La matricula esta muy da�ada, no se distinge el numero");
			        return 1;
			    }
			    new npstring[128];
			    format(npstring, sizeof(npstring), "%d", CarMatricula[carv]);
			    TextDrawSetString(Text:M_Texto[playerid], npstring);
				TextDrawShowForPlayer(playerid, Text:M_Fondo);
				TextDrawShowForPlayer(playerid, Text:M_Fondo2);
				TextDrawShowForPlayer(playerid, Text:M_Titulo);
				TextDrawShowForPlayer(playerid, Text:M_Texto[playerid]);
				SetTimerEx("TogglearMatricula", 10000, false, "id", playerid);
			}
	    }
	    return 1;
	}
	if(strcmp(cmd, "/bloqueo", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
	        if(Informacion[playerid][Coche] != 9999)
	        {
		        new car = Informacion[playerid][Coche];
				if(DistanciaEntreCarPer(car, playerid) < 5)
				{
				    if(CInformacion[car][cLock] == 1)
				    {
						GetVehicleParamsEx(car,engine,lights,alarm,doors,bonnet,boot,objective);
						SetVehicleParamsEx(car,engine,lights,alarm,0,bonnet,boot,objective);
			            GameTextForPlayer(playerid, "~w~Vehiculo ~g~Desbloqueado", 2000, 4);
			            CInformacion[car][cLock] = 0;
				    }
				    else if(CInformacion[car][cLock] == 0)
				    {
						GetVehicleParamsEx(car,engine,lights,alarm,doors,bonnet,boot,objective);
						SetVehicleParamsEx(car,engine,lights,alarm,1,bonnet,boot,objective);
			            GameTextForPlayer(playerid, "~w~Vehiculo ~r~Bloqueado", 2000, 4);
			            CInformacion[car][cLock] = 1;
				    }
				}
				else
				{
				    SendClientMessage(playerid, GRIS, "Lo siento, debes estar cerca de tu coche para cerrarlo/abrirlo");
				}
			}
			else
			{
			    SendClientMessage(playerid, GRIS, "Lo siento, no dispones de una cuenta");
			    return 1;
			}
	    }
	    return 1;
	}
	if(strcmp(cmd, "/salirveh", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
	        if(IsPlayerInAnyVehicle(playerid))
		    {
				TextDrawHideForPlayer(playerid, Text:V_BOX);
				TextDrawHideForPlayer(playerid, Text:V_TITLE);
				TextDrawHideForPlayer(playerid, Text:V_TEXT[playerid]);
				TextDrawHideForPlayer(playerid, Text:V_ANUNCIO);
				RemovePlayerFromVehicle(playerid);
				TogglePlayerControllable(playerid, DESCONGELADO);
			}
			else
			{
				SendClientMessage(playerid, GRIS, "Lo siento, necesitas estar arriba de un vehiculo para salir");
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/estacionar", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
	        if(IsPlayerInAnyVehicle(playerid))
		    {
		        new coche = GetPlayerVehicleID(playerid);
			    if(VehiculosVenta(coche))
			    {
					if(coche == Informacion[playerid][Coche])
					{
					    new Float: carposx, Float: carposy, Float: carposz, Float:carposa;
					    GetVehiclePos(coche, carposx, carposy, carposz);
                        GetVehicleZAngle(coche, carposa);
                        CInformacion[coche][cLocationx] = carposx;
                        CInformacion[coche][cLocationy] = carposy;
                        CInformacion[coche][cLocationz] = carposz;
                        CInformacion[coche][cAngle] = carposa;
                        ActualizarVehiculos();
                        GameTextForPlayer(playerid, "~w~Vehiculo ~g~Estacionado", 2000, 4);
					}
					else
					{
					    SendClientMessage(playerid, GRIS, "Lo siento, no eres propietario de este vehiculo");
					}
			    }
			    else
			    {
			        SendClientMessage(playerid, GRIS, "Lo siento, no se permiten vehiculos genericos");
			    }
			}
			else
			{
			    SendClientMessage(playerid, GRIS, "Lo siento, debes estar sobre un vehiculo para utilizar este comando");
			}
	    }
	    return 1;
	}
	if(strcmp(cmd, "/papeles", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
		{
		    if(Informacion[playerid][Coche]!= 9999)
			{
			    tmp = strtok(cmdtext, idx);
				if(!strlen(tmp))
				{
					SendClientMessage(playerid, DORADO, "Comando: {FFFFFF}/papeles [ID]");
					return 1;
				}
				new player = strval(tmp);
				if(GetDistanceBetweenPlayers(playerid, player) > 3.0)
				{
				    SendClientMessage(playerid, GRIS, "Lo siento, debes estar cerca del jugador al que quieres mostrarle los papeles");
				    return 1;
				}
			    new car = Informacion[playerid][Coche];
                new dias = ((CInformacion[car][cTComprado]-(CInformacion[car][cTComprado]%24))/24);
                new horas = (CInformacion[car][cTComprado]%24);
				format(string, sizeof(string), "Propietario: %s\nMatricula: %d\nModelo: %s\nEmpadronamiento vencido en %d dias y %d horas", CInformacion[car][cNameD], CarMatricula[car], VehicleName[GetVehicleModel(car)-400], dias, horas);
				ShowPlayerDialog(player, VPapeles, DIALOG_STYLE_MSGBOX," ", string, "Salir", "");
			}
			else
			{
			    SendClientMessage(playerid, GRIS, "Lo siento, no dispones de ningun vehiculo actualmente");
			    return 1;
			}
		}
		return 1;
	}
	/* =================================[BANCO]================================ */
	if(strcmp(cmd, "/registrar", true) == 0)
	{
		if(!PlayerToPoint(100, playerid, 1438.3186,-996.9917,1639.7843)) { SendClientMessage(playerid, GRIS, "Lo siento, debes estar en las cajas de registro del banco"); return 1; }
        if(Informacion[playerid][DNI] == 0) { SendClientMessage(playerid, GRIS, "Lo siento, debes tener una documentaci�n para abrir una cuenta bancaria"); return 1; }
        if(Informacion[playerid][CBancaria] == 1) { SendClientMessage(playerid, GRIS, "Lo siento, ya tienes una cuenta bancaria"); return 1; }
        if(Informacion[playerid][Busqueda] >= 1) { SendClientMessage(playerid, GRIS, "Lo siento, no podemos dar cuenta bancaria a un civil buscado por la SAPD"); return 1; }
		new DialogText[968];
		strcat(DialogText, "{D49E00}-= Banco Municipal de Los Santos =-\n");
		strcat(DialogText, "{FFFFFF}�Estas listo para adquirir tu primera cuenta bancaria?\n");
		strcat(DialogText, "{FFFFFF}con esta tarjeta puedes empezar a transferir, depositar o retirar dinero\n");
		strcat(DialogText, "{FFFFFF}ademas de recibir las pagas horarias a tu cuenta bancaria\n");
		strcat(DialogText, "\n");
		strcat(DialogText, "{FFFFFF}Nuestro banco no cobrara ningun interes mensual a su cuenta bancaria\n");
		strcat(DialogText, "{FFFFFF}Ningun tipo de descuentos por retiro, transferencia o deposito\n");
		strcat(DialogText, "{FFFFFF}Has click en SIGUIENTE para continuar y CERRAR para cancelar\n");
		ShowPlayerDialog(playerid, TerminosBancarios, DIALOG_STYLE_MSGBOX, " ", DialogText, "Siguiente", "Cerrar");
	}
	if(strcmp(cmd, "/banco", true) == 0)
	{
		if(!PlayerToPoint(100, playerid, 1438.3186,-996.9917,1639.7843)) { SendClientMessage(playerid, GRIS, "Lo siento, debes estar en los cajeros del banco"); return 1; }
		if(Informacion[playerid][CBancaria] == 0) { SendClientMessage(playerid, GRIS, "Lo siento, no tienes ninguna cuenta bancaria"); return 1; }
	    ShowPlayerDialog(playerid, DBanco, DIALOG_STYLE_LIST, "{D49E00}-= Banco Municiapl de Los Santos =-","-> Depositar\n-> Transferir\n-> Retirar\n-> Informacion", "Aceptar", "Cancelar");
	    return 1;
	}
 	/* ==================================[SAPD]================================ */
	if(strcmp(cmd, "/multar", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
	        if(Informacion[playerid][Faccion] != SAPD) { SendClientMessage(playerid, GRIS, "Comando no disponible, requiere ser miembro SAPD"); return 1; }
	    	tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, DORADO, "Comando: {FFFFFF}/multar [ID] [Precio] [Detalles]");
				return 1;
			}
			giveplayerid = ReturnUser(tmp);
            tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, DORADO, "Comando: {FFFFFF}/multar [ID] [Precio] [Detalles]");
				return 1;
			}
			Precio = strval(tmp);
			if(Precio < 1 || Precio > 5000) { SendClientMessage(playerid, GRIS, "El valor del ticket no puede superar los $5000"); return 1; }
			if(IsPlayerConnected(giveplayerid))
			{
			    if(giveplayerid != INVALID_PLAYER_ID)
			    {
			        if(RangoCercanoS(8.0, playerid, giveplayerid))
					{
						new length = strlen(cmdtext);
						while ((idx < length) && (cmdtext[idx] <= ' '))
						{
							idx++;
						}
						new offset = idx;
						new result[64];
						while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
						{
							result[idx - offset] = cmdtext[idx];
							idx++;
						}
						result[idx - offset] = EOS;
						if(!strlen(result))
						{
							SendClientMessage(playerid, DORADO, "Comando: {FFFFFF}/multar [ID] [Precio] [Detalles]");
							return 1;
						}
						format(string, sizeof(string), "* Has dado a %s una multa de $%d por %s", NombreEx(giveplayerid), Precio, (result));
						SendClientMessage(playerid, NARANJA, string);
						format(string, sizeof(string), "{AA0000}�Advertencia!, has sido multado\n\nMiembro SAPD: {FFFFFF}%s\n{AA0000}Precio: {FFFFFF}$%d", NombreEx(playerid), Precio);
						ShowPlayerDialog(playerid, Multa, DIALOG_STYLE_MSGBOX, " ", string, "Pagar", "Ignorar");
						format(string, sizeof(string), "* %s hace una multa y se la da a %s", NombreEx(playerid), NombreEx(giveplayerid));
						RangoCercano(10, playerid, string, VIOLETA, VIOLETA, VIOLETA, VIOLETA, VIOLETA);
						EmisorMulta[giveplayerid] = playerid;
						PrecioMulta[giveplayerid] = Precio;
						Informacion[giveplayerid][Multas] += 1;
						return 1;
					}
					else
					{
						SendClientMessage(playerid, GRIS, "Lo siento oficial, el usuario se encuentra muy lejos de ti");
						return 1;
					}
				}
			}
			else
			{
			    SendClientMessage(playerid, GRIS, "Lo siento oficial, el usuario se encuentra desconectado");
			    return 1;
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/busqueda", true) == 0)
	{
	    new tmp2[256], jugador, nivel, mensaje[256], mensaje2[256];
	    tmp = strtok(cmdtext, idx);
	    tmp2 = strtok(cmdtext, idx);
	    jugador = strval(tmp);
	    nivel = strval(tmp2);
	    if(!strlen(tmp) || !strlen(tmp2)) return SendClientMessage(playerid, DORADO, "Comando: {FFFFFF}/busqueda [ID] [Nivel]");
	    if(IsPlayerConnected(jugador) && IsPlayerConnected(playerid))
	    {
	        if(Informacion[playerid][Faccion] == SAPD)
	        {
				if(nivel > 6) { SendClientMessage(playerid, GRIS, "Lo siento, el valor maximo es de 6 puntos de busqueda"); return 1; }
				format(mensaje, sizeof(mensaje), "[SAPD]�Atenci�n!, tu nivel de busqueda ha sido fijado en %d estrellas por el miembro SAPD %s", nivel, NombreEx(playerid));
	            SendClientMessage(jugador, 0x00A6FFFF, mensaje);
    		    format(mensaje2, sizeof(mensaje2), "Sospechoso: %s | Nivel de Busqueda: %d | Denunciante: %s",NombreEx(jugador), nivel, NombreEx(playerid));
	            MensajeSAPD(CROJOV, mensaje2);
	            Informacion[jugador][Busqueda] = nivel;
	            SetPlayerWantedLevel(jugador, nivel);
		        GameTextForPlayer(jugador, "~r~~n~~n~�Nivel de Busqueda cambiada!", 3000, 4);
	            PlayerPlaySound(playerid, 1057, 0.0, 0.0, 0.0);
				PlayerPlaySound(jugador, 1057, 0.0, 0.0, 0.0);
	        }
	        else
	        {
	            SendClientMessage(playerid, GRIS, "Comando no disponible, requiere ser miembro SAPD");
	        }
	    }
	    else
	    {
	        SendClientMessage(playerid, GRIS, "Lo siento, el usuario se encuentra desconectado");
	    }
	    return 1;
	}
	if(strcmp(cmd, "/tazer", true) == 0 || strcmp(cmd, "/ta", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			if(ServicioSAPD[playerid] == 0) { SendClientMessage(playerid, GRIS, "Lo siento, debes estar de servicio para utilizar el comando (No tienes tazer)"); return 1; }
			if(TazerMano[playerid] == 0)
			{
				if(Informacion[playerid][Faccion] != SAPD) { SendClientMessage(playerid, GRIS, "Comando no disponible, requiere ser miembro SAPD"); return 1; }
			    format(string, sizeof(string), "* %s saca su tazer de su cinturon y carga la electricidad", NombreEx(playerid));
		        RangoCercano(10, playerid, string, VIOLETA, VIOLETA, VIOLETA, VIOLETA, VIOLETA);
				TazerMano[playerid] = 1;
				SetPlayerAttachedObject(playerid, 0, 18642, 6, 0.06, 0.01, 0.08, 180.0, 0.0, 0.0);
			}
			else if(TazerMano[playerid] == 1)
			{
			  	if(Informacion[playerid][Faccion] != SAPD) { SendClientMessage(playerid, GRIS, "Comando no disponible, requiere ser miembro SAPD"); return 1; }
		        format(string, sizeof(string), "* %s guarda su tazer de su cinturon y descarga la electricidad", NombreEx(playerid));
		        RangoCercano(10, playerid, string, VIOLETA, VIOLETA, VIOLETA, VIOLETA, VIOLETA);
				TazerMano[playerid] = 0;
				RemovePlayerAttachedObject(playerid, 0);
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/esposas", true) == 0)
	{
		if(IsPlayerConnected(playerid))
		{
			if(JugadorEsposado[giveplayerid] == 1)
			{
			    if(Informacion[playerid][Faccion] != SAPD) { SendClientMessage(playerid, GRIS, "Comando no disponible, requiere ser miembro SAPD"); return 1; }
				if(ServicioSAPD[playerid] == 0) { SendClientMessage(playerid, GRIS, "Lo siento, debes estar de servicio para utilizar el comando (No tienes esposas)"); return 1; }
				tmp = strtok(cmdtext, idx);
				if(!strlen(tmp)) { SendClientMessage(playerid, DORADO, "Comando: {FFFFFF}/esposas [ID]"); return 1; }
				giveplayerid = ReturnUser(tmp);
				if(!IsPlayerConnected(giveplayerid)) { SendClientMessage(playerid, GRIS, "Lo siento oficial, el sospechoso se encuentra desconectado"); return 1; }
				if(Informacion[giveplayerid][Faccion] == SAPD) { SendClientMessage(playerid, GRIS, "Lo siento oficial, no puedes esposar a otro miembro de SAPD"); return 1; }
				if(RangoCercanoS(5.0, playerid, giveplayerid))
				{
					if(giveplayerid == playerid) { SendClientMessage(playerid, GRIS, "Lo siento oficial, no puedes esposarte a ti mismo"); return 1; }
					format(string, sizeof(string), "* El miembro de SAPD %s ta ha esposado", NombreEx(playerid));
					SendClientMessage(giveplayerid, AZULCLARO, string);
					format(string, sizeof(string), "* Has esposado al sospechoso %s", NombreEx(giveplayerid));
					SendClientMessage(giveplayerid, AZULCLARO, string);
					format(string, sizeof(string), "* %s le coloca esposas a %s y las cierra con llave fuertemente", NombreEx(playerid), NombreEx(giveplayerid));
					RangoCercano(10, playerid, string, VIOLETA, VIOLETA, VIOLETA, VIOLETA, VIOLETA);
					JugadorEsposado[giveplayerid] = 1;
					TogglePlayerControllable(giveplayerid, 0);
				 }
			}
			else if(JugadorEsposado[giveplayerid] == 0)
			{
				{
					if(ServicioSAPD[playerid] == 0) { SendClientMessage(playerid, GRIS, "Lo siento, debes estar de servicio para utilizar el comando (No tienes esposas)"); return 1; }
					tmp = strtok(cmdtext, idx);
					if(!strlen(tmp)) { SendClientMessage(playerid, DORADO, "Comando: {FFFFFF}/desesposar [ID]"); return 1; }
					giveplayerid = ReturnUser(tmp);
					if(!IsPlayerConnected(giveplayerid)) { SendClientMessage(playerid, GRIS, "Lo siento oficial, el sospechoso se encuentra desconectado"); return 1; }
					if(Informacion[giveplayerid][Faccion] == SAPD) { SendClientMessage(playerid, GRIS, "Lo siento oficial, no puedes desesposar a otro miembro de SAPD"); return 1; }
					if(RangoCercanoS(5.0, playerid, giveplayerid))
					{
						if(giveplayerid == playerid) { SendClientMessage(playerid, GRIS, "Lo siento oficial, no puedes desesposarte a ti mismo"); return 1; }
						format(string, sizeof(string), "* El miembro de SAPD %s ta ha desesposado", NombreEx(playerid));
						SendClientMessage(giveplayerid, AZULCLARO, string);
						format(string, sizeof(string), "* Has desesposado al sospechoso %s", NombreEx(giveplayerid));
						SendClientMessage(giveplayerid, AZULCLARO, string);
						format(string, sizeof(string), "* %s le quita las esposas a %s", NombreEx(playerid), NombreEx(giveplayerid));
						RangoCercano(10, playerid, string, VIOLETA, VIOLETA, VIOLETA, VIOLETA, VIOLETA);
						JugadorEsposado[giveplayerid] = 0;
						TogglePlayerControllable(giveplayerid, 1);
					}
				}
			}
		}
		return 1;
	}
	if(strcmp("/asensor", cmdtext, true, 10) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
	    	if(Informacion[playerid][Faccion] == SAPD)
	    	{
	    	    if(PlayerToPoint(3, playerid, 258.2337,86.5617,1002.4453))
				{
					ShowPlayerDialog(playerid, Asensor, DIALOG_STYLE_MSGBOX, "{FEB800}- Asensor LSPD","{FFFFFF}�A d�nde desea ir oficial?","Garage","Azotea");
				}
				else
				{
					SendClientMessage(playerid, GRIS, "Debes estar en la puerta del elevador de LSPD");
					return 1;
				}
			}
			return 1;
		}
	}
	if(strcmp(cmd, "/servicio", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			if(ServicioSAPD[playerid] == 0)
			{
				if(!PlayerToPoint(4, playerid, 253.7153,76.9650,1003.6406)) { SendClientMessage(playerid, GRIS, "Lo siento, debes estar en el vestuario del departamento"); return 1; }
				if(Informacion[playerid][Faccion] != SAPD) { SendClientMessage(playerid, GRIS, "Comando no disponible, requiere ser miembro SAPD"); return 1; }
			    format(string, sizeof(string), "* %s saca su placa, su tazer y su desert eagle y los coloca en su cinturon", NombreEx(playerid));
		        RangoCercano(10, playerid, string, VIOLETA, VIOLETA, VIOLETA, VIOLETA, VIOLETA);
				ServicioSAPD[playerid] = 1;
				GivePlayerWeapon(playerid, 24, 250);

			}
			else if(ServicioSAPD[playerid] == 1)
			{
				if(!PlayerToPoint(4, playerid, 253.7153,76.9650,1003.6406)) { SendClientMessage(playerid, GRIS, "Lo siento, debes estar en el vestuario del departamento"); return 1; }
			    if(Informacion[playerid][Faccion] != SAPD) { SendClientMessage(playerid, GRIS, "Comando no disponible, requiere ser miembro SAPD"); return 1; }
		        format(string, sizeof(string), "* %s guarda su placa, su tazer y su desert eagle en la taquilla", NombreEx(playerid));
		        RangoCercano(10, playerid, string, VIOLETA, VIOLETA, VIOLETA, VIOLETA, VIOLETA);
				ServicioSAPD[playerid] = 0;
				GivePlayerWeapon(playerid, 24, 0);
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/equipo", true) == 0)
	{
        if(Informacion[playerid][Faccion] != SAPD) { SendClientMessage(playerid, GRIS, "Comando no disponible, requiere ser miembro SAPD"); return 1; }
        if(!PlayerToPoint(4, playerid, 253.7153,76.9650,1003.6406)) { SendClientMessage(playerid, GRIS, "Lo siento, debes estar en el vestuario del departamento"); return 1; }
        ShowPlayerDialog(playerid, EquipoSAPD, DIALOG_STYLE_LIST, " ","-> Equipo SWAT Ligero\n-> Equipo SWAT Pesado\n-> Equipo Francotirador\n-> Equipo Espionaje\n-> Retirar Equipo","Seleccionar","Cerrar");
		return 1;
	}
	if(strcmp(cmd, "/ref", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
         	if(Informacion[playerid][Faccion] != SAPD) { SendClientMessage(playerid, GRIS, "Comando no disponible, requiere ser miembro SAPD"); return 1; }
	        if(PedidoRefuerzos[playerid] == 0)
	        {
				new RangoSAPD[64];
				if(Informacion[playerid][Rango] == 1) { RangoSAPD = "Guardia de Seguridad"; }
				else if(Informacion[playerid][Rango] == 2) { RangoSAPD = "Cadete"; }
				else if(Informacion[playerid][Rango] == 3) { RangoSAPD = "Oficial de Patrulla"; }
				else if(Informacion[playerid][Rango] == 4) { RangoSAPD = "Sargento de Oficinas"; }
				else if(Informacion[playerid][Rango] == 5) { RangoSAPD = "Patrulla Antivicio"; }
				else if(Informacion[playerid][Rango] == 6) { RangoSAPD = "Inspector"; }
				else if(Informacion[playerid][Rango] == 7) { RangoSAPD = "Teniente"; }
				else if(Informacion[playerid][Rango] == 8) { RangoSAPD = "Jefe de Operaci�nes"; }
				else if(Informacion[playerid][Rango] == 9) { RangoSAPD = "Jefe de Policia"; }
				else if(Informacion[playerid][Rango] == 10) { RangoSAPD = "Ministro de Seguridad"; }
				else { RangoSAPD = "Cadete"; }
				format(string, sizeof(string), "* SAPD: El %s %s requiere apoyo urgentemente, posicion marcada en el radar", RangoSAPD, NombreEx(playerid));
				MensajeSAPD(CROJOV, string);
				SendClientMessage(playerid, DORADO, "Vuelve a ingresar /ref para desactivar el rastreo GPS de tu posicion");
				PedidoRefuerzos[playerid] = 1;
    			for(new i = 0; i < MAX_PLAYERS; i++)
				{
				    if(IsPlayerConnected(i))
				    {
				        if(Informacion[i][Faccion] == SAPD)
				        {
				            SetPlayerMarkerForPlayer(i, playerid, CROJOV);
						}
					}
				}
			}
			else if(PedidoRefuerzos[playerid] == 1)
			{
				new RangoSAPD[64];
				if(Informacion[playerid][Rango] == 1) { RangoSAPD = "Guardia de Seguridad"; }
				else if(Informacion[playerid][Rango] == 2) { RangoSAPD = "Cadete"; }
				else if(Informacion[playerid][Rango] == 3) { RangoSAPD = "Oficial de Patrulla"; }
				else if(Informacion[playerid][Rango] == 4) { RangoSAPD = "Sargento de Oficinas"; }
				else if(Informacion[playerid][Rango] == 5) { RangoSAPD = "Patrulla Antivicio"; }
				else if(Informacion[playerid][Rango] == 6) { RangoSAPD = "Inspector"; }
				else if(Informacion[playerid][Rango] == 7) { RangoSAPD = "Teniente"; }
				else if(Informacion[playerid][Rango] == 8) { RangoSAPD = "Jefe de Operaci�nes"; }
				else if(Informacion[playerid][Rango] == 9) { RangoSAPD = "Jefe de Policia"; }
				else if(Informacion[playerid][Rango] == 10) { RangoSAPD = "Ministro de Seguridad"; }
				else { RangoSAPD = "Cadete"; }
				format(string, sizeof(string), "* SAPD: El %s %s ya no requiere apoyo, su posicion ha sido borrada del radar", RangoSAPD, NombreEx(playerid));
				MensajeSAPD(VERDE, string);
				PedidoRefuerzos[playerid] = 0;
    			for(new i = 0; i < MAX_PLAYERS; i++)
				{
				    if(IsPlayerConnected(i))
				    {
				        if(Informacion[i][Faccion] == SAPD)
				        {
				            SetPlayerMarkerForPlayer(i, playerid, SINCOLOR);
						}
					}
				}
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/transmitirgob", true) == 0 || strcmp(cmd, "/tgob", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			if(TransmisionGobierno[playerid] == 0)
			{
				if(Informacion[playerid][Faccion] != SAPD) { SendClientMessage(playerid, GRIS, "Comando no disponible, requiere ser miembro SAPDI"); return 1; }
				if(Informacion[playerid][Rango] != 10) { SendClientMessage(playerid, GRIS, "Comando no disponible, solo ministro de seguridad"); return 1; }
				SendClientMessageToAll(BLANCO, "{909FBE}* * * * * -= {FFFFFF}Transmisi�n Gobernamental {909FBE}=- * * * * *");
				format(string, sizeof(string), "{909FBE}Comunicador: {FFFFFF}%s", NombreEx(playerid));
				SendClientMessageToAll(BLANCO, string);
				SendClientMessage(playerid, VERDE, "�Conexi�n establecida con �xito!");
				format(string, sizeof(string), "* %s prende su microfono inalambrico", NombreEx(playerid));
		        RangoCercano(10, playerid, string, VIOLETA, VIOLETA, VIOLETA, VIOLETA, VIOLETA);
				TransmisionGobierno[playerid] = 1;
			}
			else if(TransmisionGobierno[playerid] == 1)
			{
			    if(Informacion[playerid][Faccion] != SAPD) { SendClientMessage(playerid, GRIS, "Comando no disponible, requiere ser miembro SAPD"); return 1; }
				if(Informacion[playerid][Rango] != 10) { SendClientMessage(playerid, GRIS, "Comando no disponible, solo ministro de seguridad"); return 1; }
				SendClientMessageToAll(ROJO, "-| Transmisi�n Gobernamental Finalizada -|");
				format(string, sizeof(string), "* %s apaga su microfono inalambrico", NombreEx(playerid));
				SendClientMessage(playerid, ROJO, "�Conexi�n finalizada con �xito!");
		        RangoCercano(10, playerid, string, VIOLETA, VIOLETA, VIOLETA, VIOLETA, VIOLETA);
				TransmisionGobierno[playerid] = 0;
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/megafono", true) == 0 || strcmp(cmd, "/m", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			if(VozMegafono[playerid] == 0)
			{
			    if(Informacion[playerid][Faccion] != SAPD || Informacion[playerid][Faccion] != SAMD) { SendClientMessage(playerid, GRIS, "Comando no disponible, requiere ser miembro SAPD o SAMD"); return 1; }
		        format(string, sizeof(string), "* %s descuelga su megafono de su cinturon", NombreEx(playerid));
		        RangoCercano(10, playerid, string, VIOLETA, VIOLETA, VIOLETA, VIOLETA, VIOLETA);
				VozMegafono[playerid] = 1;
			}
			else if(VozMegafono[playerid] == 1)
			{
			    if(Informacion[playerid][Faccion] != SAPD || Informacion[playerid][Faccion] != SAMD) { SendClientMessage(playerid, GRIS, "Comando no disponible, requiere ser miembro SAPD o SAMD"); return 1; }
		        format(string, sizeof(string), "* %s cuelga su megafono de su cinturon", NombreEx(playerid));
		        RangoCercano(10, playerid, string, VIOLETA, VIOLETA, VIOLETA, VIOLETA, VIOLETA);
				VozMegafono[playerid] = 0;
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/placa", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
	        if(Informacion[playerid][Faccion] != SAPD) { SendClientMessage(playerid, GRIS, "Comando no disponible, requiere ser miembro SAPD"); return 1; }
        	tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, DORADO, "Comando: {FFFFFF}/placa [ID]");
				return 1;
			}
			giveplayerid = ReturnUser(tmp);
			if(IsPlayerConnected(giveplayerid))
			{
				if(giveplayerid != INVALID_PLAYER_ID)
				{
			    	if(RangoCercanoS(8.0, playerid, giveplayerid))
					{
						new RangoSAPD[64];
						if(Informacion[playerid][Rango] == 1) { RangoSAPD = "Guardia de Seguridad"; }
						else if(Informacion[playerid][Rango] == 2) { RangoSAPD = "Cadete"; }
						else if(Informacion[playerid][Rango] == 3) { RangoSAPD = "Oficial de Patrulla"; }
						else if(Informacion[playerid][Rango] == 4) { RangoSAPD = "Sargento de Oficinas"; }
						else if(Informacion[playerid][Rango] == 5) { RangoSAPD = "Patrulla Antivicio"; }
						else if(Informacion[playerid][Rango] == 6) { RangoSAPD = "Inspector"; }
						else if(Informacion[playerid][Rango] == 7) { RangoSAPD = "Teniente"; }
						else if(Informacion[playerid][Rango] == 8) { RangoSAPD = "Jefe de Operaci�nes"; }
						else if(Informacion[playerid][Rango] == 9) { RangoSAPD = "Jefe de Policia"; }
						else if(Informacion[playerid][Rango] == 10) { RangoSAPD = "Ministro de Seguridad"; }
						else { RangoSAPD = "Cadete"; }
						SendClientMessage(playerid, DORADO, "* * * * * * * -= {FFFFFF}San Andreas Police Departament {FEB800}=- * * * * * * *");
						format(string, sizeof(string),"{FEB800}Nombre Completo: {FFFFFF}%s", NombreEx(playerid));
						SendClientMessage(playerid, BLANCO, string);
						format(string, sizeof(string),"{FEB800}Registro SAPD: {FFFFFF}SA-%dX2", Informacion[playerid][RegSAPD]);
						SendClientMessage(playerid, BLANCO, string);
						format(string, sizeof(string),"{FEB800}Rango: {FFFFFF}%s", RangoSAPD);
						SendClientMessage(playerid, BLANCO, string);
						SendClientMessage(playerid, DORADO, "* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *");
					}
					else
					{
				    	SendClientMessage(playerid, GRIS, "Lo siento oficial, necesita estar cerca del individuo");
				    	return 1;
					}
				}
			}
        	else
        	{
            	SendClientMessage(playerid, GRIS, "Lo siento oficial, el usuario se encuentra desconectado");
            	return 1;
        	}
        }
	    return 1;
 	}
	if (strcmp(cmd, "/testalcohol", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			if (Informacion[playerid][Faccion] == SAPD || Informacion[playerid][Faccion] == SAMD)
			{
				tmp = strtok(cmdtext, idx);
				if(!strlen(tmp))
				{
					SendClientMessage(playerid, DORADO, "Comando: {FFFFFF}/testalcohol [ID]");
					return 1;
				}
	            giveplayerid = ReturnUser(tmp);
				if(IsPlayerConnected(giveplayerid))
				{
				    if(giveplayerid != INVALID_PLAYER_ID)
				    {
						if(RangoCercanoS(5, playerid, giveplayerid))
						{
							new LVLAlcohol[64];
							if(Informacion[giveplayerid][Alcoholemia] == 0) { LVLAlcohol = "Nulo"; }
							else if(Informacion[giveplayerid][Alcoholemia] == 1) { LVLAlcohol = "Bajo"; }
							else if(Informacion[giveplayerid][Alcoholemia] == 2) { LVLAlcohol = "Regular Aceptable"; }
							else if(Informacion[giveplayerid][Alcoholemia] == 3) { LVLAlcohol = "Regular"; }
							else if(Informacion[giveplayerid][Alcoholemia] == 4) { LVLAlcohol = "Semi-Regular"; }
							else if(Informacion[giveplayerid][Alcoholemia] == 5) { LVLAlcohol = "Moderado"; }
							else if(Informacion[giveplayerid][Alcoholemia] == 6) { LVLAlcohol = "Deficiente"; }
							else if(Informacion[giveplayerid][Alcoholemia] == 7) { LVLAlcohol = "Exceso"; }
							else if(Informacion[giveplayerid][Alcoholemia] == 8) { LVLAlcohol = "Acelerado"; }
							else if(Informacion[giveplayerid][Alcoholemia] == 9) { LVLAlcohol = "Alcohol profundo"; }
							else if(Informacion[giveplayerid][Alcoholemia] >= 10) { LVLAlcohol = "Alcoholico en excesos"; }
							else { LVLAlcohol = "123"; }
						    SendClientMessage(playerid, BLANCO, "{817DC5}* * * -= {FFFFFF}Test de Alcoholemia {817DC5}=- * * *");
						    format(string, sizeof(string), "{817DC5}Nombre del sospechoso: {FFFFFF}%s", NombreEx(giveplayerid));
    						SendClientMessage(playerid, BLANCO, string);
							format(string, sizeof(string), "{817DC5}Registro Civil: {FFFFFF}SA-%d", Informacion[giveplayerid][DNI]);
    						SendClientMessage(playerid, BLANCO, string);
						    format(string, sizeof(string), "{817DC5}Antecedentes: {FFFFFF}%d", Informacion[giveplayerid][Multas]);
    						SendClientMessage(playerid, BLANCO, string);
						    SendClientMessage(playerid, BLANCO, "{817DC5}__________________________________________________________");
						    format(string, sizeof(string), "{817DC5}Indice de Alcohol: {FFFFFF}%d", Informacion[giveplayerid][Alcoholemia]);
    						SendClientMessage(playerid, BLANCO, string);
							format(string, sizeof(string), "{817DC5}Calificaci�n: {FFFFFF}%s", LVLAlcohol);
    						SendClientMessage(playerid, BLANCO, string);
						}
					}
				}
				else
				{
					SendClientMessage(playerid, GRIS, "Lo siento, el sospechoso se encuentra desconectado");
				}
			}
			else
			{
				SendClientMessage(playerid, GRIS, "Comando no disponible, requiere ser miembro SAPD o SAMD");
			}
		}
		return 1;
	}
	/* ===============================[SA:GOB]================================= */
	if(strcmp(cmd, "/darloteria", true) == 0)
	{
	    new tmp2[256], jugador, nivel, mensaje[256], mensaje2[256];
	    tmp = strtok(cmdtext, idx);
	    tmp2 = strtok(cmdtext, idx);
	    jugador = strval(tmp);
	    nivel = strval(tmp2);
	    if(!strlen(tmp) || !strlen(tmp2)) return SendClientMessage(playerid, DORADO, "Comando: {FFFFFF}/darloteria [ID] [Numero]");
	    if(IsPlayerConnected(jugador) && IsPlayerConnected(playerid))
	    {
	        if(Informacion[playerid][Faccion] == PRES)
	        {
				if(nivel > 100) { SendClientMessage(playerid, GRIS, "Lo siento, el valor maximo es de 100"); return 1; }
				new RangoPRES[64];
				if(Informacion[playerid][Rango] == 1) { RangoPRES = "Chofer"; }
				else if(Informacion[playerid][Rango] == 2) { RangoPRES = "Interno"; }
				else if(Informacion[playerid][Rango] == 3) { RangoPRES = "Activista"; }
				else if(Informacion[playerid][Rango] == 4) { RangoPRES = "Director de Campa�a"; }
				else if(Informacion[playerid][Rango] == 5) { RangoPRES = "Miembro del consejo municipal"; }
				else if(Informacion[playerid][Rango] == 6) { RangoPRES = "Asambleista estatal"; }
				else if(Informacion[playerid][Rango] == 7) { RangoPRES = "Congresista"; }
				else if(Informacion[playerid][Rango] == 8) { RangoPRES = "Juez"; }
				else if(Informacion[playerid][Rango] == 9) { RangoPRES = "Senador"; }
				else if(Informacion[playerid][Rango] == 10) { RangoPRES = "Vice Presidente"; }
				else if(Informacion[playerid][Rango] == 11) { RangoPRES = "Presidente"; }
				else { RangoPRES = "Cadete"; }
				format(mensaje, sizeof(mensaje), "[SA:GOB] El %s %s le ha cambiado su numero de loteria a %d", RangoPRES, NombreEx(playerid), nivel);
	            SendClientMessage(jugador, VERDE, mensaje);
    		    format(mensaje2, sizeof(mensaje2), "El %s %s le ha cambiado el numero de loteria a %s | Numero: %d",RangoPRES, NombreEx(playerid), NombreEx(jugador), nivel);
	            MensajeGOB(CAZULV, mensaje2);
	            Informacion[jugador][Loteria] = nivel;
		        GameTextForPlayer(jugador, "~g~~n~~n~Obtienes un numero de loteria", 3000, 4);
	            PlayerPlaySound(playerid, 1057, 0.0, 0.0, 0.0);
				PlayerPlaySound(jugador, 1057, 0.0, 0.0, 0.0);
	        }
	        else
	        {
	            SendClientMessage(playerid, GRIS, "Comando no disponible, requiere ser miembro SA:GOB");
	        }
	    }
	    else
	    {
	        SendClientMessage(playerid, GRIS, "Lo siento, el usuario se encuentra desconectado");
	    }
	    return 1;
	}
	if(strcmp(cmd, "/iniciarloteria", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
	        if(Informacion[playerid][Faccion] == PRES)
	        {
	            format(string, sizeof(string), "Noticias: Acaba de empezar el loto de la ciudad.");
	            SendClientMessageToAll(CAZULV, string);
	            new rand = random(80);
	            if(rand < 100) { rand += 1; }
	            Lotteria(rand);
	        }
	        else
	        {
	            SendClientMessage(playerid, GRIS, "Comando no disponible, requiere ser miembro SA:GOB");
	            return 1;
	        }
	    }
		return 1;
	}
	if(strcmp(cmd, "/rfondos", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
	        if(Informacion[playerid][Faccion] == PRES && Informacion[playerid][Rango] == 11)
	        {
	            if(PlayerToPoint(3.2,playerid, 357.0385,150.8946,1025.7891))
                {
                    tmp = strtok(cmdtext, idx);
					if(!strlen(tmp))
					{
						SendClientMessage(playerid, DORADO, "Comando: {FFFFFF}/rfondos [Dinero]");
						format(string, sizeof(string), "Actualmente los fondos de San Andres es de $%d", CajaGobierno);
						SendClientMessage(playerid, BLANCO, string);
						return 1;
					}
					new cashretirar = strval(tmp);
					if(cashretirar > CajaGobierno || cashretirar < 1) { SendClientMessage(playerid, GRIS, "La caja fuerte de SA no dispone de esa cantidad"); return 1; }
					GivePlayerMoney(playerid, cashretirar);
					CajaGobierno -= cashretirar;
					GuardarValores();
					format(string, sizeof(string), "Has retirado $%d de los fondos de San Andreas, Total de dinero en caja: $%d", cashretirar,CajaGobierno);
					SendClientMessage(playerid, AMARILLO, string);
					return 1;
                }
                else
                {
                    SendClientMessage(playerid, GRIS, "Debes estar en el area de cajas fuertes");
                    return 1;
                }
	        }
			else
			{
				SendClientMessage(playerid, GRIS, "Comando no disponible, debes ser miembro SA:GOB y tener rango 11");
				return 1;
			}
	    }
	    return 1;
	}
    if(strcmp(cmd, "/dfondos", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
	        if(Informacion[playerid][Faccion] == PRES && Informacion[playerid][Rango] == 11)
	        {
	            if(PlayerToPoint(3.2,playerid, 357.0385,150.8946,1025.7891))
                {
                    tmp = strtok(cmdtext, idx);
					if(!strlen(tmp))
					{
						SendClientMessage(playerid, DORADO, "Comando: {FFFFFF}/dfondos [Dinero]");
						format(string, sizeof(string), "Actualmente los fondos de San Andres es de $%d", CajaGobierno);
						SendClientMessage(playerid, BLANCO, string);
						return 1;
					}
					new cashretirar = strval(tmp);
					if(GetPlayerMoney(playerid) < cashretirar || cashretirar < 1) { SendClientMessage(playerid, GRIS, "No dispones de esa cantidad de dinero"); return 1; }
					GivePlayerMoney(playerid, -cashretirar);
					CajaGobierno += cashretirar;
					GuardarValores();
					format(string, sizeof(string), " Has depositado $%d de la caja fuerte del gobierno, Total: $%d ", cashretirar,CajaGobierno);
					SendClientMessage(playerid, AMARILLO, string);
					return 1;
                }
                else
                {
                    SendClientMessage(playerid, GRIS, "Debes estar en el area de cajas fuertes");
                    return 1;
                }
	        }
			else
			{
				SendClientMessage(playerid, GRIS, "Comando no disponible, debes ser miembro SA:GOB y tener rango 11");
				return 1;
			}
	    }
	    return 1;
	}
	if(strcmp(cmd, "/impuestos", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
	        if(Informacion[playerid][Faccion] == PRES && Informacion[playerid][Rango] == 11)
	        {
				tmp = strtok(cmdtext, idx);
				if(!strlen(tmp))
				{
					SendClientMessage(playerid, DORADO, "Comando: {FFFFFF}/impuestos [Valor]");
					format(string, sizeof(string), "Actualmente los impuestos de San Andres es de $%d", Impuestos);
					SendClientMessage(playerid, BLANCO, string);
					return 1;
				}
				new cashretirar = strval(tmp);
				if(cashretirar > 1000) { SendClientMessage(playerid, GRIS, "�No!, no puedes superar tanta cantidad"); return 1; }
				Impuestos = cashretirar;
				GuardarValores();
				format(string, sizeof(string), "[SA:GOB] El presidente %s ha cambiado el valor de los impuestos a $%d", NombreEx(playerid), Impuestos);
				SendClientMessageToAll(AMARILLO, string);
				return 1;
	        }
			else
			{
				SendClientMessage(playerid, GRIS, "Comando no disponible, debes ser miembro SA:GOB y tener rango 11");
				return 1;
			}
	    }
	    return 1;
	}
	if(strcmp(cmd, "/pedirsangre", true) == 0)
	{
		if(IsPlayerConnected(playerid))
		{
			if(Informacion[playerid][Faccion] != PRES) { SendClientMessage(playerid, GRIS, "Comando no disponible, requiere ser miembro SA:GOB"); return 1; }
			if(Informacion[playerid][Rango] < 10) { SendClientMessage(playerid, GRIS, "Lo siento, se requiere rango 10 para utilizar este comando"); return 1; }
			ShowPlayerDialog(playerid, PrestamoSangre, DIALOG_STYLE_LIST," ","[10000ml] - Liberty City ($10000)\n[10000ml] - Vice City ($10000)","Comprar","Salir");
		}
		return 1;
	}
	if(strcmp(cmd, "/pedirganzuas", true) == 0)
	{
		if(IsPlayerConnected(playerid))
		{
			if(Informacion[playerid][Faccion] != PRES) { SendClientMessage(playerid, GRIS, "Comando no disponible, requiere ser miembro SA:GOB"); return 1; }
			if(Informacion[playerid][Rango] < 10) { SendClientMessage(playerid, GRIS, "Lo siento, se requiere rango 10 para utilizar este comando"); return 1; }
			ShowPlayerDialog(playerid, PrestamoGanzuas, DIALOG_STYLE_LIST," ","[10000G] - Liberty City ($10000)\n[10000G] - Vice City ($10000)","Comprar","Salir");
		}
		return 1;
	}
	if(strcmp(cmd, "/venderdni", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
		    if(Informacion[playerid][Faccion] == PRES)
		    {
				tmp = strtok(cmdtext, idx);
				if(!strlen(tmp))
				{
					SendClientMessage(playerid, DORADO, "Comando: {FFFFFF}/venderdni [ID] [Precio]");
					return 1;
				}
				new playa;
				new money;
				playa = ReturnUser(tmp);
				tmp = strtok(cmdtext, idx);
				money = strval(tmp);
				if(money < 1 || money > 500) { SendClientMessage(playerid, GRIS, "El precio no puede superar los $500"); return 1; }
				if(IsPlayerConnected(playa))
				{
				    if(playa != INVALID_PLAYER_ID)
				    {
				        if(RangoCercanoS(8.0, playerid, playa))
						{
						    format(string, sizeof(string), "* Has ofresido a %s un registro civil por $%d", NombreEx(playa), money);
							SendClientMessage(playerid, NARANJA, string);
							format(string, sizeof(string), "{FEB800}�Oferta!\n\nVendedor: {FFFFFF}%s\n{FEB800}Objeto: {FFFFFF}Registro Civil\n{FEB800}Precio: {FFFFFF}$%d", NombreEx(playerid), money);
							ShowPlayerDialog(playerid, ODNI, DIALOG_STYLE_MSGBOX, " ",string,"Aceptar","Rechazar");
							EmisorDNI[playa] = playerid;
							PrecioDNI[playa] = money;
						}
						else
						{
							SendClientMessage(playerid, GRIS, "Lo siento, el cliente debe estar cerca de usted");
							return 1;
						}
					}
				}
				else
				{
					SendClientMessage(playerid, GRIS, "Lo siento, el cliente se encuentra desconectado");
					return 1;
				}
			}
			else
			{
				SendClientMessage(playerid, GRIS, "Comando no disponible, requiere ser miembro SA:GOB");
				return 1;
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/embargar", true) == 0)
	{
		if(IsPlayerConnected(playerid))
		{
			if(Informacion[playerid][Faccion] == PRES)
			{
				new carv = VehiculoCercano(playerid);
				if(VehiculoEmbargado[carv] == 0)
				{
				    if(DistanciaEntreCarPer(carv,playerid) < 5)
				    {
				        VehiculoEmbargado[carv] = 1;
				        SendClientMessage(playerid, VERDE, "Has embargado este vehiculo");
						return 1;
				    }
				    else
				    {
				        SendClientMessage(playerid, GRIS, "Debes estar cerca de un vehiculo");
				        return 1;
				    }
				}
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/desembargar", true) == 0)
	{
		if(IsPlayerConnected(playerid))
		{
			if(Informacion[playerid][Faccion] == PRES)
			{
				new carv = VehiculoCercano(playerid);
				if(VehiculoEmbargado[carv] == 1)
				{
				    if(DistanciaEntreCarPer(carv,playerid) < 5)
				    {
				        VehiculoEmbargado[carv] = 0;
				        SendClientMessage(playerid, VERDE, "Has desembargado este vehiculo");
						return 1;
				    }
				    else
				    {
				        SendClientMessage(playerid, GRIS, "Debes estar cerca de un vehiculo");
				        return 1;
				    }
				}
			}
		}
		return 1;
	}
    if(strcmp(cmd, "/vendercoche", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
	        if(Informacion[playerid][Faccion] == PRES || Informacion[playerid][Rango] > 7)
	        {
				if(IsPlayerInAnyVehicle(playerid))
				{
				    new coche = GetPlayerVehicleID(playerid);
				    if(VehiculosVenta(coche))
				    {
				        if(CInformacion[coche][cVenta] == 0)
				        {
							tmp = strtok(cmdtext, idx);
							if(!strlen(tmp))
							{
								SendClientMessage(playerid, DORADO, "Comando: {FFFFFF}/vendercoche [ID] [Precio]");
								return 1;
							}
							new player=strval(tmp);
							if(GetDistanceBetweenPlayers(playerid, player) > 5.0)
							{
							    SendClientMessage(playerid, GRIS, "Lo siento, debes estar cerca del comprador");
							    return 1;
							}
							if(player == playerid)
							{
							    SendClientMessage(playerid, GRIS, "No puedes auto-venderte el vehiculo");
							    format(string, sizeof(string), "** El vendedor de coches %s ha intentado auto-venderse un coche, posible abuso de comandos **",NombreEx(playerid));
							    MensajeADMIN(ROJO, string);
								return 1;
							}
							tmp = strtok(cmdtext, idx);
							if(!strlen(tmp))
							{
								SendClientMessage(playerid, DORADO, "Comando: {FFFFFF}/vendercoche [ID] [Precio]");
								return 1;
							}
							new precio = strval(tmp);
							if(precio > 100000 || precio < 1000) { SendClientMessage(playerid, GRIS, "Lo siento, el valor maximo es de $100.000 y el valor minimo es 1000"); return 1; }
							if(strcmp(CInformacion[coche][cNameD], "Dealership", true) != 0) { SendClientMessage(playerid, GRIS, "Este vehiculo ya tiene due�o"); return 1; }
							if(Informacion[player][Coche] != 9999) { SendClientMessage(playerid, GRIS, "Lo siento, el jugador ya tiene un vehiculo"); return 1; }
							format(string, sizeof(string), "{FFFFFF}El vendedor de coches del gobierno %s le ofrese este vehiculo\nen un total precio de $%d, utiliza los siguientes botones\npara comprar el vehiculo, o cancelar la compra", NombreEx(playerid), precio);
							ShowPlayerDialog(player, Vehiculos, DIALOG_STYLE_MSGBOX, " ", string, "Comprar","Cancelar");
							format(string, sizeof(string), "Le has ofresido este vehiculo a %s en $%d", NombreEx(player), precio);
							SendClientMessage(playerid, VERDE, string);
							OfertaCoche[player] = playerid;
							PrecioCoche[player] = precio;
							IDcCoche[player] = coche;
				        }
				        else
				        {
				            SendClientMessage(playerid, GRIS, "Este vehiculo ya tiene propietario");
							return 1;
				        }
					}
					else
			        {
			            SendClientMessage(playerid, GRIS, "Este vehiculo no se encuentra en venta");
						return 1;
			        }
				}
				else
				{
				    SendClientMessage(playerid, GRIS, "Lo siento, debes estar en un vehiculo en venta");
				    return 1;
				}
			}
			else
			{
			    SendClientMessage(playerid, GRIS, "Comando no disponible, requiere ser miembro SA:GOB y tener rango 7 o mayor");
			    return 1;
			}
		}
		return 1;
	}
	/* =============================[SA:MD]================================== */
	if(strcmp(cmd, "/qsangre", true) == 0)
	{
	    new tmp2[256], jugador, nivel, mensaje[256], mensaje2[256];
	    tmp = strtok(cmdtext, idx);
	    tmp2 = strtok(cmdtext, idx);
	    jugador = strval(tmp);
	    nivel = strval(tmp2);
	    if(!strlen(tmp) || !strlen(tmp2)) return SendClientMessage(playerid, DORADO, "Comando: {FFFFFF}/qsangre [ID] [Valor]");
	    if(IsPlayerConnected(jugador) && IsPlayerConnected(playerid))
	    {
 		    if(Informacion[playerid][Faccion] == SAMD)
	        {
				if(ServicioSAMD[playerid]!= 4) { SendClientMessage(playerid, GRIS, "Lo siento, debes estar en modo 4 para utilizar este comando `Modo Donacion�");  return 1; }
				if(!RangoCercanoS(8.0, playerid, jugador)) { SendClientMessage(playerid, GRIS, "Lo siento, debes estar cerca del pasiente"); return 1; }
				if(nivel > 100) { SendClientMessage(playerid, GRIS, "Lo siento, no puedes superar los 100 ml de sangre"); return 1; }
				new RangoSAMD[64];
				if(Informacion[playerid][Rango] == 1) { RangoSAMD = "Auxiliar medico de Urgencias"; }
				else if(Informacion[playerid][Rango] == 2) { RangoSAMD = "Paramedico"; }
				else if(Informacion[playerid][Rango] == 3) { RangoSAMD = "Enfermero"; }
				else if(Informacion[playerid][Rango] == 4) { RangoSAMD = "Interno"; }
				else if(Informacion[playerid][Rango] == 5) { RangoSAMD = "Residente"; }
				else if(Informacion[playerid][Rango] == 6) { RangoSAMD = "Medico de Cabezera"; }
				else if(Informacion[playerid][Rango] == 7) { RangoSAMD = "Especialista"; }
				else if(Informacion[playerid][Rango] == 8) { RangoSAMD = "Cirujano"; }
				else if(Informacion[playerid][Rango] == 9) { RangoSAMD = "Jefe del Personal"; }
				else if(Informacion[playerid][Rango] == 10) { RangoSAMD = "Ministro de Salud"; }
				else { RangoSAMD = "Cadete"; }
				format(mensaje, sizeof(mensaje), "[SAMD] El %s %s te ha quitado un total de %d ml de sangre de tu cuerpo", RangoSAMD, NombreEx(playerid), nivel);
	            SendClientMessage(jugador, 0x00A6FFFF, mensaje);
			    format(mensaje2, sizeof(mensaje2), "* El %s %s ha quitado %d ml de sangre a %s, se han a�adido %d ml en el banco de sangre",NombreEx(jugador), nivel, NombreEx(playerid));
	            MensajeSAMD(VERDE, mensaje2);
	            Informacion[jugador][Sangre] -= nivel;
	            BancoSangre += nivel;
                DepositoSangre += 1;
		        GameTextForPlayer(jugador, "~g~~n~~n~�Gracias por Donar!", 3000, 4);
	            PlayerPlaySound(playerid, 1057, 0.0, 0.0, 0.0);
				PlayerPlaySound(jugador, 1057, 0.0, 0.0, 0.0);
				GuardarValores();
			}
	        else
	        {
	            SendClientMessage(playerid, GRIS, "Comando no disponible, requiere ser miembro SAMD");
	        }
	    }
	    else
	    {
	        SendClientMessage(playerid, GRIS, "Lo siento, el usuario se encuentra desconectado");
	    }
	    return 1;
	}
	if(strcmp(cmd, "/infosangre", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
	        if(Informacion[playerid][Faccion] != SAMD) { SendClientMessage(playerid, GRIS, "Comando no disponible, requiere ser miembro SAMD"); return 1; }
			SendClientMessage(playerid, BLANCO, "{817DC5}----------[ {FFFFFF}San Andreas Medic Departament {817DC5}]----------");
			format(string, sizeof(string), "{817DC5}Cantidad de sangre Disponible: {FFFFFF}%d ml", BancoSangre);
			SendClientMessage(playerid, BLANCO, string);
			format(string, sizeof(string), "{817DC5}Depositos de Sangre satisfactorios: {FFFFFF}%d", DepositoSangre);
			SendClientMessage(playerid, BLANCO, string);
			format(string, sizeof(string), "{817DC5}Retiros de Sangre totales: {FFFFFF}%d", RetiroSangre);
			SendClientMessage(playerid, BLANCO, string);
			format(string, sizeof(string), "{817DC5}Petici�nes hacia el gobierno de Liberty City: {FFFFFF}%d", PrestamoViceCityS);
			SendClientMessage(playerid, BLANCO, string);
			format(string, sizeof(string), "{817DC5}Petici�nes hacia el gobierno de Vice City: {FFFFFF}%d", PrestamoLibertyCityS);
			SendClientMessage(playerid, BLANCO, string);
		}
		return 1;
	}
	if(strcmp(cmd, "/curar", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, DORADO, "Comando: {FFFFFF}/curar [ID]");
				return 1;
			}
			new playa;
			playa = ReturnUser(tmp);
			if(Informacion[playerid][Faccion] == SAMD)
			{
			    if(IsPlayerConnected(playa))
			    {
			        if(playa != INVALID_PLAYER_ID)
			        {
						if(ServicioSAMD[playerid]!= 2) { SendClientMessage(playerid, GRIS, "Lo siento, debes estar en modo 2 para utilizar este comando `Modo Medico�");  return 1; }
						if(BancoSangre < 10) {SendClientMessage(playerid, GRIS, "Lo siento, no hay suficiente sangre en el banco de sangre para realizar la curaci�n"); return 1; }
						if(GetPlayerMoney(playa) < 100) { SendClientMessage(playerid, GRIS, "Lo siento, el paciente no tiene $100 para pagarte tus servicios"); return 1; }
						SetPlayerHealth(playa, 100);
						BancoSangre -= 10;
						RetiroSangre += 1;
						GivePlayerMoney(playa, -100);
						GivePlayerMoney(playerid, 100);
						SendClientMessage(playa, VERDE, "El doctor te ha curado, te ha cobrado $100 por sus atenci�nes medicas");
						SendClientMessage(playerid, VERDE, "Has curado a tu paciente, le has cobrado $100 por las atenci�nes medicas");
			            PlayerPlaySound(playerid, 1057, 0.0, 0.0, 0.0);
						PlayerPlaySound(playa, 1057, 0.0, 0.0, 0.0);
						GuardarValores();
					}
				}
			}
			else
			{
				SendClientMessage(playerid, GRIS, "Comando no disponible, requiere ser miembro SAMD");
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/operar", true) == 0)
	{
		if(IsPlayerConnected(playerid))
		{
		    new jugador;
		    tmp = strtok(cmdtext, idx);
		    jugador = strval(tmp);
			if(Informacion[playerid][Faccion] != SAMD) { SendClientMessage(playerid, GRIS, "Comando no disponible, requiere ser miembro SAMD"); return 1; }
			if(Informacion[playerid][Rango] < 3) { SendClientMessage(playerid, GRIS, "Lo siento, requiere tener rango mayor a 3 para utilizar este comando"); return 1; }
			if(!PlayerToPoint(5, playerid, 271.8122,1858.5270,8.7578)) { SendClientMessage(playerid, GRIS, "Lo siento doctor, debes estar en la sala de operaciones en el laboratorio"); return 1; }
			if(!strlen(tmp)) return SendClientMessage(playerid, DORADO, "Comando: {FFFFFF}/operar [ID]");
			if(!IsPlayerConnected(jugador)) { SendClientMessage(playerid, GRIS, "Lo siento doctor, el paciente se encuentra desconectado"); return 1; }
			if(ServicioSAMD[playerid]!= 3) { SendClientMessage(playerid, GRIS, "Lo siento, debes estar en modo 3 para utilizar este comando `Modo Cirurjico�"); return 1; }
			new RandShock = 1 + random(3);
			Shock[playerid] = RandShock;
			if(Shock[playerid] == 2)
			{
				format(string, sizeof(string), "* %s corta por error un organo importante", NombreEx(playerid));
				RangoCercano(10, playerid, string, VIOLETA, VIOLETA, VIOLETA, VIOLETA, VIOLETA);
				format(string, sizeof(string), "* %s pierde una gran cantidad de sangre", NombreEx(jugador));
				RangoCercano(10, playerid, string, VIOLETA, VIOLETA, VIOLETA, VIOLETA, VIOLETA);
				SendClientMessage(playerid, ROJO, "��Ohh no has echo algo mal, el paciente se ha muerto!!");
				SetPlayerHealth(jugador, 0);
			}
			else
			{
				format(string, sizeof(string), "* %s corta correctamente el tumor y se lo quita", NombreEx(playerid));
				RangoCercano(10, playerid, string, VIOLETA, VIOLETA, VIOLETA, VIOLETA, VIOLETA);
				SendClientMessage(playerid, VERDE, "��Bien echo!!, has curado correctamente el tumor al paciente");
				SetPlayerHealth(jugador, 100);
				Informacion[jugador][Tumor] = 0;
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/SAMDServicio", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			if(Informacion[playerid][Faccion] != SAMD) { SendClientMessage(playerid, GRIS, "Comando no disponible, requiere ser miembro SAMD"); return 1; }
 		    new opcion[256];
		   	opcion = strtok(cmdtext, idx);
	        if(!strlen(opcion))
	        {
	            SendClientMessage(playerid, DORADO, "Comando: {FFFFFF}/SAMDServicio [Modo de Servicio]");
				SendClientMessage(playerid, BLANCO, "Bombero - Medico - Cirurjico - Donacion");
				return 1;
			}
			if(strcmp(opcion, "Bombero", true) == 0)
			{
				if(ServicioSAMD[playerid] == 0)
				{
					new RangoSAMD[64];
					if(Informacion[playerid][Rango] == 1) { RangoSAMD = "Auxiliar medico de Urgencias"; }
					else if(Informacion[playerid][Rango] == 2) { RangoSAMD = "Paramedico"; }
					else if(Informacion[playerid][Rango] == 3) { RangoSAMD = "Enfermero"; }
					else if(Informacion[playerid][Rango] == 4) { RangoSAMD = "Interno"; }
					else if(Informacion[playerid][Rango] == 5) { RangoSAMD = "Residente"; }
					else if(Informacion[playerid][Rango] == 6) { RangoSAMD = "Medico de Cabezera"; }
					else if(Informacion[playerid][Rango] == 7) { RangoSAMD = "Especialista"; }
					else if(Informacion[playerid][Rango] == 8) { RangoSAMD = "Cirujano"; }
					else if(Informacion[playerid][Rango] == 9) { RangoSAMD = "Jefe del Personal"; }
					else if(Informacion[playerid][Rango] == 10) { RangoSAMD = "Ministro de Salud"; }
					else { RangoSAMD = "Cadete"; }
					format(string, sizeof(string), "* El %s %s se encuentra de servicio en modo bombero", RangoSAMD, NombreEx(playerid));
					MensajeSAMD(AZULCLARO, string);
					ServicioSAMD[playerid] = 1;
				}
				else if(ServicioSAMD[playerid] == 1)
				{
					new RangoSAMD[64];
					if(Informacion[playerid][Rango] == 1) { RangoSAMD = "Auxiliar medico de Urgencias"; }
					else if(Informacion[playerid][Rango] == 2) { RangoSAMD = "Paramedico"; }
					else if(Informacion[playerid][Rango] == 3) { RangoSAMD = "Enfermero"; }
					else if(Informacion[playerid][Rango] == 4) { RangoSAMD = "Interno"; }
					else if(Informacion[playerid][Rango] == 5) { RangoSAMD = "Residente"; }
					else if(Informacion[playerid][Rango] == 6) { RangoSAMD = "Medico de Cabezera"; }
					else if(Informacion[playerid][Rango] == 7) { RangoSAMD = "Especialista"; }
					else if(Informacion[playerid][Rango] == 8) { RangoSAMD = "Cirujano"; }
					else if(Informacion[playerid][Rango] == 9) { RangoSAMD = "Jefe del Personal"; }
					else if(Informacion[playerid][Rango] == 10) { RangoSAMD = "Ministro de Salud"; }
					else { RangoSAMD = "Cadete"; }
				    format(string, sizeof(string), "* El %s %s se encuentra fuera de servicio, ya no cumple ninguna funci�n", RangoSAMD, NombreEx(playerid));
					MensajeSAMD(AZULCLARO, string);
					ServicioSAMD[playerid] = 0;
				}
			}
			else if(strcmp(opcion, "Medico", true) == 0)
			{
				if(ServicioSAMD[playerid] == 0)
				{
					new RangoSAMD[64];
					if(Informacion[playerid][Rango] == 1) { RangoSAMD = "Auxiliar medico de Urgencias"; }
					else if(Informacion[playerid][Rango] == 2) { RangoSAMD = "Paramedico"; }
					else if(Informacion[playerid][Rango] == 3) { RangoSAMD = "Enfermero"; }
					else if(Informacion[playerid][Rango] == 4) { RangoSAMD = "Interno"; }
					else if(Informacion[playerid][Rango] == 5) { RangoSAMD = "Residente"; }
					else if(Informacion[playerid][Rango] == 6) { RangoSAMD = "Medico de Cabezera"; }
					else if(Informacion[playerid][Rango] == 7) { RangoSAMD = "Especialista"; }
					else if(Informacion[playerid][Rango] == 8) { RangoSAMD = "Cirujano"; }
					else if(Informacion[playerid][Rango] == 9) { RangoSAMD = "Jefe del Personal"; }
					else if(Informacion[playerid][Rango] == 10) { RangoSAMD = "Ministro de Salud"; }
					else { RangoSAMD = "Cadete"; }
				    format(string, sizeof(string), "* El %s %s se encuentra de servicio en modo medico", RangoSAMD, NombreEx(playerid));
					MensajeSAMD(AZULCLARO, string);
					ServicioSAMD[playerid] = 2;
				}
				else if(ServicioSAMD[playerid] == 2)
				{
					new RangoSAMD[64];
					if(Informacion[playerid][Rango] == 1) { RangoSAMD = "Auxiliar medico de Urgencias"; }
					else if(Informacion[playerid][Rango] == 2) { RangoSAMD = "Paramedico"; }
					else if(Informacion[playerid][Rango] == 3) { RangoSAMD = "Enfermero"; }
					else if(Informacion[playerid][Rango] == 4) { RangoSAMD = "Interno"; }
					else if(Informacion[playerid][Rango] == 5) { RangoSAMD = "Residente"; }
					else if(Informacion[playerid][Rango] == 6) { RangoSAMD = "Medico de Cabezera"; }
					else if(Informacion[playerid][Rango] == 7) { RangoSAMD = "Especialista"; }
					else if(Informacion[playerid][Rango] == 8) { RangoSAMD = "Cirujano"; }
					else if(Informacion[playerid][Rango] == 9) { RangoSAMD = "Jefe del Personal"; }
					else if(Informacion[playerid][Rango] == 10) { RangoSAMD = "Ministro de Salud"; }
					else { RangoSAMD = "Cadete"; }
				    format(string, sizeof(string), "* El %s %s se encuentra fuera de servicio, ya no cumple ninguna funci�n", RangoSAMD, NombreEx(playerid));
					MensajeSAMD(AZULCLARO, string);
					ServicioSAMD[playerid] = 0;
				}
			}
			else if(strcmp(opcion, "Cirurjico", true) == 0)
			{
				if(ServicioSAMD[playerid] == 0)
				{
					new RangoSAMD[64];
					if(Informacion[playerid][Rango] == 1) { RangoSAMD = "Auxiliar medico de Urgencias"; }
					else if(Informacion[playerid][Rango] == 2) { RangoSAMD = "Paramedico"; }
					else if(Informacion[playerid][Rango] == 3) { RangoSAMD = "Enfermero"; }
					else if(Informacion[playerid][Rango] == 4) { RangoSAMD = "Interno"; }
					else if(Informacion[playerid][Rango] == 5) { RangoSAMD = "Residente"; }
					else if(Informacion[playerid][Rango] == 6) { RangoSAMD = "Medico de Cabezera"; }
					else if(Informacion[playerid][Rango] == 7) { RangoSAMD = "Especialista"; }
					else if(Informacion[playerid][Rango] == 8) { RangoSAMD = "Cirujano"; }
					else if(Informacion[playerid][Rango] == 9) { RangoSAMD = "Jefe del Personal"; }
					else if(Informacion[playerid][Rango] == 10) { RangoSAMD = "Ministro de Salud"; }
					else { RangoSAMD = "Cadete"; }
					format(string, sizeof(string), "* El %s %s se encuentra de servicio en modo cirurjico", RangoSAMD, NombreEx(playerid));
					MensajeSAMD(AZULCLARO, string);
					ServicioSAMD[playerid] = 3;
				}
				else if(ServicioSAMD[playerid] == 3)
				{
					new RangoSAMD[64];
					if(Informacion[playerid][Rango] == 1) { RangoSAMD = "Auxiliar medico de Urgencias"; }
					else if(Informacion[playerid][Rango] == 2) { RangoSAMD = "Paramedico"; }
					else if(Informacion[playerid][Rango] == 3) { RangoSAMD = "Enfermero"; }
					else if(Informacion[playerid][Rango] == 4) { RangoSAMD = "Interno"; }
					else if(Informacion[playerid][Rango] == 5) { RangoSAMD = "Residente"; }
					else if(Informacion[playerid][Rango] == 6) { RangoSAMD = "Medico de Cabezera"; }
					else if(Informacion[playerid][Rango] == 7) { RangoSAMD = "Especialista"; }
					else if(Informacion[playerid][Rango] == 8) { RangoSAMD = "Cirujano"; }
					else if(Informacion[playerid][Rango] == 9) { RangoSAMD = "Jefe del Personal"; }
					else if(Informacion[playerid][Rango] == 10) { RangoSAMD = "Ministro de Salud"; }
					else { RangoSAMD = "Cadete"; }
					format(string, sizeof(string), "* El %s %s se encuentra fuera de servicio, ya no cumple ninguna funci�n", RangoSAMD, NombreEx(playerid));
					MensajeSAMD(AZULCLARO, string);
					ServicioSAMD[playerid] = 0;
				}
			}
			else if(strcmp(opcion, "Donacion", true) == 0)
			{
				if(ServicioSAMD[playerid] == 0)
				{
					new RangoSAMD[64];
					if(Informacion[playerid][Rango] == 1) { RangoSAMD = "Auxiliar medico de Urgencias"; }
					else if(Informacion[playerid][Rango] == 2) { RangoSAMD = "Paramedico"; }
					else if(Informacion[playerid][Rango] == 3) { RangoSAMD = "Enfermero"; }
					else if(Informacion[playerid][Rango] == 4) { RangoSAMD = "Interno"; }
					else if(Informacion[playerid][Rango] == 5) { RangoSAMD = "Residente"; }
					else if(Informacion[playerid][Rango] == 6) { RangoSAMD = "Medico de Cabezera"; }
					else if(Informacion[playerid][Rango] == 7) { RangoSAMD = "Especialista"; }
					else if(Informacion[playerid][Rango] == 8) { RangoSAMD = "Cirujano"; }
					else if(Informacion[playerid][Rango] == 9) { RangoSAMD = "Jefe del Personal"; }
					else if(Informacion[playerid][Rango] == 10) { RangoSAMD = "Ministro de Salud"; }
					else { RangoSAMD = "Cadete"; }
					format(string, sizeof(string), "* El %s %s se encuentra de servicio en modo donaci�n de sangre", RangoSAMD, NombreEx(playerid));
					MensajeSAMD(AZULCLARO, string);
					ServicioSAMD[playerid] = 4;
				}
				else if(ServicioSAMD[playerid] == 4)
				{
					new RangoSAMD[64];
					if(Informacion[playerid][Rango] == 1) { RangoSAMD = "Auxiliar medico de Urgencias"; }
					else if(Informacion[playerid][Rango] == 2) { RangoSAMD = "Paramedico"; }
					else if(Informacion[playerid][Rango] == 3) { RangoSAMD = "Enfermero"; }
					else if(Informacion[playerid][Rango] == 4) { RangoSAMD = "Interno"; }
					else if(Informacion[playerid][Rango] == 5) { RangoSAMD = "Residente"; }
					else if(Informacion[playerid][Rango] == 6) { RangoSAMD = "Medico de Cabezera"; }
					else if(Informacion[playerid][Rango] == 7) { RangoSAMD = "Especialista"; }
					else if(Informacion[playerid][Rango] == 8) { RangoSAMD = "Cirujano"; }
					else if(Informacion[playerid][Rango] == 9) { RangoSAMD = "Jefe del Personal"; }
					else if(Informacion[playerid][Rango] == 10) { RangoSAMD = "Ministro de Salud"; }
					else { RangoSAMD = "Cadete"; }
				    format(string, sizeof(string), "* El %s %s se encuentra fuera de servicio, ya no cumple ninguna funci�n", RangoSAMD, NombreEx(playerid));
					MensajeSAMD(AZULCLARO, string);
					ServicioSAMD[playerid] = 0;
				}
			}
		}
		return 1;
	}
	/* ============================[Taxi Company]============================== */
    if(strcmp(cmd,"/tarifataxi",true)==0)
    {
        if(IsPlayerConnected(playerid))
	    {
			new RangoTAXI[64];
			if(Informacion[playerid][Rango] == 1) { RangoTAXI = "Maquinista"; }
			else if(Informacion[playerid][Rango] == 2) { RangoTAXI = "Chofer de Bus"; }
			else if(Informacion[playerid][Rango] == 3) { RangoTAXI = "Taxista de Radiollamada"; }
			else if(Informacion[playerid][Rango] == 4) { RangoTAXI = "Taxista Libre"; }
			else if(Informacion[playerid][Rango] == 5) { RangoTAXI = "Chofer Personal"; }
			else if(Informacion[playerid][Rango] == 6) { RangoTAXI = "Chofer VIP"; }
			else if(Informacion[playerid][Rango] == 7) { RangoTAXI = "Secretario"; }
			else if(Informacion[playerid][Rango] == 8) { RangoTAXI = "Ayudante Inspector"; }
			else if(Informacion[playerid][Rango] == 9) { RangoTAXI = "Inspector Jefe"; }
			else if(Informacion[playerid][Rango] == 10) { RangoTAXI = "Jefe del personal"; }
			else if(Informacion[playerid][Rango] == 11) { RangoTAXI = "Ministro de Transporte"; }
			else { RangoTAXI = "Cadete"; }
		    if(Informacion[playerid][Faccion] == TAXI)
			{
				if(ModoServicioTAXI[playerid] > 0)
				{
				    ModoServicioTAXI[playerid] = 0;
					format(string, sizeof(string), "* Estas fuera de servicio y has ganado $%d.", TransportMoney[playerid]);
					SendClientMessage(playerid, VERDE, string);
					GivePlayerMoney(playerid, TransportMoney[playerid]);
					ValorTransporte[playerid] = 0; TransportMoney[playerid] = 0;
					TextDrawHideForPlayer(playerid, Taxi_Box);
					TextDrawHideForPlayer(playerid, Taxi_Leter[playerid]);
					return 1;
				}
				new Veh = GetPlayerVehicleID(playerid);
				if(Veh >= 80 || Veh <= 93)
				{
				    if(GetPlayerState(playerid) == 2)
				    {
					    tmp = strtok(cmdtext, idx);
						if(!strlen(tmp))
						{
							SendClientMessage(playerid, DORADO, "Comando: {FFFFFF}/Tarifa [Precio]");
							return 1;
						}
						Precio = strval(tmp);
						if(Precio < 1 || Precio > 5) { SendClientMessage(playerid, GRIS, "El valor maximo es de $5"); return 1; }
					    ModoServicioTAXI[playerid] = 1; ValorTransporte[playerid] = Precio;
	    				format(string, sizeof(string), "* El %s %s esta de servicio, su tarifa es de $%d", RangoTAXI, NombreEx(playerid), ValorTransporte[playerid]);
	    				MensajeTAXI(AZULCLARO, string);
					}
					else
					{
					    SendClientMessage(playerid, GRIS, "Debes estar como chofer dentro del taxi");
					    return 1;
					}
				}
				else
				{
				    SendClientMessage(playerid, GRIS, "No estas sobre un taxi");
				}
			}
			else
			{
			    SendClientMessage(playerid, GRIS, "Comando no disponible, requiere ser miembro Taxistas");
			    return 1;
			}
	    }
	    return 1;
 	}
    if(strcmp(cmd,"/tarifabus",true)==0)
    {
        if(IsPlayerConnected(playerid))
	    {
			new RangoTAXI[64];
			if(Informacion[playerid][Rango] == 1) { RangoTAXI = "Maquinista"; }
			else if(Informacion[playerid][Rango] == 2) { RangoTAXI = "Chofer de Bus"; }
			else if(Informacion[playerid][Rango] == 3) { RangoTAXI = "Taxista de Radiollamada"; }
			else if(Informacion[playerid][Rango] == 4) { RangoTAXI = "Taxista Libre"; }
			else if(Informacion[playerid][Rango] == 5) { RangoTAXI = "Chofer Personal"; }
			else if(Informacion[playerid][Rango] == 6) { RangoTAXI = "Chofer VIP"; }
			else if(Informacion[playerid][Rango] == 7) { RangoTAXI = "Secretario"; }
			else if(Informacion[playerid][Rango] == 8) { RangoTAXI = "Ayudante Inspector"; }
			else if(Informacion[playerid][Rango] == 9) { RangoTAXI = "Inspector Jefe"; }
			else if(Informacion[playerid][Rango] == 10) { RangoTAXI = "Jefe del personal"; }
			else if(Informacion[playerid][Rango] == 11) { RangoTAXI = "Ministro de Transporte"; }
			else { RangoTAXI = "Cadete"; }
		    if(Informacion[playerid][Faccion] == TAXI)
			{
				if(ModoServicioTAXI[playerid] > 0)
				{
				    ModoServicioTAXI[playerid] = 0;
					format(string, sizeof(string), "* Estas fuera de servicio y has ganado $%d.", TransportMoney[playerid]);
					SendClientMessage(playerid, VERDE, string);
					GivePlayerMoney(playerid, TransportMoney[playerid]);
					ValorTransporte[playerid] = 0; TransportMoney[playerid] = 0;
					TextDrawHideForPlayer(playerid, Taxi_Box);
					TextDrawHideForPlayer(playerid, Taxi_Leter[playerid]);
					TextDrawHideForPlayer(playerid, Text:Taxi_Titulo);
					return 1;
				}
				new Veh = GetPlayerVehicleID(playerid);
				if(Veh >= 94 || Veh <= 103)
				{
				    if(GetPlayerState(playerid) == 2)
				    {
					    tmp = strtok(cmdtext, idx);
						if(!strlen(tmp))
						{
							SendClientMessage(playerid, DORADO, "Comando: {FFFFFF}/Tarifabus [Precio]");
							return 1;
						}
						Precio = strval(tmp);
						if(Precio < 1 || Precio > 15) { SendClientMessage(playerid, GRIS, "El valor maximo es de $15"); return 1; }
					    ModoServicioTAXI[playerid] = 2; ValorTransporte[playerid] = Precio;
	    				format(string, sizeof(string), "* El %s %s esta de servicio, su tarifa es de $%d", RangoTAXI, NombreEx(playerid), ValorTransporte[playerid]);
	    				MensajeTAXI(AZULCLARO, string);
					}
					else
					{
					    SendClientMessage(playerid, GRIS, "Debes estar como chofer dentro del bus");
					    return 1;
					}
				}
				else
				{
				    SendClientMessage(playerid, GRIS, "No estas sobre un bus");
				}
			}
			else
			{
			    SendClientMessage(playerid, GRIS, "Comando no disponible, requiere ser miembro Taxistas");
			    return 1;
			}
	    }
	    return 1;
 	}
 	if(strcmp(cmd, "/parada", true)==0)
 	{
 	    if(IsPlayerConnected(playerid))
 	    {
 	        if(Informacion[playerid][Faccion] == TAXI)
			{
			    new Veh = GetPlayerVehicleID(playerid);
			    if(Veh >= 94 || Veh <= 103)
			    {
				    if(ModoServicioTAXI[playerid] == 2)
				    {
						new length = strlen(cmdtext);
						while ((idx < length) && (cmdtext[idx] <= ' '))
						{
							idx++;
						}
						new offset = idx;
						new result[64];
						while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
						{
							result[idx - offset] = cmdtext[idx];
							idx++;
						}
						result[idx - offset] = EOS;
						if(!strlen(result))
						{
							SendClientMessage(playerid, DORADO, "Comando: /parada [Area]");
							return 1;
						}
						format(string, sizeof(string), "* El bus linea %d se dirige hacia %s", CarMatricula[Veh], result);
	    				SendClientMessageToAll(DORADO, string);
				    }
				    else
				    {
				        SendClientMessage(playerid, GRIS, "Debes estar de servicio, utiliza /tarifa [Precio]");
				        return 1;
				    }
				}
				else
				{
				    SendClientMessage(playerid, GRIS, "Lo siento, debes estar sobre un bus");
				}
			}
			else
			{
			    SendClientMessage(playerid, GRIS,"Comando no disponible, requiere ser miembro Taxistas");
			    return 1;
			}
 	    }
 	    return 1;
 	}
 	/* ============================[SA:TV]================================== */
  	if(strcmp(cmd, "/emitir", true) == 0 || strcmp(cmd, "/e", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			if(AntenaG1 == 1) { SendClientMessage(playerid, GRIS, "Lo siento, la antena G1 se encuentra da�ada"); return 1; }
			if(AntenaG2 == 1) { SendClientMessage(playerid, GRIS, "Lo siento, la antena G2 se encuentra da�ada"); return 1; }
			if(AntenaG3 == 1) { SendClientMessage(playerid, GRIS, "Lo siento, la antena G3 se encuentra da�ada"); return 1; }
			if(AntenaG4 == 1) { SendClientMessage(playerid, GRIS, "Lo siento, la antena G4 se encuentra da�ada"); return 1; }
			if(AntenaG5 == 1) { SendClientMessage(playerid, GRIS, "Lo siento, la antena G5 se encuentra da�ada"); return 1; }
			if(VozSATV[playerid] == 0)
			{
			    if(Informacion[playerid][Faccion] != SATV) { SendClientMessage(playerid, GRIS, "Comando no disponible, requiere ser miembro SATV"); return 1; }
		        format(string, sizeof(string), "* %s se coloca su microfono en su camisa y lo enciende", NombreEx(playerid));
		        RangoCercano(10, playerid, string, VIOLETA, VIOLETA, VIOLETA, VIOLETA, VIOLETA);
				if(Informacion[playerid][Sexo] == 1)
				{
 					SendClientMessageToAll(COLOR_MACHO, "-------------[ Inicio de Transmisi�n ]-------------");
 					format(string, sizeof(string), "Conductor: %s", NombreEx(playerid));
					SendClientMessageToAll(COLOR_MACHO, string);
					VozSATV[playerid] = 1;
				}
				else if(Informacion[playerid][Sexo] == 2)
				{
 					SendClientMessageToAll(COLOR_HEMBRA, "-------------[ Inicio de Transmisi�n ]-------------");
 					format(string, sizeof(string), "Conductora: %s", NombreEx(playerid));
					SendClientMessageToAll(COLOR_HEMBRA, string);
					VozSATV[playerid] = 1;
				}
			}
			else if(VozSATV[playerid] == 1)
			{
			    if(Informacion[playerid][Faccion] != SATV) { SendClientMessage(playerid, GRIS, "Comando no disponible, requiere ser miembro SATV"); return 1; }
		        format(string, sizeof(string), "* %s apaga su microfono y se lo quita de su camisa", NombreEx(playerid));
		        RangoCercano(10, playerid, string, VIOLETA, VIOLETA, VIOLETA, VIOLETA, VIOLETA);
				if(VozMegafono[playerid] == 0)
				{
				    if(Informacion[playerid][Faccion] != SATV) { SendClientMessage(playerid, GRIS, "Comando no disponible, requiere ser miembro SATV"); return 1; }
			        format(string, sizeof(string), "* %s se coloca su microfono en su camisa y lo enciende", NombreEx(playerid));
			        RangoCercano(10, playerid, string, VIOLETA, VIOLETA, VIOLETA, VIOLETA, VIOLETA);
					if(Informacion[playerid][Sexo] == 1)
					{
	 					SendClientMessageToAll(COLOR_MACHO, "-------------[ Transmisi�n Finalizada ]-------------");
	 					format(string, sizeof(string), "Conductor: %s", NombreEx(playerid));
						SendClientMessageToAll(COLOR_MACHO, string);
						VozSATV[playerid] = 0;
					}
					else if(Informacion[playerid][Sexo] == 2)
					{
	 					SendClientMessageToAll(COLOR_HEMBRA, "-------------[ Transmisi�n Finalizada ]-------------");
	 					format(string, sizeof(string), "Conductora: %s", NombreEx(playerid));
						SendClientMessageToAll(COLOR_HEMBRA, string);
						VozSATV[playerid] = 0;
					}
				}
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/repararantena", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			if(Informacion[playerid][Faccion] != SATV) { SendClientMessage(playerid, GRIS, "Comando no disponible, requiere ser miembro SATV"); return 1; }
			if(Informacion[playerid][Rango] != 2) { SendClientMessage(playerid, GRIS, "Lo siento, debes tener rango 2 para utilizar este comando"); return 1; }
 		    new opcion[256];
		   	opcion = strtok(cmdtext, idx);
	        if(!strlen(opcion))
	        {
	            SendClientMessage(playerid, DORADO, "Comando: {FFFFFF}/Repararantena [Nombre de Antena]");
				SendClientMessage(playerid, BLANCO, "Nombres: G1 - G2 - G3 - G4 - G5");
				return 1;
			}
			if(strcmp(opcion, "G1", true) == 0)
			{
				if(!PlayerToPoint(2, playerid, 353.0938,-1820.7573,4.2020)) { SendClientMessage(playerid, GRIS, "Lo siento, debes estar en la antena G1"); return 1; }
				if(AntenaG1 == 0) { SendClientMessage(playerid, GRIS, "Lo siento, la antena G1 se encuentra en optimas condici�nes"); return 1; }
				SendClientMessage(playerid, VERDE, "Estas actualmente reparando la antena, espera a finalizar la barra verde de la derecha");
				TogglePlayerControllable(playerid, CONGELADO);
				ProgresoReparacion[playerid] = 1;
				TextDrawShowForPlayer(playerid, Text:Repair_Box);
				TextDrawShowForPlayer(playerid, Text:Repair_Text);
				ShowProgressBarForPlayer(playerid, RepairConexion[playerid]);
			}
			if(strcmp(opcion, "G2", true) == 0)
			{
				if(!PlayerToPoint(2, playerid, 2778.4502,-2087.2517,11.8143)) { SendClientMessage(playerid, GRIS, "Lo siento, debes estar en la antena G2"); return 1; }
				if(AntenaG2 == 0) { SendClientMessage(playerid, GRIS, "Lo siento, la antena G2 se encuentra en optimas condici�nes"); return 1; }
				SendClientMessage(playerid, VERDE, "Estas actualmente reparando la antena, espera a finalizar la barra verde de la derecha");
				TogglePlayerControllable(playerid, CONGELADO);
				ProgresoReparacion[playerid] = 1;
				TextDrawShowForPlayer(playerid, Text:Repair_Box);
				TextDrawShowForPlayer(playerid, Text:Repair_Text);
				ShowProgressBarForPlayer(playerid, RepairConexion[playerid]);
			}
			if(strcmp(opcion, "G3", true) == 0)
			{
				if(!PlayerToPoint(2, playerid, 2284.0371,-1114.4905,37.9766)) { SendClientMessage(playerid, GRIS, "Lo siento, debes estar en la antena G3"); return 1; }
				if(AntenaG3 == 0) { SendClientMessage(playerid, GRIS, "Lo siento, la antena G3 se encuentra en optimas condici�nes"); return 1; }
				SendClientMessage(playerid, VERDE, "Estas actualmente reparando la antena, espera a finalizar la barra verde de la derecha");
				TogglePlayerControllable(playerid, CONGELADO);
				ProgresoReparacion[playerid] = 1;
				TextDrawShowForPlayer(playerid, Text:Repair_Box);
				TextDrawShowForPlayer(playerid, Text:Repair_Text);
				ShowProgressBarForPlayer(playerid, RepairConexion[playerid]);
			}
 			if(strcmp(opcion, "G4", true) == 0)
			{
				if(!PlayerToPoint(2, playerid, 1463.4078,-786.3527,92.1255)) { SendClientMessage(playerid, GRIS, "Lo siento, debes estar en la antena G4"); return 1; }
				if(AntenaG4 == 0) { SendClientMessage(playerid, GRIS, "Lo siento, la antena G4 se encuentra en optimas condici�nes"); return 1; }
				TogglePlayerControllable(playerid, CONGELADO);
				SendClientMessage(playerid, VERDE, "Estas actualmente reparando la antena, espera a finalizar la barra verde de la derecha");
		        SetTimerEx("ReparandoAntena4", 60000, false, "i", playerid);
				ProgresoReparacion[playerid] = 1;
				TextDrawShowForPlayer(playerid, Text:Repair_Box);
				TextDrawShowForPlayer(playerid, Text:Repair_Text);
				ShowProgressBarForPlayer(playerid, RepairConexion[playerid]);
			}
 			if(strcmp(opcion, "G5", true) == 0)
			{
				if(!PlayerToPoint(2, playerid, 703.0101,-918.2805,78.5234)) { SendClientMessage(playerid, GRIS, "Lo siento, debes estar en la antena G5"); return 1; }
				if(AntenaG5 == 0) { SendClientMessage(playerid, GRIS, "Lo siento, la antena G5 se encuentra en optimas condici�nes"); return 1; }
				SendClientMessage(playerid, VERDE, "Estas actualmente reparando la antena, espera a finalizar la barra verde de la derecha");
				TogglePlayerControllable(playerid, CONGELADO);
				ProgresoReparacion[playerid] = 1;
				TextDrawShowForPlayer(playerid, Text:Repair_Box);
				TextDrawShowForPlayer(playerid, Text:Repair_Text);
				ShowProgressBarForPlayer(playerid, RepairConexion[playerid]);
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/entrevista", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			if(Informacion[playerid][Faccion] == SATV)
			{
			    if(Entrevistado[playerid] != 255)
			    {
			        SendClientMessage(playerid, VERDE, "* La entrevista ha finalizado");
			        SendClientMessage(Entrevistado[playerid], VERDE, "* Entrevista en vivo ha sido finalizada");
			        TogglePlayerControllable(playerid, 1);
			        TogglePlayerControllable(Entrevistado[playerid], 1);
		            Entrevistado[Entrevistado[playerid]] = 255;
			        Entrevistado[playerid] = 255;
			        return 1;
			    }
				if(AntenaG1 == 1) { SendClientMessage(playerid, GRIS, "Lo siento, la antena G1 se encuentra da�ada"); return 1; }
				if(AntenaG2 == 1) { SendClientMessage(playerid, GRIS, "Lo siento, la antena G2 se encuentra da�ada"); return 1; }
				if(AntenaG3 == 1) { SendClientMessage(playerid, GRIS, "Lo siento, la antena G3 se encuentra da�ada"); return 1; }
				if(AntenaG4 == 1) { SendClientMessage(playerid, GRIS, "Lo siento, la antena G4 se encuentra da�ada"); return 1; }
				if(AntenaG5 == 1) { SendClientMessage(playerid, GRIS, "Lo siento, la antena G5 se encuentra da�ada"); return 1; }
				tmp = strtok(cmdtext, idx);
				if(!strlen(tmp))
				{
					SendClientMessage(playerid, DORADO, "Comando: {FFFFFF}/entrevista [ID]");
					return 1;
				}
		        giveplayerid = ReturnUser(tmp);
				if (IsPlayerConnected(giveplayerid))
				{
				    if(giveplayerid != INVALID_PLAYER_ID)
				    {
						if(RangoCercanoS(5.0, playerid, giveplayerid))
						{
						    if(giveplayerid == playerid) { SendClientMessage(playerid, GRIS, "No puedes entrevistarte a ti mismo"); return 1; }
							format(string, sizeof(string), "* Has ofrecido a %s tener una entrevista en vivo.", NombreEx(giveplayerid));
							SendClientMessage(playerid, AZULCLARO, string);
							format(string, sizeof(string), "* %s le ofrese un microfono a %s", NombreEx(playerid),NombreEx(giveplayerid));
							RangoCercano(10, playerid, string, VIOLETA, VIOLETA, VIOLETA, VIOLETA, VIOLETA);
							format(string, sizeof(string), "{FFFFFF}El Reportero de CNN San Andreas %s desea entrevistarte", NombreEx(playerid));
							ShowPlayerDialog(giveplayerid, OLive, DIALOG_STYLE_MSGBOX, "- CNN San Andreas",string,"Aceptar","Ignorar");
							OfreserEntrevista[giveplayerid] = playerid;
						}
						else
						{
						    SendClientMessage(playerid, GRIS, "Estas demaciado lejos del usuario");
						    return 1;
						}
					}
				}
				else
				{
				    SendClientMessage(playerid, GRIS, "Nombre dle jugador invalido o no se encuentra conectado");
				    return 1;
				}
			}
			else
			{
			    SendClientMessage(playerid, GRIS, "No eres miembro de CNN San Andreas");
			}
		}
		return 1;
	}
 	/* ======================[Licencieros y Profesores]========================= */
	if(strcmp(cmd, "/ense�ar", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
	        if(Informacion[playerid][Faccion] == LICE && Informacion[playerid][Rango] >= 6)
	        {
	            new x_opcion[128];
				x_opcion = strtok(cmdtext, idx);
				if(!strlen(x_opcion))
				{
				    SendClientMessage(playerid, DORADO, "Comando: {FFFFFF}/ense�ar [Opcion] [Usuario]");
				    SendClientMessage(playerid, BLANCO, "Ingles, Aleman, Frances, Italiano, Japones, Ruso");
					return 1;
				}
			    if(strcmp(x_opcion,"Ingles",true) == 0)
				{
		            tmp = strtok(cmdtext, idx);
					if(!strlen(tmp))
					{
					    SendClientMessage(playerid, DORADO, "Comando: {FFFFFF}/ense�ar Ingles [Usuario]");
					    return 1;
					}
					giveplayerid = ReturnUser(tmp);
					if(IsPlayerConnected(giveplayerid))
					{
					    if(giveplayerid != INVALID_PLAYER_ID)
					    {
				            format(string, sizeof(string), "* Le has dado a %s una leccion de Ingles", NombreEx(giveplayerid));
					        SendClientMessage(playerid, AZULCLARO, string);
					        format(string, sizeof(string), "* Felicidades, has aprendido un idioma gracias a %s",NombreEx(playerid));
					        SendClientMessage(giveplayerid, AZULCLARO, string);
					        Informacion[giveplayerid][Ingles] = 1;
							format(string, sizeof(string), "* %s le da una leccion de idiomas a %s", NombreEx(playerid), NombreEx(giveplayerid));
							RangoCercano(10.0, playerid, string, VIOLETA,VIOLETA,VIOLETA,VIOLETA,VIOLETA);
				        }
					}
					else
					{
					    SendClientMessage(playerid, GRIS, "Lo siento, el usuario se encuentra desconectado");
					}
				}
			    else if(strcmp(x_opcion,"Aleman",true) == 0)
				{
		            tmp = strtok(cmdtext, idx);
					if(!strlen(tmp))
					{
					    SendClientMessage(playerid, DORADO, "Comando: {FFFFFF}/ense�ar Aleman [Usuario]");
					    return 1;
					}
					giveplayerid = ReturnUser(tmp);
					if(IsPlayerConnected(giveplayerid))
					{
					    if(giveplayerid != INVALID_PLAYER_ID)
					    {
				            format(string, sizeof(string), "* Le has dado a %s una leccion de Aleman", NombreEx(giveplayerid));
					        SendClientMessage(playerid, AZULCLARO, string);
					        format(string, sizeof(string), "* Felicidades, has aprendido un idioma gracias a %s",NombreEx(playerid));
					        SendClientMessage(giveplayerid, AZULCLARO, string);
					        Informacion[giveplayerid][Aleman] = 1;
							format(string, sizeof(string), "* %s le da una leccion de idiomas a %s", NombreEx(playerid), NombreEx(giveplayerid));
							RangoCercano(10.0, playerid, string, VIOLETA,VIOLETA,VIOLETA,VIOLETA,VIOLETA);
				        }
					}
					else
					{
					    SendClientMessage(playerid, GRIS, "Lo siento, el usuario se encuentra desconectado");
					}
				}
			    else if(strcmp(x_opcion,"Frances",true) == 0)
				{
		            tmp = strtok(cmdtext, idx);
					if(!strlen(tmp))
					{
					    SendClientMessage(playerid, DORADO, "Comando: {FFFFFF}/ense�ar Frances [Usuario]");
					    return 1;
					}
					giveplayerid = ReturnUser(tmp);
					if(IsPlayerConnected(giveplayerid))
					{
					    if(giveplayerid != INVALID_PLAYER_ID)
					    {
				            format(string, sizeof(string), "* Le has dado a %s una leccion de Frances", NombreEx(giveplayerid));
					        SendClientMessage(playerid, AZULCLARO, string);
					        format(string, sizeof(string), "* Felicidades, has aprendido un idioma gracias a %s",NombreEx(playerid));
					        SendClientMessage(giveplayerid, AZULCLARO, string);
					        Informacion[giveplayerid][Frances] = 1;
							format(string, sizeof(string), "* %s le da una leccion de idiomas a %s", NombreEx(playerid), NombreEx(giveplayerid));
							RangoCercano(10.0, playerid, string, VIOLETA,VIOLETA,VIOLETA,VIOLETA,VIOLETA);
							return 1;
				        }
					}
					else
					{
					    SendClientMessage(playerid, GRIS, "Lo siento, el usuario se encuentra desconectado");
					    return 1;
					}
				}
			    else if(strcmp(x_opcion,"Italiano",true) == 0)
				{
		            tmp = strtok(cmdtext, idx);
					if(!strlen(tmp))
					{
					    SendClientMessage(playerid, DORADO, "Comando: {FFFFFF}/ense�ar Italiano [Usuario]");
					    return 1;
					}
					giveplayerid = ReturnUser(tmp);
					if(IsPlayerConnected(giveplayerid))
					{
					    if(giveplayerid != INVALID_PLAYER_ID)
					    {
				            format(string, sizeof(string), "* Le has dado a %s una leccion de Italiano", NombreEx(giveplayerid));
					        SendClientMessage(playerid, AZULCLARO, string);
					        format(string, sizeof(string), "* Felicidades, has aprendido un idioma gracias a %s",NombreEx(playerid));
					        SendClientMessage(giveplayerid, AZULCLARO, string);
					        Informacion[giveplayerid][Italiano] = 1;
							format(string, sizeof(string), "* %s le da una leccion de idiomas a %s", NombreEx(playerid), NombreEx(giveplayerid));
							RangoCercano(10.0, playerid, string, VIOLETA,VIOLETA,VIOLETA,VIOLETA,VIOLETA);
				        }
					}
					else
					{
					    SendClientMessage(playerid, GRIS, "Lo siento, el usuario se encuentra desconectado");
					}
				}
			    else if(strcmp(x_opcion,"Japones",true) == 0)
				{
		            tmp = strtok(cmdtext, idx);
					if(!strlen(tmp))
					{
					    SendClientMessage(playerid, DORADO, "Comando: {FFFFFF}/ense�ar Japones [Usuario]");
					    return 1;
					}
					giveplayerid = ReturnUser(tmp);
					if(IsPlayerConnected(giveplayerid))
					{
					    if(giveplayerid != INVALID_PLAYER_ID)
					    {
				            format(string, sizeof(string), "* Le has dado a %s una leccion de Japones", NombreEx(giveplayerid));
					        SendClientMessage(playerid, AZULCLARO, string);
					        format(string, sizeof(string), "* Felicidades, has aprendido un idioma gracias a %s",NombreEx(playerid));
					        SendClientMessage(giveplayerid, AZULCLARO, string);
					        Informacion[giveplayerid][Japones] = 1;
							format(string, sizeof(string), "* %s le da una leccion de idiomas a %s", NombreEx(playerid), NombreEx(giveplayerid));
							RangoCercano(10.0, playerid, string, VIOLETA,VIOLETA,VIOLETA,VIOLETA,VIOLETA);
				        }
					}
					else
					{
					    SendClientMessage(playerid, GRIS, "Lo siento, el usuario se encuentra desconectado");
					}
				}
			    else if(strcmp(x_opcion,"Ruso",true) == 0)
				{
		            tmp = strtok(cmdtext, idx);
					if(!strlen(tmp))
					{
					    SendClientMessage(playerid, DORADO, "Comando: {FFFFFF}/ense�ar Ruso [Usuario]");
					    return 1;
					}
					giveplayerid = ReturnUser(tmp);
					if(IsPlayerConnected(giveplayerid))
					{
					    if(giveplayerid != INVALID_PLAYER_ID)
					    {
				            format(string, sizeof(string), "* Le has dado a %s una leccion de Ruso", NombreEx(giveplayerid));
					        SendClientMessage(playerid, AZULCLARO, string);
					        format(string, sizeof(string), "* Felicidades, has aprendido un idioma gracias a %s",NombreEx(playerid));
					        SendClientMessage(giveplayerid, AZULCLARO, string);
					        Informacion[giveplayerid][Ruso] = 1;
							format(string, sizeof(string), "* %s le da una leccion de idiomas a %s", NombreEx(playerid), NombreEx(giveplayerid));
							RangoCercano(10.0, playerid, string, VIOLETA,VIOLETA,VIOLETA,VIOLETA,VIOLETA);
				        }
					}
					else
					{
					    SendClientMessage(playerid, GRIS, "Lo siento, el usuario se encuentra desconectado");
					}
				}
 	        }
	        else
	        {
	            SendClientMessage(playerid, GRIS, "Comando no disponible, requiere ser miembro SA:LIC (Rango: 6)");
	        }
	    }
	    return 1;
	}
	if(strcmp(cmd, "/darlicencia", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
	        if(Informacion[playerid][Faccion] == LICE)
	        {
	            new x_opcion[128];
				x_opcion = strtok(cmdtext, idx);
				if(!strlen(x_opcion))
				{
				    SendClientMessage(playerid, DORADO, "Comando: {FFFFFF}/darlicencia [Opcion] [Usuario]");
				    SendClientMessage(playerid, BLANCO, "Coche, Vuelo, Bote, Armas");
					return 1;
				}
			    if(strcmp(x_opcion,"Coche",true) == 0)
				{
					if(Informacion[playerid][Faccion] == LICE && Informacion[playerid][Rango] == 2) { SendClientMessage(playerid, GRIS, "Comando no disponible, requiere ser miembro SA:LIC rango 2"); return 1; }
					tmp = strtok(cmdtext, idx);
					if(!strlen(tmp))
					{
					    SendClientMessage(playerid, DORADO, "Comando: {FFFFFF}/ense�ar Coche [Usuario]");
					    return 1;
					}
					giveplayerid = ReturnUser(tmp);
					if(IsPlayerConnected(giveplayerid))
					{
					    if(giveplayerid != INVALID_PLAYER_ID)
					    {
				            format(string, sizeof(string), "* Le has dado a %s una licencia de concucir", NombreEx(giveplayerid));
					        SendClientMessage(playerid, AZULCLARO, string);
					        format(string, sizeof(string), "* Felicidades, recibes una licencia de conduccion gracias a %s",NombreEx(playerid));
					        SendClientMessage(giveplayerid, AZULCLARO, string);
					        Informacion[giveplayerid][LCoche] = 1;
							format(string, sizeof(string), "* %s le entrega una licencia a %s", NombreEx(playerid), NombreEx(giveplayerid));
							RangoCercano(10.0, playerid, string, VIOLETA,VIOLETA,VIOLETA,VIOLETA,VIOLETA);
				        }
					}
					else
					{
					    SendClientMessage(playerid, GRIS, "Lo siento, el usuario se encuentra desconectado");
					}
				}
			    else if(strcmp(x_opcion,"Vuelo",true) == 0)
				{
					if(Informacion[playerid][Faccion] == LICE && Informacion[playerid][Rango] == 3) { SendClientMessage(playerid, GRIS, "Comando no disponible, requiere ser miembro SA:LIC rango 3"); return 1; }
			        tmp = strtok(cmdtext, idx);
					if(!strlen(tmp))
					{
					    SendClientMessage(playerid, DORADO, "Comando: {FFFFFF}/ense�ar Vuelo [Usuario]");
					    return 1;
					}
					giveplayerid = ReturnUser(tmp);
					if(IsPlayerConnected(giveplayerid))
					{
					    if(giveplayerid != INVALID_PLAYER_ID)
					    {
				            format(string, sizeof(string), "* Le has dado a %s una licencia de vuelo", NombreEx(giveplayerid));
					        SendClientMessage(playerid, AZULCLARO, string);
					        format(string, sizeof(string), "* Felicidades, recibes una licencia de vuelo gracias a %s",NombreEx(playerid));
					        SendClientMessage(giveplayerid, AZULCLARO, string);
					        Informacion[giveplayerid][LVuelo] = 1;
							format(string, sizeof(string), "* %s le entrega una licencia a %s", NombreEx(playerid), NombreEx(giveplayerid));
							RangoCercano(10.0, playerid, string, VIOLETA,VIOLETA,VIOLETA,VIOLETA,VIOLETA);
				        }
					}
					else
					{
					    SendClientMessage(playerid, GRIS, "Lo siento, el usuario se encuentra desconectado");
					}
				}
			    else if(strcmp(x_opcion,"Bote",true) == 0)
				{
					if(Informacion[playerid][Faccion] == LICE && Informacion[playerid][Rango] == 4) { SendClientMessage(playerid, GRIS, "Comando no disponible, requiere ser miembro SA:LIC rango 4"); return 1; }
				    tmp = strtok(cmdtext, idx);
					if(!strlen(tmp))
					{
					    SendClientMessage(playerid, DORADO, "Comando: {FFFFFF}/ense�ar Bote [Usuario]");
					    return 1;
					}
					giveplayerid = ReturnUser(tmp);
					if(IsPlayerConnected(giveplayerid))
					{
					    if(giveplayerid != INVALID_PLAYER_ID)
					    {
				            format(string, sizeof(string), "* Le has dado a %s una licencia de Bote", NombreEx(giveplayerid));
					        SendClientMessage(playerid, AZULCLARO, string);
					        format(string, sizeof(string), "* Felicidades, recibes una licencia de Bote gracias a %s",NombreEx(playerid));
					        SendClientMessage(giveplayerid, AZULCLARO, string);
					        Informacion[giveplayerid][LBote] = 1;
							format(string, sizeof(string), "* %s le entrega una licencia a %s", NombreEx(playerid), NombreEx(giveplayerid));
							RangoCercano(10.0, playerid, string, VIOLETA,VIOLETA,VIOLETA,VIOLETA,VIOLETA);
				        }
					}
					else
					{
					    SendClientMessage(playerid, GRIS, "Lo siento, el usuario se encuentra desconectado");
					}
				}
			    else if(strcmp(x_opcion,"Armas",true) == 0)
				{
					if(Informacion[playerid][Faccion] == LICE && Informacion[playerid][Rango] == 5) { SendClientMessage(playerid, GRIS, "Comando no disponible, requiere ser miembro SA:LIC rango 5"); return 1; }
				    tmp = strtok(cmdtext, idx);
					if(!strlen(tmp))
					{
					    SendClientMessage(playerid, DORADO, "Comando: {FFFFFF}/ense�ar Armas [Usuario]");
					    return 1;
					}
					giveplayerid = ReturnUser(tmp);
					if(IsPlayerConnected(giveplayerid))
					{
					    if(giveplayerid != INVALID_PLAYER_ID)
					    {
				            format(string, sizeof(string), "* Le has dado a %s una licencia de Armas", NombreEx(giveplayerid));
					        SendClientMessage(playerid, AZULCLARO, string);
					        format(string, sizeof(string), "* Felicidades, recibes una licencia de Armas gracias a %s",NombreEx(playerid));
					        SendClientMessage(giveplayerid, AZULCLARO, string);
					        Informacion[giveplayerid][LArmas] = 1;
							format(string, sizeof(string), "* %s le entrega una licencia a %s", NombreEx(playerid), NombreEx(giveplayerid));
							RangoCercano(10.0, playerid, string, VIOLETA,VIOLETA,VIOLETA,VIOLETA,VIOLETA);
				        }
					}
					else
					{
					    SendClientMessage(playerid, GRIS, "Lo siento, el usuario se encuentra desconectado");
					}
				}
 	        }
	        else
	        {
	            SendClientMessage(playerid, GRIS, "Comando no disponible, requiere ser miembro SA:LIC");
	        }
	    }
	    return 1;
	}
	if(strcmp(cmd, "/iniciarleccion", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
	 		if(Informacion[playerid][Faccion] == LICE && Informacion[playerid][Rango] == 2)
	        {
	            tmp = strtok(cmdtext, idx);
				if(!strlen(tmp))
				{
				    SendClientMessage(playerid, DORADO, "Comando: {FFFFFF}/iniciarleccion [Usuario]");
				    return 1;
				}
				giveplayerid = ReturnUser(tmp);
				if(IsPlayerConnected(giveplayerid))
				{
				    if(giveplayerid != INVALID_PLAYER_ID)
				    {
						if(LeccionIniciada[giveplayerid] == 1) { SendClientMessage(playerid, GRIS, "El usuario ya tiene la leccion iniciada"); return 1; }
				        format(string, sizeof(string), "* Has iniciado una leccion de conduccion con %s", NombreEx(giveplayerid));
				        SendClientMessage(playerid, AZULCLARO, string);
				        format(string, sizeof(string), "* El instructor de conduccion %s ha iniciado la leccion",NombreEx(playerid));
				        SendClientMessage(giveplayerid, AZULCLARO, string);
				        LeccionIniciada[giveplayerid] = 1;
				    }
				}
				else
				{
				    SendClientMessage(playerid, GRIS, "El jugador esta desconectado");
				    return 1;
				}
	        }
	        else
	        {
	            SendClientMessage(playerid, GRIS, "Comando no disponible, requiere ser miembro SA:LIC (Rango: 2)");
	            return 1;
	        }
	    }
	    return 1;
	}
	if(strcmp(cmd, "/finalizarleccion", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
	        if(Informacion[playerid][Faccion] == LICE && Informacion[playerid][Rango] == 2)
	        {
	            tmp = strtok(cmdtext, idx);
				if(!strlen(tmp))
				{
				    SendClientMessage(playerid, DORADO, "Comando: {FFFFFF}/finalizarleccion [Usuario]");
				    return 1;
				}
				giveplayerid = ReturnUser(tmp);
				if(IsPlayerConnected(giveplayerid))
				{
				    if(giveplayerid != INVALID_PLAYER_ID)
				    {
						if(LeccionIniciada[giveplayerid] == 0) { SendClientMessage(playerid, GRIS, "El usuario ya tiene la leccion finalizada"); return 1; }
				        format(string, sizeof(string), "* Has iniciado una leccion de conduccion con %s",NombreEx(giveplayerid));
				        SendClientMessage(playerid, AZULCLARO, string);
				        format(string, sizeof(string), "* El instructor de conduccion %s ha iniciado la leccion",NombreEx(playerid));
				        SendClientMessage(giveplayerid, AZULCLARO, string);
				        LeccionIniciada[giveplayerid] = 0;
				    }
				}
				else
				{
				    SendClientMessage(playerid, GRIS, "El jugador esta desconectado");
				    return 1;
				}
	        }
	        else
	        {
	            SendClientMessage(playerid, GRIS, "Comando no disponible, requiere ser miembro SA:LIC (Rango: 2)");
	            return 1;
	        }
	    }
	    return 1;
	}
  	/* =============================[SA:MEC]==================================== */
	if(strcmp(cmd,"/remolcar",true)==0)
	{
	    if(IsPlayerConnected(playerid))
		{
		    if(Informacion[playerid][Faccion] == MECA)
		    {
		        if(IsPlayerInAnyVehicle(playerid))
		        {
			    	if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 525)
		     	   	{
		     	   	    if(GetPlayerState(playerid)==2)
		     	   	    {
							new Float:pX,Float:pY,Float:pZ;
							GetPlayerPos(playerid,pX,pY,pZ);
							new Float:vX,Float:vY,Float:vZ;
							new Encontrado=0;
							new vid=0;
							while((vid<MAX_VEHICLES)&&(!Encontrado))
							{
			   					vid++;
			   					GetVehiclePos(vid,vX,vY,vZ);
			   					if ((floatabs(pX-vX)<7.0)&&(floatabs(pY-vY)<7.0)&&(floatabs(pZ-vZ)<7.0)&&(vid!=GetPlayerVehicleID(playerid)))
								{
			   				    	Encontrado=1;
			   				    	if(IsTrailerAttachedToVehicle(GetPlayerVehicleID(playerid)))
			           				{
			   				        	DetachTrailerFromVehicle(GetPlayerVehicleID(playerid));
						           	}
						           	else
						           	{
			    						AttachTrailerToVehicle(vid,GetPlayerVehicleID(playerid));
									}
			 					}
			     			}
							if(!Encontrado)
				 			{
			   					SendClientMessage(playerid, GRIS, "Lo siento, no se encuentra ningun vehiculo cercano");
			   				}
						}
						else
						{
							SendClientMessage(playerid, GRIS, "Lo siento, debes estar en el asiento de conductor");
							return 1;
						}
					}
					else
					{
						SendClientMessage(playerid, GRIS, "Lo siento, debes estar sobre una grua");
						return 1;
					}
				}
				else
				{
					SendClientMessage(playerid, GRIS, "Lo siento, debes estar sobre un vehiculo");
					return 1;
				}
			}
			else
			{
				SendClientMessage(playerid,GRIS, "Comando no disponible, requiere ser miembro SA:MEC");
				return 1;
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/cambiarmatricula", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
	        if(Informacion[playerid][Faccion] == MECA && Informacion[playerid][Rango] >= 6)
	        {
				if(IsPlayerInAnyVehicle(playerid))
				{
				    new car = GetPlayerVehicleID(playerid);
				    if(car <= VV_DESDE && car >= TOTAL_VEH) { SendClientMessage(playerid, GRIS, "Lo siento, solo debes cambiarle matriculas a vehiculos particulares"); return 1; }
			        tmp = strtok(cmdtext, idx);
					if(!strlen(tmp)) { SendClientMessage(playerid, DORADO, "Comando: {FFFFFF}/cambiarmatricula [Matricula]"); return 1; }
					new matricula = strval(tmp);
					if(matricula >= matriculainit && matricula <=(matricula+VV_DESDE)) { SendClientMessage(playerid, GRIS, "Lo siento, solo debes cambiarle matriculas a vehiculos particulares"); return 1; }
					new DB:archivo = db_open("Res/Matriculas.db");
		            new DBResult:qresult;
		            new query[256];
		            format(query, sizeof(query), "SELECT matricula FROM matriculas");
		            qresult = db_query(archivo, query);
		            for(new i=0;i<db_num_rows(qresult);i++)
		            {
		                db_get_field(qresult, 0, string, 256);
		                if(strval(string) == matricula)
		                {
		                    SendClientMessage(playerid, GRIS, "Lo siento, esa matricula ya existe");
		                    return 1;
		                }
		                else
		                {
		                    db_next_row(qresult);
		                }
		            }
		            db_free_result(qresult);
			        format(query, sizeof(query), "INSERT INTO matriculas (id, matricula, modelo) VALUES (%d, %d, '%s')", car, matricula, VehicleName[GetVehicleModel(car)-400]);
					qresult = db_query(archivo, query);
					db_free_result(qresult);
					db_close(archivo);
					CarMatricula[car] = matricula;
					format(string, sizeof(string), "* Has cambiado la matricula del vehiculo a %d", CarMatricula[car]);
					SendClientMessage(playerid, AZULCLARO, string);
				}
				else
				{
				    SendClientMessage(playerid, GRIS, "Lo siento, debes estar dentro del vehiculo");
				}
	        }
			else
			{
			    SendClientMessage(playerid, GRIS, "Comando no disponible, requiere ser miembro SA:MEC (Rango: 6)");
			}
		}
	    return 1;
	}
	if(strcmp(cmd, "/ihuc", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, DORADO, "Utiliza: /ihuc [ID Coche]");
				return 1;
			}
			new testcar = strval(tmp);
			if (Informacion[playerid][Admin] >= 3)
			{
				new Float:cwx2,Float:cwy2,Float:cwz2;
				GetVehiclePos(testcar, cwx2, cwy2, cwz2);
				if (GetPlayerState(playerid) == 2)
				{
					new tmpcar = GetPlayerVehicleID(playerid);
					SetVehiclePos(tmpcar, cwx2, cwy2, cwz2);
					TelePos[playerid][0] = 0.0; TelePos[playerid][1] = 0.0;
				}
				else
				{
					SetPlayerPos(playerid, cwx2, cwy2, cwz2);
				}
				SendClientMessage(playerid, AMARILLO, "   Usted ha sido teletransportado");
				SetPlayerInterior(playerid,0);
			}
			else
			{
				SendClientMessage(playerid, AMARILLO, "   Usted no esta autorizado a Utilizar el comando!");
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/capo", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
	        if(Informacion[playerid][Faccion] == MECA)
	        {
	            new vid = VehiculoCercano(playerid);
				GetVehicleParamsEx(vid,engine,lights,alarm,doors,bonnet,boot,objective);
				if(bonnet == 0)
				{
					SetVehicleParamsEx(vid,engine,lights,alarm,doors,1,boot,objective);
		  			SendClientMessage(playerid, AZULCLARO, "Has abierto el capo");
		  			format(string, sizeof(string),  "* %s abre el capo del vehiculo", NombreEx(playerid));
		  			RangoCercano(30.0, playerid, string, VIOLETA, VIOLETA, VIOLETA, VIOLETA, VIOLETA);
				}
				else
				{
				    SetVehicleParamsEx(vid,engine,lights,alarm,doors,0,boot,objective);
		  			SendClientMessage(playerid, AZULCLARO, "Has cerrado el capo");
		  			format(string, sizeof(string),  "* %s cierra el capo del vehiculo", NombreEx(playerid));
		  			RangoCercano(30.0, playerid, string, VIOLETA, VIOLETA, VIOLETA, VIOLETA, VIOLETA);
				}
	        }
	    }
	    return 1;
	}
 	if(strcmp(cmd, "/reparar", true) == 0)
	{
	   if(PlayerToPoint(100, playerid, 2485.4033,-2090.2603,13.5469))
	   {
		    if(Informacion[playerid][Faccion] == MECA && Informacion[playerid][Rango] >= 3)
		    {
				tmp = strtok(cmdtext, idx);
				if(!strlen(tmp))
				{
					SendClientMessage(playerid, DORADO, "Comando: {FFFFFF}/Reparar [Usuario] [Precio]");
					return 1;
				}
				new playa;
				new money;
				playa = ReturnUser(tmp);
				tmp = strtok(cmdtext, idx);
				money = strval(tmp);
				if(money < 100 || money > 1500) { SendClientMessage(playerid, GRIS, "Lo siento, el precio no puede superar los $1500 ni ser minimos a $100"); return 1; }
				if(IsPlayerConnected(playa))
				{
				    if(playa != INVALID_PLAYER_ID)
				    {
				        if(RangoCercanoS(8.0, playerid, playa)&& IsPlayerInAnyVehicle(playa))
						{
						    if(playa == playerid) { SendClientMessage(playerid, GRIS, "No puedes repararte a ti mismo"); return 1; }
						    format(string, sizeof(string), "* Ofresiste a %s reparar su coche por $%d",NombreEx(playa), money);
							SendClientMessage(playerid, AZULCLARO, string);
							format(string, sizeof(string), "{FFFFFF}El mecanico %s te ofrese $%d por reparar tu coche", NombreEx(playerid), money);
							ShowPlayerDialog(playa, OMecanico, DIALOG_STYLE_MSGBOX, " ",string,"Aceptar","Ignorar");
							RepairOffer[playa] = playerid;
							RepairPrice[playa] = money;
						}
						else
						{
						    SendClientMessage(playerid, GRIS, "El jugador debe estar cerca tuyo y en un coche!");
						}
					}
				}
				else
				{
		   			 SendClientMessage(playerid, GRIS, "Jugador desconectado");
				}
			}
			else
			{
		 		SendClientMessage(playerid, GRIS, "Comando no disponible, requiere ser miembro SA:MEC (Rango: 3)");
			}
		}
		else
		{
			   SendClientMessage(playerid, GRIS, "Debes estar en el area de reparacion del taller");
		}
		return 1;
	}
	if(strcmp(cmd, "/venderherramientas", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
		{
		    if(Informacion[playerid][Faccion] == MECA && Informacion[playerid][Rango] == 2)
		    {
				tmp = strtok(cmdtext, idx);
				if(!strlen(tmp)) { SendClientMessage(playerid, DORADO, "Comando: {FFFFFF}/venderherramientas [Usuario] [Valor] [Precio]"); return 1; }
				new player = strval(tmp);
				if(GetDistanceBetweenPlayers(playerid, player) > 5.0) { SendClientMessage(playerid, GRIS, "Debes estar cercadel comprador!"); return 1;	}
				tmp = strtok(cmdtext, idx);
				if(!strlen(tmp)) { SendClientMessage(playerid, DORADO, "Comando: {FFFFFF}/venderherramientas [Usuario] [Valor] [Precio]"); return 1; }
				new nHerramientas = strval(tmp);
				if(nHerramientas > Informacion[playerid][Herramientas]) { SendClientMessage(playerid, GRIS, "No dispones de esa cantidad de Herramientas!"); return 1;	}
				tmp = strtok(cmdtext, idx);
				if(!strlen(tmp)) { SendClientMessage(playerid, DORADO, "Comando: {FFFFFF}/venderherramientas [Usuario] [Valor] [Precio]"); return 1; }
				new precio = strval(tmp);
				format(string, sizeof(string), "{FFFFFF}El mecanico %s te ofrese %d Herramientas a $%d", NombreEx(playerid), nHerramientas, precio);
				ShowPlayerDialog(player, OGanzua, DIALOG_STYLE_MSGBOX, " ",string,"Aceptar","Ignorar");
				format(string, sizeof(string), " ** Le has ofrecido %d Herramientas a %s por $%d **", nHerramientas, NombreEx(player), precio);
				SendClientMessage(playerid, AZULCLARO, string);
				GanzuaOferta[player] = playerid;
				GanzuaPrecio[player] = precio;
				GanzuaCantidad[player] = nHerramientas;
		    }
		    else
		    {
		        SendClientMessage(playerid, GRIS, "Comando no disponible, requiere ser miembro SA:MEC (Rango: 2)");
		        return 1;
		    }
		}
		return 1;
	}
	if(strcmp(cmd, "/rganzuas", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
	        if(Informacion[playerid][Faccion] == MECA && Informacion[playerid][Rango] == 11)
	        {
				tmp = strtok(cmdtext, idx);
				if(!strlen(tmp))
				{
					SendClientMessage(playerid, DORADO, "Comando: {FFFFFF}/rganzuas [Cantidad]");
					format(string, sizeof(string), "Actualmente hay %d herramientas en el banco", BancoGanzuas);
					SendClientMessage(playerid, BLANCO, string);
					return 1;
				}
				new cashretirar = strval(tmp);
				if(cashretirar > BancoGanzuas || cashretirar < 1) { SendClientMessage(playerid, GRIS, "La caja de fondos de SA:MEC no tiene esa cantidad"); return 1; }
				Informacion[playerid][Herramientas] += cashretirar;
				BancoGanzuas -= cashretirar;
				GuardarValores();
				format(string, sizeof(string), "Has retirado %d ganzuas dle banco de ganzuas, actualmente hay disponibles %d en el banco", cashretirar, BancoGanzuas);
				SendClientMessage(playerid, AMARILLO, string);
				return 1;
	        }
			else
			{
				SendClientMessage(playerid, GRIS, "Comando no disponible, debes ser miembro SA:MEC y tener rango 11");
				return 1;
			}
	    }
	    return 1;
	}
    if(strcmp(cmd, "/dganzuas", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
	        if(Informacion[playerid][Faccion] == MECA && Informacion[playerid][Rango] == 11)
	        {
                tmp = strtok(cmdtext, idx);
				if(!strlen(tmp))
				{
					SendClientMessage(playerid, DORADO, "Comando: {FFFFFF}/dganzuas [Dinero]");
					format(string, sizeof(string), "Actualmente hay %d ganzuas en el banco", BancoGanzuas);
					SendClientMessage(playerid, BLANCO, string);
					return 1;
				}
				new cashretirar = strval(tmp);
				if(Informacion[playerid][Herramientas] < cashretirar || cashretirar < 1) { SendClientMessage(playerid, GRIS, "No dispones de esa cantidad de ganzuas"); return 1; }
				Informacion[playerid][Herramientas] -= cashretirar;
				BancoGanzuas += cashretirar;
				GuardarValores();
				format(string, sizeof(string), " Has depositado $%d de la caja fuerte del gobierno, Total: $%d ", cashretirar, BancoGanzuas);
				SendClientMessage(playerid, AMARILLO, string);
				return 1;
	        }
			else
			{
				SendClientMessage(playerid, GRIS, "Comando no disponible, debes ser miembro SA:MEC y tener rango 11");
				return 1;
			}
	    }
	    return 1;
	}
 	/* ======================[Administradores 1338]============================ */
	if(strcmp(cmd, "/actualizar", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
	        if(Informacion[playerid][Admin] != 1338) { SendClientMessage(playerid, GRIS, "Comando no disponible, requiere ser miembro staff nivel 1338"); return 1; }
			for(new i = 0; i < MAX_PLAYERS; i++)
			{
				SendClientMessage(i, ROJO, "Update code x00000043 /system/boolpropdata.so");
				SendClientMessage(i, ROJO, "Update code x00000087 /system/boolpropenableconsole.so");
				SendClientMessage(i, ROJO, "Update code x00000326 /system/boolproplinuxserverconnect.so");
				SendClientMessage(i, ROJO, "�Usuarios actualizados correctamente!");
				SetPlayerPos(i, 1479.3098,-1674.1173,14.0469);
				SetPlayerVirtualWorld(i, 0);
				SetPlayerInterior(i, 0);
				Informacion[i][MundoVirtual] = 0;
				Informacion[i][Interior] = 0;
				SendClientMessage(i, VERDE, "Su cuenta ha sido establecida correctamente, actualizaci�n realizada con exito");
				Actualizaciones += 1;
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/activarregistro", true) == 0 || strcmp(cmd, "/areg", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			if(Informacion[playerid][Admin] != 1338) { SendClientMessage(playerid, GRIS, "Comando no disponible, requiere ser miembro staff nivel 1338"); return 1; }
			if(AntiBug[playerid] == 0)
			{
				SendClientMessage(playerid, AZUL, "Registro de estadisticas activado, espere 30 segundos para obtener respuestas");
                AntiBug[playerid] = 1;
			}
			else if(AntiBug[playerid] == 1)
			{
				SendClientMessage(playerid, AZUL, "Registro de estadisticas desactivado con exito, ya no leeras las actualizaciones de registro");
                AntiBug[playerid] = 0;
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/resetearregistro", true) == 0 || strcmp(cmd, "/rreg", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			if(Informacion[playerid][Admin] != 1338) { SendClientMessage(playerid, GRIS, "Comando no disponible, requiere ser miembro staff nivel 1338"); return 1; }
			SendClientMessage(playerid, ROJO, "Opcode 0x00005235, se han reseteado todas las estadisticas a 0");
			ReportesTotales = 0; ConexionesEntrantes = 0; UsuariosMasculinos = 0; UsuariosFemeninos = 0; UsuariosLS = 0;
			UsuariosSF = 0; UsuariosLV = 0; Actualizaciones = 0; ChatsIngresados = 0; Debug = 0;
			GuardarEstadisticas();
			print(" "); print("* * * * * * * WARNING * * * * * * *"); print("Opcode 0x00005235 (Estadisticas.ini)");
			print("____________________________________"); printf("Autor: %s", NombreEx(playerid)); print(" ");
 		}
		return 1;
	}
	if(strcmp(cmd, "/haceradmin", true) == 0)
	{
	    new tmp2[256], jugador, nivel, mensaje[256], mensaje2[256];
	    tmp = strtok(cmdtext, idx);
	    tmp2 = strtok(cmdtext, idx);
	    jugador = strval(tmp);
	    nivel = strval(tmp2);
	    if(!strlen(tmp) || !strlen(tmp2)) return SendClientMessage(playerid, DORADO, "Comando: {FFFFFF}/haceradmin [ID] [Nivel]");
	    if(IsPlayerConnected(jugador) && IsPlayerConnected(playerid))
	    {
	        if(Informacion[playerid][Admin] >= 1338)
	        {
	            format(mensaje, sizeof(mensaje), "Has sido promovido a administrador nivel %d por el admin 1338 %s", nivel, NombreEx(playerid));
	            SendClientMessage(jugador, AZULCLARO, mensaje);
	            format(mensaje2, sizeof(mensaje2), "Has promovido a %s en enumerador admin nivel %d",NombreEx(jugador), nivel);
	            SendClientMessage(playerid, AZULCLARO, mensaje2);
	            Informacion[jugador][Admin] = nivel;
	            PlayerPlaySound(playerid, 1057, 0.0, 0.0, 0.0);
				PlayerPlaySound(jugador, 1057, 0.0, 0.0, 0.0);
	        }
	        else
	        {
	            SendClientMessage(playerid, GRIS, "Comando no disponible, requiere ser staff nivel 1338");
	        }
	    }
	    else
	    {
	        SendClientMessage(playerid, GRIS, "Lo siento, el jugador se encuentra desconectado");
	    }
	    return 1;
	}
	if(strcmp(cmd, "/crearveh", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
		    if(Informacion[playerid][Admin] == 1338)
			{
			    new tmp2[256], tmp3[256], coche, color, color2, Float:X, Float:Y, Float:Z, str[256];
			    GetPlayerPos(playerid, X, Y, Z);
			    tmp = strtok(cmdtext, idx);
			    tmp2 = strtok(cmdtext, idx);
			    tmp3 = strtok(cmdtext, idx);
			    coche = strval(tmp);
			    color = strval(tmp2);
			    color2 = strval(tmp3);
			    new veh = GetPlayerVehicleID(playerid);
			    if(!strlen(tmp) || !strlen(tmp2) || !strlen(tmp3)) return SendClientMessage(playerid, DORADO, "Comando: {FFFFFF}/crearveh [IDModelo] [Color1] [Color2]");
			    if(!EsNumerico(tmp2) || !EsNumerico(tmp) || !EsNumerico(tmp3)) return SendClientMessage(playerid, 0xCBCCCEFF, "Lo siento, debes utilizar valores numericos!");
			    if(strval(tmp) < 400 || strval(tmp) > 611) return SendClientMessage(playerid, GRIS, "Lo siento, solo se dispone de un nivel mayor a 400 y menor a 611");
			    veh = CreateVehicle(coche, X, Y, Z, 180, color, color2, 60000);
			    PutPlayerInVehicle(playerid, veh, 0);
			    format(str, sizeof(str), "Has creado exitosamente el vehiculo id %d.", coche);
			    SendClientMessage(playerid, AZULCLARO, str);
		    }
		    else
      		{
		        SendClientMessage(playerid, GRIS, "Comando no disponible, requiere ser staff nivel 1338");
		    }
	    }
	    return 1;
	}
	if(strcmp(cmd, "/guardarveh", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
		    if(Informacion[playerid][Admin] == 1338)
			{
			    new coche, col, col2, Float:zX, Float:zY, Float:zZ, Float: zA, faccion;
			    tmp = strtok(cmdtext, idx);
			    faccion = strval(tmp);
			    if(!strlen(tmp)) return SendClientMessage(playerid, GRIS, "Comando: {FFFFFF}/guardarveh [Faccion]");
			    if(strval(tmp) < 0 || strval(tmp) > 6) return SendClientMessage(playerid, GRIS, "La facci�n debe ser m�s de 0 y menos de 6!");
			    coche = GetPlayerVehicleID(playerid);
       			GetVehiclePos(coche, zX, zY, zZ);
       			GetVehicleZAngle(coche, zA);
       			col = GetVehicleColor1(coche);
       			col2 = GetVehicleColor2(coche);
			    GuardarAuto(coche, zX, zY, zZ, zA, col, col2, faccion);
			    SendClientMessage(playerid, AMARILLO, "�Posicion guardada con exito!");
		    }
		    else
		    {
		        SendClientMessage(playerid, GRIS, "Comando no disponible, requiere ser staff nivel 1338");
		    }
	    }
	    return 1;
	}
	if(strcmp(cmd, "/desbugearvehiculo", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
		{
		    if(Informacion[playerid][Admin] == 1338)
		    {
			    if(IsPlayerInAnyVehicle(playerid))
			    {
			        new coche = GetPlayerVehicleID(playerid);
					if(VehiculosVenta(coche))
					{
						    new Float: carposx, Float: carposy, Float: carposz, Float:carposa;
						    GetVehiclePos(coche, carposx, carposy, carposz);
	                        GetVehicleZAngle(coche, carposa);
						    CInformacion[coche][cVenta] = 0;
                            CInformacion[coche][cTComprado] = 0;
                            strmid(CInformacion[coche][cNameD], "Dealership", 0, strlen("Dealership"), 999);
                            CInformacion[coche][cLock] = 0;
                            CInformacion[coche][cColorOne] = 1;
							CInformacion[coche][cColorTwo] = 1;
							ChangeVehicleColor(coche, 1, 1);
	                        CInformacion[coche][cLocationx] = carposx;
	                        CInformacion[coche][cLocationy] = carposy;
	                        CInformacion[coche][cLocationz] = carposz;
	                        CInformacion[coche][cAngle] = carposa;
	                        RepairVehicle(coche);
	                        ActualizarVehiculos();
                            GameTextForPlayer(playerid, "Vehiculo desbugeado", 1000, 3);
							GetVehicleParamsEx(coche,engine,lights,alarm,doors,bonnet,boot,objective);
							SetVehicleParamsEx(coche,0,lights,alarm,0,bonnet,boot,objective);
							TogglePlayerControllable(playerid, DESCONGELADO);
							RemovePlayerFromVehicle(playerid);
							printf("-> Vehiculo desbugeado, ID Coche: %d | Autor: %s", GetPlayerVehicleID(playerid), NombreEx(playerid));
				    }
			    }
			    else
			    {
			        SendClientMessage(playerid, GRIS, "Debes estar arriba de un coche");
			        return 1;
			    }
			}
			else
			{
			    SendClientMessage(playerid, GRIS, "Necesitas ser administrador nivel 1338");
			    return 1;
			}
		}
		return 1;
	}
 	/* ======================[Administradores 1337]============================ */
	if(strcmp(cmd, "/enumerar", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, DORADO, "Comando: {FFFFFF}/enumerar [Usuario] [IDItem] [Cantidad]");
			    SendClientMessage(playerid, BLANCO, "Nivel, Sexo, Edad, Origen, Skin, Personalidad, Signo");
			    SendClientMessage(playerid, BLANCO, "Aficion, TestRol, Experiencia, Bloqueo, Interior, MundoVirtual");
			    SendClientMessage(playerid, BLANCO, "Dinero, Faccion, Rango, Busqueda, Mascara, Multas, DineroBanco");
			    SendClientMessage(playerid, BLANCO, "RegSAPD, Loteria, Coche, Sangre, Tumor, Alcoholemia, NTelefono");
			    SendClientMessage(playerid, BLANCO, "LCoche, LVuelo, LBote, LArmas, Herramientas, Trabajo");
			    SendClientMessage(playerid, BLANCO, " ");
				return 1;
			}
			giveplayerid = ReturnUser(tmp);
            if(IsPlayerConnected(giveplayerid))
	    	{
	    	    if(giveplayerid != INVALID_PLAYER_ID)
	    	    {
					tmp = strtok(cmdtext, idx);
					if(!strlen(tmp))
					{
						SendClientMessage(playerid, DORADO, "Comando: {FFFFFF}/enumerar [Usuario] [IDItem] [Cantidad]");
					    SendClientMessage(playerid, BLANCO, "Nivel, Sexo, Edad, Origen, Skin, Personalidad, Signo");
					    SendClientMessage(playerid, BLANCO, "Aficion, TestRol, Experiencia, Bloqueo, Interior, MundoVirtual");
					    SendClientMessage(playerid, BLANCO, "Dinero, Faccion, Rango, Busqueda, Mascara, Multas, DineroBanco");
					    SendClientMessage(playerid, BLANCO, "RegSAPD, Loteria, Coche, Sangre, Tumor, Alcoholemia, NTelefono");
					    SendClientMessage(playerid, BLANCO, "LCoche, LVuelo, LBote, LArmas, Herramientas, Trabajo");
					    SendClientMessage(playerid, BLANCO, " ");
						return 1;
					}
					new stat;
					stat = strval(tmp);
					tmp = strtok(cmdtext, idx);
					if(!strlen(tmp))
					{
						SendClientMessage(playerid, DORADO, "Comando: {FFFFFF}/enumerar [Usuario] [IDItem] [Cantidad]");
					    SendClientMessage(playerid, BLANCO, "Nivel, Sexo, Edad, Origen, Skin, Personalidad, Signo");
					    SendClientMessage(playerid, BLANCO, "Aficion, TestRol, Experiencia, Bloqueo, Interior, MundoVirtual");
					    SendClientMessage(playerid, BLANCO, "Dinero, Faccion, Rango, Busqueda, Mascara, Multas, DineroBanco");
					    SendClientMessage(playerid, BLANCO, "RegSAPD, Loteria, Coche, Sangre, Tumor, Alcoholemia, NTelefono");
					    SendClientMessage(playerid, BLANCO, "LCoche, LVuelo, LBote, LArmas, Herramientas, Trabajo");
					    SendClientMessage(playerid, BLANCO, " ");
						return 1;
					}
					new amount;
					amount = strval(tmp);
					if(Informacion[playerid][Admin] >= 1338)
					{
						switch (stat)
						{
							case 1:
							{
								Informacion[giveplayerid][Nivel] = amount;
								format(string, sizeof(string), "Valor del enumerador modificado a %d", amount);
							}
							case 2:
							{
								Informacion[giveplayerid][Sexo] = amount;
								format(string, sizeof(string), "Valor del enumerador modificado a %d", amount);
							}
							case 3:
							{
								Informacion[giveplayerid][Edad] = amount;
								format(string, sizeof(string), "Valor del enumerador modificado a %d", amount);
							}
							case 4:
							{
								Informacion[giveplayerid][Origen] = amount;
								format(string, sizeof(string), "Valor del enumerador modificado a %d", amount);
							}
							case 5:
							{
								Informacion[giveplayerid][Skin] = amount;
								format(string, sizeof(string), "Valor del enumerador modificado a %d", amount);
							}
							case 6:
							{
								Informacion[giveplayerid][Personalidad] = amount;
								format(string, sizeof(string), "Valor del enumerador modificado a %d", amount);
							}
							case 7:
							{
								Informacion[giveplayerid][Signo] = amount;
								format(string, sizeof(string), "Valor del enumerador modificado a %d", amount);
							}
							case 8:
							{
								Informacion[giveplayerid][Aficion] = amount;
								format(string, sizeof(string), "Valor del enumerador modificado a %d", amount);
							}
							case 9:
							{
								Informacion[giveplayerid][TestRol] = amount;
								format(string, sizeof(string), "Valor del enumerador modificado a %d", amount);
							}
							case 10:
							{
								Informacion[giveplayerid][Experiencia] = amount;
								format(string, sizeof(string), "Valor del enumerador modificado a %d", amount);
							}
							case 11:
							{
								Informacion[giveplayerid][Bloqueo] = amount;
								format(string, sizeof(string), "Valor del enumerador modificado a %d", amount);
							}
							case 12:
							{
								Informacion[giveplayerid][Interior] = amount;
								format(string, sizeof(string), "Valor del enumerador modificado a %d", amount);
							}
							case 13:
							{
								Informacion[giveplayerid][MundoVirtual] = amount;
								format(string, sizeof(string), "Valor del enumerador modificado a %d", amount);
							}
							case 14:
							{
								Informacion[giveplayerid][Dinero] = amount;
								format(string, sizeof(string), "Valor del enumerador modificado a %d", amount);
							}
							case 15:
							{
								Informacion[giveplayerid][Faccion] = amount;
								format(string, sizeof(string), "Valor del enumerador modificado a %d", amount);
							}
							case 16:
							{
								Informacion[giveplayerid][Rango] = amount;
								format(string, sizeof(string), "Valor del enumerador modificado a %d", amount);
							}
							case 17:
							{
								Informacion[giveplayerid][Busqueda] = amount;
								format(string, sizeof(string), "Valor del enumerador modificado a %d", amount);
							}
							case 18:
							{
								Informacion[giveplayerid][Mascara] = amount;
								format(string, sizeof(string), "Valor del enumerador modificado a %d", amount);
							}
							case 19:
							{
								Informacion[giveplayerid][Multas] = amount;
								format(string, sizeof(string), "Valor del enumerador modificado a %d", amount);
							}
							case 20:
							{
								Informacion[giveplayerid][DineroBanco] = amount;
								format(string, sizeof(string), "Valor del enumerador modificado a %d", amount);
							}
							case 21:
							{
								Informacion[giveplayerid][RegSAPD] = amount;
								format(string, sizeof(string), "Valor del enumerador modificado a %d", amount);
							}
							case 22:
							{
								Informacion[giveplayerid][Loteria] = amount;
								format(string, sizeof(string), "Valor del enumerador modificado a %d", amount);
							}
							case 23:
							{
								Informacion[giveplayerid][Coche] = amount;
								format(string, sizeof(string), "Valor del enumerador modificado a %d", amount);
							}
							case 24:
							{
								Informacion[giveplayerid][Sangre] = amount;
								format(string, sizeof(string), "Valor del enumerador modificado a %d", amount);
							}
							case 25:
							{
								Informacion[giveplayerid][Tumor] = amount;
								format(string, sizeof(string), "Valor del enumerador modificado a %d", amount);
							}
							case 26:
							{
								Informacion[giveplayerid][Alcoholemia] = amount;
								format(string, sizeof(string), "Valor del enumerador modificado a %d", amount);
							}
							case 27:
							{
								Informacion[giveplayerid][NTelefono] = amount;
								format(string, sizeof(string), "Valor del enumerador modificado a %d", amount);
							}
							case 28:
							{
								Informacion[giveplayerid][LCoche] = amount;
								format(string, sizeof(string), "Valor del enumerador modificado a %d", amount);
							}
							case 29:
							{
								Informacion[giveplayerid][LVuelo] = amount;
								format(string, sizeof(string), "Valor del enumerador modificado a %d", amount);
							}
							case 30:
							{
								Informacion[giveplayerid][LBote] = amount;
								format(string, sizeof(string), "Valor del enumerador modificado a %d", amount);
							}
							case 31:
							{
								Informacion[giveplayerid][LArmas] = amount;
								format(string, sizeof(string), "Valor del enumerador modificado a %d", amount);
							}
							case 32:
							{
								Informacion[giveplayerid][Herramientas] = amount;
								format(string, sizeof(string), "Valor del enumerador modificado a %d", amount);
							}
							case 33:
							{
								Informacion[giveplayerid][Trabajo] = amount;
								format(string, sizeof(string), "Valor del enumerador modificado a %d", amount);
							}
						}
						SendClientMessage(playerid, AMARILLO, string);
					}
					else
					{
						SendClientMessage(playerid, GRIS, "Comando no disponible, requiere ser miembro staff 1338");
					}
				}
			}
		}
		return 1;
	}
	return ComandoErroneo(playerid, cmdtext);
}

public OnPlayerRequestClass(playerid, classid)
{
	LimpiarChat(playerid, 20);
	new nombre[MAX_PLAYER_NAME], archivo[256], string[256];
	GetPlayerName(playerid, nombre, sizeof(nombre));
	format(archivo, sizeof(archivo), "Res/Userdata/%s.ini", nombre);
	SendClientMessage(playerid, DORADO, "�Conexion finalizada con exito!");
	if(!dini_Exists(archivo))
	{
		format(string, sizeof(string), "{FEB800}Bienvenido(a) a Las Vegas City RolePlay usuario %s\n{FFFFFF}Actualmente su nombre no se encuentra registrada en nuestra base de datos\ninserte una contrase�a  en el siguiente campo para poder registrarla.", nombre);
	    ShowPlayerDialog(playerid, Registro, DIALOG_STYLE_INPUT, " ",string,"Registrar","Salir");
	}
	else
	{
		format(string, sizeof(string), "{FEB800}Bienvenido(a) a Las Vegas City RolePlay usuario %s\n{FFFFFF}su nombre se encuentra registrada en nuestra base de datos\ninserte su contrase�a para acceder a su cuenta", nombre);
	    ShowPlayerDialog(playerid, Logueo, DIALOG_STYLE_INPUT, " ",string,"Acceder","Salir");
 	}
	TextDrawShowForPlayer(playerid, Barra1);
	TextDrawShowForPlayer(playerid, Barra2);
	SetPlayerCameraPos(playerid, -61.7616,-1372.1816,100.3645);
	SetPlayerCameraLookAt(playerid, 88.2550,-1500.3762,11.8782);
	SetPlayerPos(playerid, 100.1829,-1422.4619,14.0540);
	return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	if(dialogid == Registro)
	{
       new nombrejugador[MAX_PLAYER_NAME], archivo[256],string[200];
       if (!strlen(inputtext)) return ShowPlayerDialog(playerid, Registro, DIALOG_STYLE_INPUT, " ", "{AA0000}�Error!\n{FFFFFF}Lo siento, la contrase�a que has insertado es incorrecta, intente nuevamente", "Continuar", "Salir");
       if (!response) return Kick(playerid);
       GetPlayerName(playerid, nombrejugador, sizeof(nombrejugador));
       format(archivo, sizeof(archivo), "Res/Userdata/%s.ini", nombrejugador);
       dini_Create(archivo);
       dini_Set(archivo, "Usuario", nombrejugador);
       dini_Set(archivo, "Contrase�a", inputtext);
       CrearCuenta(playerid);
       format(string,sizeof(string),"{55C800}Felicidades\n{FFFFFF}Has registrado este nombre en nuestra base de datos\ninserta tu contrase�a para poder iniciar sesi�n por primera vez");
       ShowPlayerDialog(playerid, Logueo, DIALOG_STYLE_INPUT, " ", string, "Iniciar", "Salir");
	}
	if(dialogid == Logueo)
	{
	   new nombrejugador[MAX_PLAYER_NAME], archivo[256], comprobante[256];
       if (!strlen(inputtext)) return ShowPlayerDialog(playerid, Logueo, DIALOG_STYLE_INPUT, " ", "{AA0000}�Error!\n{FFFFFF}Lo siento, la contrase�a que has insertado es incorrecta, intente nuevamente", "Aceptar", "Salir");
       if (!response) return Kick(playerid);
       GetPlayerName(playerid, nombrejugador, sizeof(nombrejugador));
       format(archivo, sizeof(archivo), "Res/Userdata/%s.ini", nombrejugador);
       format(comprobante, sizeof(comprobante), "%s", dini_Get(archivo, "Contrase�a"));
       if (!strcmp (inputtext, comprobante))
       {
			SpawnPlayer(playerid);
       }
       else
	   {
			if(!strlen(inputtext)) return ShowPlayerDialog(playerid, Logueo, DIALOG_STYLE_INPUT, " ", "{AA0000}�Error!\n{FFFFFF}Lo siento, la contrase�a que has insertado es incorrecta, intente nuevamente", "Aceptar","Salir");
			if(!response) return Kick(playerid);
			GetPlayerName(playerid, nombrejugador, sizeof(nombrejugador));
			format(archivo, sizeof(archivo), "Res/Userdata/%s.ini", nombrejugador);
			format(comprobante, sizeof(comprobante), "%s", dini_Get(archivo, "Contrase�a"));
		}
		return 1;
	}
	if(dialogid == EJob1)
	{
	    if(response)
	    {
	        SendClientMessage(playerid, VERDE, "Has empezado a repartir productos a los 3 24/7 de la ciudad");
	        SendClientMessage(playerid, BLANCO, "Mission: carga el deposito de tu vehiculo con productos y distribullelos a los 3 tiendas de 24/7");
	        SendClientMessage(playerid, BLANCO, "Dirijete al siguiente siguiente punto en {AA0000}ROJO {FFFFFF}marcado en el mapa");
			TogglePlayerControllable(playerid, DESCONGELADO);
			PasosTrabajo[playerid] = 1;
			SetPlayerCheckpoint(playerid, 417.9941,-1726.2198,8.9211, 8.0);
		}
		else
		{
		    SendClientMessage(playerid, GRIS, "Has elegido cancelar la mission de trabajo");
		    RemovePlayerFromVehicle(playerid);
			TogglePlayerControllable(playerid, DESCONGELADO);
		}
	}
	if(dialogid == SolicitudLice)
	{
	    new string[256];
	    if(response)
	    {
	        if(listitem == 0)
	        {
				SendClientMessage(playerid, VERDE, "Solicitud enviada a todos licencieros de vehiculos terrestres conectados");
				for(new i = 0; i < MAX_PLAYERS; i++)
			    {
			        if(IsPlayerConnected(i))
			        {
						if(Informacion[i][Faccion] == LICE && Informacion[i][Rango] == 2)
						{
						    format(string, sizeof(string), "* * El cliente %s (ID: %d) solicita un licenciero de vehiculos terrestres, Telefono: %d", NombreEx(playerid), playerid, Informacion[playerid][NTelefono]);
							SendClientMessage(i, AZULCLARO, string);
						}
					}
				}
			}
			if(listitem == 1)
			{
				SendClientMessage(playerid, VERDE, "Solicitud enviada a todos licencieros de vehiculos aereos conectados");
				for(new i = 0; i < MAX_PLAYERS; i++)
			    {
			        if(IsPlayerConnected(i))
			        {
						if(Informacion[i][Faccion] == LICE && Informacion[i][Rango] == 3)
						{
						    format(string, sizeof(string), "* * El cliente %s (ID: %d) solicita un licenciero de vehiculos aereos, Telefono: %d", NombreEx(playerid), playerid, Informacion[playerid][NTelefono]);
							SendClientMessage(i, AZULCLARO, string);
						}
					}
				}
			}
			if(listitem == 2)
			{
				SendClientMessage(playerid, VERDE, "Solicitud enviada a todos licencieros de vehiculos maritimos conectados");
				for(new i = 0; i < MAX_PLAYERS; i++)
			    {
			        if(IsPlayerConnected(i))
			        {
						if(Informacion[i][Faccion] == LICE && Informacion[i][Rango] == 4)
						{
						    format(string, sizeof(string), "* * El cliente %s (ID: %d) solicita un licenciero de vehiculos maritimos, Telefono: %d", NombreEx(playerid), playerid, Informacion[playerid][NTelefono]);
							SendClientMessage(i, AZULCLARO, string);
						}
					}
				}
			}
			if(listitem == 3)
			{
				SendClientMessage(playerid, VERDE, "Solicitud enviada a todos licencieros de armamento personal conectados");
				for(new i = 0; i < MAX_PLAYERS; i++)
			    {
			        if(IsPlayerConnected(i))
			        {
						if(Informacion[i][Faccion] == LICE && Informacion[i][Rango] == 5)
						{
						    format(string, sizeof(string), "* * El cliente %s (ID: %d) solicita un licenciero de armamento personal, Telefono: %d", NombreEx(playerid), playerid, Informacion[playerid][NTelefono]);
							SendClientMessage(i, AZULCLARO, string);
						}
					}
				}
			}
			if(listitem == 4)
			{
				SendClientMessage(playerid, VERDE, "Solicitud enviada a todos profesores de idiomas conectados");
				for(new i = 0; i < MAX_PLAYERS; i++)
			    {
			        if(IsPlayerConnected(i))
			        {
						if(Informacion[i][Faccion] == LICE && Informacion[i][Rango] >= 6)
						{
						    format(string, sizeof(string), "* * El cliente %s (ID: %d) solicita un profesor de idiomas, Telefono: %d", NombreEx(playerid), playerid, Informacion[playerid][NTelefono]);
							SendClientMessage(i, AZULCLARO, string);
						}
					}
				}
			}
		}
	}
	if(dialogid == PrestamoSangre)
	{
	    if(response)
	    {
	        if(listitem == 0)
	        {
	            SendClientMessage(playerid, VERDE, "Has comprado 10000 ml de sangre que han sido depositados al banco de sangre de SAMD");
				MensajeSAMD(VERDE, "El gobierno de san andreas ha depositado un total de 10000 ml de sangre desde Liberty City");
				SendClientMessage(playerid, ROJO, "El congreso de Liberty City le ha cobrado $10000 al estado de San Andreas");
				BancoSangre += 10000;
				CajaGobierno -= 10000;
				PrestamoLibertyCityS += 1;
				GuardarValores();
			}
	        if(listitem == 1)
	        {
	            SendClientMessage(playerid, VERDE, "Has comprado 10000 ml de sangre que han sido depositados al banco de sangre de SAMD");
				MensajeSAMD(VERDE, "El gobierno de san andreas ha depositado un total de 10000 ml de sangre desde Vice City");
				SendClientMessage(playerid, ROJO, "El congreso de Vice City le ha cobrado $10000 al estado de San Andreas");
				BancoSangre += 10000;
				CajaGobierno -= 10000;
				PrestamoViceCityS += 1;
				GuardarValores();
			}
		}
	}
	if(dialogid == PrestamoGanzuas)
	{
	    if(response)
	    {
	        if(listitem == 0)
	        {
	            SendClientMessage(playerid, VERDE, "Has comprado 10000 ganzuas que han sido depositadas al banco de ganzuas de SA:MEC");
				MensajeMECA(VERDE, "El gobierno de SA:GOB ha depositado 10000 ganzuas al banco de ganzuas");
				SendClientMessage(playerid, ROJO, "El congreso de Liberty City le ha cobrado $10000 al estado de San Andreas");
				BancoGanzuas += 10000;
				CajaGobierno -= 10000;
				PrestamoLibertyCityS += 1;
				GuardarValores();
			}
	        if(listitem == 1)
	        {
	            SendClientMessage(playerid, VERDE, "Has comprado 10000 ganzuas que han sido depositadas al banco de ganzuas de SA:MEC");
				MensajeMECA(VERDE, "El gobierno de SA:GOB ha depositado 10000 ganzuas al banco de ganzuas");
				SendClientMessage(playerid, ROJO, "El congreso de Vice City le ha cobrado $10000 al estado de San Andreas");
				BancoGanzuas += 10000;
				CajaGobierno -= 10000;
				PrestamoViceCityS += 1;
				GuardarValores();
			}
		}
	}
 	if(dialogid == VPanel)
	{
		new string[64];
		if(response)
	    {
	        if(listitem == 0)
	        {
	            ShowPlayerDialog(playerid, VLuces, DIALOG_STYLE_MSGBOX, "{FEB800}- Luces","{FFFFFF}�Que desea hacer?","Encender","Apagar");
	        }
	        if(listitem == 1)
	        {
	            ShowPlayerDialog(playerid, VCapo, DIALOG_STYLE_MSGBOX, "{FEB800}- Capo","{FFFFFF}�Que desea hacer?","Abrir","Cerrar");
	        }
	        if(listitem == 2)
	        {
	            ShowPlayerDialog(playerid, VMaletero, DIALOG_STYLE_MSGBOX, "{FEB800}- Maletero","{FFFFFF}�Que desea hacer?","Abrir","Cerrar");
	        }
	        if(listitem == 3)
	        {
				if(engine == VEHICLE_PARAMS_ON)
				{
				 	GetVehicleParamsEx(GetPlayerVehicleID(playerid), engine, lights, alarm, doors, bonnet, boot, objective);
					SetVehicleParamsEx(GetPlayerVehicleID(playerid), VEHICLE_PARAMS_OFF, lights, alarm, doors, bonnet, boot, objective);
					format(string, sizeof(string), "* %s saca las llaves del vehiculo y apaga el motor", NombreEx(playerid));
					RangoCercano(30, playerid, string, VIOLETA, VIOLETA, VIOLETA, VIOLETA, VIOLETA);
					VArrancado[GetPlayerVehicleID(playerid)] = 0;
					Motor[playerid] = 0;
				}
				else if(engine == VEHICLE_PARAMS_OFF || engine == VEHICLE_PARAMS_UNSET)
				{
				    SendClientMessage(playerid, GRIS, "El motor del vehiculo ya esta apagado");
				}
			}
	        if(listitem == 4)
	        {
				RemovePlayerFromVehicle(playerid);
				TogglePlayerControllable(playerid, DESCONGELADO);
				format(string, sizeof(string), "* %s baja del vehiculo a la fuerza", NombreEx(playerid));
				RangoCercano(30, playerid, string, VIOLETA, VIOLETA, VIOLETA, VIOLETA, VIOLETA);
				TextDrawHideForPlayer(playerid, Text:V_BOX);
				TextDrawHideForPlayer(playerid, Text:V_TITLE);
				TextDrawHideForPlayer(playerid, Text:V_TEXT[playerid]);
				TextDrawHideForPlayer(playerid, Text:V_ANUNCIO);
			}
		}
	}
	if(dialogid == OMecanico)
	{
	    if(response)
	    {
			new string[256];
	        RepairCar[playerid] = GetPlayerVehicleID(playerid);
	        SetVehicleHealth(RepairCar[playerid], 1000);
			GivePlayerMoney(RepairOffer[playerid], RepairPrice[playerid]);
	        RepairVehicle(GetPlayerVehicleID(playerid));
			format(string, sizeof(string), "* Tu coche fue reparado por $%d, por el mecanico %s",RepairPrice[playerid], NombreEx(RepairOffer[playerid]));
			SendClientMessage(playerid, VERDE, string);
			format(string, sizeof(string), "* Reparaste el coche de %s por $%d",NombreEx(playerid),RepairPrice[playerid]);
			SendClientMessage(RepairOffer[playerid], VERDE, string);
			RepairOffer[playerid] = 999;
			RepairPrice[playerid] = 0;
	    }
	    else
	    {
			SendClientMessage(playerid, GRIS, "Has rechazado la propuesta de reparacion del mecanico");
			SendClientMessage(RepairOffer[playerid], GRIS, "Lo siento, el usuario que ofresiste tu ayuda la ha ignorado");
			RepairOffer[playerid] = 999;
			RepairPrice[playerid] = 0;
		}
	}
	if(dialogid == VLuces)
	{
		new string[256];
		new vehiculo = GetPlayerVehicleID(playerid);
		if(response)
	    {
			GetVehicleParamsEx(vehiculo, engine, lights, alarm, doors, bonnet, boot, objective);
			SetVehicleParamsEx(vehiculo, engine, 1, alarm, doors, bonnet, boot, objective);
	        GameTextForPlayer(playerid, "~w~Luces: ~g~Encendidas", 2000, 4);
  			format(string, sizeof(string), "* %s enciende las luces de su vehiculo", NombreEx(playerid));
  			RangoCercano(10, playerid, string, VIOLETA, VIOLETA, VIOLETA, VIOLETA, VIOLETA);
		}
        else
        {
			GetVehicleParamsEx(vehiculo, engine, lights, alarm, doors, bonnet, boot, objective);
			SetVehicleParamsEx(vehiculo, engine, 0, alarm, doors, bonnet, boot, objective);
	        GameTextForPlayer(playerid, "~w~Luces: ~R~Apagadas", 2000, 4);
  			format(string, sizeof(string), "* %s apaga las luces de su vehiculo", NombreEx(playerid));
  			RangoCercano(10, playerid, string, VIOLETA, VIOLETA, VIOLETA, VIOLETA, VIOLETA);
		}
	}
	if(dialogid == VCapo)
	{
		new string[256];
		new vehiculo = GetPlayerVehicleID(playerid);
		if(response)
	    {
			GetVehicleParamsEx(vehiculo, engine, lights, alarm, doors, bonnet, boot, objective);
			SetVehicleParamsEx(vehiculo, engine, lights, alarm, doors, 1, boot, objective);
	        GameTextForPlayer(playerid, "~w~Capo: ~g~Abierto", 2000, 4);
  			format(string, sizeof(string), "* %s abre el capo de su vehiculo", NombreEx(playerid));
  			RangoCercano(10, playerid, string, VIOLETA, VIOLETA, VIOLETA, VIOLETA, VIOLETA);
	    }
        else
        {
			GetVehicleParamsEx(vehiculo, engine, lights, alarm, doors, bonnet, boot, objective);
			SetVehicleParamsEx(vehiculo, engine, lights, alarm, doors, 0, boot, objective);
	        GameTextForPlayer(playerid, "~w~Capo: ~R~Cerrado", 2000, 4);
  			format(string, sizeof(string), "* %s cierra el capo de su vehiculo", NombreEx(playerid));
  			RangoCercano(10, playerid, string, VIOLETA, VIOLETA, VIOLETA, VIOLETA, VIOLETA);
		}
	}
	if(dialogid == VMaletero)
	{
		new string[256];
		new vehiculo = GetPlayerVehicleID(playerid);
		if(response)
	    {
			GetVehicleParamsEx(vehiculo, engine, lights, alarm, doors, bonnet, boot, objective);
			SetVehicleParamsEx(vehiculo, engine, lights, alarm, doors, bonnet, 1, objective);
			GameTextForPlayer(playerid, "~w~Maletero: ~g~Abierto", 2000, 4);
  			format(string, sizeof(string), "* %s abre el maletero de su vehiculo", NombreEx(playerid));
  			RangoCercano(10, playerid, string, VIOLETA, VIOLETA, VIOLETA, VIOLETA, VIOLETA);
	    }
        else
        {
			GetVehicleParamsEx(vehiculo, engine, lights, alarm, doors, bonnet, boot, objective);
			SetVehicleParamsEx(vehiculo, engine, lights, alarm, doors, bonnet, 0, objective);
	        GameTextForPlayer(playerid, "~w~Maletero: ~R~Cerrado", 2000, 4);
  			format(string, sizeof(string), "* %s cierra el capo de su vehiculo", NombreEx(playerid));
  			RangoCercano(10, playerid, string, VIOLETA, VIOLETA, VIOLETA, VIOLETA, VIOLETA);
		}
	}
	if(dialogid == Asensor)
 	{
   		if(response)
		{
			SetPlayerPos(playerid, 1568.6674,-1690.6655,5.8906);
			SetPlayerInterior(playerid, 0);
			SetPlayerVirtualWorld(playerid, 0);
	     }
		 else
		 {
			SetPlayerPos(playerid, 1564.9000,-1665.9075,28.3956);
			SetPlayerInterior(playerid, 0);
			SetPlayerVirtualWorld(playerid, 0);
	    }
		return 1;
	}
	if(dialogid == DBanco)
    {
	    if(response)
        {
			switch(listitem)
			{
	   			case 0:
	   			{
	   			    ShowPlayerDialog(playerid, DepositoBancario, DIALOG_STYLE_INPUT, " ", "{FFFFFF}�Cuanto dinero quiere depositar?", "Enviar", "Cancelar");
	   			}
	   			case 1:
	   			{
	   			    new string[128];
			    	format(string,sizeof(string),"{D49E00}Dinero total: {FFFFFF}$%d\n\nIndique el ID del usuario al que desea transferir:", Informacion[playerid][DineroBanco]);
			    	ShowPlayerDialog(playerid, TransferenciaBancaria, DIALOG_STYLE_INPUT," ",string,"Siguiente","Cancelar");
	   			}
	   			case 2:
	   			{
	   			    ShowPlayerDialog(playerid, RetiroBancario, DIALOG_STYLE_INPUT, " ", "{FFFFFF}�Cuanto dinero quiere retirar?", "Retirar", "Cancelar");
	   			}
	   			case 3:
	   			{
	   			    new string[256];
			        new TCredito[64];
			        if(Informacion[playerid][TarjetaCredito] == 3) { TCredito = "Liberty City Union"; }
					else if(Informacion[playerid][TarjetaCredito] == 2) { TCredito = "Vice City BandRed"; }
					else if(Informacion[playerid][TarjetaCredito] == 1) { TCredito = "San Andreas Express"; }
					else { TCredito = "Sin Tarjeta"; }
					new NCuenta = Informacion[playerid][NCBancaria];
					new DTotal = Informacion[playerid][DineroBanco];
					format(string, sizeof(string), "{D49E00}Titular: {FFFFFF}%s\n{D49E00}Tarjeta de Credito: {FFFFFF}%s\n{D49E00}Numero de Cuenta: {FFFFFF}%d\n{D49E00}Dinero Total: {FFFFFF}$%d\n{D49E00}Impuestos: {FFFFFF}-%d", NombreEx(playerid), TCredito, NCuenta, DTotal, Impuestos);
					ShowPlayerDialog(playerid, InformacionBancaria, DIALOG_STYLE_MSGBOX, " ", string, "Aceptar", "");
				}
			}
		}
	}
	if(dialogid == RetiroBancario)
	{
	    if(response)
	    {
	     	if(!EsNumerico(inputtext))
	     	{
		    	ShowPlayerDialog(playerid, RetiroBancario, DIALOG_STYLE_INPUT,"", "{FFFFFF}Ingrese la cantidad que quieres sacar:","Sacar","Cancelar");
		     	SendClientMessage(playerid, GRIS, "Solo puedes utilizar numeros");
		     	return 1;
	     	}
	     	if(strval(inputtext) > Informacion[playerid][DineroBanco]) return SendClientMessage(playerid, GRIS, "No puedes sacar una cifra de dinero que no tienes!");
	     	if(Informacion[playerid][DineroBanco] == 0) return SendClientMessage(playerid, GRIS, "No puedes sacar dinero porque no hay nada guardado!");
	     	if(Informacion[playerid][DineroBanco]-strval(inputtext) < 0) return SendClientMessage(playerid, GRIS, "No puedes sacar esa cantidad o te puedes quedar en numeros rojos en el banco!");
		   	new minombre[MAX_PLAYER_NAME], archivo[256], s[128];
    		GivePlayerMoney(playerid, strval(inputtext));
    		Informacion[playerid][DineroBanco] -= strval(inputtext);
			GetPlayerName(playerid, minombre, sizeof(minombre)); format(archivo, sizeof(archivo), "/Res/Userdata/%s.ini", minombre);
			dini_IntSet(archivo, "DineroBancario", Informacion[playerid][DineroBanco]);
			format(s, sizeof(s), "Ahora tienes $%d, gracias por venir", Informacion[playerid][DineroBanco]); SendClientMessage(playerid, AZULCLARO, s);
	    }
	    else
	    {
	    	SendClientMessage(playerid, GRIS, "Has cancelado la operacion de retiro");
	    }
	}
	if(dialogid == OLive)
 	{
	    new string[256];
   		if(response)
		{
		    SendClientMessage(playerid, VERDE, "* Has aceptado la entrevista, todo lo que digas ahora lo escucharan todos.");
			SendClientMessage(OfreserEntrevista[playerid], VERDE, "* Ha aceptado la entrevista, estas en vivo!, Utiliza /entrevista para finalizar");
			format(string, sizeof(string), "* %s toma el microfono cordialmente y se lo pone", NombreEx(playerid));
			RangoCercano(10, playerid, string, VIOLETA, VIOLETA, VIOLETA, VIOLETA, VIOLETA);
			TogglePlayerControllable(playerid, 0);
			TogglePlayerControllable(OfreserEntrevista[playerid], 0);
			Entrevistado[playerid] = OfreserEntrevista[playerid];
			Entrevistado[OfreserEntrevista[playerid]] = playerid;
			OfreserEntrevista[playerid] = 999;
		}
		else
		{
			format(string, sizeof(string), "* %s rechaza el microfono cordialmente", NombreEx(playerid));
			RangoCercano(10, playerid, string, VIOLETA, VIOLETA, VIOLETA, VIOLETA, VIOLETA);
			OfreserEntrevista[playerid] = 999;
		}
		return 1;
	}
	if(dialogid == CLlamada)
	{
	    new string[256];
	    if(response)
	    {
			for(new i = 0; i < MAX_PLAYERS; i++)
			{
				if(IsPlayerConnected(i))
				{
					if(Linea[i] == playerid)
					{
						Linea[playerid] = i;
						SendClientMessage(i,  AMARILLO, "Han contestado la llamada");
						format(string, sizeof(string), "* %s contesta su llamada telefonica", NombreEx(playerid));
						RangoCercano(30.0, playerid, string, VIOLETA,VIOLETA,VIOLETA,VIOLETA,VIOLETA);
						RingTone[playerid] = 0;
					}

				}
			}
	     }
		 else
		 {
    		new caller = Linea[playerid];
			if(IsPlayerConnected(caller))
			{
			    if(caller != INVALID_PLAYER_ID)
			    {
					if(caller != 255)
					{
						if(caller < 255)
						{
							SendClientMessage(caller,  GRIS, "Llamada Ignorada");
							CellTime[caller] = 0;
							CellTime[playerid] = 0;
							SendClientMessage(playerid,  GRIS, "Has ignorado la llamada");
							Linea[caller] = 255;
						}
						Linea[playerid] = 255;
						CellTime[playerid] = 0;
						RingTone[playerid] = 0;
					}
				}
			}
		}
		return 1;
	}
	if(dialogid == DepositoBancario)
	{
	    if(response)
	    {
	     	if(!EsNumerico(inputtext))
	     	{
		    	ShowPlayerDialog(playerid,DepositoBancario,DIALOG_STYLE_INPUT," ", "{FFFFFF}Ingrese la cantidad que quieres depositar:","Meter","Cancelar");
		     	SendClientMessage(playerid, GRIS,"Solo puedes escribir n�meros en la casilla correspondiente!");
		     	return 1;
	     	}
	     	if(strval(inputtext) > GetPlayerMoney(playerid)) return SendClientMessage(playerid, GRIS, "No tienes esa cantidad de dinero");
	     	if(strval(inputtext) < 50) return SendClientMessage(playerid, GRIS, "No puedes depositar menos de $50");
	     	if(GetPlayerMoney(playerid)-strval(inputtext) < 0) return SendClientMessage(playerid, GRIS, "No puedes depositar esa cantidad o tendras deudas");
		   	new minombre[MAX_PLAYER_NAME], archivo[256], s[128];
    		GivePlayerMoney(playerid, -strval(inputtext));
    		Informacion[playerid][DineroBanco] += strval(inputtext);
			GetPlayerName(playerid, minombre, sizeof(minombre)); format(archivo, sizeof(archivo), "/Usuarios/%s.ini", minombre);
			dini_IntSet(archivo, "DineroBanco", Informacion[playerid][DineroBanco]);
			format(s, sizeof(s), "Ahora tienes $%d en tu cuenta bancaria", Informacion[playerid][DineroBanco]); SendClientMessage(playerid, AZULCLARO, s);
	    }
	    else
	    {
	    	SendClientMessage(playerid, GRIS, "Has cancelado el deposito");
	    }
	}
    if(dialogid == TransferenciaBancaria)
	{
     	if(response)
     	{
	     	if(strval(inputtext) == INVALID_PLAYER_ID) return SendClientMessage(playerid, GRIS, "El usuario se encuentra desconectado");
	        else if(!EsNumerico(inputtext))
	        {
		        new string[128];
			    format(string,sizeof(string),"{D49E00}Dinero total: {FFFFFF}$%d\n\nIndique el ID del usuario al que desea transferir:", Informacion[playerid][DineroBanco]);
			    ShowPlayerDialog(playerid, TransferenciaBancaria, DIALOG_STYLE_INPUT," ",string,"Aceptar","Cancelar");
		        SendClientMessage(playerid, ROJO, "Porfavor, usa ID, no el nombre");
	        }
			else
			{
				transferido = strval(inputtext);
				new string[128];
				format(string,sizeof(string),"{D49E00}ID: {FFFFFF}$%d\n\nIndique la cantidad de dinero que desea transferir:", transferido, Informacion[playerid][DineroBanco]);
				ShowPlayerDialog(playerid, TransferenciaBancaria2, DIALOG_STYLE_INPUT, " ",string,"Aceptar","Cancelar");
			}
		}
		return 1;
	}
    if(dialogid == TransferenciaBancaria2)
    {
        if(response)
        {
	        new archivo[100], Nombre[MAX_PLAYER_NAME];
			GetPlayerName(playerid, Nombre, sizeof(Nombre));
			format(archivo, sizeof(archivo), "Res/Userdata/%s.ini", Nombre);
	     	if(strval(inputtext) > Informacion[playerid][DineroBanco]) return SendClientMessage(playerid, GRIS, "No tienes esa cantidad de dinero");
	        else if(!EsNumerico(inputtext))
	        {
		        new string[128];
				format(string,sizeof(string),"{FFFFFF}ID: %d\nIndique la cantidad exacta de dinero a transferir",transferido);
				ShowPlayerDialog(playerid,TransferenciaBancaria2,DIALOG_STYLE_INPUT," ",string,"Aceptar","Cancelar");
		        SendClientMessage(playerid, GRIS,"El valor solo debe contener numeros!");
	        }
			else
			{
				Informacion[playerid][DineroBanco] -= strval(inputtext);
				Informacion[transferido][DineroBanco] += strval(inputtext);
				new string[128], string2[128], string3[128], string4[128];
				format(string,sizeof(string),"Has transferido $%d a %s",strval(inputtext),NombreEx(transferido));
				SendClientMessage(playerid,AMARILLO,string);
				dini_IntSet(archivo,"DineroBanco",Informacion[playerid][DineroBanco]);
				format(string2,128,"Actualmente tienes $%d en el banco",Informacion[playerid][DineroBanco]);
				SendClientMessage(playerid,AMARILLO,string2);
				format(string3,128,"El jugador: %s, Te ha transferido %d$ a tu cuenta bancaria.",NombreEx(playerid),strval(inputtext));
				SendClientMessage(transferido,AMARILLO,string3);
				format(string4,128,"Tu nuevo balance es: %d$",Informacion[transferido][DineroBanco]);
				SendClientMessage(transferido,AMARILLO,string4);
			}
		}
    }
	if(dialogid == OGanzua)
	{
	    if(response)
	    {
			new string[256];
			if(GetPlayerMoney(playerid) > GanzuaPrecio[playerid])
		    {
				GivePlayerMoney(GanzuaOferta[playerid], GanzuaPrecio[playerid]);
				GivePlayerMoney(playerid, -GanzuaPrecio[playerid]);
				Informacion[playerid][Herramientas] += GanzuaCantidad[playerid];
				Informacion[GanzuaOferta[playerid]][Herramientas] -= GanzuaCantidad[playerid];
				format(string, sizeof(string), "** %s te ha comprado %d Herramientas por $%d **", NombreEx(playerid), GanzuaCantidad[playerid], GanzuaPrecio[playerid]);
				SendClientMessage(GanzuaOferta[playerid], VERDE, string);
				format(string, sizeof(string), "** Le has comprado a %s %d Herramientas por $%d **", NombreEx(GanzuaOferta[playerid]), GanzuaCantidad[playerid], GanzuaPrecio[playerid]);
				SendClientMessage(playerid, VERDE, string);
				GanzuaPrecio[playerid] = 0;
				GanzuaOferta[playerid] = 999;
				GanzuaCantidad[playerid] = 0;
				return 1;
			}
	    }
	    else
	    {
			SendClientMessage(playerid, GRIS, "Has rechazado la propuesta de venta de Herramientas");
			SendClientMessage(GanzuaOferta[playerid], GRIS, "El usuario ha rechazado la oferta");
			GanzuaPrecio[playerid] = 0;
			GanzuaOferta[playerid] = 999;
			GanzuaCantidad[playerid] = 0;
		}
	}
 	if(dialogid == EquipoSAPD)
	{
		new string[256];
		if(response)
	    {
	        if(listitem == 0)
	        {
				ResetPlayerWeapons(playerid);
				SetPlayerArmour(playerid, 100);
                SetPlayerHealth(playerid, 100);
				GivePlayerWeapon(playerid, 3, 1);
   				GivePlayerWeapon(playerid, 24, 400);
			    GivePlayerWeapon(playerid, 41, 999);
			    GivePlayerWeapon(playerid, 17, 5);
		    	GivePlayerWeapon(playerid, 29, 600);
				SetPlayerSkin(playerid, 285);
				format(string, sizeof(string), "* %s se coloca su equipo SWAT ligero y prepara sus armas", NombreEx(playerid));
				RangoCercano(30, playerid, string, VIOLETA, VIOLETA, VIOLETA, VIOLETA, VIOLETA);
			}
			if(listitem == 1)
   			{
				ResetPlayerWeapons(playerid);
				SetPlayerArmour(playerid, 100);
                SetPlayerHealth(playerid, 100);
			    GivePlayerWeapon(playerid, 3, 1);
				GivePlayerWeapon(playerid, 24, 400);
			    GivePlayerWeapon(playerid, 41, 999);
			    GivePlayerWeapon(playerid, 17, 5);
		    	GivePlayerWeapon(playerid, 31, 600);
 				SetPlayerSkin(playerid, 285);
				format(string, sizeof(string), "* %s se coloca su equipo SWAT pesado y prepara sus armas", NombreEx(playerid));
				RangoCercano(30, playerid, string, VIOLETA, VIOLETA, VIOLETA, VIOLETA, VIOLETA);
			}
			if(listitem == 2)
   			{
				ResetPlayerWeapons(playerid);
				SetPlayerArmour(playerid, 100);
                SetPlayerHealth(playerid, 100);
			    GivePlayerWeapon(playerid, 3, 1);
				GivePlayerWeapon(playerid, 24, 400);
				GivePlayerWeapon(playerid, 34, 500);
		    	SetPlayerSkin(playerid, 165);
				format(string, sizeof(string), "* %s se coloca su equipo francotirador y prepara su sniper", NombreEx(playerid));
				RangoCercano(30, playerid, string, VIOLETA, VIOLETA, VIOLETA, VIOLETA, VIOLETA);
			}
			if(listitem == 3)
   			{
				ResetPlayerWeapons(playerid);
				SetPlayerArmour(playerid, 100);
                SetPlayerHealth(playerid, 100);
			    GivePlayerWeapon(playerid, 3, 1);
				GivePlayerWeapon(playerid, 24, 400);
		    	SetPlayerSkin(playerid, 165);
				format(string, sizeof(string), "* %s se coloca su equipo de espionaje y toma un pasamonta�as", NombreEx(playerid));
				RangoCercano(30, playerid, string, VIOLETA, VIOLETA, VIOLETA, VIOLETA, VIOLETA);
				Informacion[playerid][Mascara] = 1;
			}
			if(listitem == 4)
   			{
				ResetPlayerWeapons(playerid);
				SetPlayerSkin(playerid, Informacion[playerid][Skin]);
				GivePlayerWeapon(playerid, 3, 0);
				SetPlayerArmour(playerid, 50);
                SetPlayerHealth(playerid, 100);
				format(string, sizeof(string), "* %s retira todo su armamento y se coloca su ropa informal", NombreEx(playerid));
				RangoCercano(30, playerid, string, VIOLETA, VIOLETA, VIOLETA, VIOLETA, VIOLETA);
			}
		}
	}
	if(dialogid == UserRoot)
	{
	    if(response)
	    {
	        if(listitem == 0)
	        {
				SendClientMessage(playerid, VERDE, "Has auto-cambiado tu interior a 0");
				SetPlayerInterior(playerid, 0);
				Informacion[playerid][Interior] = 0;
   	        }
 	        if(listitem == 1)
	        {
				SendClientMessage(playerid, VERDE, "Has auto-cambiado tu mundo virtual a 0");
				SetPlayerInterior(playerid, 0);
				Informacion[playerid][MundoVirtual] = 0;
   	        }
		}
	}
	if(dialogid == AdminClick)
	{
	    new string[256];
	    if(response)
	    {
			if(listitem == 0)
			{
			    SendClientMessage(playerid, AZULCLARO, "La solicitud ha sido enviada al miembro del staff, aguarde un momento");
			    format(string, sizeof(string), "[AYUDA] El usuario %s solicita una ayuda de parte suya, ID: %d", NombreEx(playerid), playerid);
				SendClientMessage(IDReporte[playerid], FLUORESENTE, string);
				IDReporte[playerid] = 999;
			}
			if(listitem == 1)
			{
			    SendClientMessage(playerid, AZULCLARO, "La solicitud ha sido enviada al miembro del staff, aguarde un momento");
			    format(string, sizeof(string), "[QUEJA] El usuario %s presenta una queja, ID: %d", NombreEx(playerid), playerid);
				SendClientMessage(IDReporte[playerid], FLUORESENTE, string);
				IDReporte[playerid] = 999;
			}
		}
	}
	if(dialogid == TerminosBancarios)
	{
	    if(response)
	    {
			ShowPlayerDialog(playerid, EleccionTarjeta, DIALOG_STYLE_LIST, "-> Tarjetas de credito", "San Andreas Express\nVice City BandRed\nLiberty City Union\n", "Seleccionar", "");
		}
	}
	if(dialogid == Vehiculos)
	{
	    if(response)
	    {
	        new string[256];
	        if(GetPlayerMoney(playerid) > PrecioCoche[playerid])
			{
				new giveplayer[MAX_PLAYER_NAME];
				GetPlayerName(OfertaCoche[playerid], giveplayer, sizeof(giveplayer));
				CajaGobierno += PrecioCoche[playerid];
				GivePlayerMoney(playerid, -PrecioCoche[playerid]);
				CInformacion[IDcCoche[playerid]][cVenta] = 1;
				strmid(CInformacion[IDcCoche[playerid]][cNameD], NombreEx(playerid), 0, strlen(NombreEx(playerid)), 999);
				CInformacion[IDcCoche[playerid]][cTComprado] = 168;
				Informacion[playerid][Coche] = IDcCoche[playerid];
				format(string, sizeof(string), "** Felicidades!, has comprado un veh�culo por $%d al vendedor %s **", PrecioCoche[playerid], giveplayer);
				SendClientMessage(playerid, AMARILLO, string);
				SendClientMessage(playerid, AMARILLO, "Para ver los comandos de tu veh�culo usa /ayuda");
				SendClientMessage(playerid, BLANCO, "El motor del vehiculo se encuentra apagado, manten presionado el bot�n {FF0000}2 {FFFFFF}para encenderlo. ");
				format(string, sizeof(string), "** %s te ha comprado un veh�culo por $%d, informalo m�s sobre su nueva compra **", NombreEx(playerid), PrecioCoche[playerid]);
	            SendClientMessage(OfertaCoche[playerid], VERDE, string);
	            SendClientMessage(OfertaCoche[playerid], VERDE, "El dinero de venta del vehiculo ha sido llevado a los fondos de San Andreas");
			    ActualizarVehiculos();
	            OfertaCoche[playerid] = 999;
	            PrecioCoche[playerid] = 0;
	            IDcCoche[playerid] = 9999;
				TogglePlayerControllable(playerid, DESCONGELADO);
				RemovePlayerFromVehicle(playerid);
	        }
	        else
	        {
	            SendClientMessage(playerid, GRIS, "Lo siento, no tienes suficiente dinero para comprar el vehiculo");
		   	    OfertaCoche[playerid] = 999;
		        PrecioCoche[playerid] = 0;
		        IDcCoche[playerid] = 9999;
				TogglePlayerControllable(playerid, DESCONGELADO);
				RemovePlayerFromVehicle(playerid);
		    }
	   }
	   else
	   {
	   	    OfertaCoche[playerid] = 999;
	        PrecioCoche[playerid] = 0;
	        IDcCoche[playerid] = 9999;
            SendClientMessage(OfertaCoche[playerid], ROJO, "Ha rechazado tu oferta de vender este vehiculo");
            SendClientMessage(playerid, ROJO, "Has rechazado la oferta de venta de este vehiculo");
			TogglePlayerControllable(playerid, DESCONGELADO);
		 	RemovePlayerFromVehicle(playerid);
		}
    }
	if(dialogid == EleccionTarjeta)
	{
	    new string[256];
		if(response)
		{
			if(listitem == 0)
	        {
			    new randomtarjet = 600000000 + random(699999999);
				SendClientMessage(playerid, DORADO, "Tarjeta de Credito: {FFFFFF}San Andreas Express");
				SendClientMessage(playerid, DORADO, "Numero de Serie: {FFFFFF}AB4L - 5514 - 0951 - DB21 - HE81 - FFF9");
				format(string, sizeof(string), "Numero de Cuenta: {FFFFFF}%d-AB", randomtarjet);
				SendClientMessage(playerid, DORADO, string);
				Informacion[playerid][CBancaria] = 1;
				Informacion[playerid][NCBancaria] = randomtarjet;
				Informacion[playerid][TarjetaCredito] = 1;
			}
	        if(listitem == 1)
	        {
			    new randomtarjet = 600000000 + random(699999999);
				SendClientMessage(playerid, DORADO, "Tarjeta de Credito: {FFFFFF}Vice City BandRed");
				SendClientMessage(playerid, DORADO, "Numero de Serie: {FFFFFF}JKJ4L - 8527 - 0F51 - D721 - HG11 - F1F1");
				format(string, sizeof(string), "Numero de Cuenta: {FFFFFF}%d-BC", randomtarjet);
				SendClientMessage(playerid, DORADO, string);
				Informacion[playerid][CBancaria] = 1;
				Informacion[playerid][NCBancaria] = randomtarjet;
				Informacion[playerid][TarjetaCredito] = 2;
			}
	        if(listitem == 2)
	        {
			    new randomtarjet = 600000000 + random(699999999);
				SendClientMessage(playerid, DORADO, "Tarjeta de Credito: {FFFFFF}Liberty City Union");
				SendClientMessage(playerid, DORADO, "Numero de Serie: {FFFFFF}H11L - AT27 - 0V57 - H711 - H615 - J6D1");
				format(string, sizeof(string), "Numero de Cuenta: {FFFFFF}%d-XC", randomtarjet);
				SendClientMessage(playerid, DORADO, string);
				Informacion[playerid][CBancaria] = 1;
				Informacion[playerid][NCBancaria] = randomtarjet;
				Informacion[playerid][TarjetaCredito] = 3;
			}
		}
	}
	if(dialogid == Reporte)
	{
		new string[256];
	    if(response)
	    {
			if(listitem == 0)
	        {
				SendClientMessage(playerid, AZULCLARO, "Gracias por reportar al usuario, los miembros del staff conectados acudiran enseguida");
				format(string, sizeof(string), "[REPORTE]: Usuario %s reporta a %s por hacer deathmatch", NombreEx(playerid), NombreEx(IDReporte[playerid]));
				MensajeADMIN(ROJO, string);
				IDReporte[playerid] = 999;
				ReportesTotales += 1;
			}
	        if(listitem == 1)
	        {
				SendClientMessage(playerid, AZULCLARO, "Gracias por reportar al usuario, los miembros del staff conectados acudiran enseguida");
				format(string, sizeof(string), "[REPORTE]: Usuario %s reporta a %s por hacer metagaming", NombreEx(playerid), NombreEx(IDReporte[playerid]));
				MensajeADMIN(ROJO, string);
				IDReporte[playerid] = 999;
				ReportesTotales += 1;
			}
	        if(listitem == 2)
	        {
				SendClientMessage(playerid, AZULCLARO, "Gracias por reportar al usuario, los miembros del staff conectados acudiran enseguida");
				format(string, sizeof(string), "[REPORTE]: Usuario %s reporta a %s por hacer powergaming", NombreEx(playerid), NombreEx(IDReporte[playerid]));
				MensajeADMIN(ROJO, string);
				IDReporte[playerid] = 999;
				ReportesTotales += 1;
			}
	        if(listitem == 3)
	        {
				SendClientMessage(playerid, AZULCLARO, "Gracias por reportar al usuario, los miembros del staff conectados acudiran enseguida");
				format(string, sizeof(string), "[REPORTE]: Usuario %s reporta a %s por hacer carjacking", NombreEx(playerid), NombreEx(IDReporte[playerid]));
				MensajeADMIN(ROJO, string);
				IDReporte[playerid] = 999;
				ReportesTotales += 1;
			}
	        if(listitem == 4)
	        {
				SendClientMessage(playerid, AZULCLARO, "Gracias por reportar al usuario, los miembros del staff conectados acudiran enseguida");
				format(string, sizeof(string), "[REPORTE]: Usuario %s reporta a %s por hacer trainkill", NombreEx(playerid), NombreEx(IDReporte[playerid]));
				MensajeADMIN(ROJO, string);
				IDReporte[playerid] = 999;
				ReportesTotales += 1;
			}
	        if(listitem == 5)
	        {
				SendClientMessage(playerid, AZULCLARO, "Gracias por reportar al usuario, los miembros del staff conectados acudiran enseguida");
				format(string, sizeof(string), "[REPORTE]: Usuario %s reporta a %s por hacer driveby", NombreEx(playerid), NombreEx(IDReporte[playerid]));
				MensajeADMIN(ROJO, string);
				IDReporte[playerid] = 999;
				ReportesTotales += 1;
			}
	        if(listitem == 6)
	        {
				SendClientMessage(playerid, AZULCLARO, "Gracias por reportar al usuario, los miembros del staff conectados acudiran enseguida");
				format(string, sizeof(string), "[REPORTE]: Usuario %s reporta a %s por hacer helikill", NombreEx(playerid), NombreEx(IDReporte[playerid]));
				MensajeADMIN(ROJO, string);
				IDReporte[playerid] = 999;
				ReportesTotales += 1;
			}
	        if(listitem == 7)
	        {
				SendClientMessage(playerid, AZULCLARO, "Gracias por reportar al usuario, los miembros del staff conectados acudiran enseguida");
				format(string, sizeof(string), "[REPORTE]: Usuario %s reporta a %s por hacer flood", NombreEx(playerid), NombreEx(IDReporte[playerid]));
				MensajeADMIN(ROJO, string);
				IDReporte[playerid] = 999;
				ReportesTotales += 1;
			}
	        if(listitem == 8)
	        {
				SendClientMessage(playerid, AZULCLARO, "Gracias por reportar al usuario, los miembros del staff conectados acudiran enseguida");
				format(string, sizeof(string), "[REPORTE]: Usuario %s reporta a %s por insultar OOC", NombreEx(playerid), NombreEx(IDReporte[playerid]));
				MensajeADMIN(ROJO, string);
				IDReporte[playerid] = 999;
				ReportesTotales += 1;
			}
	        if(listitem == 9)
	        {
				SendClientMessage(playerid, AZULCLARO, "Gracias por reportar al usuario, los miembros del staff conectados acudiran enseguida");
				format(string, sizeof(string), "[REPORTE]: Usuario %s reporta a %s por abusar de bugs", NombreEx(playerid), NombreEx(IDReporte[playerid]));
				MensajeADMIN(ROJO, string);
				IDReporte[playerid] = 999;
				ReportesTotales += 1;
			}
	        if(listitem == 10)
	        {
				SendClientMessage(playerid, AZULCLARO, "Gracias por reportar al usuario, los miembros del staff conectados acudiran enseguida");
				format(string, sizeof(string), "[REPORTE]: Usuario %s reporta a %s por Comandor hacks o cheats", NombreEx(playerid), NombreEx(IDReporte[playerid]));
				MensajeADMIN(ROJO, string);
				IDReporte[playerid] = 999;
				ReportesTotales += 1;
			}
	        if(listitem == 11)
	        {
				SendClientMessage(playerid, AZULCLARO, "Gracias por reportar al usuario, los miembros del staff conectados acudiran enseguida");
				format(string, sizeof(string), "[REPORTE]: Usuario %s reporta a %s por hacer SPAM", NombreEx(playerid), NombreEx(IDReporte[playerid]));
				MensajeADMIN(ROJO, string);
				IDReporte[playerid] = 999;
				ReportesTotales += 1;
			}
		}
	}
	if(dialogid == Terminos)
	{
	    if(response)
	    {
			TextDrawShowForPlayer(playerid, Barra1);
			TextDrawShowForPlayer(playerid, Barra2);
			SendClientMessage(playerid, VERDE, "Gracias por aceptar nuestros t�rminos y condiciones de nuestro servidor.");
			SendClientMessage(playerid, BLANCO, "Ahora vamos a proceder a un test de roleplay para calificarlo");
			SetPlayerPos(playerid, 1401.1342,-1690.7317,18.5469);
			SetPlayerCameraPos(playerid, 1410.1300,-1711.4304,28.1829);
			SetPlayerCameraLookAt(playerid, 1480.4828,-1742.3158,17.9032);
		    ShowPlayerDialog(playerid, TRol, DIALOG_STYLE_LIST, "{FEB800}[1/10]: {FFFFFF}�Qu� es DeathMatch?","1| Matar o Herir a un usuario sin alguna raz�n\n2| Insultar a alguien por canales OOC\n3| Saltar varias veces seguidas para viajar mas r�pido","Seleccionar","");
			Informacion[playerid][TestRol] = 0;
		}
		else
		{
		    SendClientMessage(playerid, ROJO, "Lo siento, no se permite evadir esto, has sido kickeado");
			Kick(playerid);
		}
	}
	if(dialogid == RentaVehiculo)
	{
	    if(response)
	    {
			new dinero = GetPlayerMoney(playerid);
	        if(dinero <= 199)
			{
				SendClientMessage(playerid, GRIS, "No tienes suficiente dinero para rentar el vehiculo!");
				RemovePlayerFromVehicle(playerid);
				return 1;
			}
			if(Rentado[GetPlayerVehicleID(playerid)] == 0 && Informacion[playerid][HeRentado] == 0)
			{
		        Rentado[GetPlayerVehicleID(playerid)] = 1;
		        SendClientMessage(playerid, AZULCLARO, "Has rentado el vehiculo por $200");
		        if(!EsBicicleta(GetPlayerVehicleID(playerid)))
		        {
		        	SendClientMessage(playerid, AZULCLARO, "{FFFFFF}El motor del vehiculo se encuentra apagado, manten presionado el bot�n {FF0000}2 {FFFFFF}para encenderlo.");
		        }
		        else
		        {
		            GetVehicleParamsEx(GetPlayerVehicleID(playerid), engine, lights, alarm, doors, bonnet, boot, objective);
		            if(engine == VEHICLE_PARAMS_OFF || engine == VEHICLE_PARAMS_UNSET)
		            {
		            	SetVehicleParamsEx(GetPlayerVehicleID(playerid), VEHICLE_PARAMS_ON, lights, alarm, doors, bonnet, boot, objective);
		            }
		        }
		        GivePlayerMoney(playerid, -200);
		        Informacion[playerid][VRentado] = GetPlayerVehicleID(playerid);
		        Informacion[playerid][HeRentado] = 1;
	        }
	        else
	        {
	            SendClientMessage(playerid, ROJO ,"El vehiculo ya est� rentado!");
	            RemovePlayerFromVehicle(playerid);
	        }
	    }
	    else
	    {
	    	SendClientMessage(playerid, ROJO, "Has decidido no rentar el vehiculo.");
	    	RemovePlayerFromVehicle(playerid);
	    }
	}
	if(dialogid == Guia)
	{
	    if(response)
	    {
	        if(listitem == 0)
	        {
				SendClientMessage(playerid, DORADO, "-= Facciones =-");
				SendClientMessage(playerid, BLANCO, "Las facciones son una parte importante de tu jugador, es una muy buena forma de extenderte en roles y ganar dinero mas seguido.");
				SendClientMessage(playerid, BLANCO, "Con aumentos seg�n el rango que obtengas, cada faccion contiene un dirijente, un lider que controle a sus miembros y haga planie ordenes");
				SendClientMessage(playerid, BLANCO, "para futuros roles. La unica forma de ingresar a una faccion es por medio de su lider, debes tratar de tener contacto con el, pero evitando el MG.");
				SendClientMessage(playerid, BLANCO, "Quizas no sea facil de contactar con el lider, y tengas que recurrir a un miembro de alguna faccion para hablar con el lider.");
			}
			if(listitem == 1)
			{
				SendClientMessage(playerid, DORADO, "-= Trabajos =-");
				SendClientMessage(playerid, BLANCO, "Si  el dinero de faccion no te contenta puedes buscar trabajos extras, para conseguir una peque�a bonificacion, los trabajos son muy facil de encontrar");
				SendClientMessage(playerid, BLANCO, "solo debes recurrir a un miembro de SA:GOB y el te dara trabajos legales");
				SendClientMessage(playerid, BLANCO, "si los quieres ilegales debes buscarlos por toda la ciudad, pero recuerda que son ilegales");
				SendClientMessage(playerid, BLANCO, "si te pillan mientras trabajas seras arrestado por algun policia que este en la zona");
			}
			if(listitem == 2)
			{
				SendClientMessage(playerid, DORADO, "-= Comandos =-");
				SendClientMessage(playerid, BLANCO, "Nuestro servidor cuenta con todos los comandos desarrollados desde cero y totalmente en espa�ol para que usted pueda Comandorlos de forma correcta y apropiada");
				SendClientMessage(playerid, BLANCO, "si algun comando que encuentres tenga una falla debes reportarla Comandondo el comando /bug, si abusas con algun comando fallado y que te de beneficios personales hacia tu jugador");
				SendClientMessage(playerid, BLANCO, "arriesgas tu entrada al servidor, podras ser kickeado y advertido, incluso baneado de IP y tu cuenta sera bloqueada");
			}
			if(listitem == 3)
			{
				SendClientMessage(playerid, DORADO, "-= Staff =-");
				SendClientMessage(playerid, BLANCO, "Nuestro staff se encargara que no hallan usuarios rompiendo reglas internas o utilizen alguna trampa (Hacks/Cheats) dentro del servidor.");
				SendClientMessage(playerid, BLANCO, "Recuerda que si ves algun Anti-RPG o un Cheat/Hacks puedes reportarlos presionando el boton TAB y hacer doble click en el nombre del usuario infractor.");
				SendClientMessage(playerid, BLANCO, "Tu reporte quedara totalmente anonima y nadie excepto los administradores podra saber quien reporto al infractor.");
			}
			if(listitem == 4)
			{
				SendClientMessage(playerid, DORADO, "-= Vehiculos =-");
				SendClientMessage(playerid, BLANCO, "�Sabias que puedes ser propietario de tu propio coche?, el servidor incluye un sistema de venta de vehiculos via faccion");
				SendClientMessage(playerid, BLANCO, "solo debes contactar a un miembro de SA:GOB y el te vendera el vehiculo que quieras.");
				SendClientMessage(playerid, BLANCO, "y hacer lo que quieras con el, tambien puedes participar en eventos de la SA:TV como alguna carrera legal");
				SendClientMessage(playerid, BLANCO, "tambien puedes encontrar grupos de corredores ilegales que apuestan su dinero.");
			}
			if(listitem == 5)
			{
				SendClientMessage(playerid, DORADO, "-= Propiedades =-");
				SendClientMessage(playerid, BLANCO, "�Tambien sabias que puedes comprar casas?, el servidor tiene un total de 300 casas diferentes");
				SendClientMessage(playerid, BLANCO, "debes pararte en la puerta de la casa que quieres y Comandor /comprarcasa para adquirirla,");
				SendClientMessage(playerid, BLANCO, "recuerda que las casas te consumen dinero, solo debes pagar sus facturas de electricidad.");
				SendClientMessage(playerid, BLANCO, "Puedes abrir negocios dentro de tu casa, venta ilegal de drogas, herramientas o armas");
				SendClientMessage(playerid, BLANCO, "Si tu cuenta esta en modo PREMIUM, puedes adquirir Kits de decoracion para tu casa");
				SendClientMessage(playerid, BLANCO, "el ensablado demora entre 10 o 11 horas, pero tu casa obtiene muchas mejoras a tu gusto");
			}
			if(listitem == 6)
			{
				SendClientMessage(playerid, DORADO, "-= Objetos =-");
				SendClientMessage(playerid, BLANCO, "Puedes adquirir elementos para tu cuenta como drogas, armas, herramientas, bombas hasta preservativos");
				SendClientMessage(playerid, BLANCO, "Solo debes conseguir la forma de obtenerlos, Drogas: LCD, Crack, Marighuana, Cocaina, Opio");
			}
			if(listitem == 7)
			{
				SendClientMessage(playerid, DORADO, "-= Proximamente =-");
				SendClientMessage(playerid, BLANCO, "�Sabias que puedes colaborar con el servidor?, si te gusta el servidor y quieres que mejore mucho");
				SendClientMessage(playerid, BLANCO, "Puedes aportarnos ideas, cualquier cosa es posible, solo debes contactar con nuestro progamador");
			}
		}
	}
	if(dialogid == Multa)
	{
		new string[256];
	    if(response)
	    {
			format(string, sizeof(string), "* Has pagado la multa de $%d al oficial %s", PrecioMulta[playerid], NombreEx(EmisorMulta[playerid]));
			SendClientMessage(playerid, VERDE, string);
			format(string, sizeof(string), "* %s ha pagado tu ticket de $%d.", NombreEx(playerid), PrecioMulta[playerid]);
			SendClientMessage(EmisorMulta[playerid], VERDE, string);
			GivePlayerMoney(playerid, -PrecioMulta[playerid]);
			CajaGobierno += PrecioMulta[playerid];
			EmisorMulta[playerid] = 999;
			PrecioMulta[playerid] = 0;
		}
		else
		{
			format(string, sizeof(string), "* Has ignorado la multa, corre o tendras lios!", PrecioMulta[playerid], NombreEx(EmisorMulta[playerid]));
			SendClientMessage(playerid, GRIS, string);
			format(string, sizeof(string), "* %s ha ignorado la multa, es un figitivo!", NombreEx(playerid));
			SendClientMessage(EmisorMulta[playerid], VERDE, string);
			format(string, sizeof(string), "* %s escupe la multa, la rompe a la mitad y se la tira a %s en la cara", NombreEx(playerid), NombreEx(EmisorMulta[playerid]));
			RangoCercano(10, playerid, string, VIOLETA, VIOLETA, VIOLETA, VIOLETA, VIOLETA);
			EmisorMulta[playerid] = 999;
			PrecioMulta[playerid] = 0;
		}
	}
	if(dialogid == TRol)
	{
	    if(response)
	    {
	        if(listitem == 0)
	        {
			    SendClientMessage(playerid, VERDE, "�Has respondido correctamente la pregunta!");
				ShowPlayerDialog(playerid, TRol2, DIALOG_STYLE_LIST, "{FEB800}[2/10]: {FFFFFF}�Qu� es RevengeKill?","1| Insultar a alguien usando canales OOC\n2| Repetir muchas veces seguida la misma palabra\n3| Matar a alguien que te halla matado por venganza","Seleccionar","");
				PlayerPlaySound(playerid, 1139, 0.0, 0.0, 0.0);
				Informacion[playerid][TestRol] += 1;
			}
			if(listitem == 1)
			{
			    SendClientMessage(playerid, ROJO, "�La respuesta seleccionada no es correcta!");
				ShowPlayerDialog(playerid, TRol2, DIALOG_STYLE_LIST, "{FEB800}[2/10]: {FFFFFF}�Qu� es RevengeKill?","1| Insultar a alguien usando canales OOC\n2| Repetir muchas veces seguida la misma palabra\n3| Matar a alguien que te halla matado por venganza","Seleccionar","");
			}
			if(listitem == 2)
			{
			    SendClientMessage(playerid, ROJO, "�La respuesta seleccionada no es correcta!");
				ShowPlayerDialog(playerid, TRol2, DIALOG_STYLE_LIST, "{FEB800}[2/10]: {FFFFFF}�Qu� es RevengeKill?","1| Insultar a alguien usando canales OOC\n2| Repetir muchas veces seguida la misma palabra\n3| Matar a alguien que te halla matado por venganza","Seleccionar","");
			}
			if(listitem == 3)
			{
			    SendClientMessage(playerid, ROJO, "�La respuesta seleccionada no es correcta!");
				ShowPlayerDialog(playerid, TRol2, DIALOG_STYLE_LIST, "{FEB800}[2/10]: {FFFFFF}�Qu� es RevengeKill?","1| Insultar a alguien usando canales OOC\n2| Repetir muchas veces seguida la misma palabra\n3| Matar a alguien que te halla matado por venganza","Seleccionar","");
			}
		}
	}
	if(dialogid == TRol2)
	{
	    if(response)
	    {
	        if(listitem == 0)
	        {
	        	SendClientMessage(playerid, ROJO, "�La respuesta seleccionada no es correcta!");
				ShowPlayerDialog(playerid, TRol3, DIALOG_STYLE_LIST, "{FEB800}[3/10]: {FFFFFF}�Qu� arriesgas haciendo SPAM?","1| Recibes un Kick\n2| Recibes un Castigo\n3| Recibes un Baneo","Seleccionar","");
			}
			if(listitem == 1)
	        {
	        	SendClientMessage(playerid, ROJO, "�La respuesta seleccionada no es correcta!");
				ShowPlayerDialog(playerid, TRol3, DIALOG_STYLE_LIST, "{FEB800}[3/10]: {FFFFFF}�Qu� arriesgas haciendo SPAM?","1| Recibes un Kick\n2| Recibes un Castigo\n3| Recibes un Baneo","Seleccionar","");
			}
			if(listitem == 2)
	        {
	       	    SendClientMessage(playerid, VERDE, "�Has respondido correctamente la pregunta!");
				ShowPlayerDialog(playerid, TRol3, DIALOG_STYLE_LIST, "{FEB800}[3/10]: {FFFFFF}�Qu� arriesgas haciendo SPAM?","1| Recibes un Kick\n2| Recibes un Castigo\n3| Recibes un Baneo","Seleccionar","");
				PlayerPlaySound(playerid, 1139, 0.0, 0.0, 0.0);
				Informacion[playerid][TestRol] += 1;
			}
		}
	}
	if(dialogid == TRol3)
	{
	    if(response)
	    {
	        if(listitem == 0)
	        {
	        	SendClientMessage(playerid, ROJO, "�La respuesta seleccionada no es correcta!");
				ShowPlayerDialog(playerid, TRol4, DIALOG_STYLE_LIST, "{FEB800}[4/10]: {FFFFFF}�Cu�les son los comandos Comandodos para rolear?","1| /me - /do - /intentar\n2| /admins - /reportar - /bug\n3| /invitar - /desinvitar - /darrango","Seleccionar","");
			}
			if(listitem == 1)
	        {
	        	SendClientMessage(playerid, ROJO, "�La respuesta seleccionada no es correcta!");
				ShowPlayerDialog(playerid, TRol4, DIALOG_STYLE_LIST, "{FEB800}[4/10]: {FFFFFF}�Cu�les son los comandos Comandodos para rolear?","1| /me - /do - /intentar\n2| /admins - /reportar - /bug\n3| /invitar - /desinvitar - /darrango","Seleccionar","");
			}
			if(listitem == 2)
	        {
        	    SendClientMessage(playerid, VERDE, "�Has respondido correctamente la pregunta!");
				ShowPlayerDialog(playerid, TRol4, DIALOG_STYLE_LIST, "{FEB800}[4/10]: {FFFFFF}�Cu�les son los comandos Comandodos para rolear?","1| /me - /do - /intentar\n2| /admins - /reportar - /bug\n3| /invitar - /desinvitar - /darrango","Seleccionar","");
				Informacion[playerid][TestRol] += 1;
				PlayerPlaySound(playerid, 1139, 0.0, 0.0, 0.0);
			}
		}
	}
	if(dialogid == TRol4)
	{
	    if(response)
	    {
			if(listitem == 0)
	        {
        	    SendClientMessage(playerid, VERDE, "�Has respondido correctamente la pregunta!");
				ShowPlayerDialog(playerid, TRol5, DIALOG_STYLE_LIST, "{FEB800}[5/10]: {FFFFFF}�Qu� harias para ingresar a una faccion?","1| Me Postulo via FORO en la seccion correcta\n2| Pido que me den faccion a los administradores\n3| Insulto y Floodeo al lider hasta que se canse","Seleccionar","");
				Informacion[playerid][TestRol] += 1;
				PlayerPlaySound(playerid, 1139, 0.0, 0.0, 0.0);
		    }
			if(listitem == 1)
	        {
	        	SendClientMessage(playerid, ROJO, "�La respuesta seleccionada no es correcta!");
				ShowPlayerDialog(playerid, TRol5, DIALOG_STYLE_LIST, "{FEB800}[5/10]: {FFFFFF}�Qu� harias para ingresar a una faccion?","1| Me Postulo via FORO en la seccion correcta\n2| Pido que me den faccion a los administradores\n3| Insulto y Floodeo al lider hasta que se canse","Seleccionar","");
	        }
			if(listitem == 2)
	        {
 	        	SendClientMessage(playerid, ROJO, "�La respuesta seleccionada no es correcta!");
				ShowPlayerDialog(playerid, TRol5, DIALOG_STYLE_LIST, "{FEB800}[5/10]: {FFFFFF}�Qu� harias para ingresar a una faccion?","1| Me Postulo via FORO en la seccion correcta\n2| Pido que me den faccion a los administradores\n3| Insulto y Floodeo al lider hasta que se canse","Seleccionar","");
	        }
	    }
	}
	if(dialogid == TRol5)
	{
	    if(response)
	    {
			if(listitem == 0)
	        {
        	    SendClientMessage(playerid, VERDE, "�Has respondido correctamente la pregunta!");
				ShowPlayerDialog(playerid, TRol6, DIALOG_STYLE_LIST, "{FEB800}[6/10]: {FFFFFF}�y si quiero pertenecer al staff?","1| Demuestro que soy buen rolero y me postulo en el foro\n2| Floodeo y alcahueteo al due�o del servidor","Seleccionar","");
				Informacion[playerid][TestRol] += 1;
				PlayerPlaySound(playerid, 1139, 0.0, 0.0, 0.0);
			}
			if(listitem == 1)
	        {
	        	SendClientMessage(playerid, ROJO, "�La respuesta seleccionada no es correcta!");
				ShowPlayerDialog(playerid, TRol6, DIALOG_STYLE_LIST, "{FEB800}[6/10]: {FFFFFF}�y si quiero pertenecer al staff?","1| Demuestro que soy buen rolero y me postulo en el foro\n2| Floodeo y alcahueteo al due�o del servidor","Seleccionar","");
	        }
			if(listitem == 2)
	        {
 	        	SendClientMessage(playerid, ROJO, "�La respuesta seleccionada no es correcta!");
				ShowPlayerDialog(playerid, TRol6, DIALOG_STYLE_LIST, "{FEB800}[6/10]: {FFFFFF}�y si quiero pertenecer al staff?","1| Demuestro que soy buen rolero y me postulo en el foro\n2| Floodeo y alcahueteo al due�o del servidor","Seleccionar","");
	        }
	    }
	}
	if(dialogid == TRol6)
	{
	    if(response)
	    {
			if(listitem == 0)
	        {
        	    SendClientMessage(playerid, VERDE, "�Has respondido correctamente la pregunta!");
				ShowPlayerDialog(playerid, TRol7, DIALOG_STYLE_LIST, "{FEB800}[7/10]: {FFFFFF}�Que es el CarJacking?","1| Saltar arriba de los coches\n2| Robar los coches sin rol","Seleccionar","");
				Informacion[playerid][TestRol] += 1;
				PlayerPlaySound(playerid, 1139, 0.0, 0.0, 0.0);
		    }
			if(listitem == 1)
	        {
	        	SendClientMessage(playerid, ROJO, "�La respuesta seleccionada no es correcta!");
				ShowPlayerDialog(playerid, TRol7, DIALOG_STYLE_LIST, "{FEB800}[7/10]: {FFFFFF}�Que es el CarJacking?","1| Saltar arriba de los coches\n2| Robar los coches sin rol","Seleccionar","");
	        }
			if(listitem == 2)
	        {
 	        	SendClientMessage(playerid, ROJO, "�La respuesta seleccionada no es correcta!");
				ShowPlayerDialog(playerid, TRol7, DIALOG_STYLE_LIST, "{FEB800}[7/10]: {FFFFFF}�Que es el CarJacking?","1| Saltar arriba de los coches\n2| Robar los coches sin rol","Seleccionar","");
	        }
	    }
	}
	if(dialogid == TRol7)
	{
	    if(response)
	    {
			if(listitem == 0)
	        {
 	        	SendClientMessage(playerid, ROJO, "�La respuesta seleccionada no es correcta!");
				ShowPlayerDialog(playerid, TRol8, DIALOG_STYLE_LIST, "{FEB800}[8/10]: {FFFFFF}�Qu� es el metagaming?","1| Comandor canales IC y decirlos OOC\n2| Comandor canales IC para decir cosas OOC\n3| Comandor canales OOC para Comandorlos OOC","Seleccionar","");
	        }
			if(listitem == 1)
	        {
        	    SendClientMessage(playerid, VERDE, "�Has respondido correctamente la pregunta!");
				ShowPlayerDialog(playerid, TRol8, DIALOG_STYLE_LIST, "{FEB800}[8/10]: {FFFFFF}�Qu� es el metagaming?","1| Comandor canales IC y decirlos OOC\n2| Comandor canales IC para decir cosas OOC\n3| Comandor canales OOC para Comandorlos OOC","Seleccionar","");
				Informacion[playerid][TestRol] += 1;
				PlayerPlaySound(playerid, 1139, 0.0, 0.0, 0.0);
		    }
	    }
	}
	if(dialogid == TRol8)
	{
	    if(response)
	    {
			if(listitem == 0)
	        {
 	        	SendClientMessage(playerid, ROJO, "�La respuesta seleccionada no es correcta!");
				ShowPlayerDialog(playerid, TRol9, DIALOG_STYLE_LIST, "{FEB800}[9/10]: {FFFFFF}�Qu� es el TrainKill?","1| Matar a alguien aplastandolo con el coche\n2| Una forma de Deathmatch, Comandondo el tren como arma","Seleccionar","");
	        }
			if(listitem == 1)
	        {
        	    SendClientMessage(playerid, VERDE, "�Has respondido correctamente la pregunta!");
				ShowPlayerDialog(playerid, TRol9, DIALOG_STYLE_LIST, "{FEB800}[9/10]: {FFFFFF}�Qu� es el TrainKill?","1| Matar a alguien aplastandolo con el coche\n2| Una forma de Deathmatch, Comandondo el tren como arma","Seleccionar","");
				Informacion[playerid][TestRol] += 1;
				PlayerPlaySound(playerid, 1139, 0.0, 0.0, 0.0);
		    }
			if(listitem == 2)
	        {
 	        	SendClientMessage(playerid, ROJO, "�La respuesta seleccionada no es correcta!");
				ShowPlayerDialog(playerid, TRol9, DIALOG_STYLE_LIST, "{FEB800}[9/10]: {FFFFFF}�Qu� es el TrainKill?","1| Matar a alguien aplastandolo con el coche\n2| Una forma de Deathmatch, Comandondo el tren como arma","Seleccionar","");
	        }
	    }
	}
	if(dialogid == TRol9)
	{
	    if(response)
	    {
			if(listitem == 0)
	        {
 	        	SendClientMessage(playerid, ROJO, "�La respuesta seleccionada no es correcta!");
				ShowPlayerDialog(playerid, TRol10, DIALOG_STYLE_LIST, "{FEB800}[10/10]: {FFFFFF}�Que es el Flood?","1| Repetir la misma palabra mas de 3 veces en un corto tiempo\n2| Saltar sobre las casas y coches de la gente","Seleccionar","");
	        }
			if(listitem == 1)
	        {
        	    SendClientMessage(playerid, VERDE, "�Has respondido correctamente la pregunta!");
				ShowPlayerDialog(playerid, TRol10, DIALOG_STYLE_LIST, "{FEB800}[10/10]: {FFFFFF}�Que es el Flood?","1| Repetir la misma palabra mas de 3 veces en un corto tiempo\n2| Saltar sobre las casas y coches de la gente","Seleccionar","");
				Informacion[playerid][TestRol] += 1;
				PlayerPlaySound(playerid, 1139, 0.0, 0.0, 0.0);
		    }
	    }
	}
	if(dialogid == TRol10)
	{
	    if(response)
	    {
			if(listitem == 0)
	        {
        	    SendClientMessage(playerid, VERDE, "�Has respondido correctamente la pregunta!");
				SendClientMessage(playerid, BLANCO, "Ahora vamos a calificar tu rol dependiendo de las respuestas que hallas respondido");
				Informacion[playerid][TestRol] += 1;
				SetTimerEx("ProcesandoRol", 5000, false, "iid", playerid);
				PlayerPlaySound(playerid, 1139, 0.0, 0.0, 0.0);
		    }
			if(listitem == 1)
	        {
			 	SendClientMessage(playerid, ROJO, "�La respuesta seleccionada no es correcta!");
				SendClientMessage(playerid, BLANCO, "Ahora vamos a calificar tu rol dependiendo de las respuestas que hallas respondido");
				SetTimerEx("ProcesandoRol", 5000, false, "iid", playerid);
			}
	    }
	}
	if(dialogid == SEXO)
	{
	    if(response)
	    {
			Informacion[playerid][Sexo] = 1;
			SetPlayerSkin(playerid, 26);
			Informacion[playerid][Skin] = 26;
			ShowPlayerDialog(playerid, EDAD, DIALOG_STYLE_INPUT, " ","{FEB800}Sexo seleccionado: {FFFFFF}Masculino\n{FFFFFF}�Cuantos a�os tienes?","Aceptar","");
			UsuariosMasculinos += 1;
		}
		else
		{
			Informacion[playerid][Sexo] = 2;
			SetPlayerSkin(playerid, 93);
			Informacion[playerid][Skin] = 93;
			ShowPlayerDialog(playerid, EDAD, DIALOG_STYLE_INPUT, " ","{FEB800}Sexo seleccionado: {FFFFFF}Femenino\n{FFFFFF}�Cuantos a�os tienes?","Aceptar","");
			UsuariosFemeninos += 1;
		}
	}
	if(dialogid == EDAD)
	{
  		new edad;
  		if(!strlen(inputtext)) return ShowPlayerDialog(playerid, EDAD, DIALOG_STYLE_INPUT, " ", "�Cuantos a�os tienes?", "Aceptar", "");
  		if(!response) return ShowPlayerDialog(playerid, EDAD, DIALOG_STYLE_INPUT, " ", "�Cuantos a�os tienes?", "Aceptar", "");
  		edad = strval(inputtext);
  		Informacion[playerid][Edad] = edad;
		ShowPlayerDialog(playerid, PERSONALIDAD, DIALOG_STYLE_LIST, "{FEB800}�Como es tu personalidad?","-| Reformador\n-| Ayudador\n-| Triunfador\n-| Individualista\n-| Investigador\n-| Leal\n-| Entusiasta\n-| Desafiante\n-| Pacifico","Seleccionar","");
	}
	if(dialogid == PERSONALIDAD)
	{
	    if(response)
	    {
	        if(listitem == 0)
	        {
	            Informacion[playerid][Personalidad] = 1;
	            ShowPlayerDialog(playerid, SIGNO, DIALOG_STYLE_LIST, "{FEB800}�Cual es tu signo?","-| Aries\n-| Tauro\n-| G�minis\n-| C�ncer\n-| Leo\n-| Virgo\n-| Libra\n-| Escorpio\n-| Sagitario\n-| Capricornio\n-| Acuario\n-| Piscis","Seleccionar","");
			}
	        if(listitem == 1)
	        {
	            Informacion[playerid][Personalidad] = 2;
	            ShowPlayerDialog(playerid, SIGNO, DIALOG_STYLE_LIST, "{FEB800}�Cual es tu signo?","-| Aries\n-| Tauro\n-| G�minis\n-| C�ncer\n-| Leo\n-| Virgo\n-| Libra\n-| Escorpio\n-| Sagitario\n-| Capricornio\n-| Acuario\n-| Piscis","Seleccionar","");
			}
	        if(listitem == 2)
	        {
	            Informacion[playerid][Personalidad] = 3;
	            ShowPlayerDialog(playerid, SIGNO, DIALOG_STYLE_LIST, "{FEB800}�Cual es tu signo?","-| Aries\n-| Tauro\n-| G�minis\n-| C�ncer\n-| Leo\n-| Virgo\n-| Libra\n-| Escorpio\n-| Sagitario\n-| Capricornio\n-| Acuario\n-| Piscis","Seleccionar","");
			}
	        if(listitem == 3)
	        {
	            Informacion[playerid][Personalidad] = 4;
	            ShowPlayerDialog(playerid, SIGNO, DIALOG_STYLE_LIST, "{FEB800}�Cual es tu signo?","-| Aries\n-| Tauro\n-| G�minis\n-| C�ncer\n-| Leo\n-| Virgo\n-| Libra\n-| Escorpio\n-| Sagitario\n-| Capricornio\n-| Acuario\n-| Piscis","Seleccionar","");
			}
	        if(listitem == 4)
	        {
	            Informacion[playerid][Personalidad] = 5;
	            ShowPlayerDialog(playerid, SIGNO, DIALOG_STYLE_LIST, "{FEB800}�Cual es tu signo?","-| Aries\n-| Tauro\n-| G�minis\n-| C�ncer\n-| Leo\n-| Virgo\n-| Libra\n-| Escorpio\n-| Sagitario\n-| Capricornio\n-| Acuario\n-| Piscis","Seleccionar","");
			}
	        if(listitem == 5)
	        {
	            Informacion[playerid][Personalidad] = 6;
	            ShowPlayerDialog(playerid, SIGNO, DIALOG_STYLE_LIST, "{FEB800}�Cual es tu signo?","-| Aries\n-| Tauro\n-| G�minis\n-| C�ncer\n-| Leo\n-| Virgo\n-| Libra\n-| Escorpio\n-| Sagitario\n-| Capricornio\n-| Acuario\n-| Piscis","Seleccionar","");
			}
	        if(listitem == 6)
	        {
	            Informacion[playerid][Personalidad] = 7;
	            ShowPlayerDialog(playerid, SIGNO, DIALOG_STYLE_LIST, "{FEB800}�Cual es tu signo?","-| Aries\n-| Tauro\n-| G�minis\n-| C�ncer\n-| Leo\n-| Virgo\n-| Libra\n-| Escorpio\n-| Sagitario\n-| Capricornio\n-| Acuario\n-| Piscis","Seleccionar","");
			}
	        if(listitem == 7)
	        {
	            Informacion[playerid][Personalidad] = 8;
	            ShowPlayerDialog(playerid, SIGNO, DIALOG_STYLE_LIST, "{FEB800}�Cual es tu signo?","-| Aries\n-| Tauro\n-| G�minis\n-| C�ncer\n-| Leo\n-| Virgo\n-| Libra\n-| Escorpio\n-| Sagitario\n-| Capricornio\n-| Acuario\n-| Piscis","Seleccionar","");
			}
	        if(listitem == 8)
	        {
	            Informacion[playerid][Personalidad] = 9;
	            ShowPlayerDialog(playerid, SIGNO, DIALOG_STYLE_LIST, "{FEB800}�Cual es tu signo?","-| Aries\n-| Tauro\n-| G�minis\n-| C�ncer\n-| Leo\n-| Virgo\n-| Libra\n-| Escorpio\n-| Sagitario\n-| Capricornio\n-| Acuario\n-| Piscis","Seleccionar","");
			}
		}
	}
	if(dialogid == SIGNO)
	{
	    if(response)
	    {
	        if(listitem == 0)
	        {
		        Informacion[playerid][Signo] = 1;
				ShowPlayerDialog(playerid, ORIGEN, DIALOG_STYLE_LIST, "{FEB800}�De d�nde eres originario?","-| Los Santos\n-| San Fierro\n-| Las Venturas","Seleccionar", "");
			}
	        if(listitem == 1)
	        {
		        Informacion[playerid][Signo] = 2;
				ShowPlayerDialog(playerid, ORIGEN, DIALOG_STYLE_LIST, "{FEB800}�De d�nde eres originario?","-| Los Santos\n-| San Fierro\n-| Las Venturas","Seleccionar", "");
			}
	        if(listitem == 2)
	        {
			    Informacion[playerid][Signo] = 3;
				ShowPlayerDialog(playerid, ORIGEN, DIALOG_STYLE_LIST, "{FEB800}�De d�nde eres originario?","-| Los Santos\n-| San Fierro\n-| Las Venturas","Seleccionar", "");
			}
	        if(listitem == 3)
			{
				Informacion[playerid][Signo] = 4;
				ShowPlayerDialog(playerid, ORIGEN, DIALOG_STYLE_LIST, "{FEB800}�De d�nde eres originario?","-| Los Santos\n-| San Fierro\n-| Las Venturas","Seleccionar", "");
			}
	        if(listitem == 4)
	        {
		        Informacion[playerid][Signo] = 5;
				ShowPlayerDialog(playerid, ORIGEN, DIALOG_STYLE_LIST, "{FEB800}�De d�nde eres originario?","-| Los Santos\n-| San Fierro\n-| Las Venturas","Seleccionar", "");
			}
	        if(listitem == 5)
	        {
			    Informacion[playerid][Signo] = 6;
				ShowPlayerDialog(playerid, ORIGEN, DIALOG_STYLE_LIST, "{FEB800}�De d�nde eres originario?","-| Los Santos\n-| San Fierro\n-| Las Venturas","Seleccionar", "");
			}
	        if(listitem == 6)
	        {
		        Informacion[playerid][Signo] = 7;
				ShowPlayerDialog(playerid, ORIGEN, DIALOG_STYLE_LIST, "{FEB800}�De d�nde eres originario?","-| Los Santos\n-| San Fierro\n-| Las Venturas","Seleccionar", "");
			}
	        if(listitem == 7)
	        {
		        Informacion[playerid][Signo] = 8;
				ShowPlayerDialog(playerid, ORIGEN, DIALOG_STYLE_LIST, "{FEB800}�De d�nde eres originario?","-| Los Santos\n-| San Fierro\n-| Las Venturas","Seleccionar", "");
			}
	        if(listitem == 8)
	        {
		        Informacion[playerid][Signo] = 9;
				ShowPlayerDialog(playerid, ORIGEN, DIALOG_STYLE_LIST, "{FEB800}�De d�nde eres originario?","-| Los Santos\n-| San Fierro\n-| Las Venturas","Seleccionar", "");
			}
	        if(listitem == 9)
	        {
			    Informacion[playerid][Signo] = 10;
				ShowPlayerDialog(playerid, ORIGEN, DIALOG_STYLE_LIST, "{FEB800}�De d�nde eres originario?","-| Los Santos\n-| San Fierro\n-| Las Venturas","Seleccionar", "");
			}
			if(listitem == 10)
	        {
		        Informacion[playerid][Signo] = 11;
				ShowPlayerDialog(playerid, ORIGEN, DIALOG_STYLE_LIST, "{FEB800}�De d�nde eres originario?","-| Los Santos\n-| San Fierro\n-| Las Venturas","Seleccionar", "");
			}
	        if(listitem == 11)
	        {
			    Informacion[playerid][Signo] = 12;
				ShowPlayerDialog(playerid, ORIGEN, DIALOG_STYLE_LIST, "{FEB800}�De d�nde eres originario?","-| Los Santos\n-| San Fierro\n-| Las Venturas","Seleccionar", "");
			}
		}
	}
	if(dialogid == ORIGEN)
	{
	    if(response)
	    {
	        if(listitem == 0)
	        {
		        Informacion[playerid][Origen] = 1;
				ShowPlayerDialog(playerid, MSN, DIALOG_STYLE_INPUT, " ", "{FFFFFF}Porfavor, escriba su direcci�n de email en el siguiente recuadro;","Proceder","");
				UsuariosLS += 1;
			}
	        if(listitem == 1)
	        {
		        Informacion[playerid][Origen] = 2;
				ShowPlayerDialog(playerid, MSN, DIALOG_STYLE_INPUT, " ", "{FFFFFF}Porfavor, escriba su direcci�n de email en el siguiente recuadro;","Proceder","");
				UsuariosSF += 1;
			}
	        if(listitem == 2)
	        {
		        Informacion[playerid][Origen] = 3;
				ShowPlayerDialog(playerid, MSN, DIALOG_STYLE_INPUT, " ", "{FFFFFF}Porfavor, escriba su direcci�n de email en el siguiente recuadro;","Proceder","");
				UsuariosLV += 1;
			}
		}
	}
	if(dialogid == MSN)
	{
		if(response)
		{
		    if(!strlen(inputtext)) return ShowPlayerDialog(playerid, MSN, DIALOG_STYLE_INPUT, " ", "{FFFFFF}Porfabor, escribe tu MSN OOC dentro del siguiente cuadro","Seleccionar","");
		    new nombrejugador[MAX_PLAYER_NAME], archivo[256];
		    GetPlayerName(playerid, nombrejugador, sizeof(nombrejugador));
      		format(archivo, sizeof(archivo), "/Res/Userdata/%s.ini", nombrejugador);
	        if(dini_Exists(archivo))
	        {
		       	dini_Set(archivo, "MSN", inputtext);
			}
			ShowPlayerDialog(playerid, AFICION, DIALOG_STYLE_LIST, "{FEB800}�C�al es tu aficion?","-| Negocios\n-| Legales\n-| Crimen\n-| Medicina\n-| Television","Seleccionar","");
			return true;
	    }
	    else
	    {
	        ShowPlayerDialog(playerid, MSN, DIALOG_STYLE_INPUT, "", "{FFFFFF}Porfavor, escriba su direcci�n de email en el siguiente recuadro\nEjemplo: nick@hotmail.com","Seleccionar","");
			return false;
		}
	}
	if(dialogid == AFICION)
	{
	    if(response)
	    {
	        if(listitem == 0)
	        {
		        Informacion[playerid][Aficion] = 1;
				SendClientMessage(playerid, VERDE, "�Registro completado con exito!, ahora procederas a ver un corto tutorial");
				TimerTutorial[playerid] = 1;
			}
	        if(listitem == 1)
	        {
		        Informacion[playerid][Aficion] = 2;
				SendClientMessage(playerid, VERDE, "�Registro completado con exito!, ahora procederas a ver un corto tutorial");
				TimerTutorial[playerid] = 1;
			}
	        if(listitem == 2)
	        {
		        Informacion[playerid][Aficion] = 3;
				SendClientMessage(playerid, VERDE, "�Registro completado con exito!, ahora procederas a ver un corto tutorial");
				TimerTutorial[playerid] = 1;
			}
	        if(listitem == 4)
	        {
		        Informacion[playerid][Aficion] = 3;
				SendClientMessage(playerid, VERDE, "�Registro completado con exito!, ahora procederas a ver un corto tutorial");
				TimerTutorial[playerid] = 1;
			}
		}
	}
	return 1;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	new vehiculo = GetPlayerVehicleID(playerid);
  	if(PRESSED(KEY_FIRE))
    {
        if(Informacion[playerid][Faccion] == SAMD)
		{
			CheckFire(playerid);
			return 1;
		}
	}
	if(IsPlayerInAnyVehicle(playerid))
    {
	    if(HOLDING(KEY_SUBMISSION))
	    {
	        if(encendiendo[vehiculo] == 0 && VArrancado[GetPlayerVehicleID(playerid)] == 0)
	        {
		        encendiendo[vehiculo] = 1;
			 	SetProgressBarValue(CarMotor[playerid], Motor[playerid]);
		 		SetProgressBarMaxValue(CarMotor[playerid], 100);
				ShowProgressBarForPlayer(playerid, CarMotor[playerid]);
				TextDrawShowForPlayer(playerid, Motor_Box);
				TextDrawShowForPlayer(playerid, Motor_Titulo);
			}
	        if(encendiendo[vehiculo] == 1 && VArrancado[GetPlayerVehicleID(playerid)] == 0)
	        {
		   		if (Motor[playerid] == 0)
				{
				    new s[256];
					MotorS[playerid] = SetTimerEx("ArrancandoV", 30, true, "d", playerid);
					format(s, sizeof(s), "* %s gira la llave del veh�culo e intenta encender su motor.", NombreEx(playerid));
					RangoCercano(10, playerid, s, VIOLETA, VIOLETA, VIOLETA, VIOLETA, VIOLETA);
					PlayerPlaySound(playerid, 1135, 0.0, 0.0, 0.0);
				}
			}
	    }
	    if((oldkeys & KEY_SUBMISSION) && !(newkeys & KEY_SUBMISSION))
	    {
			GetVehicleParamsEx(vehiculo, engine, lights, alarm, doors, bonnet, boot, objective);
			if(engine == VEHICLE_PARAMS_OFF || VEHICLE_PARAMS_UNSET)
			{
			    if(encendiendo[vehiculo] == 1 && VArrancado[GetPlayerVehicleID(playerid)] == 0)
			    {
					PlayerPlaySound(playerid, 1135, 0.0, 0.0, 0.0);
			  		SendClientMessage(playerid, BLANCO, "Ha fallado el arranque del motor");
		  			SetVehicleParamsEx(vehiculo, VEHICLE_PARAMS_OFF, lights, alarm, doors, bonnet, boot, objective);
					encendiendo[vehiculo] = 0;
					Motor[playerid]	= 0;
					SetProgressBarValue(CarMotor[playerid], Motor[playerid]);
					HideProgressBarForPlayer(playerid, CarMotor[playerid]);
					VArrancado[GetPlayerVehicleID(playerid)] = 0;
					TextDrawHideForPlayer(playerid, Motor_Box);
					TextDrawHideForPlayer(playerid, Motor_Titulo);
					KillTimer(MotorS[playerid]);
				}
			}
	    }
	}
    if(newkeys & KEY_FIRE)
	{
		if(TazerMano[playerid] == 1)
		{
 			ApplyAnimation(playerid,"KNIFE","knife_3",4.1,0,1,1,0,0,1);
      		SetTimerEx("TiempoLimipiar", 2000, false, "d", playerid);
		    new victima = JugadoresCerca(playerid);
			if(IsPlayerConnected(victima))
	     	{
	    	   	if(DistanciaEntreDosJugadores(playerid, victima) < 2)
	            {
					new str[256];
	                format(str, sizeof(str), "* %s dispara su pistola electria en la espalda de %s", NombreEx(playerid), NombreEx(victima));
					RangoCercano(10, playerid, str, VIOLETA, VIOLETA, VIOLETA, VIOLETA, VIOLETA);
	                SetTimerEx("AnimacionCaido",300,false,"d",victima);
	                return 1;
 				}
			}
		}
  		return 1;
  	}
	if(newkeys == KEY_SECONDARY_ATTACK)
	{
		// -= Entradas =-
		if(IsPlayerInRangeOfPoint(playerid, 3, 1285.8928,-1349.8894,13.5678))
	    {
	        SetPlayerPos(playerid, 238.7139,139.5321,1003.0234); // - Presidencia de la Nacion (Principal)
			SetPlayerInterior(playerid, 3);
			Informacion[playerid][Interior] = 3;
			TextDrawShowForPlayer(playerid, Text:L_FONDO);
			TextDrawShowForPlayer(playerid, Text:L_TITULO);
			TextDrawShowForPlayer(playerid, Text:L_VERSION);
			TextDrawShowForPlayer(playerid, Text:L_CARGANDO);
			TogglePlayerControllable(playerid, CONGELADO);
			SetTimerEx("Unloading", 2000, false, "i", playerid);
	    }
		if(IsPlayerInRangeOfPoint(playerid, 3, 1310.8937,-1315.1736,35.6588))
	    {
	        SetPlayerPos(playerid, 288.7538,167.7373,1007.1719); // - Presidencia de la Nacion (Azotea)
			SetPlayerInterior(playerid, 3);
			Informacion[playerid][Interior] = 3;
			TextDrawShowForPlayer(playerid, Text:L_FONDO);
			TextDrawShowForPlayer(playerid, Text:L_TITULO);
			TextDrawShowForPlayer(playerid, Text:L_VERSION);
			TextDrawShowForPlayer(playerid, Text:L_CARGANDO);
			TogglePlayerControllable(playerid, CONGELADO);
			SetTimerEx("Unloading", 2000, false, "i", playerid);
	    }
		if(IsPlayerInRangeOfPoint(playerid, 3, 1480.8536,-1748.9911,15.3666))
	    {
	        SetPlayerPos(playerid, 389.6705,173.1553,1008.3828); // - Ayuntamiento
			SetPlayerInterior(playerid, 3);
			Informacion[playerid][Interior] = 3;
			TextDrawShowForPlayer(playerid, Text:L_FONDO);
			TextDrawShowForPlayer(playerid, Text:L_TITULO);
			TextDrawShowForPlayer(playerid, Text:L_VERSION);
			TextDrawShowForPlayer(playerid, Text:L_CARGANDO);
			TogglePlayerControllable(playerid, CONGELADO);
			SetTimerEx("Unloading", 2000, false, "i", playerid);
	    }
		if(IsPlayerInRangeOfPoint(playerid, 3, 1836.3481,-1682.4355,13.3517))
	    {
			if(GetPlayerMoney(playerid) < 50) { SendClientMessage(playerid, GRIS, "Lo siento, necesitas 50$ para pagar la entrada"); return 1; }
			SetPlayerPos(playerid, 493.4309,-24.3261,1000.6797); // - Discoteca
			SetPlayerInterior(playerid, 17);
			Informacion[playerid][Interior] = 17;
			TextDrawShowForPlayer(playerid, Text:L_FONDO);
			TextDrawShowForPlayer(playerid, Text:L_TITULO);
			TextDrawShowForPlayer(playerid, Text:L_VERSION);
			TextDrawShowForPlayer(playerid, Text:L_CARGANDO);
			TogglePlayerControllable(playerid, CONGELADO);
			SetTimerEx("Unloading", 2000, false, "i", playerid);
	    }
		if(IsPlayerInRangeOfPoint(playerid, 3, 2309.9385,-1643.6752,14.8270))
	    {
			if(GetPlayerMoney(playerid) < 15) { SendClientMessage(playerid, GRIS, "Lo siento, necesitas 15$ para pagar la entrada"); return 1; }
		    SetPlayerPos(playerid, 501.9595,-68.0340,998.7578); // - The Green Bottles
			SetPlayerInterior(playerid, 11);
			Informacion[playerid][Interior] = 11;
			TextDrawShowForPlayer(playerid, Text:L_FONDO);
			TextDrawShowForPlayer(playerid, Text:L_TITULO);
			TextDrawShowForPlayer(playerid, Text:L_VERSION);
			TextDrawShowForPlayer(playerid, Text:L_CARGANDO);
			TogglePlayerControllable(playerid, CONGELADO);
			SetTimerEx("Unloading", 2000, false, "i", playerid);
		}
		if(IsPlayerInRangeOfPoint(playerid, 3, 648.4557,-1356.7407,13.5670))
	    {
		    SetPlayerPos(playerid, 246.3645,108.1332,1003.2188); // - LSTV [Principal]
			SetPlayerInterior(playerid, 10);
			Informacion[playerid][Interior] = 10;
			TextDrawShowForPlayer(playerid, Text:L_FONDO);
			TextDrawShowForPlayer(playerid, Text:L_TITULO);
			TextDrawShowForPlayer(playerid, Text:L_VERSION);
			TextDrawShowForPlayer(playerid, Text:L_CARGANDO);
			TogglePlayerControllable(playerid, CONGELADO);
			SetTimerEx("Unloading", 2000, false, "i", playerid);
		}
		if(IsPlayerInRangeOfPoint(playerid, 3, 733.3624,-1348.0914,13.5105))
	    {
			SetPlayerPos(playerid, 218.5256,126.1456,999.6924); // - LSTV [Garage]
			SetPlayerInterior(playerid, 10);
			Informacion[playerid][Interior] = 10;
			TextDrawShowForPlayer(playerid, Text:L_FONDO);
			TextDrawShowForPlayer(playerid, Text:L_TITULO);
			TextDrawShowForPlayer(playerid, Text:L_VERSION);
			TextDrawShowForPlayer(playerid, Text:L_CARGANDO);
			TogglePlayerControllable(playerid, CONGELADO);
			SetTimerEx("Unloading", 2000, false, "i", playerid);
		}
		if(IsPlayerInRangeOfPoint(playerid, 3, 953.9430,-1336.3042,13.5389))
	    {
			if(GetPlayerMoney(playerid) < 60) { SendClientMessage(playerid, GRIS, "Lo siento, necesitas 60$ para pagar la entrada"); return 1; }
			SetPlayerPos(playerid, -100.4243,-24.5154,1000.7188); // - Tienda Porno
			SetPlayerInterior(playerid, 3);
			Informacion[playerid][Interior] = 3;
			TextDrawShowForPlayer(playerid, Text:L_FONDO);
			TextDrawShowForPlayer(playerid, Text:L_TITULO);
			TextDrawShowForPlayer(playerid, Text:L_VERSION);
			TextDrawShowForPlayer(playerid, Text:L_CARGANDO);
			TogglePlayerControllable(playerid, CONGELADO);
			SetTimerEx("Unloading", 2000, false, "i", playerid);
	    }
   		if(IsPlayerInRangeOfPoint(playerid, 3, 810.9510,-1616.2068,13.5469))
	    {
	        SetPlayerPos(playerid, 363.3454,-74.9236,1001.5078); // - Burger Shot
			SetPlayerInterior(playerid, 10);
			Informacion[playerid][Interior] = 10;
			TextDrawShowForPlayer(playerid, Text:L_FONDO);
			TextDrawShowForPlayer(playerid, Text:L_TITULO);
			TextDrawShowForPlayer(playerid, Text:L_VERSION);
			TextDrawShowForPlayer(playerid, Text:L_CARGANDO);
			TogglePlayerControllable(playerid, CONGELADO);
			SetTimerEx("Unloading", 2000, false, "i", playerid);
	    }
		if(IsPlayerInRangeOfPoint(playerid, 3, 2104.3845,-1806.4637,13.5547))
	    {
	        SetPlayerPos(playerid, 372.2942,-133.1127,1001.4922); // - Pizza Stack
			SetPlayerInterior(playerid, 5);
			Informacion[playerid][Interior] = 5;
			TextDrawShowForPlayer(playerid, Text:L_FONDO);
			TextDrawShowForPlayer(playerid, Text:L_TITULO);
			TextDrawShowForPlayer(playerid, Text:L_VERSION);
			TextDrawShowForPlayer(playerid, Text:L_CARGANDO);
			TogglePlayerControllable(playerid, CONGELADO);
			SetTimerEx("Unloading", 2000, false, "i", playerid);
	    }
		if(IsPlayerInRangeOfPoint(playerid, 3, 1368.0337,-1279.7286,13.5469))
	    {
	        SetPlayerPos(playerid, 285.4373,-41.0108,1001.5156); // - Ammu-Nation
			SetPlayerInterior(playerid, 1);
			Informacion[playerid][Interior] = 1;
			TextDrawShowForPlayer(playerid, Text:L_FONDO);
			TextDrawShowForPlayer(playerid, Text:L_TITULO);
			TextDrawShowForPlayer(playerid, Text:L_VERSION);
			TextDrawShowForPlayer(playerid, Text:L_CARGANDO);
			TogglePlayerControllable(playerid, CONGELADO);
			SetTimerEx("Unloading", 2000, false, "i", playerid);
	    }
		if(IsPlayerInRangeOfPoint(playerid, 3, 2229.2268,-1721.9786,13.5680))
	    {
			if(GetPlayerMoney(playerid) < 70) { SendClientMessage(playerid, GRIS, "Lo siento, necesitas 70$ para pagar la entrada"); return 1; }
		    SetPlayerPos(playerid, 772.1720,-4.7048,1000.7286); // - Gantom Gim
			SetPlayerInterior(playerid, 5);
			Informacion[playerid][Interior] = 5;
			TextDrawShowForPlayer(playerid, Text:L_FONDO);
			TextDrawShowForPlayer(playerid, Text:L_TITULO);
			TextDrawShowForPlayer(playerid, Text:L_VERSION);
			TextDrawShowForPlayer(playerid, Text:L_CARGANDO);
			TogglePlayerControllable(playerid, CONGELADO);
			SetTimerEx("Unloading", 2000, false, "i", playerid);
		}
		if(IsPlayerInRangeOfPoint(playerid, 3, 1022.4944,-1121.7538,23.8718))
	    {
	        SetPlayerPos(playerid, 2018.5682,1017.8448,996.8750); // - Casino
			SetPlayerInterior(playerid, 10);
			Informacion[playerid][Interior] = 10;
			TextDrawShowForPlayer(playerid, Text:L_FONDO);
			TextDrawShowForPlayer(playerid, Text:L_TITULO);
			TextDrawShowForPlayer(playerid, Text:L_VERSION);
			TextDrawShowForPlayer(playerid, Text:L_CARGANDO);
			TogglePlayerControllable(playerid, CONGELADO);
			SetTimerEx("Unloading", 2000, false, "i", playerid);
	    }
		if(IsPlayerInRangeOfPoint(playerid, 3, 1028.5026,-1104.3176,23.8281))
	    {
	        SetPlayerPos(playerid, 1489.3328,-1721.7786,8.2106); // - Mercado Negro
			SetPlayerInterior(playerid, 0);
			Informacion[playerid][Interior] = 0;
			TextDrawShowForPlayer(playerid, Text:L_FONDO);
			TextDrawShowForPlayer(playerid, Text:L_TITULO);
			TextDrawShowForPlayer(playerid, Text:L_VERSION);
			TextDrawShowForPlayer(playerid, Text:L_CARGANDO);
			TogglePlayerControllable(playerid, CONGELADO);
			SetTimerEx("Unloading", 2000, false, "i", playerid);
	    }
		if(IsPlayerInRangeOfPoint(playerid, 3, 1497.1619,-1584.3033,13.8838))
	    {
	        SetPlayerPos(playerid, 1415.1652,-988.9828,1639.7843+1); // - Banco
			SetPlayerInterior(playerid, 1);
			Informacion[playerid][Interior] = 1;
			TextDrawShowForPlayer(playerid, Text:L_FONDO);
			TextDrawShowForPlayer(playerid, Text:L_TITULO);
			TextDrawShowForPlayer(playerid, Text:L_VERSION);
			TextDrawShowForPlayer(playerid, Text:L_CARGANDO);
			TogglePlayerControllable(playerid, CONGELADO);
			SetTimerEx("Unloading", 2000, false, "i", playerid);
		}
		if(IsPlayerInRangeOfPoint(playerid, 3, 1772.9438,-1655.1816,14.4278))
	    {
	        SetPlayerPos(playerid, -2027.4482,-104.3967,1035.1719); // - Licencieros
			SetPlayerInterior(playerid, 3);
			Informacion[playerid][Interior] = 3;
			TextDrawShowForPlayer(playerid, Text:L_FONDO);
			TextDrawShowForPlayer(playerid, Text:L_TITULO);
			TextDrawShowForPlayer(playerid, Text:L_VERSION);
			TextDrawShowForPlayer(playerid, Text:L_CARGANDO);
			TogglePlayerControllable(playerid, CONGELADO);
			SetTimerEx("Unloading", 2000, false, "i", playerid);
	    }
		if(IsPlayerInRangeOfPoint(playerid, 3, -2030.0032,-118.9545,1035.1719))
	    {
	        SetPlayerPos(playerid, -1994.2268,-63.2064,1028.9183); // - Licencieros 2
			SetPlayerInterior(playerid, 3);
			Informacion[playerid][Interior] = 3;
			TextDrawShowForPlayer(playerid, Text:L_FONDO);
			TextDrawShowForPlayer(playerid, Text:L_TITULO);
			TextDrawShowForPlayer(playerid, Text:L_VERSION);
			TextDrawShowForPlayer(playerid, Text:L_CARGANDO);
			TogglePlayerControllable(playerid, CONGELADO);
			SetTimerEx("Unloading", 2000, false, "i", playerid);
		}
		if(IsPlayerInRangeOfPoint(playerid, 3, -2030.0032,-118.9545,1035.1719))
	    {
	        SetPlayerPos(playerid, -1994.2268,-63.2064,1028.9183); // - Licencieros 2
			SetPlayerInterior(playerid, 3);
			Informacion[playerid][Interior] = 3;
			TextDrawShowForPlayer(playerid, Text:L_FONDO);
			TextDrawShowForPlayer(playerid, Text:L_TITULO);
			TextDrawShowForPlayer(playerid, Text:L_VERSION);
			TextDrawShowForPlayer(playerid, Text:L_CARGANDO);
			TogglePlayerControllable(playerid, CONGELADO);
			SetTimerEx("Unloading", 2000, false, "i", playerid);
	    }
		if(IsPlayerInRangeOfPoint(playerid, 3, 1172.6755,-1323.4456,15.4022))
	    {
	        SetPlayerPos(playerid, 367.0448,162.1540,1019.9844); // - Hospital
			SetPlayerInterior(playerid, 3);
			Informacion[playerid][Interior] = 3;
			TextDrawShowForPlayer(playerid, Text:L_FONDO);
			TextDrawShowForPlayer(playerid, Text:L_TITULO);
			TextDrawShowForPlayer(playerid, Text:L_VERSION);
			TextDrawShowForPlayer(playerid, Text:L_CARGANDO);
			TogglePlayerControllable(playerid, CONGELADO);
			SetTimerEx("Unloading", 2000, false, "i", playerid);
		}
		if(IsPlayerInRangeOfPoint(playerid, 3, 364.6920,186.1605,1019.9844))
	    {
	        SetPlayerPos(playerid, 309.9743,1855.3894,7.7266); // - Laboratorio
        	SetPlayerInterior(playerid, 0);
			Informacion[playerid][Interior] = 0;
			TextDrawShowForPlayer(playerid, Text:L_FONDO);
			TextDrawShowForPlayer(playerid, Text:L_TITULO);
			TextDrawShowForPlayer(playerid, Text:L_VERSION);
			TextDrawShowForPlayer(playerid, Text:L_CARGANDO);
			TogglePlayerControllable(playerid, CONGELADO);
			SetTimerEx("Unloading", 2000, false, "i", playerid);
	    }
		if(IsPlayerInRangeOfPoint(playerid, 3, 1161.7417,-1329.5791,31.4940))
	    {
	        SetPlayerPos(playerid, 268.7224,1864.7826,8.6094); // - Azotea ft Laboratorio
			SetPlayerInterior(playerid, 0);
			Informacion[playerid][Interior] = 0;
			TextDrawShowForPlayer(playerid, Text:L_FONDO);
			TextDrawShowForPlayer(playerid, Text:L_TITULO);
			TextDrawShowForPlayer(playerid, Text:L_VERSION);
			TextDrawShowForPlayer(playerid, Text:L_CARGANDO);
			TogglePlayerControllable(playerid, CONGELADO);
			SetTimerEx("Unloading", 2000, false, "i", playerid);
	    }
		if(IsPlayerInRangeOfPoint(playerid, 3, 1759.1277,-1894.0408,13.5558))
	    {
	        SetPlayerPos(playerid, 2523.3921,-1285.8868,1054.6406); // - Taxi 1
			SetPlayerInterior(playerid, 2);
			Informacion[playerid][Interior] = 2;
			TextDrawShowForPlayer(playerid, Text:L_FONDO);
			TextDrawShowForPlayer(playerid, Text:L_TITULO);
			TextDrawShowForPlayer(playerid, Text:L_VERSION);
			TextDrawShowForPlayer(playerid, Text:L_CARGANDO);
			TogglePlayerControllable(playerid, CONGELADO);
			SetTimerEx("Unloading", 2000, false, "i", playerid);
	    }
		if(IsPlayerInRangeOfPoint(playerid, 3, 2537.5044,-1297.3079,1054.6406))
	    {
	        SetPlayerPos(playerid, 2542.8289,-1300.3031,1062.7042); // - Taxi 2
			SetPlayerInterior(playerid, 2);
			Informacion[playerid][Interior] = 2;
			TextDrawShowForPlayer(playerid, Text:L_FONDO);
			TextDrawShowForPlayer(playerid, Text:L_TITULO);
			TextDrawShowForPlayer(playerid, Text:L_VERSION);
			TextDrawShowForPlayer(playerid, Text:L_CARGANDO);
			TogglePlayerControllable(playerid, CONGELADO);
			SetTimerEx("Unloading", 2000, false, "i", playerid);
		}
		if(IsPlayerInRangeOfPoint(playerid, 3, 2851.7549,-1532.7988,11.0938))
	    {
			if(GetPlayerMoney(playerid) < 100) { SendClientMessage(playerid, GRIS, "Lo siento, necesitas 100$ para pagar la entrada"); return 1; }
			SetPlayerPos(playerid, -2636.6877,1402.9351,906.4609); // - Puticlub
			SetPlayerInterior(playerid, 3);
			Informacion[playerid][Interior] = 3;
			TextDrawShowForPlayer(playerid, Text:L_FONDO);
			TextDrawShowForPlayer(playerid, Text:L_TITULO);
			TextDrawShowForPlayer(playerid, Text:L_VERSION);
			TextDrawShowForPlayer(playerid, Text:L_CARGANDO);
			TogglePlayerControllable(playerid, CONGELADO);
			SetTimerEx("Unloading", 2000, false, "i", playerid);
	   	}
		if(IsPlayerInRangeOfPoint(playerid, 3, 1352.4213,-1758.7109,13.5078))
	    {
	        SetPlayerPos(playerid, -25.9507,-187.6105,1003.5469); // - 24/7 [1]
			SetPlayerInterior(playerid, 17);
			Informacion[playerid][Interior] = 17;
			TextDrawShowForPlayer(playerid, Text:L_FONDO);
			TextDrawShowForPlayer(playerid, Text:L_TITULO);
			TextDrawShowForPlayer(playerid, Text:L_VERSION);
			TextDrawShowForPlayer(playerid, Text:L_CARGANDO);
			TogglePlayerControllable(playerid, CONGELADO);
			SetTimerEx("Unloading", 2000, false, "i", playerid);
		}
		if(IsPlayerInRangeOfPoint(playerid, 3, 1833.1284,-1842.5874,13.5781))
	    {
	        SetPlayerPos(playerid, 6.1464,-30.7665,1003.5494); // - 24/7 [2]
			SetPlayerInterior(playerid, 10);
			Informacion[playerid][Interior] = 10;
			TextDrawShowForPlayer(playerid, Text:L_FONDO);
			TextDrawShowForPlayer(playerid, Text:L_TITULO);
			TextDrawShowForPlayer(playerid, Text:L_VERSION);
			TextDrawShowForPlayer(playerid, Text:L_CARGANDO);
			TogglePlayerControllable(playerid, CONGELADO);
			SetTimerEx("Unloading", 2000, false, "i", playerid);
	    }
		if(IsPlayerInRangeOfPoint(playerid, 3, 1315.5564,-898.5164,39.5781))
	    {
	        SetPlayerPos(playerid, -30.9129,-91.4246,1003.5469); // - 24/7 [3]
			SetPlayerInterior(playerid, 18);
			Informacion[playerid][Interior] = 18;
			TextDrawShowForPlayer(playerid, Text:L_FONDO);
			TextDrawShowForPlayer(playerid, Text:L_TITULO);
			TextDrawShowForPlayer(playerid, Text:L_VERSION);
			TextDrawShowForPlayer(playerid, Text:L_CARGANDO);
			TogglePlayerControllable(playerid, CONGELADO);
			SetTimerEx("Unloading", 2000, false, "i", playerid);
	    }
		if(IsPlayerInRangeOfPoint(playerid, 3, 1554.9537,-1675.6584,16.1953))
	    {
	        SetPlayerPos(playerid, 246.7079,66.2239,1003.6406); // - LSPD [Principal]
			SetPlayerInterior(playerid, 6);
			TextDrawShowForPlayer(playerid, Text:L_FONDO);
			TextDrawShowForPlayer(playerid, Text:L_TITULO);
			TextDrawShowForPlayer(playerid, Text:L_VERSION);
			TextDrawShowForPlayer(playerid, Text:L_CARGANDO);
			TogglePlayerControllable(playerid, CONGELADO);
			SetTimerEx("Unloading", 2000, false, "i", playerid);
	    }
		if(IsPlayerInRangeOfPoint(playerid, 3, 1564.8254,-1666.3079,28.3956))
	    {
	        SetPlayerPos(playerid, 258.1533,86.5789,1002.4453); // - LSPD [Azotea]
			SetPlayerInterior(playerid, 6);
			TextDrawShowForPlayer(playerid, Text:L_FONDO);
			TextDrawShowForPlayer(playerid, Text:L_TITULO);
			TextDrawShowForPlayer(playerid, Text:L_VERSION);
			TextDrawShowForPlayer(playerid, Text:L_CARGANDO);
			TogglePlayerControllable(playerid, CONGELADO);
			SetTimerEx("Unloading", 2000, false, "i", playerid);
	    }
		if(IsPlayerInRangeOfPoint(playerid, 3, 1568.6674,-1690.6655,5.8906))
	    {
	        SetPlayerPos(playerid, 258.1533,86.5789,1002.4453); // - LSPD [Garage]
			SetPlayerInterior(playerid, 6);
			TextDrawShowForPlayer(playerid, Text:L_FONDO);
			TextDrawShowForPlayer(playerid, Text:L_TITULO);
			TextDrawShowForPlayer(playerid, Text:L_VERSION);
			TextDrawShowForPlayer(playerid, Text:L_CARGANDO);
			TogglePlayerControllable(playerid, CONGELADO);
			SetTimerEx("Unloading", 2000, false, "i", playerid);
	    }
		// -= Salidas =-
		if(IsPlayerInRangeOfPoint(playerid, 3, 246.7079,66.2239,1003.6406))
	    {
	        SetPlayerPos(playerid, 1554.9537,-1675.6584,16.1953); // - LSPD [Principal]
			SetPlayerInterior(playerid, 0);
	    }
		if(IsPlayerInRangeOfPoint(playerid, 3, -2636.6877,1402.9351,906.4609))
	    {
	        SetPlayerPos(playerid, 2851.7549,-1532.7988,11.0938); // - Puticlub
			SetPlayerInterior(playerid, 0);
			Informacion[playerid][Interior] = 0;
	    }
		if(IsPlayerInRangeOfPoint(playerid, 3, 2523.3921,-1285.8868,1054.6406))
	    {
	        SetPlayerPos(playerid, 1759.1277,-1894.0408,13.5558); // - Taxi 1
			SetPlayerInterior(playerid, 0);
			Informacion[playerid][Interior] = 0;
	    }
		if(IsPlayerInRangeOfPoint(playerid, 3, 2542.8289,-1300.3031,1062.7042))
	    {
	        SetPlayerPos(playerid, 2537.5044,-1297.3079,1054.6406); // - Taxi 2
			SetPlayerInterior(playerid, 2);
			Informacion[playerid][Interior] = 2;
	    }
		if(IsPlayerInRangeOfPoint(playerid, 3, 268.7224,1864.7826,8.6094))
	    {
	        SetPlayerPos(playerid, 1161.7417,-1329.5791,31.4940); // - Azotea ft Laboratorio
			SetPlayerInterior(playerid, 0);
			Informacion[playerid][Interior] = 0;
		}
		if(IsPlayerInRangeOfPoint(playerid, 3, 367.0448,162.1540,1019.9844))
	    {
	        SetPlayerPos(playerid, 1172.6755,-1323.4456,15.4022); // - Hospital
			SetPlayerInterior(playerid, 0);
			Informacion[playerid][Interior] = 3;
		}
		if(IsPlayerInRangeOfPoint(playerid, 3, 309.9743,1855.3894,7.7266))
	    {
	        SetPlayerPos(playerid, 364.6920,186.1605,1019.9844); // - Laboratorio
        	SetPlayerInterior(playerid, 3);
			Informacion[playerid][Interior] = 3;
	    }
		if(IsPlayerInRangeOfPoint(playerid, 3, 493.4309,-24.3261,1000.6797))
	    {
	        SetPlayerPos(playerid, 1836.3481,-1682.4355,13.3517); // - Discoteca
			SetPlayerInterior(playerid, 0);
			Informacion[playerid][Interior] = 0;
	    }
		if(IsPlayerInRangeOfPoint(playerid, 3, 501.9595,-68.0340,998.7578))
	    {
	        SetPlayerPos(playerid, 2309.9385,-1643.6752,14.8270); // - The Green Bottles
			SetPlayerInterior(playerid, 0);
			Informacion[playerid][Interior] = 0;
		}
		if(IsPlayerInRangeOfPoint(playerid, 3, 246.3645,108.1332,1003.2188))
	    {
		    SetPlayerPos(playerid, 648.4557,-1356.7407,13.5670); // - LSTV [Principal]
			SetPlayerInterior(playerid, 0);
			Informacion[playerid][Interior] = 0;
	    }
		if(IsPlayerInRangeOfPoint(playerid, 3, 218.5256,126.1456,999.6924))
	    {
	        SetPlayerPos(playerid, 733.3624,-1348.0914,13.5105); // - LSTV [Garage]
			SetPlayerInterior(playerid, 0);
			Informacion[playerid][Interior] = 0;
	    }
		if(IsPlayerInRangeOfPoint(playerid, 3, -100.4243,-24.5154,1000.7188))
	    {
	        SetPlayerPos(playerid, 953.9430,-1336.3042,13.5389); // - Tienda Porno
			SetPlayerInterior(playerid, 0);
			Informacion[playerid][Interior] = 0;
	    }
		if(IsPlayerInRangeOfPoint(playerid, 3, 365.0107,-10.9408,1001.8516))
	    {
	        SetPlayerPos(playerid, 928.4583,-1353.0142,13.3438); // - Cluckin Bell
			SetPlayerInterior(playerid, 0);
			Informacion[playerid][Interior] = 0;
	    }
		if(IsPlayerInRangeOfPoint(playerid, 3, 363.3454,-74.9236,1001.5078))
	    {
	        SetPlayerPos(playerid, 810.9510,-1616.2068,13.5469); // - Burger Shot
			SetPlayerInterior(playerid, 0);
			Informacion[playerid][Interior] = 0;
	    }
		if(IsPlayerInRangeOfPoint(playerid, 3, 372.2942,-133.1127,1001.4922))
	    {
	        SetPlayerPos(playerid, 2104.3845,-1806.4637,13.5547); // - Pizza Stack
			SetPlayerInterior(playerid, 0);
			Informacion[playerid][Interior] = 0;
	    }
		if(IsPlayerInRangeOfPoint(playerid, 3, 285.4373,-41.0108,1001.5156))
	    {
	        SetPlayerPos(playerid, 1368.0337,-1279.7286,13.5469); // - Ammu-Nation
			SetPlayerInterior(playerid, 0);
			Informacion[playerid][Interior] = 0;
	    }
		if(IsPlayerInRangeOfPoint(playerid, 3, 772.1720,-4.7048,1000.7286))
	    {
	        SetPlayerPos(playerid, 2229.2268,-1721.9786,13.5680); // - Gantom Gim
			SetPlayerInterior(playerid, 0);
			Informacion[playerid][Interior] = 0;
	    }
		if(IsPlayerInRangeOfPoint(playerid, 3, -2027.4482,-104.3967,1035.1719))
	    {
	        SetPlayerPos(playerid, 1772.9438,-1655.1816,14.4278); // - Licencieros
			SetPlayerInterior(playerid, 0);
			Informacion[playerid][Interior] = 0;
	    }
		if(IsPlayerInRangeOfPoint(playerid, 3, -1994.2268,-63.2064,1028.9183))
	    {
	        SetPlayerPos(playerid, -2030.0032,-118.9545,1035.1719); // - Licencieros 2
			SetPlayerInterior(playerid, 3);
			Informacion[playerid][Interior] = 0;
	    }
		if(IsPlayerInRangeOfPoint(playerid, 3, 389.6705,173.1553,1008.3828))
	    {
	        SetPlayerPos(playerid, 1480.8536,-1748.9911,15.3666); // - Ayuntamiento [Principal]
			SetPlayerInterior(playerid, 0);
			Informacion[playerid][Interior] = 0;
	    }
		if(IsPlayerInRangeOfPoint(playerid, 3, 1415.1652,-988.9828,1639.7843))
	    {
	        SetPlayerPos(playerid, 1497.1619,-1584.3033,13.8838); // - Banco
			SetPlayerInterior(playerid, 0);
			Informacion[playerid][Interior] = 0;
	    }
		if(IsPlayerInRangeOfPoint(playerid, 3, 1489.3328,-1721.7786,8.2106))
	    {
	        SetPlayerPos(playerid, 1028.5026,-1104.3176,23.8281); // - Mercado Negro
			SetPlayerInterior(playerid, 0);
			Informacion[playerid][Interior] = 0;
	    }
		if(IsPlayerInRangeOfPoint(playerid, 3, 2018.5682,1017.8448,996.8750))
	    {
	        SetPlayerPos(playerid, 1022.4944,-1121.7538,23.8718); // - Casino
			SetPlayerInterior(playerid, 0);
			Informacion[playerid][Interior] = 0;
	    }
		if(IsPlayerInRangeOfPoint(playerid, 3, -25.9507,-187.6105,1003.5469))
	    {
	        SetPlayerPos(playerid, 1352.4213,-1758.7109,13.5078); // - 24/7 [1]
			SetPlayerInterior(playerid, 0);
			Informacion[playerid][Interior] = 0;
	    }
		if(IsPlayerInRangeOfPoint(playerid, 3, 6.1464,-30.7665,1003.5494))
	    {
	        SetPlayerPos(playerid, 1833.1284,-1842.5874,13.5781); // - 24/7 [2]
			SetPlayerInterior(playerid, 0);
			Informacion[playerid][Interior] = 0;
		}
		if(IsPlayerInRangeOfPoint(playerid, 3, -30.9129,-91.4246,1003.5469))
	    {
	        SetPlayerPos(playerid, 1315.5564,-898.5164,39.5781); // - 24/7 [3]
			SetPlayerInterior(playerid, 0);
			Informacion[playerid][Interior] = 0;
	    }
		if(IsPlayerInRangeOfPoint(playerid, 3, 238.7139,139.5321,1003.0234))
	    {
	        SetPlayerPos(playerid, 1285.8928,-1349.8894,13.5678); // - Presidencia de la Nacion (Principal)
			SetPlayerInterior(playerid, 0);
			Informacion[playerid][Interior] = 0;
	    }
		if(IsPlayerInRangeOfPoint(playerid, 3, 288.7538,167.7373,1007.1719))
	    {
	        SetPlayerPos(playerid, 1310.8937,-1315.1736,35.6588); // - Presidencia de la Nacion (Azotea)
			SetPlayerInterior(playerid, 0);
			Informacion[playerid][Interior] = 0;
	    }
		if(IsPlayerInRangeOfPoint(playerid, 3, 389.6705,173.1553,1008.3828))
	    {
	        SetPlayerPos(playerid, 1480.8536,-1748.9911,15.3666); // - Ayuntamiento
			SetPlayerInterior(playerid, 0);
			Informacion[playerid][Interior] = 0;
	    }
	}
	return 1;
}

public OnVehicleDeath(vehicleid, killerid)
{
	Rentado[vehicleid] = 0;
	Rentable[vehicleid] = 1;
	for(new i = 0; i < MAX_PLAYERS; i++)
	{
		if(Informacion[i][VRentado] == vehicleid)
		{
			Informacion[i][VRentado] = 0;
			Informacion[i][HeRentado] = 0;
			SendClientMessage(i, ROJO, "SERVER: Tu coche ha explotado y se ha auto-desrentado para evitar bug.");
		}
	}
	new Float:xpos,Float:ypos,Float:zpos;
    GetVehiclePos(vehicleid, xpos, ypos , zpos);
	O_FIRE_1 = CreateObject(18690, xpos + 2.0, ypos, zpos - 2.0, 0, 0, 0, 300.0);
    O_FIRE_2 = CreateObject(18690, xpos + 4.1, ypos+ 1.3, zpos - 2.0, 0, 0, 0, 300.0);
    O_FIRE_3 = CreateObject(18690, xpos + 6.4, ypos + 4.0, zpos - 2.0, 0, 0, 0, 300.0);
    O_FIRE_4 = CreateObject(18690, xpos + 2.8, ypos - 6.0, zpos - 2.0, 0, 0, 0, 300.0);
    O_FIRE_5 = CreateObject(18690, xpos + 9.0, ypos- 1.2, zpos - 2.0, 0, 0, 0, 300.0);
    O_FIRE_6 = CreateObject(18690, xpos + 12.0, ypos- 1.2, zpos - 2.0, 0, 0, 0, 300.0);
    O_FIRE_7 = CreateObject(18690, xpos - 6.0, ypos- 1.2, zpos - 3.0, 0, 0, 0, 300.0);
    O_FIRE_8 = CreateObject(18690, xpos + 4.0, ypos- 1.2, zpos - 2.0, 0, 0, 0, 300.0);
    O_FIRE_9 = CreateObject(18690, xpos + 26.0, ypos- 8.2, zpos - 2.0, 0, 0, 0, 300.0);
    O_FIRE_10 = CreateObject(18690, xpos, ypos- 1.2, zpos - 2.0, 0, 0, 0, 300.0);
	O_FIRE_11 = CreateObject(18690, xpos + 1.0, ypos, zpos - 2.0, 0, 0, 0, 300.0);
    O_FIRE_12 = CreateObject(18690, xpos + 8.1, ypos+ 4.3, zpos - 2.0, 0, 0, 0, 300.0);
    O_FIRE_13 = CreateObject(18690, xpos + 5.4, ypos + 4.0, zpos - 2.0, 0, 0, 0, 300.0);
    O_FIRE_14 = CreateObject(18690, xpos + 2.8, ypos - 1.0, zpos - 2.0, 0, 0, 0, 300.0);
    O_FIRE_15 = CreateObject(18690, xpos + 9.0, ypos- 6.2, zpos - 2.0, 0, 0, 0, 300.0);
    O_FIRE_16 = CreateObject(18690, xpos + 5.0, ypos- 4.2, zpos - 2.0, 0, 0, 0, 300.0);
    O_FIRE_17 = CreateObject(18690, xpos - 1.0, ypos- 1.2, zpos - 3.0, 0, 0, 0, 300.0);
    O_FIRE_18 = CreateObject(18690, xpos + 7.0, ypos- 9.2, zpos - 2.0, 0, 0, 0, 300.0);
    O_FIRE_19 = CreateObject(18690, xpos + 4.0, ypos- 4.2, zpos - 2.0, 0, 0, 0, 300.0);
    O_FIRE_20 = CreateObject(18690, xpos, ypos- 1.2, zpos - 2.0, 0, 0, 0, 300.0);
	for(new i = 0; i < MAX_PLAYERS; i++)
	{
		if(Informacion[i][Faccion] == SAMD && ServicioSAMD[i] == 1)
		{
		    SetPlayerMapIcon(i, FIRE_POS_MARKER ,xpos, ypos , zpos, 41, 0, MAPICON_GLOBAL);
		    SendClientMessage(i, ROJOFUERTE, "{AA3333}[ALERTA] Se ha detectado un incendio, la posicion ha sido marcada en el GPS");
			return 1;
		}
	}
	return 1;
}

public CrearCuenta(playerid)
{
	 if(IsPlayerConnected(playerid))
     {
          new archivo[256], usuario[MAX_PLAYER_NAME];
          GetPlayerName(playerid, usuario, MAX_PLAYER_NAME);
		  format(archivo, 256, "Res/Userdata/%s.ini", usuario);
          dini_IntSet(archivo, "Nivel", 1);
          dini_IntSet(archivo, "Sexo", 0);
          dini_IntSet(archivo, "Edad", 0);
          dini_IntSet(archivo, "Origen", 0);
          dini_IntSet(archivo, "Skin", 0);
          dini_IntSet(archivo, "Personalidad", 0);
          dini_IntSet(archivo, "Signo", 0);
          dini_IntSet(archivo, "Aficion", 0);
          dini_IntSet(archivo, "TestRol", 0);
          dini_IntSet(archivo, "Experiencia", 0);
          dini_IntSet(archivo, "Registrado", 0);
          dini_IntSet(archivo, "Bloqueo", 0);
          dini_IntSet(archivo, "Interior", 0);
          dini_IntSet(archivo, "MundoVirtual", 0);
          dini_IntSet(archivo, "Dinero", 0);
          dini_IntSet(archivo, "Faccion", 0);
	      dini_IntSet(archivo, "Rango", 0);
          dini_IntSet(archivo, "Admin", 0);
          dini_IntSet(archivo, "Busqueda", 0);
          dini_IntSet(archivo, "Mascara", 0);
          dini_IntSet(archivo, "DNI", 0);
          dini_IntSet(archivo, "CBancaria", 0);
          dini_IntSet(archivo, "NCBancaria", 0);
          dini_IntSet(archivo, "TarjetaCredito", 0);
          dini_IntSet(archivo, "DineroBanco", 0);
          dini_IntSet(archivo, "Multas", 0);
          dini_IntSet(archivo, "RegSAPD", 0);
          dini_IntSet(archivo, "Loteria", 0);
          dini_IntSet(archivo, "Coche", 9999);
		  dini_IntSet(archivo, "Sangre", 5000);
		  dini_IntSet(archivo, "Tumor", 0);
		  dini_IntSet(archivo, "Alcoholemia", 0);
		  dini_IntSet(archivo, "NTelefono", 0);
		  dini_IntSet(archivo, "TTelefono", 0);
		  dini_IntSet(archivo, "STelefono", 0);
		  dini_IntSet(archivo, "Ingles", 0);
		  dini_IntSet(archivo, "Aleman", 0);
		  dini_IntSet(archivo, "Frances", 0);
		  dini_IntSet(archivo, "Italiano", 0);
		  dini_IntSet(archivo, "Japones", 0);
		  dini_IntSet(archivo, "Ruso", 0);
		  dini_IntSet(archivo, "LCoche", 0);
		  dini_IntSet(archivo, "LVuelo", 0);
		  dini_IntSet(archivo, "LBote", 0);
		  dini_IntSet(archivo, "LArmas", 0);
		  dini_IntSet(archivo, "Herramientas", 0);
		  dini_IntSet(archivo, "Trabajo", 0);
		  dini_IntSet(archivo, "Lider", 0);
		  dini_IntSet(archivo, "Premium", 0);
		  return 1;
     }
     return 0;
}

public CargarDatos(playerid)
{
  	new archivo[256], usuario[MAX_PLAYER_NAME];
    GetPlayerName(playerid, usuario, MAX_PLAYER_NAME);
    format(archivo, 256, "Res/Userdata/%s.ini", usuario);
    Informacion[playerid][Nivel] = dini_Int(archivo, "Nivel");
    Informacion[playerid][Sexo] = dini_Int(archivo, "Sexo");
    Informacion[playerid][Edad] = dini_Int(archivo, "Edad");
    Informacion[playerid][Origen] = dini_Int(archivo, "Origen");
    Informacion[playerid][Skin] = dini_Int(archivo, "Skin");
    Informacion[playerid][Personalidad] = dini_Int(archivo, "Personalidad");
    Informacion[playerid][Signo] = dini_Int(archivo, "Signo");
    Informacion[playerid][Aficion] = dini_Int(archivo, "Aficion");
    Informacion[playerid][TestRol] = dini_Int(archivo, "TestRol");
    Informacion[playerid][Experiencia] = dini_Int(archivo, "Experiencia");
    Informacion[playerid][Registrado] = dini_Int(archivo, "Registrado");
    Informacion[playerid][Bloqueo] = dini_Int(archivo, "Bloqueo");
    Informacion[playerid][Interior] = dini_Int(archivo, "Interior");
    Informacion[playerid][MundoVirtual] = dini_Int(archivo, "MundoVirtual");
    Informacion[playerid][Dinero] = dini_Int(archivo, "Dinero");
	Informacion[playerid][Faccion] = dini_Int(archivo, "Faccion");
    Informacion[playerid][Rango] = dini_Int(archivo, "Rango");
    Informacion[playerid][Admin] = dini_Int(archivo, "Admin");
    Informacion[playerid][Busqueda] = dini_Int(archivo, "Busqueda");
    Informacion[playerid][Mascara] = dini_Int(archivo, "Mascara");
    Informacion[playerid][DNI] = dini_Int(archivo, "DNI");
    Informacion[playerid][CBancaria] = dini_Int(archivo, "CBancaria");
    Informacion[playerid][NCBancaria] = dini_Int(archivo, "NCBancaria");
    Informacion[playerid][TarjetaCredito] = dini_Int(archivo, "TarjetaCredito");
    Informacion[playerid][DineroBanco] = dini_Int(archivo, "DineroBanco");
    Informacion[playerid][Multas] = dini_Int(archivo, "Multas");
    Informacion[playerid][RegSAPD] = dini_Int(archivo, "RegSAPD");
    Informacion[playerid][Loteria] = dini_Int(archivo, "Loteria");
    Informacion[playerid][Coche] = dini_Int(archivo, "Coche");
    Informacion[playerid][Sangre] = dini_Int(archivo, "Sangre");
    Informacion[playerid][Tumor] = dini_Int(archivo, "Tumor");
    Informacion[playerid][Alcoholemia] = dini_Int(archivo, "Alcoholemia");
    Informacion[playerid][NTelefono] = dini_Int(archivo, "NTelefono");
    Informacion[playerid][TTelefono] = dini_Int(archivo, "TTelefono");
    Informacion[playerid][STelefono] = dini_Int(archivo, "STelefono");
    Informacion[playerid][Ingles] = dini_Int(archivo, "Ingles");
    Informacion[playerid][Aleman] = dini_Int(archivo, "Aleman");
    Informacion[playerid][Frances] = dini_Int(archivo, "Frances");
    Informacion[playerid][Italiano] = dini_Int(archivo, "Italiano");
    Informacion[playerid][Japones] = dini_Int(archivo, "Japones");
    Informacion[playerid][Ruso] = dini_Int(archivo, "Ruso");
    Informacion[playerid][LCoche] = dini_Int(archivo, "LCoche");
    Informacion[playerid][LVuelo] = dini_Int(archivo, "LVuelo");
    Informacion[playerid][LBote] = dini_Int(archivo, "LBote");
    Informacion[playerid][LArmas] = dini_Int(archivo, "LArmas");
    Informacion[playerid][Herramientas] = dini_Int(archivo, "Herramientas");
    Informacion[playerid][Trabajo] = dini_Int(archivo, "Trabajo");
    Informacion[playerid][Lider] = dini_Int(archivo, "Lider");
    Informacion[playerid][Premium] = dini_Int(archivo, "Premium");
	return 1;
}

public OnPlayerDisconnect(playerid)
{
    Informacion[playerid][VRentado] = 0;
    new archivo[256], usuario[MAX_PLAYER_NAME];
    new Float: UltimaPos[3];
    GetPlayerPos(playerid, UltimaPos[0], UltimaPos[1], UltimaPos[2]);
    Informacion[playerid][Posicion] = 1;
    GetPlayerName(playerid, usuario, MAX_PLAYER_NAME);
	format(archivo, 256, "Res/Userdata/%s.ini", usuario);
	Informacion[playerid][Dinero] = GetPlayerMoney(playerid);
  	dini_IntSet(archivo, "Nivel", Informacion[playerid][Nivel]);
  	dini_IntSet(archivo, "Sexo", Informacion[playerid][Sexo]);
  	dini_IntSet(archivo, "Edad", Informacion[playerid][Edad]);
  	dini_IntSet(archivo, "Origen", Informacion[playerid][Origen]);
  	dini_IntSet(archivo, "Skin", Informacion[playerid][Skin]);
  	dini_IntSet(archivo, "Personalidad", Informacion[playerid][Personalidad]);
  	dini_IntSet(archivo, "Signo", Informacion[playerid][Signo]);
  	dini_IntSet(archivo, "Aficion", Informacion[playerid][Aficion]);
  	dini_IntSet(archivo, "TestRol", Informacion[playerid][TestRol]);
  	dini_IntSet(archivo, "Experiencia", Informacion[playerid][Experiencia]);
  	dini_IntSet(archivo, "Registrado", Informacion[playerid][Registrado]);
  	dini_IntSet(archivo, "Bloqueo", Informacion[playerid][Bloqueo]);
  	dini_IntSet(archivo, "Interior", Informacion[playerid][Interior]);
  	dini_IntSet(archivo, "MundoVirtual", Informacion[playerid][MundoVirtual]);
 	dini_IntSet(archivo, "Dinero", Informacion[playerid][Dinero]);
    dini_FloatSet(archivo, "UltimaPosX", UltimaPos[0]);
    dini_FloatSet(archivo, "UltimaPosY", UltimaPos[1]);
    dini_FloatSet(archivo, "UltimaPosZ", UltimaPos[2]);
  	dini_IntSet(archivo, "Posicion", Informacion[playerid][Posicion]);
	dini_IntSet(archivo, "Faccion", Informacion[playerid][Faccion]);
	dini_IntSet(archivo, "Rango", Informacion[playerid][Rango]);
	dini_IntSet(archivo, "Admin", Informacion[playerid][Admin]);
	dini_IntSet(archivo, "Busqueda", Informacion[playerid][Busqueda]);
	dini_IntSet(archivo, "Mascara", Informacion[playerid][Mascara]);
	dini_IntSet(archivo, "DNI", Informacion[playerid][DNI]);
	dini_IntSet(archivo, "CBancaria", Informacion[playerid][CBancaria]);
	dini_IntSet(archivo, "NCBancaria", Informacion[playerid][NCBancaria]);
	dini_IntSet(archivo, "TarjetaCredito", Informacion[playerid][TarjetaCredito]);
	dini_IntSet(archivo, "DineroBanco", Informacion[playerid][DineroBanco]);
	dini_IntSet(archivo, "Multas", Informacion[playerid][Multas]);
	dini_IntSet(archivo, "RegSAPD", Informacion[playerid][RegSAPD]);
	dini_IntSet(archivo, "Loteria", Informacion[playerid][Loteria]);
	dini_IntSet(archivo, "Coche", Informacion[playerid][Coche]);
	dini_IntSet(archivo, "Sangre", Informacion[playerid][Sangre]);
	dini_IntSet(archivo, "Tumor", Informacion[playerid][Tumor]);
	dini_IntSet(archivo, "Alcoholemia", Informacion[playerid][Alcoholemia]);
	dini_IntSet(archivo, "NTelefono", Informacion[playerid][NTelefono]);
	dini_IntSet(archivo, "TTelefono", Informacion[playerid][TTelefono]);
	dini_IntSet(archivo, "STelefono", Informacion[playerid][STelefono]);
	dini_IntSet(archivo, "Ingles", Informacion[playerid][Ingles]);
	dini_IntSet(archivo, "Aleman", Informacion[playerid][Aleman]);
	dini_IntSet(archivo, "Frances", Informacion[playerid][Frances]);
	dini_IntSet(archivo, "Italiano", Informacion[playerid][Italiano]);
	dini_IntSet(archivo, "Japones", Informacion[playerid][Japones]);
	dini_IntSet(archivo, "Ruso", Informacion[playerid][Ruso]);
	dini_IntSet(archivo, "LCoche", Informacion[playerid][LCoche]);
	dini_IntSet(archivo, "LVuelo", Informacion[playerid][LVuelo]);
	dini_IntSet(archivo, "LBote", Informacion[playerid][LBote]);
	dini_IntSet(archivo, "LArmas", Informacion[playerid][LArmas]);
	dini_IntSet(archivo, "Herramientas", Informacion[playerid][Herramientas]);
	dini_IntSet(archivo, "Trabajo", Informacion[playerid][Trabajo]);
	dini_IntSet(archivo, "Lider", Informacion[playerid][Lider]);
	dini_IntSet(archivo, "Premium", Informacion[playerid][Premium]);
	return 1;
}

public OnVehicleSpawn(vehicleid)
{
 	CarPuenteado[vehicleid] = 0;
	new h = vehicleid;
   	if(VehiculosVenta(h))
   	{
   	    DestroyVehicle(h);
	    CreateVehicle(CInformacion[h][cModel],CInformacion[h][cLocationx],CInformacion[h][cLocationy],CInformacion[h][cLocationz]+1.0,CInformacion[h][cAngle],CInformacion[h][cColorOne],CInformacion[h][cColorTwo],1800);
		AddVehicleComponent(h,CInformacion[h][cNitro]);
		AddVehicleComponent(h,CInformacion[h][cLlantas]);
		AddVehicleComponent(h,CInformacion[h][cAleron]);
		AddVehicleComponent(h,CInformacion[h][cParachoDelan]);
		AddVehicleComponent(h,CInformacion[h][cParachoTrase]);
		AddVehicleComponent(h,CInformacion[h][cHidraulica]);
		AddVehicleComponent(h,CInformacion[h][cTecho]);
		AddVehicleComponent(h,CInformacion[h][cEscape]);
		AddVehicleComponent(h,CInformacion[h][cParachoDesco]);
		AddVehicleComponent(h,CInformacion[h][cEmbellecedor]);
		AddVehicleComponent(h,CInformacion[h][cEmbellecedor2]);
		ChangeVehiclePaintjob(h, CInformacion[h][cPaintJob]);
	}
	return 1;
}

public OnPlayerUpdate(playerid)
{
	SetPlayerScore(playerid, Informacion[playerid][Nivel]);
	if(ActivarCheckeador[playerid] == 1)
	{
	    if(Informacion[playerid][Experiencia] >= 10)
	    {
			ActivarCheckeador[playerid] = 0;
			GameTextForPlayer(playerid,"~n~~n~~n~~n~~g~Felicidades, subes de nivel!", 5000, 3);
			Informacion[playerid][Experiencia] = 0;
			Informacion[playerid][Nivel] += 1;
		}
	}
	if(IsPlayerInAnyVehicle(playerid) && BloquearVelocimetro[playerid] == 0)
    {
		new Float:vVelocity[3];
	    GetVehicleVelocity(GetPlayerVehicleID(playerid), vVelocity[0], vVelocity[1], vVelocity[2]);
		new Float: vSpeed = floatsqroot(floatpower(vVelocity[0], 2) + floatpower(vVelocity[1], 2) + floatpower(vVelocity[2], 2)) * 99;
		new string7[128];
		ShowProgressBarForPlayer(playerid, CarGasoil[playerid]);
		ShowProgressBarForPlayer(playerid, CarHealth[playerid]);
		TextDrawShowForPlayer(playerid,Text:Velocimetro_Box[playerid]);
	    TextDrawShowForPlayer(playerid,Text:Velocimetro_Vel[playerid]);
		TextDrawShowForPlayer(playerid,Text:Velocimetro_HP[playerid]);
	 	TextDrawShowForPlayer(playerid,Text:Velocimetro_GAS[playerid]);
		format(string7, sizeof(string7), "%0.0f KM/H", vSpeed);
		TextDrawSetString(Velocimetro_Vel[playerid], string7);
		TextDrawShowForPlayer(playerid,Text:Velocimetro_Vel[playerid]);
		UpdateProgressBar(CarHealth[playerid], playerid);
		new Float:health;
    	GetVehicleHealth(GetPlayerVehicleID(playerid),health);
	    if(health >= 100 && health <= 200)
		{
			SetProgressBarValue(CarHealth[playerid], 0);
	 	}
	    if(health >= 200 && health <= 300)
		{
  				SetProgressBarValue(CarHealth[playerid], 20);
	 	}
	    if(health >= 300 && health <= 400)
		{
			SetProgressBarValue(CarHealth[playerid], 30);
	 	}
	    if(health >= 400 && health <= 500)
		{
			SetProgressBarValue(CarHealth[playerid], 50);
	 	}
	    if(health >= 500 && health <= 600)
		{
			SetProgressBarValue(CarHealth[playerid], 60);
	 	}
	    if(health >= 600 && health <= 700)
		{
			SetProgressBarValue(CarHealth[playerid], 70);
	 	}
	    if(health >= 700 && health <= 800)
		{
			SetProgressBarValue(CarHealth[playerid], 80);
	 	}
	    if(health >= 800 && health <= 900)
		{
			SetProgressBarValue(CarHealth[playerid], 90);
	 	}
	    if(health >= 900 && health <= 1000)
		{
			SetProgressBarValue(CarHealth[playerid], 100);
	 	}
	}
	/* -= Comandos =- */
 	if(PlayerToPoint(1, playerid, 1479.9637,-1724.6628,13.5469))
	{
	    GameTextForPlayer(playerid,"~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~g~Comando: ~w~/guia", 5000, 3);
	}
 	if(PlayerToPoint(1, playerid, 1522.3750,-1601.1339,13.5469))
	{
	    GameTextForPlayer(playerid,"~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~g~Comando: ~w~/loteria", 5000, 3);
	}
 	if(PlayerToPoint(1, playerid, -2033.1423,-117.3941,1035.1719))
	{
	    GameTextForPlayer(playerid,"~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~g~Comando: ~w~/solicitar", 5000, 3);
	}
 	if(PlayerToPoint(1, playerid, -28.3918,-184.7443,1003.5469))
	{
	    GameTextForPlayer(playerid,"~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~g~Comando: ~w~/Comprar", 5000, 3);
	}
 	if(PlayerToPoint(1, playerid, 2.7929,-28.6153,1003.5494))
	{
	    GameTextForPlayer(playerid,"~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~g~Comando: ~w~/Comprar", 5000, 3);
	}
 	if(PlayerToPoint(1, playerid,-27.1513,-89.7159,1003.5469))
	{
	    GameTextForPlayer(playerid,"~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~g~Comando: ~w~/Comprar", 5000, 3);
	}
 	if(PlayerToPoint(1, playerid, 409.0119,-1758.4318,8.1966))
	{
	    GameTextForPlayer(playerid,"~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~g~Comando: ~w~/suscribirme", 5000, 3);
	}
	if(Informacion[playerid][Faccion] == SAPD)
    {
	 	if(PlayerToPoint(1, playerid, 253.7153,76.9650,1003.6406))
		{
		    GameTextForPlayer(playerid,"~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~g~Comando: ~w~/equipo - /servicio", 5000, 3);
		}
	 	if(PlayerToPoint(1, playerid, 267.6147,77.4457,1001.0391))
		{
		    GameTextForPlayer(playerid,"~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~g~Comando: ~w~/arrestar", 5000, 3);
		}
	}
	/* -= Entradas =- */
 	if(PlayerToPoint(1, playerid, 1480.8536,-1748.9911,15.3666))
	{
	    GameTextForPlayer(playerid,"~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~r~Area: ~w~Ayuntamiento", 5000, 3);
	}
 	if(PlayerToPoint(1, playerid, 1172.5518,-1323.2905,15.4029))
	{
	    GameTextForPlayer(playerid,"~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~r~Area: ~w~Hospital", 5000, 3);
	}
 	if(PlayerToPoint(1, playerid, 1161.7932,-1329.7328,31.4933))
	{
	    GameTextForPlayer(playerid,"~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~r~Area: ~w~Laboratorio", 5000, 3);
	}
 	if(PlayerToPoint(1, playerid, 1285.8928,-1349.8894,13.5678))
	{
	    GameTextForPlayer(playerid,"~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~r~Area: ~w~Departamento SA:GOB", 5000, 3);
	}
 	if(PlayerToPoint(1, playerid, 1310.8937,-1315.1736,35.6588))
	{
	    GameTextForPlayer(playerid,"~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~r~Area: ~w~Departamento SA:GOB", 5000, 3);
	}
 	if(PlayerToPoint(1, playerid, 1554.5265,-1675.6235,16.1953))
	{
	    GameTextForPlayer(playerid,"~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~r~Area: ~w~Departamento SAPD", 5000, 3);
	}
 	if(PlayerToPoint(1, playerid, 1565.0260,-1666.3461,28.3956))
	{
	    GameTextForPlayer(playerid,"~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~r~Area: ~w~Departamento SAPD", 5000, 3);
	}
 	if(PlayerToPoint(1, playerid, 1568.5916,-1690.5444,5.8906))
	{
	    GameTextForPlayer(playerid,"~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~r~Area: ~w~Departamento SAPD", 5000, 3);
	}
 	if(PlayerToPoint(1, playerid, 1498.9043,-1584.1024,13.5469))
	{
	    GameTextForPlayer(playerid,"~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~r~Area: ~w~Banco Municipal", 5000, 3);
	}
 	if(PlayerToPoint(1, playerid, 1352.4021,-1758.5796,13.5078))
	{
	    GameTextForPlayer(playerid,"~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~r~Area: ~w~Tienda 24/7", 5000, 3);
	}
 	if(PlayerToPoint(1, playerid, 1833.3335,-1842.5967,13.5781))
	{
	    GameTextForPlayer(playerid,"~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~r~Area: ~w~Tienda 24/7", 5000, 3);
	}
 	if(PlayerToPoint(1, playerid, 1315.4426,-898.5647,39.5781))
	{
	    GameTextForPlayer(playerid,"~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~r~Area: ~w~Tienda 24/7", 5000, 3);
	}
 	if(PlayerToPoint(1, playerid, 953.8956,-1336.7748,13.5389))
	{
	    GameTextForPlayer(playerid,"~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~r~Area: ~w~Tienda Pornografica", 5000, 3);
	}
 	if(PlayerToPoint(1, playerid, 928.3195,-1352.9054,13.3438))
	{
	    GameTextForPlayer(playerid,"~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~r~Area: ~w~Clucking Bell", 5000, 3);
	}
 	if(PlayerToPoint(1, playerid, 810.9998,-1616.0824,13.5469))
	{
	    GameTextForPlayer(playerid,"~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~r~Area: ~w~Burger Shot", 5000, 3);
	}
 	if(PlayerToPoint(1, playerid, 1759.3533,-1893.9495,13.5557))
	{
	    GameTextForPlayer(playerid,"~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~r~Area: ~w~Taxi Company", 5000, 3);
	}
 	if(PlayerToPoint(1, playerid, 1412.0793,-1700.2788,13.5395))
	{
	    GameTextForPlayer(playerid,"~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~r~Area: ~w~Tienda de Ropa", 5000, 3);
	}
 	if(PlayerToPoint(1, playerid, 1022.4844,-1121.7670,23.8718))
	{
	    GameTextForPlayer(playerid,"~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~r~Area: ~w~Casino Japones", 5000, 3);
	}
 	if(PlayerToPoint(1, playerid, 1028.4406,-1104.3571,23.8281))
	{
	    GameTextForPlayer(playerid,"~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~r~Area: ~w~Mercado Negro", 5000, 3);
	}
 	if(PlayerToPoint(1, playerid, 1028.4406,-1104.3571,23.8281))
	{
	    GameTextForPlayer(playerid,"~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~r~Area: ~w~Estudio CNN:SA", 5000, 3);
	}
 	if(PlayerToPoint(1, playerid, 732.7997,-1348.1926,13.5103))
	{
	    GameTextForPlayer(playerid,"~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~r~Area: ~w~Estudio CNN:SA", 5000, 3);
	}
 	if(PlayerToPoint(1, playerid, 2229.4983,-1721.6172,13.5646))
	{
	    GameTextForPlayer(playerid,"~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~r~Area: ~w~Gimnasio", 5000, 3);
	}
 	if(PlayerToPoint(1, playerid, 2309.8442,-1644.1412,14.8270))
	{
	    GameTextForPlayer(playerid,"~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~r~Area: ~w~The Green Bottles", 5000, 3);
	}
 	if(PlayerToPoint(1, playerid, 1772.7750,-1655.2321,14.4274))
	{
	    GameTextForPlayer(playerid,"~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~r~Area: ~w~Departamento SA:LIC", 5000, 3);
	}
 	if(PlayerToPoint(1, playerid, 1836.3978,-1682.3990,13.3496))
	{
	    GameTextForPlayer(playerid,"~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~r~Area: ~w~Discoteca", 5000, 3);
	}
 	if(PlayerToPoint(1, playerid, 2851.6394,-1532.8914,11.0938))
	{
	    GameTextForPlayer(playerid,"~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~r~Area: ~w~Club Habana", 5000, 3);
	}
 	if(PlayerToPoint(1, playerid, 2104.7217,-1806.4839,13.5547))
	{
	    GameTextForPlayer(playerid,"~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~r~Area: ~w~Well Stack Pizza", 5000, 3);
	}
 	if(PlayerToPoint(1, playerid, 1367.8969,-1279.7985,13.5469))
	{
	    GameTextForPlayer(playerid,"~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~r~Area: ~w~Ammu-Nation", 5000, 3);
	}
	return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
    HideProgressBarForPlayer(playerid, CarHealth[playerid]);
    HideProgressBarForPlayer(playerid, CarGasoil[playerid]);
    HideProgressBarForPlayer(playerid, RepairConexion[playerid]);
	return 1;
}

public OnGameModeInit()
{
	AntiDeAMX();
	CargarEstadisticas();
	CargarValores();
	CargarVehiculos();
	CargarSatelites();
	CargarTiendas();
	SetNameTagDrawDistance(10);
	UsePlayerPedAnims();
	ManualVehicleEngineAndLights();
	DisableInteriorEnterExits();
	EnableStuntBonusForAll(0);
	SetGameModeText("SA:RP Espa�ol");
	SendRconCommand("hostname ~ San Andreas RPG - Calles de Los Santos ~");
	SendRconCommand("mapname [LS ~ v1.0 Beta]");
	SendRconCommand("weburl 127.0.0.1");

	SetTimer("TimerGeneral", 1000, true);
	SetTimer("TimerVectorial", 10000, true);
	synctimer = SetTimer("SyncUp", 60000, 1);
	gettime(ghour, gminute, gsecond);
	FixHour(ghour);
	if(!realtime) { SetWorldTime(wtime); }
	if(realtime)
	{
		new tmphour;
		new tmpminute;
		new tmpsecond;
		gettime(tmphour, tmpminute, tmpsecond);
		FixHour(tmphour);
		tmphour = shifthour;
		SetWorldTime(tmphour);
	}
	Barra1 = TextDrawCreate(319.000000, 0.000000, "a");
	TextDrawAlignment(Barra1, 2);
	TextDrawBackgroundColor(Barra1, 255);
	TextDrawFont(Barra1, 1);
	TextDrawLetterSize(Barra1, 0.100000, 11.599998);
	TextDrawColor(Barra1, 255);
	TextDrawSetOutline(Barra1, 0);
	TextDrawSetProportional(Barra1, 1);
	TextDrawSetShadow(Barra1, 1);
	TextDrawUseBox(Barra1, 1);
	TextDrawBoxColor(Barra1, 255);
	TextDrawTextSize(Barra1, -39.000000, -650.000000);
	Barra2 = TextDrawCreate(319.000000, 341.000000, "a");
	TextDrawAlignment(Barra2, 2);
	TextDrawBackgroundColor(Barra2, 255);
	TextDrawFont(Barra2, 1);
	TextDrawLetterSize(Barra2, 0.100000, 11.599998);
	TextDrawColor(Barra2, 255);
	TextDrawSetOutline(Barra2, 0);
	TextDrawSetProportional(Barra2, 1);
	TextDrawSetShadow(Barra2, 1);
	TextDrawUseBox(Barra2, 1);
	TextDrawBoxColor(Barra2, 255);
	TextDrawTextSize(Barra2, -39.000000, -650.000000);
	Motor_Box = TextDrawCreate(632.000000,426.000000,"a");
	Motor_Titulo = TextDrawCreate(505.000000,437.000000,"Encendiendo motor...");
	TextDrawUseBox(Motor_Box,1);
	TextDrawBoxColor(Motor_Box,0x00000066);
	TextDrawTextSize(Motor_Box,474.000000,0.000000);
	TextDrawAlignment(Motor_Box,0);
	TextDrawAlignment(Motor_Titulo,0);
	TextDrawBackgroundColor(Motor_Box,0x000000ff);
	TextDrawBackgroundColor(Motor_Titulo,0x000000ff);
	TextDrawFont(Motor_Box,3);
	TextDrawLetterSize(Motor_Box,-0.000000,2.000000);
	TextDrawFont(Motor_Titulo,2);
	TextDrawLetterSize(Motor_Titulo,0.199999,1.000000);
	TextDrawColor(Motor_Box,0xffffffff);
	TextDrawColor(Motor_Titulo,0xffffffff);
	TextDrawSetOutline(Motor_Box,1);
	TextDrawSetOutline(Motor_Titulo,1);
	TextDrawSetProportional(Motor_Box,1);
	TextDrawSetProportional(Motor_Titulo,1);
	TextDrawSetShadow(Motor_Box,1);
	TextDrawSetShadow(Motor_Titulo,1);
	L_FONDO = TextDrawCreate(485.000000,145.000000,"a");
	L_TITULO = TextDrawCreate(247.000000,144.000000,"Las Vegas City RolePlay");
	L_VERSION = TextDrawCreate(306.000000,159.000000,"v1.0");
	L_CARGANDO = TextDrawCreate(204.000000,216.000000,"Cargando objetos del ambiente...");
	TextDrawUseBox(L_FONDO,1);
	TextDrawBoxColor(L_FONDO,0x00000099);
	TextDrawTextSize(L_FONDO,152.000000,0.000000);
	TextDrawAlignment(L_FONDO,0);
	TextDrawAlignment(L_TITULO,0);
	TextDrawAlignment(L_VERSION,0);
	TextDrawAlignment(L_CARGANDO,0);
	TextDrawBackgroundColor(L_FONDO,0x000000ff);
	TextDrawBackgroundColor(L_TITULO,0x000000ff);
	TextDrawBackgroundColor(L_VERSION,0x000000ff);
	TextDrawBackgroundColor(L_CARGANDO,0x000000ff);
	TextDrawFont(L_FONDO,3);
	TextDrawLetterSize(L_FONDO,-0.000000,18.700002);
	TextDrawFont(L_TITULO,0);
	TextDrawLetterSize(L_TITULO,0.499999,1.800000);
	TextDrawFont(L_VERSION,2);
	TextDrawLetterSize(L_VERSION,0.299999,1.400000);
	TextDrawFont(L_CARGANDO,2);
	TextDrawLetterSize(L_CARGANDO,0.299999,1.400000);
	TextDrawColor(L_FONDO,0xffffffff);
	TextDrawColor(L_TITULO,0xffffffff);
	TextDrawColor(L_VERSION,0xffffffff);
	TextDrawColor(L_CARGANDO,0xffffffff);
	TextDrawSetOutline(L_FONDO,1);
	TextDrawSetOutline(L_TITULO,1);
	TextDrawSetOutline(L_VERSION,1);
	TextDrawSetOutline(L_CARGANDO,1);
	TextDrawSetProportional(L_FONDO,1);
	TextDrawSetProportional(L_TITULO,1);
	TextDrawSetProportional(L_VERSION,1);
	TextDrawSetProportional(L_CARGANDO,1);
	TextDrawSetShadow(L_FONDO,1);
	TextDrawSetShadow(L_TITULO,1);
	TextDrawSetShadow(L_VERSION,1);
	TextDrawSetShadow(L_CARGANDO,1);

	AddStaticPickup(1239, 23, 253.7153,76.9650,1003.6406);		// [SA-RP] - /equipo y /servicio
	AddStaticPickup(1239, 23, 267.6147,77.4457,1001.0391);		// [SA-RP] - /arrestar
	AddStaticPickup(1239, 23, 353.0938,-1820.7573,4.2020); 		// [SA-RP] Antena G1
	AddStaticPickup(1239, 23, 2778.4502,-2087.2517,11.8143); 	// [SA-RP] Antena G2
	AddStaticPickup(1239, 23, 2284.0371,-1114.4905,37.9766); 	// [SA-RP] Antena G3
	AddStaticPickup(1239, 23, 1463.4078,-786.3527,92.1255); 	// [SA-RP] Antena G4
	AddStaticPickup(1239, 23, 703.0101,-918.2805,78.5234); 		// [SA-RP] Antena G5
	AddStaticPickup(1239, 23, -2033.1423,-117.3941,1035.1719); 	// [SA-RP] - Solicitar un Licenciero/Profesor
 	AddStaticPickup(1239, 23, 1479.9637,-1724.6628,13.5469); 	// [SA-RP] - Guia para el Jugador
	AddStaticPickup(1239, 23, 1522.3750,-1601.1339,13.5469); 	// [SA-RP] - Loteria
	AddStaticPickup(1581, 23, 1438.3186,-996.9917,1639.7843); 	// [SA-RP] - Registro Bancario
	AddStaticPickup(1581, 23, 1432.2441,-997.0485,1639.7843); 	// [SA-RP] - Registro Bancario (2)
	AddStaticPickup(1239, 23, 1424.7229,-981.5432,1639.7843); 	// [SA-RP] - Cajero (1)
	AddStaticPickup(1239, 23, 1421.4470,-981.6498,1639.7843); 	// [SA-RP] - Cajero (2)
	AddStaticPickup(1239, 23, 1417.9294,-981.4092,1639.7843); 	// [SA-RP] - Cajero (3)
	AddStaticPickup(1239, 23, 409.0119,-1758.4318,8.1966); 		// [SA-RP] Trabajo: Camionero
	AddStaticPickup(1239, 23, -28.3918,-184.7443,1003.5469); 	// [SA-RP] - Tienda (1)
	AddStaticPickup(1239, 23, 2.7929,-28.6153,1003.5494); 		// [SA-RP] - Tienda (2)
	AddStaticPickup(1239, 23, -27.1513,-89.7159,1003.5469); 	// [SA-RP] - Tienda (3)
	
	AddStaticPickup(1318, 23, 1480.8536,-1748.9911,15.3666); 	// [ENTRADA] Ayuntamiento
	AddStaticPickup(1318, 23, 1172.5518,-1323.2905,15.4029); 	// [ENTRADA] Hospital
	AddStaticPickup(1318, 23, 1161.7932,-1329.7328,31.4933); 	// [ENTRADA] Hospital  (Azotea)
	AddStaticPickup(1318, 23, 1285.8928,-1349.8894,13.5678); 	// [ENTRADA] Presidencia de la Nacion
	AddStaticPickup(1318, 23, 1310.8937,-1315.1736,35.6588); 	// [ENTRADA] Presidencia de la Nacion (Azotea)
	AddStaticPickup(1318, 23, 1554.5265,-1675.6235,16.1953); 	// [ENTRADA] SAPD (Principal)
	AddStaticPickup(1318, 23, 1565.0260,-1666.3461,28.3956); 	// [ENTRADA] SAPD (Azoteal)
	AddStaticPickup(1318, 23, 1568.5916,-1690.5444,5.8906); 	// [ENTRADA] SAPD (Garage)
	AddStaticPickup(1318, 23, 1498.9043,-1584.1024,13.5469); 	// [ENTRADA] Banco Municipal
	AddStaticPickup(1318, 23, 1352.4021,-1758.5796,13.5078); 	// [ENTRADA] 24/7 (1)
	AddStaticPickup(1318, 23, 1833.3335,-1842.5967,13.5781); 	// [ENTRADA] 24/7 (2)
	AddStaticPickup(1318, 23, 1315.4426,-898.5647,39.5781); 	// [ENTRADA] 24/7 (3)
	AddStaticPickup(1318, 23, 953.8956,-1336.7748,13.5389); 	// [ENTRADA] SexShop
	AddStaticPickup(1318, 23, 928.3195,-1352.9054,13.3438); 	// [ENTRADA] Clucking Bell
	AddStaticPickup(1318, 23, 810.9998,-1616.0824,13.5469); 	// [ENTRADA] Burger Shot
	AddStaticPickup(1318, 23, 1759.3533,-1893.9495,13.5557); 	// [ENTRADA] Taxi Company
	AddStaticPickup(1318, 23, 1412.0793,-1700.2788,13.5395); 	// [ENTRADA] Tienda de Ropa
	AddStaticPickup(1318, 23, 1022.4844,-1121.7670,23.8718); 	// [ENTRADA] Casino Japones
	AddStaticPickup(1318, 23, 1028.4406,-1104.3571,23.8281); 	// [ENTRADA] Mercado Negro
	AddStaticPickup(1318, 23, 648.5905,-1356.7332,13.5665); 	// [ENTRADA] CNN San Andreas (Principal)
	AddStaticPickup(1318, 23, 732.7997,-1348.1926,13.5103); 	// [ENTRADA] CNN San Andreas (Garage)
	AddStaticPickup(1318, 23, 2229.4983,-1721.6172,13.5646); 	// [ENTRADA] Ganton GIM
	AddStaticPickup(1318, 23, 2309.8442,-1644.1412,14.8270); 	// [ENTRADA] The Green Bottles
	AddStaticPickup(1318, 23, 1772.7750,-1655.2321,14.4274); 	// [ENTRADA] Departamento de Licencias
	AddStaticPickup(1318, 23, 1836.3978,-1682.3990,13.3496);	// [ENTRADA] Discoteca
	AddStaticPickup(1318, 23, 2851.6394,-1532.8914,11.0938); 	// [ENTRADA] CopaCabana
	AddStaticPickup(1318, 23, 2104.7217,-1806.4839,13.5547); 	// [ENTRADA] Well Stack Pizza
	AddStaticPickup(1318, 23, 1367.8969,-1279.7985,13.5469); 	// [ENTRADA] Armeria
	AddStaticPickup(1318, 23, 364.6920,186.1605,1019.9844);   	// [ENTRADA] Laboratorio
	AddStaticPickup(1318, 23, 2537.5044,-1297.3079,1054.6406);	// [ENTRADA] HQ Taxi 2
	AddStaticPickup(1318, 23, 2018.5682,1017.8448,996.8750); 	// [SALIDA] Casino
	AddStaticPickup(1318, 23, 1489.3328,-1721.7786,8.2106); 	// [SALIDA] Mercado Negro
	AddStaticPickup(1318, 23, -25.9507,-187.6105,1003.5469);  	// [SALIDA] 24/7 [1]
	AddStaticPickup(1318, 23, 6.1464,-30.7665,1003.5494); 		// [SALIDA] 24/7 [2]
	AddStaticPickup(1318, 23, -30.9129,-91.4246,1003.5469); 	// [SALIDA] 24/7 [3]
	AddStaticPickup(1318, 23, 285.4373,-41.0108,1001.5156); 	// [SALIDA] Ammu - Nation
	AddStaticPickup(1318, 23, -100.4243,-24.5154,1000.7188); 	// [SALIDA] Tienda Porno
	AddStaticPickup(1318, 23, 493.4309,-24.3261,1000.6797); 	// [SALIDA] Discoteca
	AddStaticPickup(1318, 23, 501.9595,-68.0340,998.7578); 		// [SALIDA] Bar The Green Bottles
	AddStaticPickup(1318, 23, 363.3454,-74.9236,1001.5078); 	// [SALIDA] Burger SHot
	AddStaticPickup(1318, 23, 365.0107,-10.9408,1001.8516); 	// [SALIDA] Cluckin Bell
	AddStaticPickup(1318, 23, 372.2942,-133.1127,1001.4922); 	// [SALIDA] Well pizza
	AddStaticPickup(1318, 23, 389.6705,173.1553,1008.3828); 	// [SALIDA] Ayuntamiento
	AddStaticPickup(1318, 23, 772.1720,-4.7048,1000.7286); 		// [SALIDA] Gangom Gim
	AddStaticPickup(1318, 23, 246.7704,63.2438,1003.6406); 		// [SALIDA] LSPD [Principal]
	AddStaticPickup(1318, 23, 258.1533,86.5789,1002.4453); 		// [SALIDA] LSPD [Garage/Azotea]
	AddStaticPickup(1318, 23, 246.3645,108.1332,1003.2188);		// [SALIDA] LSTV [Principal]
	AddStaticPickup(1318, 23, 218.5256,126.1456,999.6924); 		// [SALIDA] LSTV [Garage]
	AddStaticPickup(1318, 23, -2027.4482,-104.3967,1035.1719);	// [SALIDA] Licencieros
	AddStaticPickup(1318, 23, -1994.2268,-63.2064,1028.9183); 	// [SALIDA] Licencieros 2
	AddStaticPickup(1318, 23, 367.0448,162.1540,1019.9844); 	// [SALIDA] Hospital
	AddStaticPickup(1318, 23, 309.9743,1855.3894,7.7266);     	// [SALIDA] Laboratorio
	AddStaticPickup(1318, 23, 268.7224,1864.7826,8.6094);     	// [SALIDA] Laboratorio - Azotea
 	AddStaticPickup(1318, 23, 2523.3921,-1285.8868,1054.6406);	// [SALIDA] HQ Taxi 1
	AddStaticPickup(1318, 23, 2542.8289,-1300.3031,1062.7042);	// [SALIDA] HQ Taxi 2
	AddStaticPickup(1318, 23, -2636.6877,1402.9351,906.4609); 	// [SALIDA] PutiClub
	AddStaticPickup(1318, 23, 238.7139,139.5321,1003.0234); 	// [SALIDA] Presidencia de La Nacion [Abajo]
	AddStaticPickup(1318, 23, 288.7538,167.7373,1007.1719); 	// [SALIDA] Presidencia de La Nacion [Arriba]

	// ~ TextLabels ~
	Create3DTextLabel("{FEB800}Area: {FFFFFF}Ayuntamiento",0xEEEE88FF,1480.8536,-1748.9911,15.3666+0.75,20.0,0,1);
	Create3DTextLabel("{FEB800}Area: {FFFFFF}Hospital",0xEEEE88FF,1172.5518,-1323.2905,15.4029+0.75,20.0,0,1);
	Create3DTextLabel("{FEB800}Area: {FFFFFF}Hospital",0xEEEE88FF,1161.7932,-1329.7328,31.4933+0.75,20.0,0,1);
	Create3DTextLabel("{FEB800}Area: {FFFFFF}Presidencia de LS",0xEEEE88FF,1285.8928,-1349.8894,13.5678+0.75,20.0,0,1);
	Create3DTextLabel("{FEB800}Area: {FFFFFF}Presidencia de LS",0xEEEE88FF,1310.8937,-1315.1736,35.6588+0.75,20.0,0,1);
	Create3DTextLabel("{FEB800}Area: {FFFFFF}Departamento de Policia",0xEEEE88FF,1554.5265,-1675.6235,16.1953+0.75,20.0,0,1);
	Create3DTextLabel("{FEB800}Area: {FFFFFF}Departamento de Policia",0xEEEE88FF,1565.0260,-1666.3461,28.3956+0.75,20.0,0,1);
	Create3DTextLabel("{FEB800}Area: {FFFFFF}Departamento de Policia",0xEEEE88FF,1568.5916,-1690.5444,5.8906+0.75,20.0,0,1);
	Create3DTextLabel("{FEB800}Area: {FFFFFF}Banco Municipal",0xEEEE88FF,1498.9043,-1584.1024,13.5469+0.75,20.0,0,1);
	Create3DTextLabel("{FEB800}Area: {FFFFFF}Tienda 24/7",0xEEEE88FF,1352.4021,-1758.5796,13.5078+0.75,20.0,0,1);
	Create3DTextLabel("{FEB800}Area: {FFFFFF}Tienda 24/7",0xEEEE88FF,1833.3335,-1842.5967,13.5781+0.75,20.0,0,1);
	Create3DTextLabel("{FEB800}Area: {FFFFFF}Tienda 24/7",0xEEEE88FF,1315.4426,-898.5647,39.5781+0.75,20.0,0,1);
	Create3DTextLabel("{FEB800}Area: {FFFFFF}SexShop",0xEEEE88FF,953.8956,-1336.7748,13.5389+0.75,20.0,0,1);
	Create3DTextLabel("{FEB800}Area: {FFFFFF}Clucking Bell",0xEEEE88FF,928.3195,-1352.9054,13.3438+0.75,20.0,0,1);
	Create3DTextLabel("{FEB800}Area: {FFFFFF}Burger Shot",0xEEEE88FF,810.9998,-1616.0824,13.5469+0.75,20.0,0,1);
	Create3DTextLabel("{FEB800}Area: {FFFFFF}Departamento de Transporte",0xEEEE88FF,1759.3533,-1893.9495,13.5557+0.75,20.0,0,1);
	Create3DTextLabel("{FEB800}Area: {FFFFFF}Tienda de Ropa",0xEEEE88FF,1412.0793,-1700.2788,13.5395+0.75,20.0,0,1);
	Create3DTextLabel("{FEB800}Area: {FFFFFF}Casino Japones",0xEEEE88FF,1022.4844,-1121.7670,23.8718+0.75,20.0,0,1);
	Create3DTextLabel("{FEB800}Area: {FFFFFF}Mercado Negro",0xEEEE88FF,1028.4406,-1104.3571,23.8281+0.75,20.0,0,1);
	Create3DTextLabel("{FEB800}Area: {FFFFFF}CNN San Andreas",0xEEEE88FF,648.5905,-1356.7332,13.5665+0.75,20.0,0,1);
	Create3DTextLabel("{FEB800}Area: {FFFFFF}CNN San Andreas",0xEEEE88FF,732.7997,-1348.1926,13.5103+0.75,20.0,0,1);
	Create3DTextLabel("{FEB800}Area: {FFFFFF}Ganton GIM",0xEEEE88FF,2229.4983,-1721.6172,13.5646+0.75,20.0,0,1);
	Create3DTextLabel("{FEB800}Area: {FFFFFF}The Green Bottles",0xEEEE88FF,2309.8442,-1644.1412,14.8270+0.75,20.0,0,1);
	Create3DTextLabel("{FEB800}Area: {FFFFFF}Departamento de Licencias",0xEEEE88FF,	1772.7750,-1655.2321,14.4274+0.75,20.0,0,1);
	Create3DTextLabel("{FEB800}Area: {FFFFFF}Discoteca Alhambra",0xEEEE88FF,1836.3978,-1682.3990,13.3496+0.75,20.0,0,1);
	Create3DTextLabel("{FEB800}Area: {FFFFFF}Discoteca de Streep Tease",0xEEEE88FF,2851.6394,-1532.8914,11.0938+0.75,20.0,0,1);
	Create3DTextLabel("{FEB800}Area: {FFFFFF}Well Stack Pizza",0xEEEE88FF,2104.7217,-1806.4839,13.5547+0.75,20.0,0,1);
	Create3DTextLabel("{FEB800}Area: {FFFFFF}Armeria Ammu-Nation",0xEEEE88FF,1367.8969,-1279.7985,13.5469+0.75,20.0,0,1);
	Create3DTextLabel("{FEB800}Area: {FFFFFF}Laboratorio",0xEEEE88FF,364.6920,186.1605,1019.9844+0.75,20.0,0,1);

 	// ~ Objetos y Elementos y Vehiculos ~
 	AddStaticVehicleEx(525,1585.16357422,-1671.98266602,5.88244343,270.00000000,40,40,15); //Tow Truck 1
	AddStaticVehicleEx(525,1585.05468750,-1667.38378906,5.88252258,270.00000000,40,40,15); //Tow Truck 2
	AddStaticVehicleEx(596,1601.22424316,-1683.88781738,5.71062469,90.00000000,-1,1,0); //Police Car (LSPD) 3
	AddStaticVehicleEx(596,1601.32031250,-1687.98657227,5.71062469,90.00000000,-1,1,0); //Police Car (LSPD) 4
	AddStaticVehicleEx(596,1601.36206055,-1692.06140137,5.71062469,90.00000000,-1,1,0); //Police Car (LSPD) 5
	AddStaticVehicleEx(596,1601.40673828,-1696.48547363,5.71062469,90.00000000,-1,1,0); //Police Car (LSPD) 6
	AddStaticVehicleEx(596,1601.44628906,-1700.38525391,5.71062469,90.00000000,-1,1,0); //Police Car (LSPD) 7
	AddStaticVehicleEx(596,1601.48510742,-1704.15954590,5.71062469,90.00000000,-1,1,0); //Police Car (LSPD) 8
	AddStaticVehicleEx(596,1595.37170410,-1709.79357910,5.71062469,0.00000000,-1,1,0); //Police Car (LSPD) 9
	AddStaticVehicleEx(596,1591.69311523,-1709.71215820,5.71062469,0.00000000,-1,1,0); //Police Car (LSPD) 10
	AddStaticVehicleEx(596,1587.52233887,-1710.18664551,5.71062469,0.00000000,-1,1,0); //Police Car (LSPD) 11
	AddStaticVehicleEx(596,1583.60266113,-1710.39611816,5.71062469,0.00000000,-1,1,0); //Police Car (LSPD) 12
	AddStaticVehicleEx(596,1578.50964355,-1710.39965820,5.71062469,0.00000000,-1,1,0); //Police Car (LSPD) 13
	AddStaticVehicleEx(596,1574.36083984,-1710.24450684,5.71062469,0.00000000,-1,1,0); //Police Car (LSPD) 14
	AddStaticVehicleEx(596,1570.47900391,-1710.33569336,5.71062469,0.00000000,-1,1,0); //Police Car (LSPD) 15
	AddStaticVehicleEx(601,1565.98828125,-1710.19763184,5.82083368,0.00000000,-1,-1,0); //S.W.A.T. Van 16
	AddStaticVehicleEx(601,1562.99572754,-1710.23706055,5.82083368,0.00000000,-1,-1,0); //S.W.A.T. Van 17
	AddStaticVehicleEx(528,1558.85900879,-1710.28430176,6.07562494,0.00000000,-1,-1,0); //PRES Truck 18
	AddStaticVehicleEx(599,1528.97387695,-1688.00634766,6.27575159,270.00000000,-1,1,0); //Police Ranger 19
	AddStaticVehicleEx(599,1528.86303711,-1684.03283691,6.27575159,270.00000000,-1,1,0); //Police Ranger 20
	AddStaticVehicleEx(596,1544.21643066,-1684.18994141,5.71062469,90.00000000,1,1,0); //Police Car (LSPD) 21
	AddStaticVehicleEx(596,1544.15869141,-1680.03906250,5.71062469,90.00000000,1,1,0); //Police Car (LSPD) 22
	AddStaticVehicleEx(596,1544.10351562,-1676.03906250,5.71062469,90.00000000,1,1,0); //Police Car (LSPD) 23
	AddStaticVehicleEx(596,1544.04675293,-1671.86437988,5.71062469,90.00000000,1,1,0); //Police Car (LSPD) 24
	AddStaticVehicleEx(596,1543.99121094,-1667.86425781,5.71062469,90.00000000,1,1,0); //Police Car (LSPD) 25
	AddStaticVehicleEx(427,1545.06323242,-1663.04199219,6.13862514,90.00000000,-1,1,0); //Enforcer 26
	AddStaticVehicleEx(427,1545.11572266,-1658.89062500,6.13862514,90.00000000,-1,1,0); //Enforcer 27
	AddStaticVehicleEx(427,1545.11596680,-1654.86059570,6.13862514,90.00000000,-1,1,0); //Enforcer 28
	AddStaticVehicleEx(427,1545.15527344,-1651.05895996,6.13862514,90.00000000,-1,1,0); //Enforcer 29
	AddStaticVehicleEx(415,1538.57360840,-1645.37170410,5.74014664,180.00000000,-1,1,0); //Cheetah 30
	AddStaticVehicleEx(415,1534.47094727,-1645.42187500,5.74014664,180.00000000,-1,1,0); //Cheetah 31
	AddStaticVehicleEx(415,1530.75561523,-1645.57653809,5.74014664,180.00000000,-1,1,0); //Cheetah 32
	AddStaticVehicleEx(415,1526.34716797,-1645.78063965,5.74014664,180.00000000,-1,1,0); //Cheetah 33
	AddStaticVehicleEx(523,1562.54858398,-1692.09899902,5.55100250,210.00000000,-1,-1,0); //HPV1000 34
	AddStaticVehicleEx(523,1562.50170898,-1693.67517090,5.55100250,209.99816895,-1,-1,0); //HPV1000 35
	AddStaticVehicleEx(523,1562.46508789,-1694.90100098,5.55100250,209.99816895,-1,-1,0); //HPV1000 36
	AddStaticVehicleEx(523,1562.42895508,-1696.12658691,5.55100250,209.99816895,-1,-1,0); //HPV1000 37
	AddStaticVehicleEx(523,1562.38842773,-1697.50231934,5.55100250,209.99816895,-1,-1,0); //HPV1000 38
	AddStaticVehicleEx(523,1560.13549805,-1697.43603516,5.55100250,209.99816895,-1,-1,0); //HPV1000 39
	AddStaticVehicleEx(523,1560.16259766,-1696.00915527,5.55100250,209.99816895,-1,-1,0); //HPV1000 40
	AddStaticVehicleEx(523,1560.18115234,-1695.03283691,5.55100250,209.99816895,-1,-1,0); //HPV1000 41
	AddStaticVehicleEx(523,1560.20117188,-1693.98120117,5.55100250,209.99816895,-1,-1,0); //HPV1000 42
	AddStaticVehicleEx(523,1560.21826172,-1693.10461426,5.55100250,209.99816895,-1,-1,0); //HPV1000 43
	AddStaticVehicleEx(523,1560.23925781,-1692.00341797,5.55100250,209.99816895,-1,-1,0); //HPV1000 44
	AddStaticVehicleEx(497,1565.18640137,-1655.79040527,28.66060638,90.00000000,-1,1,0); //Police Maverick 45
	AddStaticVehicleEx(497,1565.24804688,-1644.00378418,28.66711426,90.00000000,-1,1,0); //Police Maverick 46

	AddStaticVehicleEx(416,1191.63854980,-1304.33007812,13.68898106,180.00000000,1,1,0); //Ambulance 47
	AddStaticVehicleEx(416,1191.65490723,-1313.34741211,13.69801331,180.00000000,1,1,0); //Ambulance 48
	AddStaticVehicleEx(416,1191.64953613,-1326.09423828,13.69801331,180.00000000,3,1,0); //Ambulance 49
	AddStaticVehicleEx(416,1191.79882812,-1334.83508301,13.69801331,180.00000000,3,1,0); //Ambulance 50
	AddStaticVehicleEx(416,1191.81835938,-1343.56433105,13.69937420,180.00000000,3,1,0); //Ambulance 51
	AddStaticVehicleEx(407,1191.68518066,-1355.27087402,13.75734806,180.00000000,3,1,0); //Firetruck 52
	AddStaticVehicleEx(407,1191.63635254,-1365.43566895,13.74422550,180.00000000,3,1,0); //Firetruck 53
	AddStaticVehicleEx(407,1191.58679199,-1375.09716797,13.72829056,180.00000000,3,1,0); //Firetruck 54
	AddStaticVehicleEx(563,1155.66870117,-1299.17895508,32.39337158,180.00000000,1,6,15); //Raindance 55
	AddStaticVehicleEx(563,1167.21801758,-1299.77429199,32.37452316,180.00000000,1,6,15); //Raindance 56
	AddStaticVehicleEx(487,1155.82434082,-1316.82495117,31.76898575,0.00000000,3,1,0); //Maverick 57
	AddStaticVehicleEx(487,1167.55688477,-1316.80651855,31.74892998,0.00000000,3,1,0); //Maverick 58

	AddStaticVehicleEx(409,1276.41845703,-1373.01928711,13.17183018,0.00000000,-1,-1,0); //Stretch 59
	AddStaticVehicleEx(409,1282.77233887,-1372.90832520,13.28198147,0.00000000,-1,-1,0); //Stretch 60
	AddStaticVehicleEx(490,1282.83544922,-1295.49475098,13.70263672,90.00000000,-1,-1,0); //PRES Rancher 61
	AddStaticVehicleEx(490,1282.95410156,-1300.16503906,13.70481873,90.00000000,-1,-1,0); //PRES Rancher 62
	AddStaticVehicleEx(560,1282.65747070,-1322.46789551,13.13783932,180.00000000,-1,1,0); //Sultan 63
	AddStaticVehicleEx(490,1283.29711914,-1310.11877441,13.70511723,90.00000000,-1,-1,0); //PRES Rancher 64
	AddStaticVehicleEx(490,1282.99609375,-1304.80859375,13.70481873,90.00000000,-1,-1,0); //PRES Rancher 65
	AddStaticVehicleEx(490,1283.83386230,-1315.61230469,13.70800114,90.00000000,-1,-1,0); //PRES Rancher 66
	AddStaticVehicleEx(560,1282.59326172,-1328.82263184,13.13523579,180.00000000,-1,1,0); //Sultan 67
	AddStaticVehicleEx(560,1282.66760254,-1335.19018555,13.13549042,180.00000000,-1,1,0); //Sultan 68
	AddStaticVehicleEx(560,1282.63122559,-1341.68457031,13.13780785,180.00000000,-1,1,0); //Sultan 69
	AddStaticVehicleEx(405,172.87802124,123.13710022,467.04565430,0.00000000,-1,-1,0); //Sentinel 70
	AddStaticVehicleEx(405,176.47705078,122.38719177,476.95248413,0.00000000,-1,-1,0); //Sentinel 71
	AddStaticVehicleEx(487,1315.55017090,-1299.63891602,35.92356110,0.00000000,-1,1,0); //Maverick 72
	AddStaticVehicleEx(487,1303.18750000,-1299.75659180,35.92192078,0.00000000,-1,1,0); //Maverick 73
	AddStaticVehicleEx(581,1276.08288574,-1362.06958008,13.00369644,309.99572754,-1,1,0); //BF-400 74
	AddStaticVehicleEx(581,1275.97705078,-1360.77856445,13.01008892,309.99572754,-1,1,0); //BF-400 75
	AddStaticVehicleEx(581,1275.99890137,-1359.41882324,13.01750660,309.99572754,-1,1,0); //BF-400 76
	AddStaticVehicleEx(581,1276.10815430,-1358.15527344,13.02485466,309.99572754,-1,1,0); //BF-400 77
	AddStaticVehicleEx(581,1276.00683594,-1356.99377441,13.03057480,309.99572754,-1,1,0); //BF-400 78
	AddStaticVehicleEx(581,1275.98632812,-1355.88476562,13.03642654,309.99572754,-1,1,0); //BF-400 79

	AddStaticVehicleEx(420,1787.02478027,-1897.17041016,13.24446201,89.99951172,6,1, 0); //Taxi 80
	AddStaticVehicleEx(420,1787.04211426,-1892.20556641,13.24447441,89.99951172,6,1, 0); //Taxi 81
	AddStaticVehicleEx(420,1786.87512207,-1887.28747559,13.24435234,89.99951172,6,1, 0); //Taxi 82
	AddStaticVehicleEx(420,1777.90527344,-1902.79663086,13.23778057,269.99951172,6,1, 0); //Taxi 83
	AddStaticVehicleEx(420,1777.91027832,-1897.42053223,13.23778439,269.99450684,6,1, 0); //Taxi 84
	AddStaticVehicleEx(420,1778.26721191,-1892.76440430,13.23804569,269.99450684,6,1, 0); //Taxi 85
	AddStaticVehicleEx(420,1778.20654297,-1887.62207031,13.23834038,269.99450684,6,1, 0); //Taxi 86
	AddStaticVehicleEx(420,1787.07324219,-1902.30273438,13.24449825,91.99951172,6,1, 0); //Taxi 87
	AddStaticVehicleEx(420,1784.19750977,-1932.68835449,13.23637009,359.99951172,6,1, 0); //Taxi 88
	AddStaticVehicleEx(420,1787.40087891,-1932.62329102,13.23640156,359.99450684,6,1, 0); //Taxi 89
	AddStaticVehicleEx(420,1791.06262207,-1932.49304199,13.23646545,359.99450684,6,1, 0); //Taxi 90
	AddStaticVehicleEx(420,1794.65991211,-1932.36267090,13.23652840,359.99450684,6,1, 0); //Taxi 91
	AddStaticVehicleEx(420,1798.32116699,-1932.42785645,13.23649693,359.99450684,6,1, 0); //Taxi 92
	AddStaticVehicleEx(420,1780.34045410,-1932.68835449,13.23637009,359.99450684,6,1, 0); //Taxi 93
	AddStaticVehicleEx(437,1734.34069824,-1857.46350098,13.66406250,270.00000000,-1,-1,0); //Coach 94
	AddStaticVehicleEx(437,1734.27709961,-1852.70690918,13.66406250,270.00000000,-1,-1,0); //Coach 95
	AddStaticVehicleEx(437,1753.34729004,-1857.35803223,13.66406250,270.00000000,-1,-1,0); //Coach 96
	AddStaticVehicleEx(437,1753.26501465,-1852.86474609,13.66406250,270.00000000,-1,-1,0); //Coach 97
	AddStaticVehicleEx(437,1770.87109375,-1857.23779297,13.66406250,270.00000000,-1,-1,0); //Coach 98
	AddStaticVehicleEx(437,1770.74597168,-1852.94665527,13.66406250,270.00000000,-1,-1,0); //Coach 99
	AddStaticVehicleEx(437,1789.16748047,-1857.35375977,13.66406250,270.00000000,-1,-1,0); //Coach 100
	AddStaticVehicleEx(437,1789.04882812,-1852.74792480,13.66406250,270.00000000,-1,-1,0); //Coach 101
	AddStaticVehicleEx(437,1805.99890137,-1857.24523926,13.66406250,270.00000000,-1,-1,0); //Coach 102
	AddStaticVehicleEx(437,1805.75476074,-1852.25378418,13.66406250,270.00000000,-1,-1,0); //Coach 103

 	AddStaticVehicleEx(582,769.55847168,-1346.05236816,13.67760563,90.00000000,-1,1, 0); //Newsvan 104
	AddStaticVehicleEx(582,769.55615234,-1350.80847168,13.68541813,90.00000000,-1,1, 0); //Newsvan 105
	AddStaticVehicleEx(582,769.68579102,-1355.42700195,13.68557644,90.00000000,-1,1, 0); //Newsvan 106
	AddStaticVehicleEx(582,769.54345703,-1359.71276855,13.68540192,90.00000000,-1,1, 0); //Newsvan 107
	AddStaticVehicleEx(582,769.47906494,-1365.73242188,13.67750835,90.00000000,-1,1, 0); //Newsvan 108
	AddStaticVehicleEx(582,769.45623779,-1369.95910645,13.67748165,90.00000000,-1,1, 0); //Newsvan 109
	AddStaticVehicleEx(582,769.36584473,-1374.18969727,13.73223686,90.00000000,-1,1, 0); //Newsvan 110
	AddStaticVehicleEx(582,769.34790039,-1378.60559082,13.78371048,90.00000000,-1,1, 0); //Newsvan 111
	AddStaticVehicleEx(488,738.90844727,-1379.78747559,29.19502640,270.00000000,-1,1, 0); //News Chopper 112
	AddStaticVehicleEx(488,746.10992432,-1372.48034668,29.19020462,270.00000000,-1,1, 0); //News Chopper 113
	AddStaticVehicleEx(488,738.68603516,-1363.73681641,29.19502640,270.00000000,-1,1, 0); //News Chopper 114

	AddStaticVehicleEx(525,2428.97412109,-2112.42968750,13.53687477,270.00000000,3,87, 0); //Tow Truck 115
	AddStaticVehicleEx(525,2428.94140625,-2118.96289062,13.53687477,270.00000000,3,87, 0); //Tow Truck 116
	AddStaticVehicleEx(525,2442.64746094,-2119.08447266,13.53687477,90.00000000,3,87, 0); //Tow Truck 117
	AddStaticVehicleEx(525,2442.68286133,-2115.83178711,13.53687477,90.00000000,3,87, 0); //Tow Truck 188
	AddStaticVehicleEx(525,2442.62084961,-2112.68481445,13.53687477,90.00000000,3,87, 0); //Tow Truck 119
	AddStaticVehicleEx(525,2442.58813477,-2109.02587891,13.54299164,90.00000000,3,87, 0); //Tow Truck 120
	AddStaticVehicleEx(525,2442.58984375,-2105.63867188,13.53687477,90.00000000,3,87, 0); //Tow Truck 121
	AddStaticVehicleEx(562,2517.28735352,-2118.62280273,13.30042458,48.00000000,0,1, 0); //Elegy (Exposicion) 122
	AddStaticVehicleEx(534,2510.52343750,-2118.62182617,13.36975193,306.00000000,0,1, 0); //Remington(Exposicion) 123
	AddStaticVehicleEx(451,2528.96826172,-2099.33520508,13.31124687,72.00000000,3,1, 0); //Turismo(Exposicion) 124
	AddStaticVehicleEx(541,2529.12158203,-2102.81738281,13.24687481,95.99975586,-1,1, 0); //Bullet(Exposicion) 125

	AddStaticVehicleEx(405,1760.72900391,-1680.17297363,13.55836582,90.00000000,55,1,0); //Sentinel 126
	AddStaticVehicleEx(405,1760.64587402,-1675.69274902,13.55824375,90.00000000,55,1,0); //Sentinel 127
	AddStaticVehicleEx(405,1760.54016113,-1671.15588379,13.55808926,90.00000000,55,1,0); //Sentinel 128
	AddStaticVehicleEx(405,1760.55468750,-1666.61914062,13.55811024,90.00000000,55,1,0); //Sentinel 129
	AddStaticVehicleEx(405,1760.49414062,-1662.25976562,13.55802250,90.00000000,55,1,0); //Sentinel 130

    AddStaticVehicleEx(462,834.06072998,-1335.12084961,13.24271679,0.00000000,53,1,0); //Faggio 131
	AddStaticVehicleEx(462,836.18518066,-1335.14086914,13.24271679,0.00000000,53,1,0); //Faggio 132
	AddStaticVehicleEx(462,838.33398438,-1335.16162109,13.24271679,0.00000000,53,1,0); //Faggio 133
	AddStaticVehicleEx(462,840.43347168,-1335.18188477,13.24271679,0.00000000,53,1,0); //Faggio 134
	AddStaticVehicleEx(462,842.48315430,-1335.20166016,13.24271679,0.00000000,53,1,0); //Faggio 135
	AddStaticVehicleEx(462,844.60729980,-1335.22192383,13.24271679,0.00000000,53,1,0); //Faggio 136
	AddStaticVehicleEx(462,846.60644531,-1335.24121094,13.24271679,0.00000000,53,1,0); //Faggio 137

	AddStaticVehicleEx(436,1362.78063965,-1634.95227051,13.26080608,270.00000000,104,1,0); //Previon 138
	AddStaticVehicleEx(436,1362.70092773,-1638.20056152,13.26080608,270.00000000,104,1,0); //Previon 139
	AddStaticVehicleEx(436,1362.62695312,-1641.19873047,13.26080608,270.00000000,104,1,0); //Previon 140
	AddStaticVehicleEx(436,1362.55371094,-1644.19677734,13.26080608,270.00000000,104,1,0); //Previon 141
	AddStaticVehicleEx(436,1362.47436523,-1647.44470215,13.26080608,270.00000000,104,1,0); //Previon 142
	AddStaticVehicleEx(436,1362.40649414,-1650.19299316,13.26080608,270.00000000,104,1,0); //Previon 143
	AddStaticVehicleEx(436,1362.33300781,-1653.19091797,13.26080608,270.00000000,104,1,0); //Previon 144
	AddStaticVehicleEx(436,1362.25366211,-1656.43884277,13.26080608,270.00000000,104,1,0); //Previon 145
	AddStaticVehicleEx(436,1362.17358398,-1659.68688965,13.26080608,270.00000000,104,1,0); //Previon 146
	AddStaticVehicleEx(436,1362.10571289,-1662.43518066,13.26080608,270.00000000,104,1,0); //Previon 157

	AddStaticVehicleEx(414,337.39999390,-1789.69995117,5.09999990,179.99450684,35,1,15); //Mule 158
	AddStaticVehicleEx(414,330.89999390,-1789.90002441,5.09999990,179.99450684,35,1,15); //Mule 159
	AddStaticVehicleEx(414,324.89999390,-1789.80004883,5.09999990,179.99450684,35,1,15); //Mule 160
	AddStaticVehicleEx(414,318.50000000,-1789.80004883,5.09999990,179.99450684,35,1,15); //Mule 161
	AddStaticVehicleEx(414,312.10000610,-1789.90002441,5.09999990,179.99450684,35,1,15); //Mule 162

	// - Interior HQ Taxistas
	CreateDynamicObject(1569,2522.56713867,-1287.39514160,1053.64062500,0.00000000,0.00000000,90.00000000); //object(adam_v_door) (1)
	CreateDynamicObject(1569,2522.57470703,-1284.39807129,1053.62780762,0.00000000,0.00000000,270.00000000); //object(adam_v_door) (2)
	CreateDynamicObject(1569,2536.11181641,-1298.19995117,1053.64062500,0.00000000,0.00000000,0.00000000); //object(adam_v_door) (3)
	CreateDynamicObject(1569,2539.10791016,-1298.18615723,1053.64062500,0.00000000,0.00000000,180.00000000); //object(adam_v_door) (4)
	CreateDynamicObject(2190,2538.26782227,-1283.87353516,1054.90502930,0.00000000,0.00000000,60.00000000); //object(pc_1) (1)
	CreateDynamicObject(2190,2538.21704102,-1285.53796387,1054.90502930,0.00000000,0.00000000,59.99633789); //object(pc_1) (2)
	CreateDynamicObject(2190,2538.18237305,-1287.33483887,1054.90502930,0.00000000,0.00000000,79.99633789); //object(pc_1) (3)
	CreateDynamicObject(2186,2538.45361328,-1282.48754883,1053.64062500,0.00000000,0.00000000,90.00000000); //object(photocopier_1) (1)
	CreateDynamicObject(2225,2539.84204102,-1288.56848145,1053.64062500,0.00000000,0.00000000,180.00000000); //object(swank_hi_fi_2) (1)
	CreateDynamicObject(1671,2539.84936523,-1285.80029297,1054.10083008,0.00000000,0.00000000,270.00000000); //object(swivelchair_a) (1)
	CreateDynamicObject(1671,2539.85009766,-1283.98498535,1054.10083008,0.00000000,0.00000000,270.00000000); //object(swivelchair_a) (2)
	CreateDynamicObject(1671,2539.83666992,-1287.43640137,1054.10083008,0.00000000,0.00000000,270.00000000); //object(swivelchair_a) (3)
	CreateDynamicObject(14603,2541.86523438,-1304.07617188,1063.43542480,0.00000000,0.00000000,180.00000000); //object(bikeschl_main) (1)
	CreateDynamicObject(1569,2541.25683594,-1299.48400879,1061.65417480,0.00000000,0.00000000,0.00000000); //object(adam_v_door) (5)
	CreateDynamicObject(1569,2544.23535156,-1299.49536133,1061.65417480,0.00000000,0.00000000,179.50000000); //object(adam_v_door) (6)
	CreateDynamicObject(1808,2542.97534180,-1305.94750977,1061.79492188,0.00000000,0.00000000,180.00000000); //object(cj_watercooler2) (1)
	CreateDynamicObject(1809,2534.33056641,-1299.66564941,1061.65417480,0.00000000,0.00000000,40.00000000); //object(med_hi_fi) (1)
	CreateDynamicObject(1828,2537.92846680,-1304.28942871,1061.65417480,0.00000000,0.00000000,0.00000000); //object(man_sdr_rug) (1)
	CreateDynamicObject(2230,2533.91821289,-1305.94934082,1061.65417480,0.00000000,0.00000000,131.00000000); //object(swank_speaker_2) (1)
	CreateDynamicObject(2596,2534.50634766,-1299.53039551,1064.75769043,0.00000000,0.00000000,30.00000000); //object(cj_sex_tv) (1)
	CreateDynamicObject(2631,2542.92553711,-1300.56860352,1061.65051270,0.00000000,0.00000000,0.00000000); //object(gym_mat1) (1)
	CreateDynamicObject(2853,2537.78247070,-1302.81042480,1062.15966797,0.00000000,0.00000000,0.00000000); //object(gb_bedmags03) (1)
	CreateDynamicObject(1671,2545.41381836,-1304.27368164,1062.11437988,0.00000000,0.00000000,190.00000000); //object(swivelchair_a) (4)
	CreateDynamicObject(1726,2536.01733398,-1301.32897949,1061.65417480,0.00000000,0.00000000,0.00000000); //object(mrk_seating2) (1)
	CreateDynamicObject(1727,2539.50756836,-1302.54394531,1061.65417480,0.00000000,0.00000000,270.00000000); //object(mrk_seating2b) (1)
	CreateDynamicObject(2311,2538.07568359,-1302.75427246,1061.65417480,0.00000000,0.00000000,180.00000000); //object(cj_tv_table2) (1)
	CreateDynamicObject(1671,2537.88256836,-1305.46716309,1062.11437988,0.00000000,0.00000000,169.99572754); //object(swivelchair_a) (5)
	CreateDynamicObject(1809,2534.33007812,-1299.66503906,1062.12963867,0.00000000,0.00000000,39.99572754); //object(med_hi_fi) (2)
	CreateDynamicObject(1809,2534.33007812,-1299.66503906,1062.65515137,0.00000000,0.00000000,39.99572754); //object(med_hi_fi) (3)
	CreateDynamicObject(1998,2544.52978516,-1304.06359863,1061.65832520,0.00000000,0.00000000,0.00000000); //object(officedesk1l) (1)
	CreateDynamicObject(2008,2546.47827148,-1303.08227539,1061.65417480,0.00000000,0.00000000,0.00000000); //object(officedesk1) (1)
	CreateDynamicObject(1671,2538.97070312,-1304.85253906,1062.11437988,0.00000000,0.00000000,219.99572754); //object(swivelchair_a) (6)
	CreateDynamicObject(1671,2547.34399414,-1304.04870605,1062.11437988,0.00000000,0.00000000,179.99755859); //object(swivelchair_a) (7)

  	// - Interior HQ LSMD
	CreateDynamicObject(1569,367.70098877,163.65301514,1018.98437500,0.00000000,0.00000000,270.00000000); //object(adam_v_door) (1)
	CreateDynamicObject(1569,367.70605469,160.67741394,1018.98437500,0.00000000,0.00000000,90.00000000); //object(adam_v_door) (2)
	CreateDynamicObject(2924,369.67404175,161.08549500,1020.17797852,0.00000000,0.00000000,270.00000000); //object(kmb_crash3door) (1)
	CreateDynamicObject(2924,369.68917847,163.86270142,1020.17797852,0.00000000,0.00000000,90.00000000); //object(kmb_crash3door) (2)
	CreateDynamicObject(3055,367.80429077,163.41911316,1021.18249512,0.00000000,0.00000000,90.00000000); //object(kmb_shutter) (1)
	CreateDynamicObject(3055,369.55328369,163.37985229,1021.18249512,0.00000000,0.00000000,90.00000000); //object(kmb_shutter) (2)
	CreateDynamicObject(1671,366.39840698,168.43653870,1019.44458008,0.00000000,0.00000000,0.00000000); //object(swivelchair_a) (1)
	CreateDynamicObject(1727,360.40695190,169.52040100,1018.98437500,0.00000000,0.00000000,180.00000000); //object(mrk_seating2b) (1)
	CreateDynamicObject(1998,367.26852417,168.35902405,1018.98437500,0.00000000,0.00000000,180.00000000); //object(officedesk1l) (1)
	CreateDynamicObject(2008,365.37506104,167.38752747,1018.98437500,0.00000000,0.00000000,180.00000000); //object(officedesk1) (1)
	CreateDynamicObject(1671,364.49313354,168.43513489,1019.44458008,0.00000000,0.00000000,0.00000000); //object(swivelchair_a) (2)
	CreateDynamicObject(1726,359.18490601,169.48803711,1018.98437500,0.00000000,0.00000000,180.00000000); //object(mrk_seating2) (1)
	CreateDynamicObject(1726,359.16894531,169.49804688,1018.98437500,0.00000000,0.00000000,179.99450684); //object(mrk_seating2) (3)
	CreateDynamicObject(1997,349.48501587,169.45129395,1018.99121094,0.00000000,0.00000000,90.00000000); //object(hos_trolley) (1)
	CreateDynamicObject(1997,350.80545044,164.92907715,1018.98437500,0.00000000,0.00000000,90.00000000); //object(hos_trolley) (2)
	CreateDynamicObject(1997,350.82812500,164.01464844,1018.99121094,0.00000000,0.00000000,90.00000000); //object(hos_trolley) (3)
	CreateDynamicObject(1997,351.57690430,169.49650574,1018.99121094,0.00000000,0.00000000,90.00000000); //object(hos_trolley) (4)
	CreateDynamicObject(1569,367.70605469,160.67675781,1018.98437500,0.00000000,0.00000000,90.00000000); //object(adam_v_door) (3)
	CreateDynamicObject(1569,367.70605469,160.67675781,1018.98437500,0.00000000,0.00000000,90.00000000); //object(adam_v_door) (4)
	CreateDynamicObject(1569,366.17065430,186.88465881,1018.98437500,0.00000000,0.00000000,180.00000000); //object(adam_v_door) (5)
	CreateDynamicObject(1569,363.26983643,186.88049316,1018.98437500,0.00000000,0.00000000,359.99450684); //object(adam_v_door) (6)
	CreateDynamicObject(2922,366.35269165,186.83412170,1020.59741211,0.00000000,0.00000000,180.00000000); //object(kmb_keypad) (1)

	// - Ambientacion en la playerid
	CreateDynamicObject(2404,164.39707947,-1885.73474121,1.21609747,0.00000000,0.00000000,150.00000000); //object(cj_surf_board) (1)
	CreateDynamicObject(2404,163.89328003,-1885.19116211,1.15357602,0.00000000,0.00000000,109.99633789); //object(cj_surf_board) (2)
	CreateDynamicObject(2404,163.50099182,-1884.57653809,1.23369467,0.00000000,0.00000000,129.99511719); //object(cj_surf_board) (3)
	CreateDynamicObject(9237,342.54437256,-1833.14587402,10.81656265,0.00000000,0.00000000,20.00000000); //object(lighhouse_sfn) (1)
	CreateDynamicObject(9245,329.49218750,-1823.23681641,14.93171883,0.00000000,0.00000000,0.00000000); //object(cstguard_sfn01) (1)
	CreateDynamicObject(1610,331.83532715,-1864.76806641,1.96210575,0.00000000,0.00000000,0.00000000); //object(sandcastle1) (1)
	CreateDynamicObject(1610,331.53213501,-1865.33178711,1.94749975,0.00000000,0.00000000,0.00000000); //object(sandcastle1) (2)
	CreateDynamicObject(1610,331.32043457,-1864.82824707,1.96031046,0.00000000,0.00000000,0.00000000); //object(sandcastle1) (3)
	CreateDynamicObject(1610,281.73818970,-1817.12548828,3.17763233,0.00000000,0.00000000,0.00000000); //object(sandcastle1) (4)
	CreateDynamicObject(1610,282.34548950,-1818.14990234,3.15312767,0.00000000,0.00000000,0.00000000); //object(sandcastle1) (5)
	CreateDynamicObject(1610,281.44238281,-1817.81982422,3.15808582,0.00000000,0.00000000,0.00000000); //object(sandcastle1) (6)
	CreateDynamicObject(1610,281.29470825,-1818.92614746,3.12829018,0.00000000,0.00000000,0.00000000); //object(sandcastle1) (7)
	CreateDynamicObject(1611,282.60696411,-1819.72021484,3.11279011,0.00000000,0.00000000,0.00000000); //object(sandcastle2) (1)
	CreateDynamicObject(1611,281.52166748,-1820.43371582,3.08946228,0.00000000,0.00000000,0.00000000); //object(sandcastle2) (2)
	CreateDynamicObject(1611,281.90682983,-1819.15014648,3.12491989,0.00000000,0.00000000,0.00000000); //object(sandcastle2) (3)
	CreateDynamicObject(1637,167.33903503,-1951.87133789,4.05971241,0.00000000,0.00000000,230.00000000); //object(od_pat_hutb) (1)
	CreateDynamicObject(1641,640.46832275,-1854.10803223,4.46093750,0.00000000,0.00000000,0.00000000); //object(beachtowel03) (1)
	CreateDynamicObject(1640,640.37249756,-1858.36914062,4.46093750,0.00000000,0.00000000,0.00000000); //object(beachtowel04) (2)
	CreateDynamicObject(1642,644.58508301,-1856.07775879,4.46093750,0.00000000,0.00000000,0.00000000); //object(beachtowel02) (1)
	CreateDynamicObject(1642,643.44720459,-1856.08886719,4.46093750,0.00000000,0.00000000,0.00000000); //object(beachtowel02) (2)

	// - Antenas 3G
	CreateDynamicObject(3876,1451.04516602,-781.42395020,92.15465546,0.00000000,0.00000000,0.00000000); //object(sf_roofmast) (1)
	CreateDynamicObject(3876,1456.71008301,-775.59277344,92.42509460,0.00000000,0.00000000,0.00000000); //object(sf_roofmast) (2)
	CreateDynamicObject(3876,1465.05761719,-779.90527344,91.11297607,0.00000000,0.00000000,0.00000000); //object(sf_roofmast) (3)
	CreateDynamicObject(958,1461.88220215,-785.94647217,92.22963715,0.00000000,0.00000000,222.00000000); //object(cj_chip_maker) (1)
	CreateDynamicObject(959,1461.89025879,-785.91925049,92.22029114,0.00000000,0.00000000,221.99572754); //object(cj_chip_maker_bits) (1)
	CreateDynamicObject(3876,355.54687500,-1819.13867188,3.25121307,0.00000000,0.00000000,0.00000000); //object(sf_roofmast) (3)
	CreateDynamicObject(3876,349.02789307,-1819.10131836,3.24754143,0.00000000,0.00000000,0.00000000); //object(sf_roofmast) (3)
	CreateDynamicObject(3876,349.02789307,-1819.10131836,3.24754143,0.00000000,0.00000000,0.00000000); //object(sf_roofmast) (3)
	CreateDynamicObject(959,352.36071777,-1819.12988281,4.16955996,0.00000000,0.00000000,180.00000000); //object(cj_chip_maker_bits) (2)
	CreateDynamicObject(958,352.37658691,-1819.14453125,4.12557030,0.00000000,0.00000000,180.00000000); //object(cj_chip_maker) (2)
	CreateDynamicObject(3876,704.65545654,-913.72961426,76.17227936,0.00000000,0.00000000,0.00000000); //object(sf_roofmast) (3)
	CreateDynamicObject(3876,707.19451904,-921.21520996,74.68670654,0.00000000,0.00000000,0.00000000); //object(sf_roofmast) (3)
	CreateDynamicObject(3876,2282.01391602,-1116.93225098,36.97656250,0.00000000,0.00000000,0.00000000); //object(sf_roofmast) (3)
	CreateDynamicObject(958,704.23913574,-917.28173828,78.40027618,0.00000000,0.00000000,100.00000000); //object(cj_chip_maker) (3)
	CreateDynamicObject(959,704.25524902,-917.29351807,78.46439362,0.00000000,0.00000000,100.00000000); //object(cj_chip_maker_bits) (3)
	CreateDynamicObject(3876,707.11718750,-915.45019531,76.52343750,0.00000000,0.00000000,0.00000000); //object(sf_roofmast) (3)
	CreateDynamicObject(3876,2287.85058594,-1116.84887695,36.97656250,0.00000000,0.00000000,0.00000000); //object(sf_roofmast) (3)
	CreateDynamicObject(959,2284.85791016,-1116.06213379,37.91752243,0.00000000,0.00000000,0.00000000); //object(cj_chip_maker_bits) (4)
	CreateDynamicObject(958,2284.87329102,-1116.04504395,37.85340118,0.00000000,0.00000000,0.00000000); //object(cj_chip_maker) (4)
	CreateDynamicObject(3876,2773.11059570,-2092.14746094,10.87029457,0.00000000,0.00000000,0.00000000); //object(sf_roofmast) (3)
	CreateDynamicObject(3876,2781.34301758,-2082.01611328,10.81373978,0.00000000,0.00000000,0.00000000); //object(sf_roofmast) (3)
	CreateDynamicObject(3876,2775.29833984,-2085.58691406,10.91027641,0.00000000,0.00000000,0.00000000); //object(sf_roofmast) (3)
	CreateDynamicObject(3876,2773.17895508,-2088.93237305,10.91881943,0.00000000,0.00000000,0.00000000); //object(sf_roofmast) (3)
	CreateDynamicObject(3876,2778.43261719,-2083.29638672,10.86454773,0.00000000,0.00000000,0.00000000); //object(sf_roofmast) (3)
	CreateDynamicObject(958,2776.77148438,-2086.58105469,11.73982811,0.00000000,0.00000000,226.00000000); //object(cj_chip_maker) (5)
	CreateDynamicObject(959,2776.76806641,-2086.55029297,11.76598930,0.00000000,0.00000000,226.00000000); //object(cj_chip_maker_bits) (5)

	// - Club Cobacabana
	CreateDynamicObject(3509,2859.38525391,-1520.84497070,10.07709122,0.00000000,0.00000000,350.00000000); //object(vgsn_nitree_r01) (1)
	CreateDynamicObject(3509,2852.92382812,-1544.25695801,10.09375000,0.00000000,0.00000000,349.99694824); //object(vgsn_nitree_r01) (2)
	CreateDynamicObject(3509,2845.11645508,-1565.66125488,10.09375000,0.00000000,0.00000000,349.99694824); //object(vgsn_nitree_r01) (4)
	CreateDynamicObject(3509,2862.96923828,-1496.92749023,9.89843750,0.00000000,0.00000000,349.99694824); //object(vgsn_nitree_r01) (5)
	CreateDynamicObject(3509,2819.64575195,-1504.77856445,13.42721176,0.00000000,0.00000000,349.99694824); //object(vgsn_nitree_r01) (6)
	CreateDynamicObject(3509,2819.79052734,-1513.02832031,13.42721176,0.00000000,0.00000000,349.99694824); //object(vgsn_nitree_r01) (7)
	CreateDynamicObject(3509,2819.91748047,-1520.27832031,13.42721176,0.00000000,0.00000000,349.99694824); //object(vgsn_nitree_r01) (8)
	CreateDynamicObject(3509,2808.87475586,-1569.51501465,10.09374905,0.00000000,0.00000000,319.99694824); //object(vgsn_nitree_r01) (9)
	CreateDynamicObject(3509,2808.74633789,-1553.40380859,10.09375095,0.00000000,0.00000000,319.99328613); //object(vgsn_nitree_r01) (10)
	CreateDynamicObject(3509,2889.28125000,-1588.79565430,10.04687405,0.00000000,0.00000000,319.99328613); //object(vgsn_nitree_r01) (11)
	CreateDynamicObject(3509,2885.21508789,-1598.57470703,10.04687500,0.00000000,0.00000000,319.99328613); //object(vgsn_nitree_r01) (12)
	CreateDynamicObject(3509,2828.04077148,-1596.57519531,10.08805275,0.00000000,0.00000000,319.99328613); //object(vgsn_nitree_r01) (13)
	CreateDynamicObject(3509,2839.56469727,-1575.08544922,10.08598328,0.00000000,0.00000000,319.99328613); //object(vgsn_nitree_r01) (14)
	CreateDynamicObject(3509,2865.92651367,-1480.16479492,9.94449043,0.00000000,0.00000000,319.99328613); //object(vgsn_nitree_r01) (15)
	CreateDynamicObject(3509,2760.03491211,-1597.59631348,11.92359352,0.00000000,0.00000000,319.99328613); //object(vgsn_nitree_r01) (16)
	CreateDynamicObject(3509,2767.03417969,-1597.44531250,11.92359352,0.00000000,0.00000000,319.99328613); //object(vgsn_nitree_r01) (17)
	CreateDynamicObject(3509,2773.53417969,-1597.30566406,11.92359352,0.00000000,0.00000000,319.99328613); //object(vgsn_nitree_r01) (18)
	CreateDynamicObject(3509,2782.28417969,-1597.11767578,11.92359352,0.00000000,0.00000000,319.99328613); //object(vgsn_nitree_r01) (19)
	CreateDynamicObject(3509,2788.03417969,-1596.99365234,11.92359352,0.00000000,0.00000000,319.99328613); //object(vgsn_nitree_r01) (20)
	CreateDynamicObject(3509,2787.88916016,-1590.24316406,11.92359352,0.00000000,0.00000000,319.99328613); //object(vgsn_nitree_r01) (21)
	CreateDynamicObject(3509,2787.74365234,-1583.49316406,11.92359352,0.00000000,0.00000000,319.99328613); //object(vgsn_nitree_r01) (22)
	CreateDynamicObject(3509,2787.60888672,-1577.24316406,11.92359352,0.00000000,0.00000000,319.99328613); //object(vgsn_nitree_r01) (23)
	CreateDynamicObject(3509,2787.46337891,-1570.49316406,11.92359352,0.00000000,0.00000000,319.99328613); //object(vgsn_nitree_r01) (24)
	CreateDynamicObject(3509,2787.32324219,-1563.99316406,11.92359352,0.00000000,0.00000000,319.99328613); //object(vgsn_nitree_r01) (25)
	CreateDynamicObject(18651,2850.18994141,-1535.62133789,10.14901733,0.00000000,0.00000000,0.00000000); //object(otunnel) (1)
	CreateDynamicObject(18651,2850.18237305,-1537.59484863,10.14468575,0.00000000,0.00000000,0.00000000); //object(otunnel) (2)
	CreateDynamicObject(18651,2850.17456055,-1539.57849121,10.14356422,0.00000000,0.00000000,0.00000000); //object(otunnel) (3)
	CreateDynamicObject(18651,2850.21386719,-1529.52832031,10.12861061,0.00000000,0.00000000,0.00000000); //object(otunnel) (4)
	CreateDynamicObject(18651,2850.22167969,-1527.52343750,10.13925648,0.00000000,0.00000000,0.00000000); //object(otunnel) (5)
	CreateDynamicObject(18651,2850.22949219,-1525.50305176,10.15686035,0.00000000,0.00000000,0.00000000); //object(otunnel) (6)
	CreateDynamicObject(18651,2850.35449219,-1523.51110840,10.19065094,0.00000000,0.00000000,354.00000000); //object(otunnel) (7)
	CreateDynamicObject(18651,2810.96411133,-1570.37182617,10.11718750,0.00000000,0.00000000,0.00000000); //object(otunnel) (8)
	CreateDynamicObject(18651,2810.94653320,-1552.92077637,10.11718750,0.00000000,0.00000000,0.00000000); //object(otunnel) (9)
	CreateDynamicObject(18651,2806.82543945,-1553.00195312,10.11718750,0.00000000,0.00000000,0.00000000); //object(otunnel) (10)
	CreateDynamicObject(18651,2806.85327148,-1570.27258301,10.11718750,0.00000000,0.00000000,0.00000000); //object(otunnel) (11)
	CreateDynamicObject(18651,2808.92138672,-1572.35144043,10.11718750,0.00000000,0.00000000,270.00000000); //object(otunnel) (12)
	CreateDynamicObject(18651,2808.98144531,-1550.98767090,10.11718750,0.00000000,0.00000000,272.00000000); //object(otunnel) (13)
	CreateDynamicObject(18651,2851.69897461,-1497.39843750,14.35156250,0.00000000,0.00000000,269.99951172); //object(otunnel) (14)
	CreateDynamicObject(18651,2849.69946289,-1497.39843750,14.35156250,0.00000000,0.00000000,269.99450684); //object(otunnel) (15)
	CreateDynamicObject(18651,2847.70312500,-1497.42456055,14.35156250,0.00000000,0.00000000,269.99450684); //object(otunnel) (16)
	CreateDynamicObject(18651,2845.69458008,-1497.41979980,14.35156250,0.00000000,0.00000000,269.99450684); //object(otunnel) (17)
	CreateDynamicObject(18651,2853.67675781,-1497.40283203,14.35156250,0.00000000,0.00000000,269.99450684); //object(otunnel) (18)
	CreateDynamicObject(18651,2855.66821289,-1497.40490723,14.35156250,0.00000000,0.00000000,269.99450684); //object(otunnel) (19)
	CreateDynamicObject(18651,2843.50634766,-1562.03491211,14.35156250,0.00000000,0.00000000,0.00000000); //object(otunnel) (20)
	CreateDynamicObject(18651,2843.50317383,-1560.06616211,14.35156250,0.00000000,0.00000000,0.00000000); //object(otunnel) (21)
	CreateDynamicObject(18651,2843.50146484,-1558.08850098,14.35156250,0.00000000,0.00000000,0.00000000); //object(otunnel) (22)
	CreateDynamicObject(18651,2843.49853516,-1556.11743164,14.35156250,0.00000000,0.00000000,0.00000000); //object(otunnel) (23)
	CreateDynamicObject(18651,2843.49096680,-1554.13696289,14.35156250,0.00000000,0.00000000,0.00000000); //object(otunnel) (24)
	CreateDynamicObject(18651,2843.48022461,-1552.16186523,14.35156250,0.00000000,0.00000000,0.00000000); //object(otunnel) (25)
	CreateDynamicObject(18651,2843.48730469,-1550.16992188,14.35156250,0.00000000,0.00000000,0.00000000); //object(otunnel) (26)
	CreateDynamicObject(18651,2843.48168945,-1548.19909668,14.35156250,0.00000000,0.00000000,0.00000000); //object(otunnel) (27)
	CreateDynamicObject(18651,-2637.17382812,1401.87829590,905.48437500,0.00000000,0.00000000,270.00000000); //object(otunnel) (28)
	CreateDynamicObject(18651,-2635.63354492,1401.88696289,905.48437500,0.00000000,0.00000000,270.00000000); //object(otunnel) (29)
	CreateDynamicObject(18651,-2635.81738281,1402.21203613,905.48437500,0.00000000,0.00000000,270.00000000); //object(otunnel) (30)
	CreateDynamicObject(18651,-2656.86035156,1415.18530273,905.29687500,0.00000000,0.00000000,272.00000000); //object(otunnel) (31)
	CreateDynamicObject(18651,-2655.35205078,1415.23681641,905.29687500,0.00000000,0.00000000,271.99951172); //object(otunnel) (32)
	CreateDynamicObject(18651,-2661.24438477,1415.21301270,905.29687500,0.00000000,0.00000000,271.24951172); //object(otunnel) (33)
	CreateDynamicObject(18651,-2662.95800781,1415.18347168,905.29687500,0.00000000,0.00000000,269.24694824); //object(otunnel) (34)
	CreateDynamicObject(18651,-2663.00561523,1405.49670410,905.29687500,0.00000000,0.00000000,269.24194336); //object(otunnel) (35)
	CreateDynamicObject(18651,-2661.00585938,1405.49938965,905.29687500,0.00000000,0.00000000,271.24194336); //object(otunnel) (36)
	CreateDynamicObject(18651,-2656.86694336,1405.50292969,905.30053711,0.00000000,0.00000000,269.49145508); //object(otunnel) (37)
	CreateDynamicObject(18651,-2655.38110352,1405.50036621,905.30053711,0.00000000,0.00000000,269.48913574); //object(otunnel) (38)
	CreateDynamicObject(18651,-2670.80126953,1408.58886719,906.59375000,0.00000000,0.00000000,269.48913574); //object(otunnel) (39)
	CreateDynamicObject(18651,-2672.79882812,1408.60742188,906.59375000,0.00000000,0.00000000,269.48913574); //object(otunnel) (40)
	CreateDynamicObject(18651,-2674.79980469,1408.61853027,906.59375000,0.00000000,0.00000000,269.48913574); //object(otunnel) (41)
	CreateDynamicObject(18651,-2670.83593750,1412.15002441,906.59375000,0.00000000,0.00000000,269.48913574); //object(otunnel) (42)
	CreateDynamicObject(18651,-2672.83129883,1412.17651367,906.59375000,0.00000000,0.00000000,269.48913574); //object(otunnel) (43)
	CreateDynamicObject(18651,-2674.83154297,1412.18835449,906.59375000,0.00000000,0.00000000,269.48913574); //object(otunnel) (44)
	CreateDynamicObject(18651,-2669.60888672,1409.79443359,906.59375000,0.00000000,0.00000000,179.48913574); //object(otunnel) (45)
	CreateDynamicObject(18651,-2669.59960938,1411.03918457,906.59375000,0.00000000,0.00000000,179.48913574); //object(otunnel) (46)
	CreateDynamicObject(18651,-2669.60375977,1425.14428711,905.48437500,0.00000000,0.00000000,270.00000000); //object(otunnel) (47)
	CreateDynamicObject(18651,-2667.61718750,1425.14196777,905.48437500,0.00000000,0.00000000,270.00000000); //object(otunnel) (48)
	CreateDynamicObject(18651,-2665.63305664,1425.13928223,905.48437500,0.00000000,0.00000000,270.00000000); //object(otunnel) (49)
	CreateDynamicObject(18651,-2661.98706055,1424.28930664,905.48437500,0.00000000,0.00000000,270.00000000); //object(otunnel) (50)
	CreateDynamicObject(18651,-2659.99682617,1424.29504395,905.48437500,0.00000000,0.00000000,270.00000000); //object(otunnel) (51)
	CreateDynamicObject(18651,-2655.55541992,1424.31005859,905.48437500,0.00000000,0.00000000,270.00000000); //object(otunnel) (52)
	CreateDynamicObject(18651,-2653.55053711,1424.30126953,905.48437500,0.00000000,0.00000000,270.00000000); //object(otunnel) (53)
	CreateDynamicObject(18646,-2659.88891602,1405.22216797,909.26409912,0.00000000,0.00000000,0.00000000); //object(ramplandpad) (1)
	CreateDynamicObject(18646,-2658.41455078,1405.23583984,909.26409912,0.00000000,0.00000000,0.00000000); //object(ramplandpad) (2)
	CreateDynamicObject(18646,-2658.41967773,1415.41735840,909.26409912,0.00000000,0.00000000,0.00000000); //object(ramplandpad) (3)
	CreateDynamicObject(18646,-2659.85668945,1415.41589355,909.26409912,0.00000000,0.00000000,0.00000000); //object(ramplandpad) (4)
	CreateDynamicObject(18646,-2664.25048828,1411.02819824,909.26409912,0.00000000,0.00000000,0.00000000); //object(ramplandpad) (5)
	CreateDynamicObject(18646,-2664.25805664,1409.53808594,909.26409912,0.00000000,0.00000000,0.00000000); //object(ramplandpad) (6)
	CreateDynamicObject(18646,-2653.95776367,1409.55395508,909.26409912,0.00000000,0.00000000,0.00000000); //object(ramplandpad) (7)
	CreateDynamicObject(18646,-2653.92089844,1410.99621582,909.26409912,0.00000000,0.00000000,0.00000000); //object(ramplandpad) (8)
	CreateDynamicObject(18728,-2640.87133789,1409.72302246,905.71710205,0.00000000,0.00000000,0.00000000); //object(cegravebuil03_lawn) (1)
	CreateDynamicObject(18728,-2641.11035156,1403.34350586,905.75036621,0.00000000,0.00000000,0.00000000); //object(cegravebuil03_lawn) (2)
	CreateDynamicObject(18728,-2647.20654297,1419.09069824,905.63751221,0.00000000,0.00000000,0.00000000); //object(cegravebuil03_lawn) (3)
	CreateDynamicObject(18728,-2651.31835938,1423.77746582,905.51464844,0.00000000,0.00000000,0.00000000); //object(cegravebuil03_lawn) (4)
	CreateDynamicObject(18728,-2657.64819336,1423.89733887,905.51092529,0.00000000,0.00000000,0.00000000); //object(cegravebuil03_lawn) (5)
	CreateDynamicObject(18728,-2663.84350586,1423.81262207,905.51092529,0.00000000,0.00000000,0.00000000); //object(cegravebuil03_lawn) (6)
	CreateDynamicObject(18728,-2676.53930664,1423.64099121,905.51092529,0.00000000,0.00000000,0.00000000); //object(cegravebuil03_lawn) (7)
	CreateDynamicObject(18728,-2679.54687500,1421.03149414,905.51092529,0.00000000,0.00000000,0.00000000); //object(cegravebuil03_lawn) (8)
	CreateDynamicObject(18728,-2670.29687500,1396.89501953,905.51092529,0.00000000,0.00000000,0.00000000); //object(cegravebuil03_lawn) (9)
	CreateDynamicObject(18728,-2670.29492188,1396.73522949,911.48675537,0.00000000,0.00000000,0.00000000); //object(cegravebuil03_lawn) (10)
	CreateDynamicObject(18728,-2676.12207031,1396.93408203,905.59686279,0.00000000,0.00000000,0.00000000); //object(cegravebuil03_lawn) (11)
	CreateDynamicObject(18728,-2664.10229492,1396.85156250,905.51092529,0.00000000,0.00000000,0.00000000); //object(cegravebuil03_lawn) (12)
	CreateDynamicObject(18728,-2657.19995117,1396.94372559,905.51092529,0.00000000,0.00000000,0.00000000); //object(cegravebuil03_lawn) (13)
	CreateDynamicObject(18728,-2650.54833984,1396.88818359,905.51092529,0.00000000,0.00000000,0.00000000); //object(cegravebuil03_lawn) (14)
	CreateDynamicObject(18728,-2645.86962891,1396.78796387,905.60894775,0.00000000,0.00000000,0.00000000); //object(cegravebuil03_lawn) (15)
	CreateDynamicObject(18728,-2642.06274414,1400.30017090,905.50921631,0.00000000,0.00000000,0.00000000); //object(cegravebuil03_lawn) (16)
	CreateDynamicObject(18728,-2644.25537109,1397.89978027,905.50976562,0.00000000,0.00000000,0.00000000); //object(cegravebuil03_lawn) (17)
	CreateDynamicObject(18728,-2675.71533203,1408.20581055,905.51092529,0.00000000,0.00000000,0.00000000); //object(cegravebuil03_lawn) (18)
	CreateDynamicObject(18728,-2675.88696289,1412.39208984,905.51092529,0.00000000,0.00000000,0.00000000); //object(cegravebuil03_lawn) (19)
	CreateDynamicObject(2780,-2673.60498047,1393.97497559,901.06079102,0.00000000,0.00000000,0.00000000); //object(cj_smoke_mach) (1)
	CreateDynamicObject(2780,-2667.11083984,1393.69848633,901.06079102,0.00000000,0.00000000,0.00000000); //object(cj_smoke_mach) (2)
	CreateDynamicObject(2780,-2654.37280273,1393.15661621,901.06079102,0.00000000,0.00000000,0.00000000); //object(cj_smoke_mach) (3)
	CreateDynamicObject(2780,-2646.13012695,1392.80578613,901.06079102,0.00000000,0.00000000,0.00000000); //object(cj_smoke_mach) (4)
	CreateDynamicObject(2780,-2661.46118164,1412.05944824,900.77343750,0.00000000,0.00000000,0.00000000); //object(cj_smoke_mach) (5)
	CreateDynamicObject(2780,-2633.93701172,1395.37207031,901.06079102,0.00000000,0.00000000,0.00000000); //object(cj_smoke_mach) (6)
	CreateDynamicObject(2780,-2642.83032227,1426.00256348,901.06079102,0.00000000,0.00000000,0.00000000); //object(cj_smoke_mach) (7)
	CreateDynamicObject(2780,-2662.84570312,1435.84790039,901.06079102,0.00000000,0.00000000,0.00000000); //object(cj_smoke_mach) (8)
	CreateDynamicObject(2780,-2681.09570312,1440.47766113,901.06079102,0.00000000,0.00000000,0.00000000); //object(cj_smoke_mach) (9)
	CreateDynamicObject(3877,-2663.84448242,1423.87109375,905.77734375,0.00000000,0.00000000,39.99572754); //object(sf_rooflite) (7)
	CreateDynamicObject(3877,-2657.69531250,1423.96960449,905.77734375,0.00000000,0.00000000,39.99572754); //object(sf_rooflite) (8)
	CreateDynamicObject(3877,-2651.33496094,1423.80749512,905.77734375,0.00000000,0.00000000,39.99572754); //object(sf_rooflite) (9)
	CreateDynamicObject(3877,-2647.27148438,1419.06127930,905.77734375,0.00000000,0.00000000,39.99572754); //object(sf_rooflite) (10)
	CreateDynamicObject(3877,-2640.74707031,1409.78137207,905.77734375,0.00000000,0.00000000,39.99572754); //object(sf_rooflite) (11)
	CreateDynamicObject(3877,-2640.96533203,1403.28747559,905.77734375,0.00000000,0.00000000,39.99572754); //object(sf_rooflite) (12)
	CreateDynamicObject(3877,-2642.18261719,1400.32543945,905.77734375,0.00000000,0.00000000,39.99572754); //object(sf_rooflite) (13)
	CreateDynamicObject(3877,-2644.24633789,1397.72192383,905.77734375,0.00000000,0.00000000,39.99572754); //object(sf_rooflite) (14)
	CreateDynamicObject(3877,-2645.80712891,1396.75903320,905.77734375,0.00000000,0.00000000,39.99572754); //object(sf_rooflite) (15)
	CreateDynamicObject(3877,-2650.56738281,1396.69787598,905.77734375,0.00000000,0.00000000,39.99572754); //object(sf_rooflite) (16)
	CreateDynamicObject(3877,-2657.23364258,1396.93395996,905.77734375,0.00000000,0.00000000,39.99572754); //object(sf_rooflite) (17)
	CreateDynamicObject(3877,-2664.18481445,1396.84802246,905.77734375,0.00000000,0.00000000,39.99572754); //object(sf_rooflite) (18)
	CreateDynamicObject(3877,-2670.22583008,1397.04504395,905.77734375,0.00000000,0.00000000,39.99572754); //object(sf_rooflite) (19)
	CreateDynamicObject(3877,-2676.14379883,1396.75109863,905.77734375,0.00000000,0.00000000,39.99572754); //object(sf_rooflite) (20)
	CreateDynamicObject(3877,-2675.83911133,1408.24487305,905.77734375,0.00000000,0.00000000,39.99572754); //object(sf_rooflite) (21)
	CreateDynamicObject(3877,-2675.55688477,1412.33300781,905.77734375,0.00000000,0.00000000,39.99572754); //object(sf_rooflite) (22)
	CreateDynamicObject(3877,-2679.35888672,1421.06494141,905.77734375,0.00000000,0.00000000,39.99572754); //object(sf_rooflite) (23)
	CreateDynamicObject(3877,-2676.81494141,1423.62939453,905.77734375,0.00000000,0.00000000,39.99572754); //object(sf_rooflite) (24)
	CreateDynamicObject(2780,-2633.43652344,1411.99609375,901.06079102,0.00000000,0.00000000,0.00000000); //object(cj_smoke_mach) (10)
	CreateDynamicObject(1569,2850.76367188,-1531.27038574,10.09907246,0.00000000,0.00000000,268.00000000); //object(adam_v_door) (1)
	CreateDynamicObject(1569,2850.64501953,-1534.23486328,10.09375000,0.00000000,0.00000000,87.99499512); //object(adam_v_door) (2)
	CreateDynamicObject(18850,2961.18115234,-1517.42919922,0.00000000,0.00000000,0.00000000,348.00000000); //object(lodcehollyhil03) (1)
	CreateDynamicObject(18850,2954.25952148,-1549.16491699,0.00000000,0.00000000,0.00000000,345.99743652); //object(lodcehollyhil03) (2)
	CreateDynamicObject(18850,2945.68676758,-1580.60510254,0.00000000,0.00000000,0.00000000,345.99743652); //object(lodcehollyhil03) (3)

	// - Departamento de Transporte Publico
	CreateDynamicObject(3940,1773.10791016,-1918.17810059,15.52126694,0.00000000,0.00000000,0.00000000); //object(comms01)(1)
	CreateDynamicObject(16003,1802.62438965,-1913.09985352,13.76855469,0.00000000,0.00000000,90.00000000); //object(drvin_ticket)(1)
	CreateDynamicObject(16001,1804.23864746,-1929.70031738,12.38783073,0.00000000,0.00000000,270.00000000); //object(drvin_projhut)(1)
	CreateDynamicObject(16001,1804.22998047,-1919.16101074,12.39297485,0.00000000,0.00000000,270.00000000); //object(drvin_projhut)(2)
	CreateDynamicObject(6296,1754.38122559,-1894.06970215,14.77101898,0.00000000,0.00000000,0.00000000); //object(veropolice_law2)(1)
	CreateDynamicObject(10401,1777.18762207,-1895.16247559,14.67862892,0.00000000,0.00000000,136.00000000); //object(hc_shed02_sfs)(2)
	CreateDynamicObject(970,1790.89221191,-1902.23266602,12.94877720,0.00000000,0.00000000,90.00000000); //object(fencesmallb)(1)
	CreateDynamicObject(970,1790.92517090,-1897.29516602,12.94880199,0.00000000,0.00000000,90.00000000); //object(fencesmallb)(2)
	CreateDynamicObject(970,1790.80090332,-1892.27832031,12.94870949,0.00000000,0.00000000,90.00000000); //object(fencesmallb)(3)
	CreateDynamicObject(970,1790.66796875,-1887.27954102,12.94861221,0.00000000,0.00000000,90.00000000); //object(fencesmallb)(4)
	CreateDynamicObject(1215,1790.59375000,-1885.03747559,12.96140003,0.00000000,0.00000000,0.00000000); //object(bollardlight)(1)
	CreateDynamicObject(1215,1790.74108887,-1889.44335938,12.96150780,0.00000000,0.00000000,0.00000000); //object(bollardlight)(2)
	CreateDynamicObject(1215,1790.69335938,-1890.09570312,12.96147346,0.00000000,0.00000000,0.00000000); //object(bollardlight)(3)
	CreateDynamicObject(1215,1790.83557129,-1894.39770508,12.96157742,0.00000000,0.00000000,0.00000000); //object(bollardlight)(4)
	CreateDynamicObject(1215,1790.85937500,-1895.05920410,12.96159554,0.00000000,0.00000000,0.00000000); //object(bollardlight)(5)
	CreateDynamicObject(1215,1790.91503906,-1900.06347656,12.96163654,0.00000000,0.00000000,0.00000000); //object(bollardlight)(6)
	CreateDynamicObject(1215,1790.95959473,-1899.38403320,12.96166897,0.00000000,0.00000000,0.00000000); //object(bollardlight)(7)
	CreateDynamicObject(1215,1790.95385742,-1904.39111328,12.96166515,0.00000000,0.00000000,0.00000000); //object(bollardlight)(8)
	CreateDynamicObject(1215,1801.95056152,-1911.65039062,12.96096802,0.00000000,0.00000000,0.00000000); //object(bollardlight)(9)
	CreateDynamicObject(1215,1801.79711914,-1934.91442871,12.95444489,0.00000000,0.00000000,0.00000000); //object(bollardlight)(10)
	CreateDynamicObject(1215,1776.52124023,-1931.18066406,12.95109081,0.00000000,0.00000000,0.00000000); //object(bollardlight)(11)
	CreateDynamicObject(1215,1776.32263184,-1928.53601074,12.95094585,0.00000000,0.00000000,0.00000000); //object(bollardlight)(12)
	CreateDynamicObject(1215,1776.43603516,-1910.33666992,12.95102882,0.00000000,0.00000000,0.00000000); //object(bollardlight)(13)
	CreateDynamicObject(1215,1759.93920898,-1900.70874023,13.12801266,0.00000000,0.00000000,0.00000000); //object(bollardlight)(14)
	CreateDynamicObject(1215,1759.82324219,-1887.35815430,13.11993694,0.00000000,0.00000000,0.00000000); //object(bollardlight)(15)
	CreateDynamicObject(1215,1759.13317871,-1890.66320801,13.12010574,0.00000000,0.00000000,0.00000000); //object(bollardlight)(16)
	CreateDynamicObject(1215,1759.21398926,-1897.58569336,13.12631130,0.00000000,0.00000000,0.00000000); //object(bollardlight)(17)
	CreateDynamicObject(1257,1815.65014648,-1907.86181641,13.83739662,0.00000000,0.00000000,180.00000000); //object(bustopm)(1)
	CreateDynamicObject(3749,1811.73632812,-1889.84765625,18.27247620,0.00000000,0.00000000,270.00000000); //object(clubgate01_lax)(1)
	CreateDynamicObject(1251,1826.52160645,-1918.89575195,12.47683430,0.00000000,0.00000000,0.00000000); //object(smashbar)(1)
	CreateDynamicObject(1251,1826.47814941,-1912.09973145,12.46553516,0.00000000,0.00000000,0.00000000); //object(smashbar)(2)
	CreateDynamicObject(1251,1826.46740723,-1905.20300293,12.45382404,0.00000000,0.00000000,0.00000000); //object(smashbar)(3)
	CreateDynamicObject(1251,1826.45434570,-1898.43469238,12.44235039,0.00000000,0.00000000,0.00000000); //object(smashbar)(4)
	CreateDynamicObject(1251,1826.44042969,-1891.69934082,12.43093872,0.00000000,0.00000000,0.00000000); //object(smashbar)(5)
	CreateDynamicObject(1251,1826.42675781,-1884.93969727,12.41948414,0.00000000,0.00000000,0.00000000); //object(smashbar)(6)
	CreateDynamicObject(1251,1826.41308594,-1878.12695312,12.40793419,0.00000000,0.00000000,0.00000000); //object(smashbar)(7)
	CreateDynamicObject(1251,1826.52075195,-1856.43432617,12.51874733,0.00000000,0.00000000,0.00000000); //object(smashbar)(8)
	CreateDynamicObject(1251,1826.52331543,-1849.59094238,12.51874733,0.00000000,0.00000000,0.00000000); //object(smashbar)(9)
	CreateDynamicObject(1251,1826.51660156,-1842.67126465,12.51874733,0.00000000,0.00000000,0.00000000); //object(smashbar)(10)
	CreateDynamicObject(1251,1826.47778320,-1835.63964844,12.51874733,0.00000000,0.00000000,0.00000000); //object(smashbar)(11)
	CreateDynamicObject(1251,1826.45239258,-1828.83874512,12.51874733,0.00000000,0.00000000,0.00000000); //object(smashbar)(12)
	CreateDynamicObject(1251,1826.47973633,-1822.02709961,12.51967335,0.00000000,0.00000000,0.00000000); //object(smashbar)(13)
	CreateDynamicObject(1251,1826.47460938,-1815.25415039,12.51140308,0.00000000,0.00000000,0.00000000); //object(smashbar)(14)
	CreateDynamicObject(1251,1826.50109863,-1808.44958496,12.50309467,0.00000000,0.00000000,0.00000000); //object(smashbar)(15)
	CreateDynamicObject(1251,1826.52746582,-1801.66503906,12.49481106,0.00000000,0.00000000,0.00000000); //object(smashbar)(16)
	CreateDynamicObject(1251,1826.49121094,-1794.87866211,12.48749733,0.00000000,0.00000000,0.00000000); //object(smashbar)(17)
	CreateDynamicObject(1251,1826.48693848,-1788.03784180,12.48749733,0.00000000,0.00000000,0.00000000); //object(smashbar)(18)
	CreateDynamicObject(1251,1826.51391602,-1781.25463867,12.48749733,0.00000000,0.00000000,0.00000000); //object(smashbar)(19)
	CreateDynamicObject(1237,1812.03369141,-1900.90917969,12.57208443,0.00000000,0.00000000,0.00000000); //object(strtbarrier01)(1)
	CreateDynamicObject(1237,1813.68981934,-1900.32238770,12.57427406,0.00000000,0.00000000,0.00000000); //object(strtbarrier01)(2)
	CreateDynamicObject(1237,1814.33801270,-1879.42590332,12.57812500,0.00000000,0.00000000,0.00000000); //object(strtbarrier01)(3)
	CreateDynamicObject(1237,1811.30322266,-1878.38073730,12.58416653,0.00000000,0.00000000,0.00000000); //object(strtbarrier01)(4)
	CreateDynamicObject(3475,1772.42126465,-1942.80358887,14.93595314,0.00000000,0.00000000,270.00000000); //object(vgsn_fncelec_pst)(3)
	CreateDynamicObject(3475,1778.22534180,-1942.80444336,14.93242836,0.00000000,0.00000000,270.00000000); //object(vgsn_fncelec_pst)(4)
	CreateDynamicObject(3475,1766.58618164,-1942.84130859,14.93874741,0.00000000,0.00000000,270.00000000); //object(vgsn_fncelec_pst)(5)
	CreateDynamicObject(3475,1760.98022461,-1941.34570312,14.95923805,0.00000000,0.00000000,240.00000000); //object(vgsn_fncelec_pst)(6)
	CreateDynamicObject(1418,1782.90039062,-1942.67187500,16.18828773,0.00000000,0.00000000,0.00000000); //object(dyn_f_wood_3)(1)
	CreateDynamicObject(1418,1786.36877441,-1942.62231445,16.18828773,0.00000000,0.00000000,0.00000000); //object(dyn_f_wood_3)(2)
	CreateDynamicObject(1418,1789.78784180,-1942.57812500,16.18828773,0.00000000,0.00000000,0.00000000); //object(dyn_f_wood_3)(3)
	CreateDynamicObject(1418,1793.24206543,-1942.52526855,16.18828773,0.00000000,0.00000000,0.00000000); //object(dyn_f_wood_3)(4)
	CreateDynamicObject(1418,1796.70983887,-1942.50964355,16.18828773,0.00000000,0.00000000,0.00000000); //object(dyn_f_wood_3)(5)
	CreateDynamicObject(1418,1803.65258789,-1942.47802734,16.18828773,0.00000000,0.00000000,0.00000000); //object(dyn_f_wood_3)(6)
	CreateDynamicObject(1418,1800.15917969,-1942.49414062,16.18828773,0.00000000,0.00000000,0.00000000); //object(dyn_f_wood_3)(7)
	CreateDynamicObject(1418,1807.09582520,-1942.46228027,16.18828773,0.00000000,0.00000000,0.00000000); //object(dyn_f_wood_3)(8)
	CreateDynamicObject(1418,1809.64501953,-1942.41235352,16.18828773,0.00000000,0.00000000,0.00000000); //object(dyn_f_wood_3)(9)
	CreateDynamicObject(994,1833.28503418,-1859.73889160,12.57812500,0.00000000,0.00000000,90.00000000); //object(lhouse_barrier2)(3)
	CreateDynamicObject(994,1833.24707031,-1853.40869141,12.57812500,0.00000000,0.00000000,80.25000000); //object(lhouse_barrier2)(4)
	CreateDynamicObject(994,1833.64367676,-1834.46105957,12.58538246,0.00000000,0.00000000,110.24963379); //object(lhouse_barrier2)(6)
	CreateDynamicObject(712,1864.34948730,-1864.89086914,22.16884804,0.00000000,0.00000000,0.00000000); //object(vgs_palm03)(2)
	CreateDynamicObject(712,1864.59338379,-1872.11108398,22.11266327,0.00000000,0.00000000,0.00000000); //object(vgs_palm03)(3)
	CreateDynamicObject(712,1864.16845703,-1877.88293457,22.06714630,0.00000000,0.00000000,0.00000000); //object(vgs_palm03)(4)
	CreateDynamicObject(712,1836.37182617,-1826.26940918,22.17748260,0.00000000,0.00000000,0.00000000); //object(vgs_palm03)(5)
	CreateDynamicObject(712,1856.56066895,-1832.42504883,22.17725372,0.00000000,0.00000000,0.00000000); //object(vgs_palm03)(6)
	CreateDynamicObject(712,1875.45227051,-1838.23840332,22.17023849,0.00000000,0.00000000,0.00000000); //object(vgs_palm03)(7)
	CreateDynamicObject(712,1893.84362793,-1843.65234375,22.16469574,0.00000000,0.00000000,0.00000000); //object(vgs_palm03)(8)
	CreateDynamicObject(712,1913.90136719,-1848.37011719,22.15648651,0.00000000,0.00000000,0.00000000); //object(vgs_palm03)(9)
	CreateDynamicObject(712,1932.54687500,-1852.60034180,22.14623260,0.00000000,0.00000000,0.00000000); //object(vgs_palm03)(10)
	CreateDynamicObject(712,1949.91857910,-1856.57177734,22.14623260,0.00000000,0.00000000,0.00000000); //object(vgs_palm03)(11)
	CreateDynamicObject(712,1855.99169922,-1878.58056641,22.06651115,0.00000000,0.00000000,0.00000000); //object(vgs_palm03)(12)
	CreateDynamicObject(712,1846.35986328,-1878.06823730,22.11123085,0.00000000,0.00000000,0.00000000); //object(vgs_palm03)(13)
	CreateDynamicObject(712,1834.01782227,-1878.12194824,22.10112762,0.00000000,0.00000000,0.00000000); //object(vgs_palm03)(14)
	CreateDynamicObject(712,1801.86132812,-1845.75854492,22.17748260,0.00000000,0.00000000,0.00000000); //object(vgs_palm03)(15)
	CreateDynamicObject(712,1784.42468262,-1844.29248047,22.17748260,0.00000000,0.00000000,0.00000000); //object(vgs_palm03)(16)
	CreateDynamicObject(712,1766.64196777,-1839.24414062,22.16428757,0.00000000,0.00000000,0.00000000); //object(vgs_palm03)(17)
	CreateDynamicObject(712,1752.21508789,-1834.76062012,22.15443420,0.00000000,0.00000000,0.00000000); //object(vgs_palm03)(18)
	CreateDynamicObject(712,1738.59533691,-1831.22692871,22.15880585,0.00000000,0.00000000,0.00000000); //object(vgs_palm03)(19)
	CreateDynamicObject(712,1725.08593750,-1827.31066895,22.15569496,0.00000000,0.00000000,0.00000000); //object(vgs_palm03)(20)
	CreateDynamicObject(712,1712.02880859,-1825.49768066,22.14623260,0.00000000,0.00000000,0.00000000); //object(vgs_palm03)(21)
	CreateDynamicObject(712,1703.62890625,-1856.93981934,22.17506027,0.00000000,0.00000000,0.00000000); //object(vgs_palm03)(22)
	CreateDynamicObject(712,1704.00537109,-1849.70288086,22.15933990,0.00000000,0.00000000,0.00000000); //object(vgs_palm03)(23)
	CreateDynamicObject(712,1685.53808594,-1875.30834961,22.14414215,0.00000000,0.00000000,0.00000000); //object(vgs_palm03)(24)
	CreateDynamicObject(712,1679.14624023,-1879.98986816,22.14913368,0.00000000,0.00000000,0.00000000); //object(vgs_palm03)(25)
	CreateDynamicObject(1215,1814.15954590,-1895.39880371,13.14244843,0.00000000,0.00000000,0.00000000); //object(bollardlight)(6)
	CreateDynamicObject(1215,1813.83642578,-1883.58959961,13.05829430,0.00000000,0.00000000,0.00000000); //object(bollardlight)(6)
	CreateDynamicObject(1215,1833.02685547,-1853.47570801,13.14244843,0.00000000,0.00000000,0.00000000); //object(bollardlight)(6)
	CreateDynamicObject(1215,1833.10742188,-1859.85412598,13.14244843,0.00000000,0.00000000,0.00000000); //object(bollardlight)(6)
	CreateDynamicObject(1215,1845.93395996,-1860.13793945,13.14943123,0.00000000,0.00000000,0.00000000); //object(bollardlight)(6)
	CreateDynamicObject(1215,1826.36108398,-1874.18322754,12.86518955,0.00000000,0.00000000,0.00000000); //object(bollardlight)(6)
	CreateDynamicObject(1215,1826.52465820,-1859.86706543,12.97838593,0.00000000,0.00000000,0.00000000); //object(bollardlight)(6)
	CreateDynamicObject(1215,1831.40441895,-1830.47094727,13.14244843,0.00000000,0.00000000,0.00000000); //object(bollardlight)(6)
	CreateDynamicObject(1215,1833.84143066,-1840.83679199,13.14244843,0.00000000,0.00000000,0.00000000); //object(bollardlight)(6)
	CreateDynamicObject(1215,1833.85534668,-1844.27746582,13.14244843,0.00000000,0.00000000,0.00000000); //object(bollardlight)(6)
	CreateDynamicObject(1569,1834.09802246,-1841.07934570,12.57812500,0.00000000,0.00000000,270.00000000); //object(adam_v_door)(1)
	CreateDynamicObject(1569,1834.09277344,-1844.05603027,12.57812500,0.00000000,0.00000000,90.00000000); //object(adam_v_door)(2)
	CreateDynamicObject(1569,1758.41296387,-1894.81433105,12.57392216,0.00000000,0.00000000,90.00000000); //object(adam_v_door)(3)
	CreateDynamicObject(1251,1842.28308105,-1873.83569336,12.49443245,0.00000000,0.00000000,270.00000000); //object(smashbar)(7)
	CreateDynamicObject(1251,1835.22778320,-1873.80700684,12.49443245,0.00000000,0.00000000,270.00000000); //object(smashbar)(7)
	CreateDynamicObject(1251,1829.69042969,-1873.80847168,12.45920086,0.00000000,0.00000000,270.00000000); //object(smashbar)(7)
	CreateDynamicObject(1257,1827.88928223,-1766.56689453,13.82606697,0.00000000,0.00000000,0.00000000); //object(bustopm) (1)
	CreateDynamicObject(1257,2066.75390625,-1758.57360840,13.83660507,0.00000000,0.00000000,272.00000000); //object(bustopm) (2)
	CreateDynamicObject(1257,2401.18725586,-1738.48095703,13.82606697,0.00000000,0.00000000,271.99951172); //object(bustopm) (3)
	CreateDynamicObject(1257,2756.59350586,-1896.72412109,11.33387947,0.00000000,0.00000000,271.99951172); //object(bustopm) (4)
	CreateDynamicObject(1257,2829.35229492,-1639.97583008,11.24736786,0.00000000,0.00000000,351.99951172); //object(bustopm) (5)
	CreateDynamicObject(1257,2832.39184570,-1036.31616211,23.55489922,0.00000000,0.00000000,177.99645996); //object(bustopm) (6)
	CreateDynamicObject(1257,2655.18847656,-1053.69958496,69.85668945,0.00000000,0.00000000,269.99499512); //object(bustopm) (7)
	CreateDynamicObject(1257,2636.43066406,-1242.97363281,50.29423141,0.00000000,0.00000000,181.99450684); //object(bustopm) (8)
	CreateDynamicObject(1257,2457.08691406,-1429.43005371,24.22726631,0.00000000,0.00000000,359.99401855); //object(bustopm) (9)
	CreateDynamicObject(1257,2425.04882812,-1497.60253906,24.27140045,0.00000000,0.00000000,179.98901367); //object(bustopm) (10)
	CreateDynamicObject(1257,2320.18969727,-1652.73449707,14.40415955,0.00000000,0.00000000,87.98352051); //object(bustopm) (11)
	CreateDynamicObject(1257,2025.76464844,-1606.31103516,13.82606697,0.00000000,0.00000000,87.97851562); //object(bustopm) (12)
	CreateDynamicObject(1257,1732.10400391,-1434.70935059,13.82606697,0.00000000,0.00000000,87.97851562); //object(bustopm) (13)
	CreateDynamicObject(1257,1467.43542480,-1434.86975098,13.82606697,0.00000000,0.00000000,89.97851562); //object(bustopm) (14)
	CreateDynamicObject(1257,1470.34533691,-1166.85217285,24.29749489,0.00000000,0.00000000,267.97802734); //object(bustopm) (15)
	CreateDynamicObject(1257,1730.85559082,-1166.94299316,24.09951782,0.00000000,0.00000000,269.97302246); //object(bustopm) (16)
	CreateDynamicObject(1257,1872.79907227,-1154.60144043,24.14894676,0.00000000,0.00000000,359.97253418); //object(bustopm) (17)
	CreateDynamicObject(1257,2161.85888672,-1123.78259277,25.84495926,0.00000000,0.00000000,263.96704102); //object(bustopm) (18)
	CreateDynamicObject(1257,2327.72705078,-1160.16540527,27.25807381,0.00000000,0.00000000,267.96301270); //object(bustopm) (19)
	CreateDynamicObject(1257,2584.24902344,-1189.91833496,62.29977036,0.00000000,0.00000000,267.96203613); //object(bustopm) (20)
	CreateDynamicObject(1257,2881.39843750,-1410.36779785,11.35288048,0.00000000,0.00000000,359.96203613); //object(bustopm) (21)
	CreateDynamicObject(1257,2160.83520508,-1369.95678711,24.26650429,0.00000000,0.00000000,179.96154785); //object(bustopm) (22)
	CreateDynamicObject(1257,1865.75610352,-1334.72082520,13.83490562,0.00000000,0.00000000,91.96154785); //object(bustopm) (23)
	CreateDynamicObject(1257,1467.21801758,-1292.40051270,13.86549187,0.00000000,0.00000000,91.96105957); //object(bustopm) (24)
	CreateDynamicObject(1257,1236.70666504,-1389.30322266,13.68490410,0.00000000,0.00000000,91.96105957); //object(bustopm) (25)
	CreateDynamicObject(1257,950.69726562,-1389.32287598,13.67737961,0.00000000,0.00000000,91.96105957); //object(bustopm) (26)
	CreateDynamicObject(1257,769.76696777,-1389.02221680,13.91842842,0.00000000,0.00000000,91.96105957); //object(bustopm) (27)
	CreateDynamicObject(1257,382.35986328,-1486.81103516,32.29378510,0.00000000,0.00000000,129.96105957); //object(bustopm) (28)
	CreateDynamicObject(1257,273.95989990,-1503.78515625,32.97985458,0.00000000,0.00000000,139.95727539); //object(bustopm) (29)
	CreateDynamicObject(1257,473.66210938,-1315.24206543,15.83644009,0.00000000,0.00000000,307.95477295); //object(bustopm) (30)
	CreateDynamicObject(1257,811.17205811,-1058.57458496,25.22733879,0.00000000,0.00000000,277.95227051); //object(bustopm) (31)
	CreateDynamicObject(1257,1122.70617676,-961.71173096,43.01856613,0.00000000,0.00000000,271.94860840); //object(bustopm) (32)
	CreateDynamicObject(1257,1619.92419434,-979.32635498,38.60901642,0.00000000,0.00000000,265.94458008); //object(bustopm) (33)
	CreateDynamicObject(1257,2177.51708984,-1013.47009277,63.20137024,0.00000000,0.00000000,263.94055176); //object(bustopm) (34)
	CreateDynamicObject(1257,1347.72900391,-1049.16333008,27.00225258,0.00000000,0.00000000,181.93554688); //object(bustopm) (35)
	CreateDynamicObject(1257,989.78570557,-1134.72021484,24.10731697,0.00000000,0.00000000,89.93359375); //object(bustopm) (36)
	CreateDynamicObject(1257,621.88879395,-1607.56127930,16.53631973,0.00000000,0.00000000,179.92858887); //object(bustopm) (37)
	CreateDynamicObject(1257,136.30743408,-1587.14392090,11.66014671,0.00000000,0.00000000,319.92309570); //object(bustopm) (38)
	CreateDynamicObject(1257,424.93316650,-1778.52929688,5.82606697,0.00000000,0.00000000,267.92187500); //object(bustopm) (39)
	CreateDynamicObject(1257,1079.71777344,-1858.31176758,13.83387756,0.00000000,0.00000000,269.91809082); //object(bustopm) (40)
	CreateDynamicObject(1257,1274.89819336,-1858.23840332,13.82606697,0.00000000,0.00000000,269.91760254); //object(bustopm) (41)
	CreateDynamicObject(1257,1318.39843750,-1753.43359375,13.82606697,0.00000000,0.00000000,1.91760254); //object(bustopm) (42)
	CreateDynamicObject(1257,1620.91577148,-1738.52392578,13.82606697,0.00000000,0.00000000,271.91711426); //object(bustopm) (43)
	CreateDynamicObject(1257,1807.33032227,-1738.30004883,13.81645203,0.00000000,0.00000000,271.91711426); //object(bustopm) (44)
	CreateDynamicObject(1257,1923.55102539,-1758.24194336,13.82606697,0.00000000,0.00000000,271.91711426); //object(bustopm) (45)
	CreateDynamicObject(1257,1955.63586426,-2067.22314453,13.82606697,0.00000000,0.00000000,181.91711426); //object(bustopm) (46)
	CreateDynamicObject(1257,2215.99389648,-2191.29394531,13.82606697,0.00000000,0.00000000,225.91711426); //object(bustopm) (47)
	CreateDynamicObject(1257,2191.55639648,-2353.75000000,13.82606697,0.00000000,0.00000000,135.91186523); //object(bustopm) (48)
	CreateDynamicObject(1257,2416.16381836,-2440.67700195,13.97677040,0.00000000,0.00000000,225.91186523); //object(bustopm) (49)
	CreateDynamicObject(1257,2587.20605469,-2393.10278320,13.84107304,0.00000000,0.00000000,225.90637207); //object(bustopm) (50)
	CreateDynamicObject(1257,2399.38769531,-2657.29638672,13.94325447,0.00000000,0.00000000,91.90637207); //object(bustopm) (51)

	// - Fronteras
	CreateDynamicObject(4514,56.74465942,-1538.00634766,5.81108999,0.00000000,0.00000000,260.00000000); //object(cn2_roadblock01ld) (1)
	CreateDynamicObject(4514,1699.38989258,451.01431274,31.92551994,0.00000000,0.00000000,161.99694824); //object(cn2_roadblock01ld) (2)
	CreateDynamicObject(1238,68.00440979,-1545.64318848,4.39945173,0.00000000,0.00000000,0.00000000); //object(trafficcone) (1)
	CreateDynamicObject(1238,67.95986938,-1543.69409180,4.37237930,0.00000000,0.00000000,0.00000000); //object(trafficcone) (2)
	CreateDynamicObject(1238,68.13162231,-1541.26855469,4.34024477,0.00000000,0.00000000,0.00000000); //object(trafficcone) (3)
	CreateDynamicObject(1238,68.10932922,-1538.57824707,4.29282808,0.00000000,0.00000000,0.00000000); //object(trafficcone) (4)
	CreateDynamicObject(1238,68.40509033,-1535.45922852,4.46465874,0.00000000,0.00000000,0.00000000); //object(trafficcone) (5)
	CreateDynamicObject(1238,68.44555664,-1532.96765137,4.44940805,0.00000000,0.00000000,0.00000000); //object(trafficcone) (6)
	CreateDynamicObject(1238,68.51672363,-1529.80578613,4.21381950,0.00000000,0.00000000,0.00000000); //object(trafficcone) (7)
	CreateDynamicObject(1238,68.29157257,-1526.95068359,4.28023767,0.00000000,0.00000000,0.00000000); //object(trafficcone) (8)
	CreateDynamicObject(1238,68.65044403,-1524.39819336,4.18367720,0.00000000,0.00000000,0.00000000); //object(trafficcone) (9)
	CreateDynamicObject(1238,68.97292328,-1522.10449219,4.64283895,0.00000000,0.00000000,0.00000000); //object(trafficcone) (10)
	CreateDynamicObject(4514,58.74609375,-1526.67187500,5.81108999,0.00000000,0.00000000,261.99645996); //object(cn2_roadblock01ld) (3)
	CreateDynamicObject(4514,1712.94079590,446.60488892,31.92551994,0.00000000,0.00000000,161.99340820); //object(cn2_roadblock01ld) (4)
	CreateDynamicObject(4514,1724.05627441,443.04153442,31.92551994,0.00000000,0.00000000,161.99340820); //object(cn2_roadblock01ld) (5)
	CreateDynamicObject(4514,558.11749268,416.88619995,19.83757019,0.00000000,0.00000000,211.99340820); //object(cn2_roadblock01ld) (6)
	CreateDynamicObject(4514,-191.78369141,280.95437622,12.73603058,0.00000000,0.00000000,167.99218750); //object(cn2_roadblock01ld) (7)
	CreateDynamicObject(4514,560.30273438,417.70605469,19.83757019,0.00000000,0.00000000,211.99218750); //object(cn2_roadblock01ld) (8)
	CreateDynamicObject(4514,-189.97843933,280.19873047,12.73603058,0.00000000,0.00000000,167.99194336); //object(cn2_roadblock01ld) (9)
	CreateDynamicObject(4514,-1207.69995117,-790.63470459,64.97314453,0.00000000,0.00000000,223.99194336); //object(cn2_roadblock01ld) (10)
	CreateDynamicObject(4514,-828.98864746,-1315.35217285,82.06417847,0.00000000,0.00000000,351.98925781); //object(cn2_roadblock01ld) (11)
	CreateDynamicObject(4514,-381.46166992,-837.02044678,48.18835449,0.00000000,0.00000000,245.98547363); //object(cn2_roadblock01ld) (12)
	CreateDynamicObject(4514,-86.81889343,-913.27758789,18.95369148,4.49981689,0.50155640,155.94445801); //object(cn2_roadblock01ld) (13)
	CreateDynamicObject(4514,331.19195557,-567.40081787,41.23693848,359.99902344,0.49835205,261.97912598); //object(cn2_roadblock01ld) (15)
	CreateDynamicObject(4514,807.24584961,-168.10166931,19.47859764,1.74447632,0.24453735,271.96704102); //object(cn2_roadblock01ld) (16)
	CreateDynamicObject(4514,329.25390625,-573.19726562,41.48695374,1.73583984,356.48986816,262.07885742); //object(cn2_roadblock01ld) (17)
	CreateDynamicObject(4514,754.73706055,-152.50363159,19.50846100,6.49127197,0.24313354,311.94647217); //object(cn2_roadblock01ld) (18)

	// - Mappeado Arereopuerto
	CreateDynamicObject(1683,1435.22863770,-2426.36621094,18.45731354,0.00000000,0.00000000,270.00000000); //object(ap_jumbo_01)(1)
	CreateDynamicObject(1683,1393.56835938,-2449.60351562,18.48231316,0.00000000,0.00000000,339.99938965); //object(ap_jumbo_01)(2)
	CreateDynamicObject(1683,1980.01660156,-2266.63232422,18.44950104,0.00000000,0.00000000,246.00000000); //object(ap_jumbo_01)(3)
	CreateDynamicObject(1683,1946.33422852,-2263.37426758,18.44950104,0.00000000,0.00000000,275.99487305); //object(ap_jumbo_01)(4)
	CreateDynamicObject(1683,2022.33642578,-2431.68310547,18.44950104,0.00000000,0.00000000,255.99304199); //object(ap_jumbo_01)(5)
	CreateDynamicObject(1683,2044.15002441,-2639.69897461,18.44950104,0.00000000,0.00000000,195.99243164); //object(ap_jumbo_01)(6)
	CreateDynamicObject(1683,1961.41308594,-2642.15893555,18.44950104,0.00000000,0.00000000,355.99060059); //object(ap_jumbo_01)(7)
	CreateDynamicObject(1215,1971.63696289,-2171.74926758,13.11119843,0.00000000,0.00000000,0.00000000); //object(bollardlight)(1)
	CreateDynamicObject(1215,1966.97839355,-2176.42846680,13.11119843,0.00000000,0.00000000,0.00000000); //object(bollardlight)(5)
	CreateDynamicObject(1215,1956.45886230,-2176.42211914,13.11119843,0.00000000,0.00000000,0.00000000); //object(bollardlight)(6)
	CreateDynamicObject(1215,1951.67504883,-2171.78564453,13.11119843,0.00000000,0.00000000,0.00000000); //object(bollardlight)(10)
	CreateDynamicObject(1215,1956.42956543,-2189.41284180,13.11119843,0.00000000,0.00000000,0.00000000); //object(bollardlight)(11)
	CreateDynamicObject(1215,1966.94946289,-2189.47387695,13.11119843,0.00000000,0.00000000,0.00000000); //object(bollardlight)(12)
	CreateDynamicObject(1238,1961.54089355,-2189.24267578,12.86505508,0.00000000,0.00000000,0.00000000); //object(trafficcone)(1)
	CreateDynamicObject(1238,1961.54431152,-2187.90209961,12.86505508,0.00000000,0.00000000,0.00000000); //object(trafficcone)(2)
	CreateDynamicObject(1238,1961.57690430,-2186.53247070,12.86505508,0.00000000,0.00000000,0.00000000); //object(trafficcone)(3)
	CreateDynamicObject(1238,1961.52319336,-2185.10205078,12.86505508,0.00000000,0.00000000,0.00000000); //object(trafficcone)(4)
	CreateDynamicObject(1238,1961.48608398,-2183.83398438,12.86505508,0.00000000,0.00000000,0.00000000); //object(trafficcone)(5)
	CreateDynamicObject(1238,1961.43505859,-2181.03271484,12.86505508,0.00000000,0.00000000,0.00000000); //object(trafficcone)(6)
	CreateDynamicObject(7981,1415.13256836,-2643.74169922,17.54521942,0.00000000,0.00000000,340.00000000); //object(smallradar02_lvs)(1)
	CreateDynamicObject(1238,1961.48925781,-2182.44531250,12.86505508,0.00000000,0.00000000,0.00000000); //object(trafficcone)(7)
	CreateDynamicObject(1238,1961.39416504,-2179.81494141,12.86505508,0.00000000,0.00000000,0.00000000); //object(trafficcone)(8)
	CreateDynamicObject(1238,1961.34472656,-2178.08081055,12.86505508,0.00000000,0.00000000,0.00000000); //object(trafficcone)(9)
	CreateDynamicObject(1238,1961.27941895,-2176.63671875,12.86505508,0.00000000,0.00000000,0.00000000); //object(trafficcone)(10)
	CreateDynamicObject(1215,2054.43212891,-2189.44140625,13.11833572,0.00000000,0.00000000,0.00000000); //object(bollardlight)(14)
	CreateDynamicObject(1215,2054.54394531,-2200.36206055,13.11119843,0.00000000,0.00000000,0.00000000); //object(bollardlight)(15)
	CreateDynamicObject(1215,1983.57397461,-2318.01440430,13.11119843,0.00000000,0.00000000,0.00000000); //object(bollardlight)(16)
	CreateDynamicObject(2773,1732.79650879,-2334.80078125,13.06410313,0.00000000,0.00000000,320.00000000); //object(cj_airprt_bar)(1)
	CreateDynamicObject(2773,1734.03332520,-2333.29370117,13.06410313,0.00000000,0.00000000,319.99877930); //object(cj_airprt_bar)(2)
	CreateDynamicObject(2773,1727.82446289,-2334.89282227,13.06410313,0.00000000,0.00000000,39.99877930); //object(cj_airprt_bar)(3)
	CreateDynamicObject(2773,1726.59008789,-2333.42163086,13.06410313,0.00000000,0.00000000,39.99572754); //object(cj_airprt_bar)(4)
	CreateDynamicObject(970,1748.21643066,-2311.41235352,13.09835625,0.00000000,0.00000000,270.00000000); //object(fencesmallb)(1)
	CreateDynamicObject(970,1765.27685547,-2311.40454102,13.09835625,0.00000000,0.00000000,270.00000000); //object(fencesmallb)(2)
	CreateDynamicObject(970,1748.21582031,-2311.41210938,13.09835625,0.00000000,0.00000000,270.00000000); //object(fencesmallb)(3)
	CreateDynamicObject(970,1750.23742676,-2309.35864258,13.09835625,0.00000000,0.00000000,179.99450684); //object(fencesmallb)(7)
	CreateDynamicObject(970,1763.22363281,-2309.36279297,13.09835625,0.00000000,0.00000000,179.99450684); //object(fencesmallb)(8)
	CreateDynamicObject(1215,1734.77014160,-2332.37500000,13.11119843,0.00000000,0.00000000,0.00000000); //object(bollardlight)(2)
	CreateDynamicObject(1215,1725.99157715,-2332.21948242,13.11119843,0.00000000,0.00000000,0.00000000); //object(bollardlight)(3)
	CreateDynamicObject(1215,1748.20385742,-2313.77514648,13.11119843,0.00000000,0.00000000,0.00000000); //object(bollardlight)(4)
	CreateDynamicObject(1215,1765.31115723,-2313.90917969,13.11119843,0.00000000,0.00000000,0.00000000); //object(bollardlight)(7)
	CreateDynamicObject(1215,1760.88977051,-2309.43774414,13.11119843,0.00000000,0.00000000,0.00000000); //object(bollardlight)(8)
	CreateDynamicObject(1215,1752.50244141,-2309.41870117,13.11119843,0.00000000,0.00000000,0.00000000); //object(bollardlight)(9)
	CreateDynamicObject(1257,1772.67651367,-2325.19824219,13.81465530,0.00000000,0.00000000,270.00000000); //object(bustopm)(1)
	CreateDynamicObject(1319,1765.18457031,-2313.66503906,13.09375000,0.00000000,0.00000000,50.00000000); //object(ws_ref_bollard)(1)
	CreateDynamicObject(1319,1748.34973145,-2313.55786133,13.09375000,0.00000000,0.00000000,309.99877930); //object(ws_ref_bollard)(2)
	CreateDynamicObject(712,1529.96960449,-2313.39306641,22.14623260,0.00000000,0.00000000,0.00000000); //object(vgs_palm03)(2)
	CreateDynamicObject(712,1524.54748535,-2323.71533203,22.14623260,0.00000000,0.00000000,0.00000000); //object(vgs_palm03)(3)
	CreateDynamicObject(712,1516.40075684,-2332.75952148,22.14623260,0.00000000,0.00000000,0.00000000); //object(vgs_palm03)(4)
	CreateDynamicObject(712,1506.67102051,-2338.35839844,22.14623260,0.00000000,0.00000000,0.00000000); //object(vgs_palm03)(5)
	CreateDynamicObject(712,1527.22192383,-2256.01025391,22.14623260,0.00000000,0.00000000,0.00000000); //object(vgs_palm03)(6)
	CreateDynamicObject(712,1530.68249512,-2267.03271484,22.15401268,0.00000000,0.00000000,0.00000000); //object(vgs_palm03)(7)
	CreateDynamicObject(712,1520.40942383,-2245.81616211,22.14623260,0.00000000,0.00000000,0.00000000); //object(vgs_palm03)(8)
	CreateDynamicObject(712,1511.10693359,-2237.55004883,22.14623260,0.00000000,0.00000000,0.00000000); //object(vgs_palm03)(9)
	CreateDynamicObject(712,1502.20520020,-2233.24902344,22.14623260,0.00000000,0.00000000,0.00000000); //object(vgs_palm03)(10)
	CreateDynamicObject(712,1410.69836426,-2301.34765625,22.14623260,0.00000000,0.00000000,0.00000000); //object(vgs_palm03)(11)
	CreateDynamicObject(712,1400.68115234,-2301.71044922,22.14623260,0.00000000,0.00000000,0.00000000); //object(vgs_palm03)(12)
	CreateDynamicObject(712,1385.73046875,-2301.72143555,22.14623260,0.00000000,0.00000000,0.00000000); //object(vgs_palm03)(13)
	CreateDynamicObject(712,1376.67822266,-2301.97778320,22.14623260,0.00000000,0.00000000,0.00000000); //object(vgs_palm03)(14)
	CreateDynamicObject(712,1409.87805176,-2272.01464844,22.12075806,0.00000000,0.00000000,0.00000000); //object(vgs_palm03)(15)
	CreateDynamicObject(712,1401.91601562,-2271.98242188,22.10325241,0.00000000,0.00000000,0.00000000); //object(vgs_palm03)(16)
	CreateDynamicObject(712,1383.07153320,-2272.49584961,22.14623260,0.00000000,0.00000000,0.00000000); //object(vgs_palm03)(17)
	CreateDynamicObject(712,1373.21557617,-2272.30175781,22.14623260,0.00000000,0.00000000,0.00000000); //object(vgs_palm03)(18)
	CreateDynamicObject(1215,1351.97033691,-2270.64697266,13.11119843,0.00000000,0.00000000,0.00000000); //object(bollardlight)(13)
	CreateDynamicObject(1215,1352.02465820,-2301.87451172,13.11119843,0.00000000,0.00000000,0.00000000); //object(bollardlight)(17)
	CreateDynamicObject(1215,1371.23266602,-2286.31250000,13.11119843,0.00000000,0.00000000,0.00000000); //object(bollardlight)(18)
	CreateDynamicObject(1215,1418.68994141,-2281.09106445,13.11119843,0.00000000,0.00000000,0.00000000); //object(bollardlight)(19)
	CreateDynamicObject(1215,1418.66491699,-2291.76611328,13.11119843,0.00000000,0.00000000,0.00000000); //object(bollardlight)(20)
	CreateDynamicObject(1215,1479.70617676,-2342.33666992,13.11119843,0.00000000,0.00000000,0.00000000); //object(bollardlight)(21)
	CreateDynamicObject(1215,1469.17041016,-2342.36865234,13.11119843,0.00000000,0.00000000,0.00000000); //object(bollardlight)(22)
	CreateDynamicObject(1215,1530.30273438,-2280.91479492,13.11119843,0.00000000,0.00000000,0.00000000); //object(bollardlight)(23)
	CreateDynamicObject(1215,1530.30847168,-2291.86376953,13.11119843,0.00000000,0.00000000,0.00000000); //object(bollardlight)(24)
	CreateDynamicObject(1215,1469.08813477,-2230.67871094,13.11119843,0.00000000,0.00000000,0.00000000); //object(bollardlight)(25)
	CreateDynamicObject(1215,1479.79040527,-2230.59277344,13.11119843,0.00000000,0.00000000,0.00000000); //object(bollardlight)(26)
	CreateDynamicObject(712,1584.25817871,-2152.18261719,22.14623260,0.00000000,0.00000000,0.00000000); //object(vgs_palm03)(21)
	CreateDynamicObject(712,1582.16564941,-2159.27978516,22.15401268,0.00000000,0.00000000,0.00000000); //object(vgs_palm03)(22)
	CreateDynamicObject(712,1581.65124512,-2166.34448242,22.15401268,0.00000000,0.00000000,0.00000000); //object(vgs_palm03)(23)
	CreateDynamicObject(712,1581.10852051,-2174.00634766,22.15401268,0.00000000,0.00000000,0.00000000); //object(vgs_palm03)(24)
	CreateDynamicObject(712,1581.24951172,-2181.61010742,22.14623260,0.00000000,0.00000000,0.00000000); //object(vgs_palm03)(26)
	CreateDynamicObject(712,1581.93457031,-2208.38818359,22.15401268,0.00000000,0.00000000,0.00000000); //object(vgs_palm03)(27)
	CreateDynamicObject(712,1581.76843262,-2218.65820312,22.15162659,0.00000000,0.00000000,0.00000000); //object(vgs_palm03)(28)
	CreateDynamicObject(712,1577.26245117,-2229.18701172,22.15530777,0.00000000,0.00000000,0.00000000); //object(vgs_palm03)(29)
	CreateDynamicObject(712,1567.37402344,-2233.61694336,22.15401268,0.00000000,0.00000000,0.00000000); //object(vgs_palm03)(30)
	CreateDynamicObject(712,1780.29895020,-2177.82568359,22.15404510,0.00000000,0.00000000,0.00000000); //object(vgs_palm03)(31)
	CreateDynamicObject(712,1764.21618652,-2177.63745117,22.15404510,0.00000000,0.00000000,0.00000000); //object(vgs_palm03)(32)
	CreateDynamicObject(712,1748.36657715,-2177.47802734,22.15383911,0.00000000,0.00000000,0.00000000); //object(vgs_palm03)(33)
	CreateDynamicObject(712,1732.69580078,-2178.30688477,22.15632439,0.00000000,0.00000000,0.00000000); //object(vgs_palm03)(34)
	CreateDynamicObject(712,1718.67443848,-2178.27197266,22.15404510,0.00000000,0.00000000,0.00000000); //object(vgs_palm03)(35)
	CreateDynamicObject(712,1702.16223145,-2178.47753906,22.15404510,0.00000000,0.00000000,0.00000000); //object(vgs_palm03)(36)
	CreateDynamicObject(712,1682.76647949,-2178.53173828,22.15404510,0.00000000,0.00000000,0.00000000); //object(vgs_palm03)(37)
	CreateDynamicObject(712,1663.16601562,-2177.97387695,22.15404510,0.00000000,0.00000000,0.00000000); //object(vgs_palm03)(38)

	// - CNN San Andreas
	CreateDynamicObject(1251,784.00750732,-1325.06250000,12.49530983,0.00000000,0.00000000,88.75000000); //object(smashbar) (1)
	CreateDynamicObject(1251,777.13793945,-1324.94189453,12.49530983,0.00000000,0.00000000,88.74755859); //object(smashbar) (3)
	CreateDynamicObject(1251,770.31243896,-1324.77783203,12.49530983,0.00000000,0.00000000,88.74755859); //object(smashbar) (4)
	CreateDynamicObject(1251,763.44262695,-1324.62878418,12.49530983,0.00000000,0.00000000,88.74755859); //object(smashbar) (5)
	CreateDynamicObject(1251,756.58789062,-1324.49401855,12.49530983,0.00000000,0.00000000,88.74755859); //object(smashbar) (6)
	CreateDynamicObject(1251,784.05700684,-1315.25231934,12.48749733,0.00000000,0.00000000,88.74755859); //object(smashbar) (7)
	CreateDynamicObject(1251,777.18786621,-1315.08190918,12.48749733,0.00000000,0.00000000,88.74755859); //object(smashbar) (8)
	CreateDynamicObject(1251,770.39636230,-1314.97473145,12.48749733,0.00000000,0.00000000,88.74755859); //object(smashbar) (9)
	CreateDynamicObject(1251,763.52313232,-1314.83337402,12.48749733,0.00000000,0.00000000,88.74755859); //object(smashbar) (10)
	CreateDynamicObject(1251,757.30383301,-1314.67211914,12.48749733,0.00000000,0.00000000,88.74755859); //object(smashbar) (11)
	CreateDynamicObject(3749,778.07116699,-1330.56347656,18.40746689,0.00000000,0.00000000,0.00000000); //object(clubgate01_lax) (1)
	CreateDynamicObject(4100,777.98950195,-1384.88159180,14.42522430,0.00000000,0.00000000,320.25000000); //object(meshfence1_lan) (1)
	CreateDynamicObject(4100,777.98925781,-1384.88085938,15.57523727,0.00000000,0.00000000,320.24597168); //object(meshfence1_lan) (2)
	CreateDynamicObject(4597,773.46008301,-1362.44995117,13.00877380,0.00000000,0.00000000,270.00000000); //object(crprkblok4_lan2) (1)
	CreateDynamicObject(18850,739.88250732,-1371.40087891,15.67221451,0.00000000,0.00000000,0.00000000); //object(lodcehollyhil03) (1)
	CreateDynamicObject(4832,702.95324707,-1375.08862305,59.28059387,0.00000000,0.00000000,180.00000000); //object(airtwer_las) (1)
	CreateDynamicObject(7586,695.68487549,-1359.02734375,28.01071548,0.00000000,0.00000000,0.00000000); //object(miragebuild07) (1)
	CreateDynamicObject(3763,695.34600830,-1359.69104004,64.15263367,0.00000000,0.00000000,0.00000000); //object(ce_radarmast3) (1)
	CreateDynamicObject(1595,657.26898193,-1333.06237793,25.99443626,0.00000000,0.00000000,220.00000000); //object(satdishbig) (2)
	CreateDynamicObject(1595,655.69097900,-1380.44604492,26.15735435,0.00000000,0.00000000,330.00000000); //object(satdishbig) (3)
	CreateDynamicObject(1595,697.93988037,-1381.58032227,40.63858032,0.00000000,0.00000000,359.99572754); //object(satdishbig) (5)
	CreateDynamicObject(1595,721.99218750,-1333.39794922,32.64882660,0.00000000,0.00000000,129.99453735); //object(satdishbig) (6)
	CreateDynamicObject(1569,732.09246826,-1349.56030273,12.64206791,0.00000000,0.00000000,90.00000000); //object(adam_v_door) (1)
	CreateDynamicObject(1569,732.09246826,-1346.60009766,12.64095402,0.00000000,0.00000000,270.00000000); //object(adam_v_door) (2)
	CreateDynamicObject(1569,649.69732666,-1355.25292969,12.55472088,0.00000000,0.00000000,270.00000000); //object(adam_v_door) (3)
	CreateDynamicObject(1569,649.64947510,-1358.25805664,12.58898830,0.00000000,0.00000000,90.00000000); //object(adam_v_door) (4)
	CreateDynamicObject(1215,649.65832520,-1355.09362793,13.11832237,0.00000000,0.00000000,0.00000000); //object(bollardlight) (1)
	CreateDynamicObject(1215,649.52673340,-1358.45556641,13.13683319,0.00000000,0.00000000,0.00000000); //object(bollardlight) (2)
	CreateDynamicObject(1215,783.74829102,-1329.76147461,13.11119843,0.00000000,0.00000000,0.00000000); //object(bollardlight) (3)
	CreateDynamicObject(1215,772.42480469,-1329.39868164,13.11119843,0.00000000,0.00000000,0.00000000); //object(bollardlight) (4)
	CreateDynamicObject(1215,781.70513916,-1384.74780273,13.29061794,0.00000000,0.00000000,0.00000000); //object(bollardlight) (5)
	CreateDynamicObject(1215,774.12023926,-1384.79589844,13.28200340,0.00000000,0.00000000,0.00000000); //object(bollardlight) (6)
	CreateDynamicObject(1215,773.20422363,-1364.55297852,13.09138107,0.00000000,0.00000000,0.00000000); //object(bollardlight) (7)
	CreateDynamicObject(1215,773.19415283,-1360.81164551,13.09136868,0.00000000,0.00000000,0.00000000); //object(bollardlight) (8)
	CreateDynamicObject(1215,773.49774170,-1380.68896484,13.22608185,0.00000000,0.00000000,0.00000000); //object(bollardlight) (9)
	CreateDynamicObject(1215,773.42285156,-1344.34472656,13.09164810,0.00000000,0.00000000,0.00000000); //object(bollardlight) (10)
	CreateDynamicObject(1215,728.68762207,-1358.73669434,27.64436340,0.00000000,0.00000000,0.00000000); //object(bollardlight) (11)
	CreateDynamicObject(1215,752.57135010,-1358.95690918,27.51454353,0.00000000,0.00000000,0.00000000); //object(bollardlight) (12)
	CreateDynamicObject(1215,728.33996582,-1383.76928711,27.49436569,0.00000000,0.00000000,0.00000000); //object(bollardlight) (13)
	CreateDynamicObject(1215,756.68750000,-1383.50781250,27.59436417,0.00000000,0.00000000,0.00000000); //object(bollardlight) (14)
	CreateDynamicObject(1215,654.68688965,-1334.38610840,21.25141525,0.00000000,0.00000000,0.00000000); //object(bollardlight) (15)
	CreateDynamicObject(1215,651.63562012,-1379.60705566,23.55826759,0.00000000,0.00000000,0.00000000); //object(bollardlight) (16)
	CreateDynamicObject(1215,732.09246826,-1349.73803711,13.07123470,0.00000000,0.00000000,0.00000000); //object(bollardlight) (10)
	CreateDynamicObject(1215,732.09246826,-1346.48840332,13.07837677,0.00000000,0.00000000,0.00000000); //object(bollardlight) (10)
	CreateDynamicObject(17064,743.64251709,-1355.46447754,12.25000381,0.00000000,0.00000000,180.00000000); //object(cw2_garage) (1)
	CreateDynamicObject(3055,217.55868530,128.73887634,1000.46246338,0.00000000,0.00000000,90.00000000); //object(kmb_shutter) (1)
	CreateDynamicObject(14391,263.90100098,107.32901001,1004.57727051,0.00000000,0.00000000,90.00000000); //object(dr_gsnew07) (1)
	CreateDynamicObject(14391,261.05078125,108.85546875,1004.57727051,0.00000000,0.00000000,0.00000000); //object(dr_gsnew07) (2)
	CreateDynamicObject(14391,269.83337402,119.43377686,1004.57727051,0.00000000,0.00000000,180.00000000); //object(dr_gsnew07) (3)
	CreateDynamicObject(1671,265.63916016,109.23923492,1004.07739258,0.00000000,0.00000000,0.00000000); //object(swivelchair_a) (1)
	CreateDynamicObject(1671,264.15429688,109.31157684,1004.07739258,0.00000000,0.00000000,0.00000000); //object(swivelchair_a) (2)
	CreateDynamicObject(1671,263.45947266,110.25763702,1004.07739258,0.00000000,0.00000000,270.00000000); //object(swivelchair_a) (3)
	CreateDynamicObject(1671,263.45684814,111.43928528,1004.07739258,0.00000000,0.00000000,270.00000000); //object(swivelchair_a) (4)
	CreateDynamicObject(1671,267.66928101,120.08361816,1004.07739258,0.00000000,0.00000000,90.00000000); //object(swivelchair_a) (5)
	CreateDynamicObject(1671,267.63024902,118.49846649,1004.07739258,0.00000000,0.00000000,90.00000000); //object(swivelchair_a) (6)
	CreateDynamicObject(1671,267.62026978,117.08683014,1004.07739258,0.00000000,0.00000000,90.00000000); //object(swivelchair_a) (7)

	// - Discoteca
	CreateDynamicObject(18648,1837.25781250,-1678.88269043,21.87788391,0.00000000,0.00000000,0.00000000); //object(wall2) (1)
	CreateDynamicObject(18648,1837.25781250,-1685.87438965,21.88265228,0.00000000,0.00000000,0.00000000); //object(wall2) (2)
	CreateDynamicObject(18648,1837.25781250,-1678.91857910,16.68293381,0.00000000,0.00000000,0.00000000); //object(wall2) (3)
	CreateDynamicObject(18648,1837.25781250,-1685.98852539,16.66990852,0.00000000,0.00000000,0.00000000); //object(wall2) (4)
	CreateDynamicObject(18648,1837.25781250,-1682.40417480,21.81660080,0.00000000,0.00000000,0.00000000); //object(wall2) (5)
	CreateDynamicObject(18648,1837.25781250,-1682.29089355,16.61502266,0.00000000,0.00000000,0.00000000); //object(wall2) (6)
	CreateDynamicObject(18647,1837.32275391,-1678.94592285,12.33896255,0.00000000,0.00000000,0.00000000); //object(wall1) (1)
	CreateDynamicObject(18647,1837.31750488,-1680.91027832,12.33886147,0.00000000,0.00000000,0.00000000); //object(wall1) (2)
	CreateDynamicObject(18647,1837.17980957,-1682.98889160,12.45162392,0.00000000,0.00000000,0.00000000); //object(wall1) (3)
	CreateDynamicObject(18647,1837.29541016,-1684.94384766,12.33843422,0.00000000,0.00000000,0.00000000); //object(wall1) (4)
	CreateDynamicObject(18647,1837.30676270,-1686.76391602,12.33865356,0.00000000,0.00000000,0.00000000); //object(wall1) (5)
	CreateDynamicObject(18654,491.58795166,-0.94342518,1001.07812500,0.00000000,0.00000000,50.00000000); //object(darkpoly) (1)
	CreateDynamicObject(18654,492.52639771,-2.58347321,1001.07067871,0.00000000,0.00000000,49.99877930); //object(darkpoly) (2)
	CreateDynamicObject(18654,480.79522705,-2.51794338,1001.07812500,0.00000000,0.00000000,129.99880981); //object(darkpoly) (4)
	CreateDynamicObject(18654,482.91659546,-1.13074589,1001.07812500,0.00000000,0.00000000,99.99572754); //object(darkpoly) (5)
	CreateDynamicObject(18655,483.47811890,-1.08612442,1001.07812500,0.00000000,0.00000000,100.00000000); //object(bridge) (1)
	CreateDynamicObject(18655,480.46325684,-2.94154453,1001.07812500,0.00000000,0.00000000,129.99755859); //object(bridge) (2)
	CreateDynamicObject(18655,491.73944092,-1.81725502,1001.07812500,0.00000000,0.00000000,49.99572754); //object(bridge) (3)
	CreateDynamicObject(18655,492.88452148,-2.96348000,1001.07067871,0.00000000,0.00000000,49.99328613); //object(bridge) (4)
	CreateDynamicObject(18653,483.21142578,-1.10907841,1001.07812500,0.00000000,0.00000000,100.00000000); //object(innerfence) (1)
	CreateDynamicObject(18653,491.65078735,-1.38171196,1001.07812500,0.00000000,0.00000000,29.99755859); //object(innerfence) (2)
	CreateDynamicObject(18653,492.67468262,-2.74787140,1001.07067871,0.00000000,0.00000000,45.99267578); //object(innerfence) (3)
	CreateDynamicObject(18653,480.67614746,-2.78500462,1001.07812500,0.00000000,0.00000000,135.98876953); //object(innerfence) (4)
	CreateDynamicObject(18651,484.91516113,-3.60626793,1001.40625000,0.00000000,0.00000000,270.00000000); //object(otunnel) (1)
	CreateDynamicObject(18651,486.86315918,-3.60016918,1001.40625000,0.00000000,0.00000000,270.00000000); //object(otunnel) (2)
	CreateDynamicObject(18651,488.80969238,-3.57825279,1001.40625000,0.00000000,0.00000000,270.00000000); //object(otunnel) (3)
	CreateDynamicObject(18651,490.08804321,-3.56308937,1001.40625000,0.00000000,0.00000000,270.00000000); //object(otunnel) (4)
	CreateDynamicObject(18652,483.93368530,-2.58714962,1001.40625000,0.00000000,0.00000000,0.00000000); //object(oroadbit) (1)
	CreateDynamicObject(18652,483.94595337,-1.11022663,1001.40625000,0.00000000,0.00000000,0.00000000); //object(oroadbit) (2)
	CreateDynamicObject(18652,491.08007812,-2.54492188,1001.40625000,0.00000000,0.00000000,0.00000000); //object(oroadbit) (3)
	CreateDynamicObject(18650,483.76904297,-14.16375160,999.70312500,0.00000000,0.00000000,0.00000000); //object(kickcrowd01) (1)
	CreateDynamicObject(18650,491.78170776,-14.09650898,999.70312500,0.00000000,0.00000000,0.00000000); //object(kickcrowd01) (2)
	CreateDynamicObject(18650,487.81460571,-9.99411964,999.70312500,0.00000000,0.00000000,90.00000000); //object(kickcrowd01) (3)
	CreateDynamicObject(18650,488.00186157,-18.16731453,999.70312500,0.00000000,0.00000000,90.00000000); //object(kickcrowd01) (4)
	CreateDynamicObject(18651,479.18130493,-22.38672066,1003.05120850,0.00000000,0.00000000,0.00000000); //object(otunnel) (5)
	CreateDynamicObject(18651,477.28839111,-22.43288231,1003.04425049,0.00000000,0.00000000,0.00000000); //object(otunnel) (6)
	CreateDynamicObject(18652,488.01077271,-21.22652817,1002.13281250,0.00000000,0.00000000,270.00000000); //object(oroadbit) (5)
	CreateDynamicObject(18652,486.06582642,-21.26163864,1002.13281250,0.00000000,0.00000000,270.00000000); //object(oroadbit) (6)
	CreateDynamicObject(18652,484.11834717,-21.27013016,1002.13281250,0.00000000,0.00000000,270.00000000); //object(oroadbit) (7)
	CreateDynamicObject(18652,482.15002441,-21.22028351,1002.13281250,0.00000000,0.00000000,269.50000000); //object(oroadbit) (8)
	CreateDynamicObject(18652,480.18222046,-21.22203636,1002.13281250,0.00000000,0.00000000,269.50000000); //object(oroadbit) (9)
	CreateDynamicObject(18646,477.22729492,-16.40727043,1003.82910156,0.00000000,0.00000000,0.00000000); //object(ramplandpad) (1)
	CreateDynamicObject(18646,477.22817993,-15.57135677,1003.82910156,0.00000000,0.00000000,0.00000000); //object(ramplandpad) (2)
	CreateDynamicObject(18646,477.27688599,-14.85038757,1003.82910156,0.00000000,0.00000000,0.00000000); //object(ramplandpad) (3)
	CreateDynamicObject(18646,477.25708008,-14.33161449,1003.82910156,0.00000000,0.00000000,0.00000000); //object(ramplandpad) (4)
	CreateDynamicObject(18646,477.25738525,-13.89871502,1003.82910156,0.00000000,0.00000000,0.00000000); //object(ramplandpad) (5)
	CreateDynamicObject(18646,477.26330566,-13.53905582,1003.82910156,0.00000000,0.00000000,0.00000000); //object(ramplandpad) (6)
	CreateDynamicObject(18646,492.73831177,-2.90983486,1001.16442871,0.00000000,0.00000000,0.00000000); //object(ramplandpad) (7)
	CreateDynamicObject(18646,492.48867798,-2.74020195,1001.16442871,0.00000000,0.00000000,0.00000000); //object(ramplandpad) (8)
	CreateDynamicObject(18646,491.82913208,-1.76205730,1001.17187500,0.00000000,0.00000000,0.00000000); //object(ramplandpad) (9)
	CreateDynamicObject(18646,491.57791138,-1.73200607,1001.17187500,0.00000000,0.00000000,0.00000000); //object(ramplandpad) (10)
	CreateDynamicObject(18646,480.63729858,-3.04520893,1001.17187500,0.00000000,0.00000000,0.00000000); //object(ramplandpad) (11)
	CreateDynamicObject(18646,481.05136108,-2.85732555,1001.17187500,0.00000000,0.00000000,0.00000000); //object(ramplandpad) (12)
	CreateDynamicObject(18646,483.08728027,-1.76928234,1001.17187500,0.00000000,0.00000000,0.00000000); //object(ramplandpad) (13)
	CreateDynamicObject(18646,483.34194946,-1.50265026,1001.17187500,0.00000000,0.00000000,0.00000000); //object(ramplandpad) (14)
	CreateDynamicObject(18646,483.86962891,-10.07955170,999.77343750,0.00000000,0.00000000,0.00000000); //object(ramplandpad) (15)
	CreateDynamicObject(18646,483.83496094,-18.14863777,999.77343750,0.00000000,0.00000000,0.00000000); //object(ramplandpad) (16)
	CreateDynamicObject(18646,491.73840332,-18.08456039,999.77343750,0.00000000,0.00000000,0.00000000); //object(ramplandpad) (17)
	CreateDynamicObject(18646,491.70840454,-10.06427383,999.77343750,0.00000000,0.00000000,0.00000000); //object(ramplandpad) (18)
	CreateDynamicObject(18646,501.20034790,-15.89995003,1000.81994629,0.00000000,0.00000000,0.00000000); //object(ramplandpad) (19)
	CreateDynamicObject(18646,500.72433472,-16.28449059,1000.81250000,0.00000000,0.00000000,0.00000000); //object(ramplandpad) (20)
	CreateDynamicObject(18646,500.49462891,-16.78012466,1000.81250000,0.00000000,0.00000000,0.00000000); //object(ramplandpad) (21)
	CreateDynamicObject(18646,503.69891357,-19.08621597,1000.95312500,0.00000000,0.00000000,0.00000000); //object(ramplandpad) (22)
	CreateDynamicObject(18646,503.69552612,-19.45597267,1000.95312500,0.00000000,0.00000000,0.00000000); //object(ramplandpad) (23)
	CreateDynamicObject(18646,503.79907227,-19.88812065,1000.95312500,0.00000000,0.00000000,0.00000000); //object(ramplandpad) (24)
	CreateDynamicObject(18646,503.71682739,-20.20236778,1000.95312500,0.00000000,0.00000000,0.00000000); //object(ramplandpad) (25)
	CreateDynamicObject(18646,503.69076538,-20.52037239,1000.95312500,0.00000000,0.00000000,0.00000000); //object(ramplandpad) (26)
	CreateDynamicObject(18646,503.66470337,-20.83837700,1000.95312500,0.00000000,0.00000000,0.00000000); //object(ramplandpad) (27)
	CreateDynamicObject(18646,503.74633789,-21.23589516,1000.95312500,0.00000000,0.00000000,0.00000000); //object(ramplandpad) (28)
	CreateDynamicObject(18646,503.77688599,-21.58339882,1000.95312500,0.00000000,0.00000000,0.00000000); //object(ramplandpad) (29)
	CreateDynamicObject(18646,499.82965088,-16.39624786,1004.82031250,0.00000000,0.00000000,0.00000000); //object(ramplandpad) (30)
	CreateDynamicObject(18646,499.63113403,-17.47093391,1004.82031250,0.00000000,0.00000000,0.00000000); //object(ramplandpad) (31)
	CreateDynamicObject(18646,499.79782104,-18.47970581,1004.82031250,0.00000000,0.00000000,0.00000000); //object(ramplandpad) (32)
	CreateDynamicObject(18646,499.87448120,-19.23336601,1004.82031250,0.00000000,0.00000000,0.00000000); //object(ramplandpad) (33)
	CreateDynamicObject(18646,499.87985229,-19.95985413,1004.82031250,0.00000000,0.00000000,0.00000000); //object(ramplandpad) (34)
	CreateDynamicObject(18646,499.83883667,-20.85282516,1004.82031250,0.00000000,0.00000000,0.00000000); //object(ramplandpad) (35)
	CreateDynamicObject(18646,500.01150513,-21.59832001,1004.82031250,0.00000000,0.00000000,0.00000000); //object(ramplandpad) (36)
	CreateDynamicObject(18646,499.92626953,-22.38980293,1004.82031250,0.00000000,0.00000000,0.00000000); //object(ramplandpad) (37)
	CreateDynamicObject(18646,499.85787964,-23.02494431,1004.82031250,0.00000000,0.00000000,0.00000000); //object(ramplandpad) (38)
	CreateDynamicObject(18646,499.81472778,-23.66999054,1004.82031250,0.00000000,0.00000000,0.00000000); //object(ramplandpad) (39)
	CreateDynamicObject(18646,499.85015869,-24.33963776,1004.82031250,0.00000000,0.00000000,0.00000000); //object(ramplandpad) (40)
	CreateDynamicObject(18646,499.91162109,-16.79909325,1004.82031250,0.00000000,0.00000000,0.00000000); //object(ramplandpad) (41)
	CreateDynamicObject(18646,499.85885620,-15.82378101,1004.82031250,0.00000000,0.00000000,0.00000000); //object(ramplandpad) (42)
	CreateDynamicObject(18646,500.03359985,-15.06645298,1004.82031250,0.00000000,0.00000000,0.00000000); //object(ramplandpad) (43)
	CreateDynamicObject(18646,499.87860107,-14.56992340,1004.82031250,0.00000000,0.00000000,0.00000000); //object(ramplandpad) (44)
	CreateDynamicObject(18646,499.79467773,-14.05541515,1004.82031250,0.00000000,0.00000000,0.00000000); //object(ramplandpad) (45)
	CreateDynamicObject(18646,499.86398315,-13.52003002,1004.82031250,0.00000000,0.00000000,0.00000000); //object(ramplandpad) (46)
	CreateDynamicObject(18718,479.36181641,-20.88427544,1001.42803955,0.00000000,0.00000000,0.00000000); //object(ceroad_hill20) (6)
	CreateDynamicObject(18718,489.30688477,-20.89062500,1001.38677979,0.00000000,0.00000000,0.00000000); //object(ceroad_hill20) (7)
	CreateDynamicObject(18724,480.68951416,-1.94531250,1001.70672607,0.00000000,0.00000000,0.00000000); //object(drg_nu_ext) (1)
	CreateDynamicObject(18724,481.19052124,-6.44531345,1000.14758301,0.00000000,0.00000000,0.00000000); //object(drg_nu_ext) (2)
	CreateDynamicObject(18724,483.29043579,-6.44531345,999.78131104,0.00000000,0.00000000,0.00000000); //object(drg_nu_ext) (3)
	CreateDynamicObject(18724,477.38281250,-2.25406170,1002.18737793,0.00000000,0.00000000,0.00000000); //object(drg_nu_ext) (4)
	CreateDynamicObject(18724,497.19009399,-1.94531250,1004.05859375,0.00000000,0.00000000,0.00000000); //object(drg_nu_ext) (5)
	CreateDynamicObject(18724,495.10748291,-1.94996452,1001.67761230,0.00000000,0.00000000,0.00000000); //object(drg_nu_ext) (6)
	CreateDynamicObject(18724,496.32119751,-6.07631683,1001.69201660,0.00000000,0.00000000,0.00000000); //object(drg_nu_ext) (7)
	CreateDynamicObject(18724,488.68118286,-20.89062500,1002.04693604,0.00000000,0.00000000,0.00000000); //object(drg_nu_ext) (8)
	CreateDynamicObject(18724,485.72586060,-20.89062500,1002.16235352,0.00000000,0.00000000,0.00000000); //object(drg_nu_ext) (9)
	CreateDynamicObject(18724,483.83792114,-20.89062500,1002.04675293,0.00000000,0.00000000,0.00000000); //object(drg_nu_ext) (10)
	CreateDynamicObject(18724,482.92349243,-20.89062500,1002.07781982,0.00000000,0.00000000,0.00000000); //object(drg_nu_ext) (11)
	CreateDynamicObject(18724,481.11721802,-20.88427353,1002.04675293,0.00000000,0.00000000,0.00000000); //object(drg_nu_ext) (12)
	CreateDynamicObject(18654,473.39962769,-26.89453506,1002.10937500,0.00000000,0.00000000,210.00000000); //object(darkpoly) (3)
	CreateDynamicObject(18654,473.43865967,-21.48804474,1002.10937500,0.00000000,0.00000000,129.99819946); //object(darkpoly) (6)
	CreateDynamicObject(18655,1836.80603027,-1677.82922363,12.33257294,0.00000000,0.00000000,50.00000000); //object(bridge) (5)
	CreateDynamicObject(18655,1837.00988770,-1687.19091797,12.32405472,0.00000000,0.00000000,319.99877930); //object(bridge) (6)
	CreateDynamicObject(18648,1837.07666016,-1630.70776367,30.82812500,0.00000000,0.00000000,0.00000000); //object(wall2) (7)
	CreateDynamicObject(18648,1837.10156250,-1632.65942383,30.82812500,0.00000000,0.00000000,0.00000000); //object(wall2) (8)
	CreateDynamicObject(18648,1837.06530762,-1634.62292480,30.82812500,0.00000000,0.00000000,0.00000000); //object(wall2) (9)
	CreateDynamicObject(18648,1837.06689453,-1636.20117188,30.82812500,0.00000000,0.00000000,0.00000000); //object(wall2) (10)
	CreateDynamicObject(18648,1837.89746094,-1628.85534668,30.82812500,0.00000000,0.00000000,316.00000000); //object(wall2) (11)
	CreateDynamicObject(18648,1839.68371582,-1628.10327148,30.82812500,0.00000000,0.00000000,269.99975586); //object(wall2) (12)
	CreateDynamicObject(18648,1841.75012207,-1628.11254883,30.82812500,0.00000000,0.00000000,269.99450684); //object(wall2) (13)
	CreateDynamicObject(18648,1843.83288574,-1628.10888672,30.82812500,0.00000000,0.00000000,269.99450684); //object(wall2) (14)
	CreateDynamicObject(18648,1845.43725586,-1628.08178711,30.82812500,0.00000000,0.00000000,269.99450684); //object(wall2) (15)
	CreateDynamicObject(18648,1843.96264648,-1735.33178711,33.17742920,0.00000000,0.00000000,269.99450684); //object(wall2) (16)
	CreateDynamicObject(18648,1842.24902344,-1735.32727051,33.17742920,0.00000000,0.00000000,269.99450684); //object(wall2) (17)
	CreateDynamicObject(18648,1840.82397461,-1735.35498047,33.17742920,0.00000000,0.00000000,269.99450684); //object(wall2) (18)
	CreateDynamicObject(18648,1839.31030273,-1734.73596191,33.17742920,0.00000000,0.00000000,223.99450684); //object(wall2) (19)
	CreateDynamicObject(18648,1838.66577148,-1733.00854492,33.17742920,0.00000000,0.00000000,181.98925781); //object(wall2) (20)
	CreateDynamicObject(18648,1838.63867188,-1731.05126953,33.17742920,0.00000000,0.00000000,179.98852539); //object(wall2) (21)
	CreateDynamicObject(18648,1838.57666016,-1730.09313965,33.17742920,0.00000000,0.00000000,179.98352051); //object(wall2) (22)
	CreateDynamicObject(18649,1837.44396973,-1678.98742676,28.14062500,0.00000000,0.00000000,2.00000000); //object(ramplandpad01) (1)
	CreateDynamicObject(18649,1837.42553711,-1681.07702637,28.14062500,0.00000000,0.00000000,1.99951172); //object(ramplandpad01) (2)
	CreateDynamicObject(18649,1837.34631348,-1683.13891602,28.14062500,0.00000000,0.00000000,1.99951172); //object(ramplandpad01) (3)
	CreateDynamicObject(18649,1837.51171875,-1685.41906738,28.14062500,0.00000000,0.00000000,1.99951172); //object(ramplandpad01) (4)
	CreateDynamicObject(18649,1837.69030762,-1686.86010742,28.14062500,0.00000000,0.00000000,1.99951172); //object(ramplandpad01) (5)
	CreateDynamicObject(3475,1837.72656250,-1674.95385742,14.69948959,0.00000000,0.00000000,0.00000000); //object(vgsn_fncelec_pst) (1)
	CreateDynamicObject(3475,1837.72656250,-1669.93640137,14.69948769,0.00000000,0.00000000,0.00000000); //object(vgsn_fncelec_pst) (2)
	CreateDynamicObject(3475,1837.72656250,-1664.13964844,14.69948959,0.00000000,0.00000000,0.00000000); //object(vgsn_fncelec_pst) (3)
	CreateDynamicObject(3475,1837.72656250,-1657.52014160,14.69948959,0.00000000,0.00000000,0.00000000); //object(vgsn_fncelec_pst) (4)
	CreateDynamicObject(3475,1837.72656250,-1651.53186035,14.69948959,0.00000000,0.00000000,0.00000000); //object(vgsn_fncelec_pst) (5)
	CreateDynamicObject(3475,1837.72656250,-1646.20471191,14.69845390,0.00000000,0.00000000,0.00000000); //object(vgsn_fncelec_pst) (6)
	CreateDynamicObject(3475,1837.72656250,-1640.35961914,14.68867493,0.00000000,0.00000000,0.00000000); //object(vgsn_fncelec_pst) (7)
	CreateDynamicObject(3475,1837.72656250,-1633.52917480,14.68867493,0.00000000,0.00000000,0.00000000); //object(vgsn_fncelec_pst) (8)
	CreateDynamicObject(3475,1837.71875000,-1692.15539551,14.69933891,0.00000000,0.00000000,0.00000000); //object(vgsn_fncelec_pst) (9)
	CreateDynamicObject(3475,1837.71875000,-1698.11633301,14.69933701,0.00000000,0.00000000,0.00000000); //object(vgsn_fncelec_pst) (10)
	CreateDynamicObject(3475,1837.71875000,-1702.65820312,14.69933701,0.00000000,0.00000000,0.00000000); //object(vgsn_fncelec_pst) (11)
	CreateDynamicObject(3475,1837.71875000,-1707.70703125,14.69933701,0.00000000,0.00000000,0.00000000); //object(vgsn_fncelec_pst) (12)
	CreateDynamicObject(3475,1837.71875000,-1713.48815918,14.69933891,0.00000000,0.00000000,0.00000000); //object(vgsn_fncelec_pst) (13)
	CreateDynamicObject(3475,1837.71875000,-1718.65466309,14.69933701,0.00000000,0.00000000,0.00000000); //object(vgsn_fncelec_pst) (14)
	CreateDynamicObject(3475,1837.71228027,-1723.35375977,14.69921494,0.00000000,0.00000000,0.00000000); //object(vgsn_fncelec_pst) (15)
	CreateDynamicObject(3475,1837.71875000,-1729.09594727,14.69933701,0.00000000,0.00000000,0.00000000); //object(vgsn_fncelec_pst) (16)
	CreateDynamicObject(3475,1837.38439941,-1731.70605469,14.69933701,0.00000000,0.00000000,180.00000000); //object(vgsn_fncelec_pst) (17)
	CreateDynamicObject(2773,1828.08435059,-1676.29724121,13.06410313,0.00000000,0.00000000,60.00000000); //object(cj_airprt_bar) (1)
	CreateDynamicObject(2773,1830.30224609,-1677.58728027,13.06410313,0.00000000,0.00000000,59.99633789); //object(cj_airprt_bar) (2)
	CreateDynamicObject(2773,1832.21679688,-1678.74475098,13.04158115,0.00000000,0.00000000,59.99633789); //object(cj_airprt_bar) (3)
	CreateDynamicObject(2773,1834.18994141,-1680.07983398,12.95912647,1.49826050,357.24902344,60.06832886); //object(cj_airprt_bar) (4)
	CreateDynamicObject(2773,1834.18420410,-1685.09936523,12.95936489,2.74682617,357.24475098,122.12292480); //object(cj_airprt_bar) (5)
	CreateDynamicObject(2773,1832.18408203,-1686.37402344,13.04294872,0.00000000,357.24243164,121.98672485); //object(cj_airprt_bar) (7)
	CreateDynamicObject(2773,1830.29858398,-1687.65148926,13.06410313,0.00000000,357.24243164,121.98672485); //object(cj_airprt_bar) (8)
	CreateDynamicObject(2773,1828.23217773,-1688.92419434,13.06410313,0.00000000,357.24243164,121.98672485); //object(cj_airprt_bar) (9)
	CreateDynamicObject(3666,1826.99865723,-1675.71179199,13.06056023,0.00000000,0.00000000,0.00000000); //object(airuntest_las) (1)
	CreateDynamicObject(3666,1835.32312012,-1680.82080078,12.90822983,0.00000000,0.00000000,0.00000000); //object(airuntest_las) (3)
	CreateDynamicObject(3666,1835.34655762,-1684.35205078,12.90724945,0.00000000,0.00000000,0.00000000); //object(airuntest_las) (4)
	CreateDynamicObject(3666,1826.96569824,-1689.61865234,13.06056023,0.00000000,0.00000000,0.00000000); //object(airuntest_las) (6)
	CreateDynamicObject(1569,1837.30102539,-1680.98889160,12.31510544,0.00000000,0.00000000,270.00000000); //object(adam_v_door) (1)
	CreateDynamicObject(1569,1837.32055664,-1683.99743652,12.31548309,0.00000000,0.00000000,90.00000000); //object(adam_v_door) (2)
	CreateDynamicObject(1569,491.92477417,-25.16756630,999.67187500,0.00000000,0.00000000,0.00000000); //object(adam_v_door) (3)
	CreateDynamicObject(1569,494.87707520,-25.17539978,999.67187500,0.00000000,0.00000000,180.00000000); //object(adam_v_door) (4)

	// - Mecanicos
	CreateDynamicObject(7023,2426.17968750,-2081.24804688,12.54687500,0.00000000,0.00000000,0.00000000); //object(vgngateResAntiDebug)(1)
	CreateDynamicObject(3475,2424.26074219,-2098.21972656,14.92304993,0.00000000,0.00000000,0.00000000); //object(vgsn_fncelec_pst)(2)
	CreateDynamicObject(16001,2427.41210938,-2104.67578125,12.54687500,0.00000000,0.00000000,90.00000000); //object(drvin_projhut)(1)
	CreateDynamicObject(8230,2481.57226562,-2109.08935547,14.60590363,0.00000000,0.00000000,0.00000000); //object(vgsbikeschl01)(1)
	CreateDynamicObject(8231,2481.49121094,-2108.91503906,14.42506027,0.00000000,0.00000000,0.00000000); //object(vgsbikeschl05)(1)
	CreateDynamicObject(12925,2499.04882812,-2117.97656250,12.54687500,0.00000000,0.00000000,179.99450684); //object(sw_shed01)(1)
	CreateDynamicObject(12925,2498.93847656,-2110.30175781,12.54687500,0.00000000,0.00000000,179.99450684); //object(sw_shed01)(2)
	CreateDynamicObject(12925,2498.83789062,-2102.18750000,12.54687500,0.00000000,0.00000000,179.99450684); //object(sw_shed01)(3)
	CreateDynamicObject(13027,2524.25195312,-2087.17675781,15.76187706,0.00000000,0.00000000,90.00000000); //object(ce_spray)(1)
	CreateDynamicObject(3292,2529.09082031,-2117.70312500,12.54687500,0.00000000,0.00000000,55.99731445); //object(cxf_payspray_)(1)
	CreateDynamicObject(3292,2462.48144531,-2112.19238281,12.54687500,0.00000000,0.00000000,0.00000000); //object(cxf_payspray_)(2)
	CreateDynamicObject(3293,2467.16699219,-2109.52636719,15.77315903,0.00000000,0.00000000,0.00000000); //object(des_paysinterior)(1)
	CreateDynamicObject(970,2443.95410156,-2104.08398438,13.09835625,0.00000000,0.00000000,0.00000000); //object(fencesmallb)(1)
	CreateDynamicObject(970,2441.86523438,-2104.07421875,13.09835625,0.00000000,0.00000000,0.00000000); //object(fencesmallb)(2)
	CreateDynamicObject(970,2446.03271484,-2106.17651367,13.09835625,0.00000000,0.00000000,270.00000000); //object(fencesmallb)(3)
	CreateDynamicObject(970,2445.99951172,-2110.29541016,13.10447311,0.00000000,0.00000000,270.00000000); //object(fencesmallb)(4)
	CreateDynamicObject(970,2446.00976562,-2114.45800781,13.09835625,0.00000000,0.00000000,270.00000000); //object(fencesmallb)(5)
	CreateDynamicObject(970,2446.00659180,-2118.60351562,13.09835625,0.00000000,0.00000000,270.00000000); //object(fencesmallb)(6)
	CreateDynamicObject(970,2443.89355469,-2120.66137695,13.09835625,0.00000000,0.00000000,180.00000000); //object(fencesmallb)(7)
	CreateDynamicObject(970,2441.80444336,-2120.66967773,13.09835625,0.00000000,0.00000000,179.99450684); //object(fencesmallb)(8)
	CreateDynamicObject(970,2437.69042969,-2120.67919922,13.09835625,0.00000000,0.00000000,179.99450684); //object(fencesmallb)(9)
	CreateDynamicObject(970,2433.53808594,-2120.67675781,13.09835625,0.00000000,0.00000000,179.99450684); //object(fencesmallb)(10)
	CreateDynamicObject(970,2429.39624023,-2120.69091797,13.09835625,0.00000000,0.00000000,179.99450684); //object(fencesmallb)(11)
	CreateDynamicObject(970,2427.23266602,-2120.68750000,13.09835625,0.00000000,0.00000000,179.99450684); //object(fencesmallb)(12)
	CreateDynamicObject(970,2431.32446289,-2103.95751953,13.10447311,0.00000000,0.00000000,179.99450684); //object(fencesmallb)(13)
	CreateDynamicObject(3850,2490.66992188,-2098.38671875,13.09278393,0.00000000,0.00000000,269.99450684); //object(carshowbann_sfsx)(3)
	CreateDynamicObject(3850,2480.46533203,-2098.30761719,13.09278393,0.00000000,0.00000000,269.99450684); //object(carshowbann_sfsx)(5)
	CreateDynamicObject(3850,2477.02221680,-2098.32617188,13.09278393,0.00000000,0.00000000,269.99450684); //object(cocheshowbann_sfsx)(6)
	CreateDynamicObject(3850,2473.59570312,-2098.35742188,13.09278393,0.00000000,0.00000000,269.98901367); //object(cocheshowbann_sfsx)(7)
	CreateDynamicObject(3850,2471.40380859,-2099.99023438,13.09278393,0.00000000,0.00000000,159.99450684); //object(cocheshowbann_sfsx)(8)
	CreateDynamicObject(3850,2487.24584961,-2098.42504883,13.09278393,0.00000000,0.00000000,269.99450684); //object(cocheshowbann_sfsx)(10)
	CreateDynamicObject(1215,2485.46240234,-2098.42871094,13.11119843,0.00000000,0.00000000,0.00000000); //object(bollardlight)(1)
	CreateDynamicObject(1215,2482.18676758,-2098.35888672,13.11119843,0.00000000,0.00000000,0.00000000); //object(bollardlight)(2)
	CreateDynamicObject(1215,2470.82812500,-2101.93945312,13.11119843,0.00000000,0.00000000,0.00000000); //object(bollardlight)(3)
	CreateDynamicObject(1215,2439.67382812,-2104.08789062,13.11119843,0.00000000,0.00000000,0.00000000); //object(bollardlight)(4)
	CreateDynamicObject(1215,2446.01538086,-2103.94091797,13.11119843,0.00000000,0.00000000,0.00000000); //object(bollardlight)(5)
	CreateDynamicObject(1215,2433.42187500,-2103.99023438,13.11731529,0.00000000,0.00000000,0.00000000); //object(bollardlight)(6)
	CreateDynamicObject(1215,2446.04003906,-2120.84082031,13.11119843,0.00000000,0.00000000,0.00000000); //object(bollardlight)(7)
	CreateDynamicObject(1215,2425.02563477,-2120.83666992,13.11119843,0.00000000,0.00000000,0.00000000); //object(bollardlight)(8)
	CreateDynamicObject(1215,2419.27954102,-2081.30981445,13.11119843,0.00000000,0.00000000,0.00000000); //object(bollardlight)(9)
	CreateDynamicObject(1215,2421.94433594,-2084.00390625,13.11119843,0.00000000,0.00000000,0.00000000); //object(bollardlight)(10)
	CreateDynamicObject(1215,2422.03247070,-2095.05566406,13.11119843,0.00000000,0.00000000,0.00000000); //object(bollardlight)(11)
	CreateDynamicObject(1215,2419.34179688,-2097.59179688,13.11119843,0.00000000,0.00000000,0.00000000); //object(bollardlight)(12)
	CreateDynamicObject(1215,2516.22851562,-2083.03906250,13.11119843,0.00000000,0.00000000,0.00000000); //object(bollardlight)(13)
	CreateDynamicObject(1215,2516.08105469,-2091.28613281,13.11119843,0.00000000,0.00000000,0.00000000); //object(bollardlight)(14)
	CreateDynamicObject(1215,2463.19042969,-2101.59277344,13.11119843,0.00000000,0.00000000,0.00000000); //object(bollardlight)(15)
	CreateDynamicObject(970,2516.96801758,-2095.19824219,13.09835625,0.00000000,0.00000000,33.99511719); //object(fencesmallb)(14)
	CreateDynamicObject(970,2506.93432617,-2098.65600586,13.09835625,0.00000000,0.00000000,7.99255371); //object(fencesmallb)(16)
	CreateDynamicObject(1215,2515.14453125,-2096.45458984,13.11119843,0.00000000,0.00000000,0.00000000); //object(bollardlight)(17)
	CreateDynamicObject(1215,2509.04443359,-2098.27246094,13.11119843,0.00000000,0.00000000,0.00000000); //object(bollardlight)(18)
	CreateDynamicObject(3292,2526.44433594,-2091.86157227,12.54687500,0.00000000,0.00000000,90.00000000); //object(cxf_payspray_)(3)
	CreateDynamicObject(3293,2529.29760742,-2112.48339844,15.77315903,0.00000000,0.00000000,54.00000000); //object(des_paysinterior)(2)
	CreateDynamicObject(1215,2525.38232422,-2104.84057617,13.11119843,0.00000000,0.00000000,0.00000000); //object(bollardlight)(19)
	CreateDynamicObject(1215,2520.81054688,-2111.43652344,13.11119843,0.00000000,0.00000000,0.00000000); //object(bollardlight)(20)
	CreateDynamicObject(970,2525.31542969,-2103.21875000,13.09835625,0.00000000,0.00000000,299.99267578); //object(fencesmallb)(17)
	CreateDynamicObject(970,2524.24023438,-2101.39257812,13.09835625,0.00000000,0.00000000,299.99267578); //object(fencesmallb)(18)
	CreateDynamicObject(970,2522.17285156,-2097.80273438,13.09835625,0.00000000,0.00000000,299.99267578); //object(fencesmallb)(19)
	CreateDynamicObject(970,2516.50488281,-2115.56250000,13.09835625,0.00000000,0.00000000,3.98803711); //object(fencesmallb)(20)
	CreateDynamicObject(970,2512.35449219,-2115.81933594,13.09835625,0.00000000,0.00000000,3.98803711); //object(fencesmallb)(21)
	CreateDynamicObject(970,2508.24121094,-2116.13085938,13.09835625,0.00000000,0.00000000,3.98803711); //object(fencesmallb)(22)
	CreateDynamicObject(1191,2519.59204102,-2113.89599609,16.53292084,0.00000000,0.00000000,60.00000000); //object(fbmp_lr_t1)(1)
	CreateDynamicObject(1191,2519.58032227,-2113.91357422,16.06511116,0.00000000,0.00000000,59.99633789); //object(fbmp_lr_t1)(2)
	CreateDynamicObject(1191,2519.56640625,-2113.93408203,15.53797531,0.00000000,0.00000000,59.99633789); //object(fbmp_lr_t1)(3)
	CreateDynamicObject(1186,2520.55566406,-2112.46679688,14.85471153,0.00000000,0.00000000,235.99731445); //object(rbmp_lr_sv2)(1)
	CreateDynamicObject(1186,2520.56933594,-2112.44726562,14.20057678,0.00000000,0.00000000,235.99731445); //object(rbmp_lr_sv2)(2)
	CreateDynamicObject(1096,2537.18066406,-2114.08618164,17.32735252,0.00000000,0.00000000,150.00000000); //object(wheel_gn3)(1)
	CreateDynamicObject(1096,2536.45996094,-2115.15429688,17.31963730,0.00000000,0.00000000,149.99087524); //object(wheel_gn3)(2)
	CreateDynamicObject(1096,2536.46801758,-2115.14257812,16.13334656,0.00000000,0.00000000,149.99633789); //object(wheel_gn3)(3)
	CreateDynamicObject(1096,2537.16601562,-2114.10742188,16.11367416,0.00000000,0.00000000,149.99084473); //object(wheel_gn3)(4)
	CreateDynamicObject(1097,2527.51367188,-2106.61230469,17.26939201,0.00000000,0.00000000,235.99731445); //object(wheel_gn4)(1)
	CreateDynamicObject(1097,2528.56860352,-2107.32373047,17.27414513,0.00000000,0.00000000,235.99731445); //object(wheel_gn4)(2)
	CreateDynamicObject(1097,2529.59277344,-2108.01464844,17.27875710,0.00000000,0.00000000,235.99731445); //object(wheel_gn4)(3)
	CreateDynamicObject(1097,2530.60986328,-2108.70068359,17.31233788,0.00000000,0.00000000,235.99731445); //object(wheel_gn4)(4)
	CreateDynamicObject(1076,2534.76782227,-2117.24560547,13.04633236,0.00000000,0.00000000,144.00000000); //object(wheel_lr4)(1)
	CreateDynamicObject(1076,2534.20410156,-2118.01269531,13.04633236,0.00000000,0.00000000,143.99230957); //object(wheel_lr4)(2)
	CreateDynamicObject(1076,2533.56054688,-2118.85937500,13.04633236,0.00000000,0.00000000,143.99230957); //object(wheel_lr4)(3)
	CreateDynamicObject(1075,2536.07519531,-2112.51074219,13.04633236,0.00000000,0.00000000,209.99816895); //object(wheel_sr2)(1)
	CreateDynamicObject(1075,2535.33398438,-2112.00781250,13.04633236,0.00000000,0.00000000,249.99389648); //object(wheel_sr2)(2)
	CreateDynamicObject(1008,2535.77832031,-2113.42675781,12.55419827,0.00000000,0.00000000,59.99633789); //object(nto_b_l)(1)
	CreateDynamicObject(1008,2535.48046875,-2113.24023438,12.55419827,0.00000000,0.00000000,59.99084473); //object(nto_b_l)(2)
	CreateDynamicObject(1008,2535.17919922,-2113.02734375,12.55419827,0.00000000,0.00000000,59.99633789); //object(nto_b_l)(3)
	CreateDynamicObject(1008,2534.89062500,-2112.77246094,12.55419827,0.00000000,0.00000000,59.99084473); //object(nto_b_l)(4)
	CreateDynamicObject(1010,2534.59765625,-2111.45898438,12.55419827,0.00000000,0.00000000,321.99829102); //object(nto_b_tw)(1)
	CreateDynamicObject(1010,2534.33398438,-2111.83886719,12.55419827,0.00000000,0.00000000,321.99829102); //object(nto_b_tw)(2)
	CreateDynamicObject(1010,2534.05371094,-2112.20605469,12.55419827,0.00000000,0.00000000,321.99829102); //object(nto_b_tw)(3)
	CreateDynamicObject(1010,2534.65600586,-2112.37377930,12.55419827,0.00000000,0.00000000,241.99829102); //object(nto_b_tw)(4)
	CreateDynamicObject(970,2522.21972656,-2119.76464844,13.09835625,0.00000000,0.00000000,93.98803711); //object(fencesmallb)(23)
	CreateDynamicObject(970,2534.73632812,-2094.87304688,13.09835625,0.00000000,0.00000000,359.98901367); //object(fencesmallb)(24)
	CreateDynamicObject(970,2538.74902344,-2094.88769531,13.09835625,0.00000000,0.00000000,359.98352051); //object(fencesmallb)(25)
	CreateDynamicObject(970,2540.64843750,-2112.67553711,13.09835625,0.00000000,0.00000000,7.98803711); //object(fencesmallb)(20)
	CreateDynamicObject(970,2540.64843750,-2112.67480469,14.24833870,0.00000000,0.00000000,7.98706055); //object(fencesmallb)(20)
	CreateDynamicObject(970,2525.31542969,-2103.21875000,14.14834023,0.00000000,0.00000000,299.99267578); //object(fencesmallb)(17)
	CreateDynamicObject(970,2524.24023438,-2101.39257812,14.14834023,0.00000000,0.00000000,299.99267578); //object(fencesmallb)(18)
	CreateDynamicObject(970,2522.17285156,-2097.80273438,14.17333984,0.00000000,0.00000000,299.99267578); //object(fencesmallb)(19)
	CreateDynamicObject(970,2538.74902344,-2094.88769531,14.17333984,0.00000000,0.00000000,359.98352051); //object(fencesmallb)(25)
	CreateDynamicObject(970,2534.73632812,-2094.87304688,14.17333984,0.00000000,0.00000000,359.98901367); //object(fencesmallb)(24)
	CreateDynamicObject(970,2522.21972656,-2119.76464844,13.99834251,0.00000000,0.00000000,93.98803711); //object(fencesmallb)(23)
	CreateDynamicObject(970,2516.50488281,-2115.56250000,14.14835930,0.00000000,0.00000000,3.98803711); //object(fencesmallb)(20)
	CreateDynamicObject(970,2512.35449219,-2115.81933594,14.14834023,0.00000000,0.00000000,3.98803711); //object(fencesmallb)(21)
	CreateDynamicObject(970,2508.24121094,-2116.13085938,14.14834023,0.00000000,0.00000000,3.98803711); //object(fencesmallb)(22)
	CreateDynamicObject(1663,2485.16552734,-2109.59716797,13.18214989,0.00000000,0.00000000,170.00000000); //object(swivelchair_b) (1)
	CreateDynamicObject(1726,2486.48291016,-2101.00439453,12.72193527,0.00000000,0.00000000,0.00000000); //object(mrk_seating2) (1)
	CreateDynamicObject(1726,2489.63842773,-2102.15722656,12.72193527,0.00000000,0.00000000,270.00000000); //object(mrk_seating2) (2)
	CreateDynamicObject(1727,2488.76074219,-2104.86791992,12.72193527,0.00000000,0.00000000,210.00000000); //object(mrk_seating2b) (1)
	CreateDynamicObject(1727,2487.19213867,-2105.32714844,12.72193527,0.00000000,0.00000000,159.99816895); //object(mrk_seating2b) (2)
	CreateDynamicObject(2008,2482.47607422,-2108.43676758,12.72193527,0.00000000,0.00000000,0.00000000); //object(officedesk1) (1)
	CreateDynamicObject(2008,2484.38574219,-2108.49902344,12.72193527,0.00000000,0.00000000,352.00000000); //object(officedesk1) (2)
	CreateDynamicObject(1663,2483.40771484,-2109.53564453,13.18214989,0.00000000,0.00000000,179.99694824); //object(swivelchair_b) (2)
	CreateDynamicObject(2172,2489.91088867,-2112.13696289,12.72193527,0.00000000,0.00000000,270.00000000); //object(med_office2_desk_1) (1)
	CreateDynamicObject(2172,2489.90209961,-2114.04174805,12.72193527,0.00000000,0.00000000,270.00000000); //object(med_office2_desk_1) (2)
	CreateDynamicObject(2172,2489.34008789,-2115.95947266,12.72193527,0.00000000,0.00000000,210.00000000); //object(med_office2_desk_1) (3)
	CreateDynamicObject(2172,2487.44677734,-2116.73217773,12.72193527,0.00000000,0.00000000,179.99816895); //object(med_office2_desk_1) (4)
	CreateDynamicObject(2172,2485.53051758,-2116.71166992,12.72193527,0.00000000,0.00000000,179.99450684); //object(med_office2_desk_1) (5)
	CreateDynamicObject(1671,2488.63916016,-2112.68432617,13.18214989,0.00000000,0.00000000,90.00000000); //object(swivelchair_a) (1)
	CreateDynamicObject(1671,2488.66040039,-2114.35961914,13.18214989,0.00000000,0.00000000,90.00000000); //object(swivelchair_a) (2)
	CreateDynamicObject(1671,2488.25439453,-2115.17578125,13.18214989,0.00000000,0.00000000,30.00000000); //object(swivelchair_a) (3)
	CreateDynamicObject(1671,2486.89233398,-2115.41333008,13.18214989,0.00000000,0.00000000,359.99816895); //object(swivelchair_a) (4)
	CreateDynamicObject(1671,2485.08691406,-2115.36401367,13.18214989,0.00000000,0.00000000,359.99450684); //object(swivelchair_a) (5)
	CreateDynamicObject(3051,2469.75585938,-2102.22900391,17.86498260,316.03369141,91.93023682,2.02920532); //object(lift_dr) (1)
	CreateDynamicObject(3051,2467.12719727,-2102.26733398,17.86498260,316.03271484,91.92810059,0.77673340); //object(lift_dr) (2)
	CreateDynamicObject(3051,2464.65112305,-2102.26293945,17.86498260,316.02722168,91.92260742,2.77404785); //object(lift_dr) (3)
	CreateDynamicObject(927,2464.90917969,-2116.78735352,15.79972363,0.00000000,0.00000000,180.00000000); //object(piping_detail) (1)
	CreateDynamicObject(927,2466.58789062,-2116.79443359,14.19974804,0.00000000,0.00000000,179.99450684); //object(piping_detail) (2)
	CreateDynamicObject(929,2466.82666016,-2116.87646484,13.51528072,0.00000000,0.00000000,270.00000000); //object(generator) (1)
	CreateDynamicObject(958,2467.06665039,-2116.26538086,13.43103600,0.00000000,0.00000000,0.00000000); //object(cj_chip_maker) (1)
	CreateDynamicObject(959,2466.76269531,-2117.55126953,13.43771839,0.00000000,0.00000000,0.00000000); //object(cj_chip_maker_bits) (1)
	CreateDynamicObject(1353,2465.12426758,-2116.27539062,13.22473240,0.00000000,0.00000000,180.00000000); //object(cj_aircon) (1)
	CreateDynamicObject(1690,2459.78906250,-2105.24169922,17.57433128,0.00000000,0.00000000,178.50000000); //object(gen_rooAISEt4) (1)
	CreateDynamicObject(1690,2459.67626953,-2112.36474609,17.57433128,0.00000000,0.00000000,178.49487305); //object(gen_rooAISEt4) (2)
	CreateDynamicObject(2649,2463.55712891,-2116.47558594,14.30599499,0.00000000,0.00000000,0.00000000); //object(cj_aircon2) (1)
	CreateDynamicObject(3675,2456.76123047,-2114.92333984,19.38418961,0.00000000,0.00000000,230.00000000); //object(laxrf_refinerypipe) (1)
	CreateDynamicObject(3675,2456.76342773,-2118.19384766,19.38418961,0.00000000,0.00000000,229.99877930); //object(laxrf_refinerypipe) (2)
	CreateDynamicObject(3675,2457.30493164,-2121.22436523,19.45392990,0.00000000,0.00000000,229.99877930); //object(laxrf_refinerypipe) (3)
	CreateDynamicObject(16666,2456.11718750,-2124.55517578,12.55299187,0.00000000,0.00000000,0.00000000); //object(a51_machines) (1)
	CreateDynamicObject(920,2468.79858398,-2115.74609375,13.03900719,0.00000000,0.00000000,196.00000000); //object(y_generator) (1)
	CreateDynamicObject(959,2460.27758789,-2102.13427734,13.41283607,0.00000000,0.00000000,0.00000000); //object(cj_chip_maker_bits) (2)
	CreateDynamicObject(958,2460.27441406,-2102.12182617,13.42371368,0.00000000,0.00000000,0.00000000); //object(cj_chip_maker) (2)

	// - Paisajes y Luces extras
	CreateDynamicObject(970,1358.92089844,-1747.20483398,13.09835625,0.00000000,0.00000000,0.00000000); //object(fencesmallb) (1)
	CreateDynamicObject(970,1361.04394531,-1749.27990723,13.09155560,0.00000000,0.00000000,270.00000000); //object(fencesmallb) (3)
	CreateDynamicObject(970,1361.00012207,-1754.04968262,13.07087803,0.00000000,0.00000000,270.00000000); //object(fencesmallb) (4)
	CreateDynamicObject(970,1358.90197754,-1756.15307617,13.05929375,0.00000000,0.00000000,180.00000000); //object(fencesmallb) (5)
	CreateDynamicObject(970,1356.81286621,-1756.16748047,13.05929375,0.00000000,0.00000000,179.99450684); //object(fencesmallb) (6)
	CreateDynamicObject(970,1343.60168457,-1756.20593262,13.05929375,0.00000000,0.00000000,179.99450684); //object(fencesmallb) (7)
	CreateDynamicObject(970,1347.73999023,-1756.18408203,13.05929375,0.00000000,0.00000000,179.99450684); //object(fencesmallb) (8)
	CreateDynamicObject(970,1341.50012207,-1754.10827637,13.06607723,0.00000000,0.00000000,89.99450684); //object(fencesmallb) (9)
	CreateDynamicObject(970,1341.47448730,-1749.96679688,13.07725143,0.00000000,0.00000000,89.99450684); //object(fencesmallb) (10)
	CreateDynamicObject(970,1341.47888184,-1745.83447266,13.08834362,0.00000000,0.00000000,89.99450684); //object(fencesmallb) (11)
	CreateDynamicObject(970,1341.49523926,-1743.74536133,13.09392357,0.00000000,0.00000000,89.99450684); //object(fencesmallb) (12)
	CreateDynamicObject(1215,1356.77026367,-1747.24462891,13.11119843,0.00000000,0.00000000,0.00000000); //object(bollardlight) (1)
	CreateDynamicObject(1215,1361.11645508,-1751.67529297,13.09339046,0.00000000,0.00000000,0.00000000); //object(bollardlight) (2)
	CreateDynamicObject(1215,1354.61999512,-1756.29235840,13.07213593,0.00000000,0.00000000,0.00000000); //object(bollardlight) (3)
	CreateDynamicObject(1215,1349.84887695,-1756.24328613,13.07213593,0.00000000,0.00000000,0.00000000); //object(bollardlight) (4)
	CreateDynamicObject(1215,1341.29394531,-1741.59277344,12.94713593,0.00000000,0.00000000,0.00000000); //object(bollardlight) (5)
	CreateDynamicObject(1215,1345.72949219,-1722.17150879,13.13521290,0.00000000,0.00000000,0.00000000); //object(bollardlight) (6)
	CreateDynamicObject(1215,1351.78735352,-1722.13989258,13.17219639,0.00000000,0.00000000,0.00000000); //object(bollardlight) (7)
	CreateDynamicObject(1215,1352.13220215,-1416.27185059,13.07162189,0.00000000,0.00000000,0.00000000); //object(bollardlight) (8)
	CreateDynamicObject(1215,1348.09899902,-1416.23254395,13.05872154,0.00000000,0.00000000,0.00000000); //object(bollardlight) (9)
	CreateDynamicObject(712,1350.17700195,-1418.27954102,22.14623260,0.00000000,0.00000000,0.00000000); //object(vgs_palm03) (3)
	CreateDynamicObject(712,1349.32153320,-1431.68090820,22.14623260,0.00000000,0.00000000,0.00000000); //object(vgs_palm03) (4)
	CreateDynamicObject(712,1348.54553223,-1442.08203125,22.14623260,0.00000000,0.00000000,0.00000000); //object(vgs_palm03) (5)
	CreateDynamicObject(712,1346.79956055,-1453.91271973,22.14623260,0.00000000,0.00000000,0.00000000); //object(vgs_palm03) (6)
	CreateDynamicObject(712,1342.64697266,-1472.59350586,22.13843918,0.00000000,0.00000000,0.00000000); //object(vgs_palm03) (7)
	CreateDynamicObject(712,1339.71752930,-1479.71459961,22.14623260,0.00000000,0.00000000,0.00000000); //object(vgs_palm03) (8)
	CreateDynamicObject(712,1330.99548340,-1496.67297363,22.14623260,0.00000000,0.00000000,0.00000000); //object(vgs_palm03) (9)
	CreateDynamicObject(712,1328.70336914,-1500.60351562,22.14623260,0.00000000,0.00000000,0.00000000); //object(vgs_palm03) (10)
	CreateDynamicObject(712,1317.60046387,-1517.32836914,22.14623260,0.00000000,0.00000000,0.00000000); //object(vgs_palm03) (11)
	CreateDynamicObject(712,1315.72290039,-1520.88159180,22.13843918,0.00000000,0.00000000,0.00000000); //object(vgs_palm03) (12)
	CreateDynamicObject(712,1305.07226562,-1716.09851074,22.14623260,0.00000000,0.00000000,0.00000000); //object(vgs_palm03) (13)
	CreateDynamicObject(712,1307.90356445,-1540.91589355,22.14623260,0.00000000,0.00000000,0.00000000); //object(vgs_palm03) (14)
	CreateDynamicObject(712,1306.19519043,-1553.42651367,22.14623260,0.00000000,0.00000000,0.00000000); //object(vgs_palm03) (15)
	CreateDynamicObject(647,1350.27429199,-1422.06079102,14.37879086,0.00000000,0.00000000,0.00000000); //object(new_bushsm) (1)
	CreateDynamicObject(647,1349.41992188,-1428.46472168,14.37879086,0.00000000,0.00000000,0.00000000); //object(new_bushsm) (2)
	CreateDynamicObject(647,1349.50512695,-1424.93139648,14.37879086,0.00000000,0.00000000,0.00000000); //object(new_bushsm) (3)
	CreateDynamicObject(647,1348.91613770,-1434.35156250,14.37879086,0.00000000,0.00000000,0.00000000); //object(new_bushsm) (4)
	CreateDynamicObject(647,1348.66918945,-1438.39111328,14.37879086,0.00000000,0.00000000,0.00000000); //object(new_bushsm) (5)
	CreateDynamicObject(647,1348.10559082,-1445.04919434,14.37879086,0.00000000,0.00000000,0.00000000); //object(new_bushsm) (6)
	CreateDynamicObject(647,1347.42163086,-1450.38635254,14.37879086,0.00000000,0.00000000,0.00000000); //object(new_bushsm) (7)
	CreateDynamicObject(647,1346.06481934,-1457.08972168,14.37879086,0.00000000,0.00000000,0.00000000); //object(new_bushsm) (8)
	CreateDynamicObject(647,1345.33666992,-1460.73156738,14.37879086,0.00000000,0.00000000,0.00000000); //object(new_bushsm) (9)
	CreateDynamicObject(647,1344.42016602,-1464.50842285,14.37879086,0.00000000,0.00000000,0.00000000); //object(new_bushsm) (10)
	CreateDynamicObject(647,1343.29272461,-1468.03857422,14.37099743,0.00000000,0.00000000,0.00000000); //object(new_bushsm) (11)
	CreateDynamicObject(647,1341.67224121,-1474.79797363,14.37099743,0.00000000,0.00000000,0.00000000); //object(new_bushsm) (12)
	CreateDynamicObject(647,1340.63159180,-1477.37500000,14.37879086,0.00000000,0.00000000,0.00000000); //object(new_bushsm) (13)
	CreateDynamicObject(647,1338.63610840,-1482.22216797,14.37879086,0.00000000,0.00000000,0.00000000); //object(new_bushsm) (14)
	CreateDynamicObject(647,1336.70056152,-1485.93908691,14.37879086,0.00000000,0.00000000,0.00000000); //object(new_bushsm) (15)
	CreateDynamicObject(647,1334.88476562,-1489.50805664,14.37879086,0.00000000,0.00000000,0.00000000); //object(new_bushsm) (16)
	CreateDynamicObject(647,1333.10278320,-1493.01220703,14.37879086,0.00000000,0.00000000,0.00000000); //object(new_bushsm) (17)
	CreateDynamicObject(647,1327.24560547,-1503.18225098,14.37879086,0.00000000,0.00000000,0.00000000); //object(new_bushsm) (18)
	CreateDynamicObject(647,1325.34240723,-1505.77636719,14.37879086,0.00000000,0.00000000,0.00000000); //object(new_bushsm) (19)
	CreateDynamicObject(647,1323.59741211,-1508.66833496,14.37879086,0.00000000,0.00000000,0.00000000); //object(new_bushsm) (20)
	CreateDynamicObject(647,1321.47229004,-1511.24377441,14.37879086,0.00000000,0.00000000,0.00000000); //object(new_bushsm) (21)
	CreateDynamicObject(647,1318.99206543,-1514.62426758,14.37879086,0.00000000,0.00000000,0.00000000); //object(new_bushsm) (22)
	CreateDynamicObject(647,1314.66552734,-1523.31591797,14.37099743,0.00000000,0.00000000,0.00000000); //object(new_bushsm) (23)
	CreateDynamicObject(647,1312.94555664,-1527.24353027,14.37099743,0.00000000,0.00000000,0.00000000); //object(new_bushsm) (24)
	CreateDynamicObject(647,1311.50695801,-1530.50732422,14.37879086,0.00000000,0.00000000,0.00000000); //object(new_bushsm) (25)
	CreateDynamicObject(647,1310.32482910,-1533.17565918,14.37879086,0.00000000,0.00000000,0.00000000); //object(new_bushsm) (26)
	CreateDynamicObject(647,1307.75012207,-1543.72460938,14.37879086,0.00000000,0.00000000,0.00000000); //object(new_bushsm) (27)
	CreateDynamicObject(647,1307.14404297,-1547.47082520,14.37879086,0.00000000,0.00000000,0.00000000); //object(new_bushsm) (28)
	CreateDynamicObject(647,1306.45385742,-1551.27490234,14.37879086,0.00000000,0.00000000,0.00000000); //object(new_bushsm) (29)
	CreateDynamicObject(1215,1349.38598633,-1448.07019043,13.11119843,0.00000000,0.00000000,0.00000000); //object(bollardlight) (10)
	CreateDynamicObject(1215,1342.85668945,-1477.27868652,13.11119843,0.00000000,0.00000000,0.00000000); //object(bollardlight) (11)
	CreateDynamicObject(1215,1331.61059570,-1499.78344727,13.06078243,0.00000000,0.00000000,0.00000000); //object(bollardlight) (12)
	CreateDynamicObject(1215,1317.94006348,-1519.73059082,13.10401726,0.00000000,0.00000000,0.00000000); //object(bollardlight) (13)
	CreateDynamicObject(1215,1310.01196289,-1539.50988770,13.11119843,0.00000000,0.00000000,0.00000000); //object(bollardlight) (14)
	CreateDynamicObject(1215,1306.84313965,-1538.76562500,13.11119843,0.00000000,0.00000000,0.00000000); //object(bollardlight) (15)
	CreateDynamicObject(1215,1315.20788574,-1518.72912598,13.11119843,0.00000000,0.00000000,0.00000000); //object(bollardlight) (16)
	CreateDynamicObject(1215,1328.22900391,-1498.08825684,13.11119843,0.00000000,0.00000000,0.00000000); //object(bollardlight) (17)
	CreateDynamicObject(1215,1339.50756836,-1475.99353027,13.11119843,0.00000000,0.00000000,0.00000000); //object(bollardlight) (18)
	CreateDynamicObject(1215,1346.09948730,-1447.58044434,13.11119843,0.00000000,0.00000000,0.00000000); //object(bollardlight) (19)
	CreateDynamicObject(712,1285.32299805,-1779.35241699,22.64993286,0.00000000,0.00000000,0.00000000); //object(vgs_palm03) (16)
	CreateDynamicObject(712,1285.13623047,-1763.04467773,22.64993286,0.00000000,0.00000000,0.00000000); //object(vgs_palm03) (17)
	CreateDynamicObject(712,1285.16455078,-1745.18139648,22.64993286,0.00000000,0.00000000,0.00000000); //object(vgs_palm03) (18)
	CreateDynamicObject(647,1285.33923340,-1748.18469238,14.88249111,0.00000000,0.00000000,0.00000000); //object(new_bushsm) (30)
	CreateDynamicObject(647,1285.33032227,-1748.10363770,14.88249111,0.00000000,0.00000000,0.00000000); //object(new_bushsm) (31)
	CreateDynamicObject(647,1285.31250000,-1751.63232422,14.88249111,0.00000000,0.00000000,0.00000000); //object(new_bushsm) (32)
	CreateDynamicObject(647,1285.25891113,-1756.31689453,14.88249111,0.00000000,0.00000000,0.00000000); //object(new_bushsm) (33)
	CreateDynamicObject(647,1285.20275879,-1769.65881348,14.88249111,0.00000000,0.00000000,0.00000000); //object(new_bushsm) (34)
	CreateDynamicObject(647,1285.36206055,-1774.30895996,14.88249111,0.00000000,0.00000000,0.00000000); //object(new_bushsm) (35)
	CreateDynamicObject(3877,1304.77832031,-1686.20117188,14.21261597,0.00000000,0.00000000,0.00000000); //object(sf_rooflite) (1)
	CreateDynamicObject(3877,1304.95507812,-1843.39746094,14.21261597,0.00000000,0.00000000,0.00000000); //object(sf_rooflite) (2)
	CreateDynamicObject(712,1306.19433594,-1553.42578125,22.14623260,0.00000000,0.00000000,0.00000000); //object(vgs_palm03) (20)
	CreateDynamicObject(712,1304.92810059,-1706.54809570,22.14623260,0.00000000,0.00000000,0.00000000); //object(vgs_palm03) (21)
	CreateDynamicObject(712,1304.58752441,-1690.44909668,22.14623260,0.00000000,0.00000000,0.00000000); //object(vgs_palm03) (22)
	CreateDynamicObject(712,1285.02612305,-1804.66113281,22.43319321,0.00000000,0.00000000,0.00000000); //object(vgs_palm03) (23)
	CreateDynamicObject(712,1285.04052734,-1815.84191895,22.39652252,0.00000000,0.00000000,0.00000000); //object(vgs_palm03) (24)
	CreateDynamicObject(712,1284.62719727,-1830.95141602,22.39854431,0.00000000,0.00000000,0.00000000); //object(vgs_palm03) (25)
	CreateDynamicObject(712,1252.64819336,-1840.74414062,22.32747459,0.00000000,0.00000000,0.00000000); //object(vgs_palm03) (26)
	CreateDynamicObject(712,1244.27758789,-1839.67822266,22.44051743,0.00000000,0.00000000,0.00000000); //object(vgs_palm03) (27)
	CreateDynamicObject(712,1235.01159668,-1839.88903809,22.43641090,0.00000000,0.00000000,0.00000000); //object(vgs_palm03) (28)
	CreateDynamicObject(712,1227.20556641,-1840.53381348,22.35789680,0.00000000,0.00000000,0.00000000); //object(vgs_palm03) (29)
	CreateDynamicObject(712,1199.04772949,-1839.76843262,22.46005058,0.00000000,0.00000000,0.00000000); //object(vgs_palm03) (30)
	CreateDynamicObject(712,1192.81091309,-1839.96350098,22.44728088,0.00000000,0.00000000,0.00000000); //object(vgs_palm03) (31)
	CreateDynamicObject(712,1192.64294434,-1830.60070801,22.46177864,0.00000000,0.00000000,0.00000000); //object(vgs_palm03) (32)
	CreateDynamicObject(996,1304.27270508,-1838.89733887,13.29563046,0.00000000,0.00000000,90.00000000); //object(lhouse_barrier1) (1)
	CreateDynamicObject(996,1304.26440430,-1830.64831543,13.29563046,0.00000000,0.00000000,90.00000000); //object(lhouse_barrier1) (2)
	CreateDynamicObject(996,1304.31958008,-1822.44628906,13.29563046,0.00000000,0.00000000,90.00000000); //object(lhouse_barrier1) (3)
	CreateDynamicObject(996,1304.23437500,-1814.22448730,13.29563046,0.00000000,0.00000000,90.00000000); //object(lhouse_barrier1) (4)
	CreateDynamicObject(996,1304.32946777,-1805.90441895,13.29563046,0.00000000,0.00000000,90.00000000); //object(lhouse_barrier1) (5)
	CreateDynamicObject(996,1304.40100098,-1797.60327148,13.29563046,0.00000000,0.00000000,90.00000000); //object(lhouse_barrier1) (6)
	CreateDynamicObject(996,1304.54528809,-1789.22973633,13.29563046,0.00000000,0.00000000,90.00000000); //object(lhouse_barrier1) (7)
	CreateDynamicObject(996,1304.50988770,-1777.94006348,13.29563046,0.00000000,0.00000000,90.00000000); //object(lhouse_barrier1) (8)
	CreateDynamicObject(996,1304.54516602,-1769.75610352,13.29563046,0.00000000,0.00000000,90.00000000); //object(lhouse_barrier1) (9)
	CreateDynamicObject(996,1304.52661133,-1761.59436035,13.29563046,0.00000000,0.00000000,90.00000000); //object(lhouse_barrier1) (10)
	CreateDynamicObject(996,1304.72998047,-1751.69616699,13.29563046,0.00000000,0.00000000,90.00000000); //object(lhouse_barrier1) (11)
	CreateDynamicObject(996,1304.71398926,-1743.48510742,13.29563046,0.00000000,0.00000000,90.00000000); //object(lhouse_barrier1) (12)
	CreateDynamicObject(996,1304.70861816,-1735.17968750,13.29563046,0.00000000,0.00000000,90.00000000); //object(lhouse_barrier1) (13)
	CreateDynamicObject(996,1304.82238770,-1726.75183105,13.29563046,0.00000000,0.00000000,90.00000000); //object(lhouse_barrier1) (14)
	CreateDynamicObject(996,1304.90893555,-1718.36779785,13.29563046,0.00000000,0.00000000,90.00000000); //object(lhouse_barrier1) (15)
	CreateDynamicObject(996,1304.92822266,-1710.09716797,13.29563046,0.00000000,0.00000000,90.00000000); //object(lhouse_barrier1) (16)
	CreateDynamicObject(996,1305.00292969,-1701.35302734,13.29563046,0.00000000,0.00000000,90.00000000); //object(lhouse_barrier1) (17)
	CreateDynamicObject(996,1304.80822754,-1693.69152832,13.29563046,0.00000000,0.00000000,90.00000000); //object(lhouse_barrier1) (18)
	CreateDynamicObject(1215,1311.11376953,-901.24169922,39.14244843,0.00000000,0.00000000,0.00000000); //object(bollardlight) (21)
	CreateDynamicObject(1215,1320.27868652,-901.44104004,39.14244843,0.00000000,0.00000000,0.00000000); //object(bollardlight) (22)
	CreateDynamicObject(1215,1311.27587891,-911.13427734,38.05143738,0.00000000,0.00000000,0.00000000); //object(bollardlight) (23)
	CreateDynamicObject(1215,1320.05273438,-911.65100098,37.17313385,0.00000000,0.00000000,0.00000000); //object(bollardlight) (24)
	CreateDynamicObject(1215,1342.69580078,-918.47552490,35.07364655,0.00000000,0.00000000,0.00000000); //object(bollardlight) (25)
	CreateDynamicObject(1215,1334.12097168,-914.92584229,35.86180496,0.00000000,0.00000000,0.00000000); //object(bollardlight) (26)
	CreateDynamicObject(1215,1218.99804688,-923.20465088,42.65807343,0.00000000,0.00000000,0.00000000); //object(bollardlight) (27)
	CreateDynamicObject(1215,1218.37426758,-919.66333008,42.65807343,0.00000000,0.00000000,0.00000000); //object(bollardlight) (28)
	CreateDynamicObject(1215,1183.27319336,-921.66802979,42.87384033,0.00000000,0.00000000,0.00000000); //object(bollardlight) (29)
	CreateDynamicObject(1215,1211.82617188,-919.75164795,42.58707809,0.00000000,0.00000000,0.00000000); //object(bollardlight) (30)
	CreateDynamicObject(1215,1176.62390137,-892.94775391,42.89308548,0.00000000,0.00000000,0.00000000); //object(bollardlight) (31)
	CreateDynamicObject(1215,1207.02307129,-888.65179443,42.58761978,0.00000000,0.00000000,0.00000000); //object(bollardlight) (32)
	CreateDynamicObject(1215,907.35046387,-1766.88867188,13.11119843,0.00000000,0.00000000,0.00000000); //object(bollardlight) (33)
	CreateDynamicObject(1215,911.56945801,-1763.24890137,13.10270309,0.00000000,0.00000000,0.00000000); //object(bollardlight) (34)
	CreateDynamicObject(1215,922.93664551,-1763.61694336,13.11022568,0.00000000,0.00000000,0.00000000); //object(bollardlight) (35)
	CreateDynamicObject(1215,927.32775879,-1767.92443848,13.11417961,0.00000000,0.00000000,0.00000000); //object(bollardlight) (36)
	CreateDynamicObject(3430,1479.99682617,-1722.42419434,14.20988750,0.00000000,0.00000000,0.00000000); //object(vegasbooth01) (1)
	CreateDynamicObject(3437,1276.60021973,-1724.47326660,18.90747643,0.00000000,0.00000000,0.00000000); //object(ballypllr01_lvs) (1)
	CreateDynamicObject(3437,1271.04370117,-1724.32556152,18.90747643,0.00000000,0.00000000,0.00000000); //object(ballypllr01_lvs) (2)
	CreateDynamicObject(3437,1253.40026855,-1724.39904785,18.91960526,0.00000000,0.00000000,0.00000000); //object(ballypllr01_lvs) (3)
	CreateDynamicObject(3437,1260.21105957,-1724.65173340,18.91751099,0.00000000,0.00000000,0.00000000); //object(ballypllr01_lvs) (4)
	CreateDynamicObject(3437,1014.96527100,-1115.69421387,28.75880241,0.00000000,0.00000000,0.00000000); //object(ballypllr01_lvs) (5)
	CreateDynamicObject(3437,1008.72265625,-1115.87792969,28.76032829,0.00000000,0.00000000,0.00000000); //object(ballypllr01_lvs) (6)
	CreateDynamicObject(3437,1003.80236816,-1117.07165527,28.75903893,0.00000000,0.00000000,32.00000000); //object(ballypllr01_lvs) (7)
	CreateDynamicObject(3437,1001.05871582,-1121.21704102,28.75903893,0.00000000,0.00000000,71.99768066); //object(ballypllr01_lvs) (8)
	CreateDynamicObject(3437,1001.30792236,-1125.18554688,28.75903893,0.00000000,0.00000000,123.99340820); //object(ballypllr01_lvs) (9)
	CreateDynamicObject(3437,1004.19598389,-1127.41638184,28.75903893,0.00000000,0.00000000,123.99169922); //object(ballypllr01_lvs) (10)
	CreateDynamicObject(3437,1029.61694336,-1115.26000977,28.75481415,0.00000000,0.00000000,3.99172974); //object(ballypllr01_lvs) (11)
	CreateDynamicObject(3437,1036.10278320,-1115.09875488,28.75889015,0.00000000,0.00000000,3.98803711); //object(ballypllr01_lvs) (12)
	CreateDynamicObject(3437,1041.09423828,-1117.42651367,28.75903893,0.00000000,0.00000000,323.98803711); //object(ballypllr01_lvs) (13)
	CreateDynamicObject(3437,1042.76623535,-1121.96435547,28.75903893,0.00000000,0.00000000,283.98681641); //object(ballypllr01_lvs) (14)
	CreateDynamicObject(3437,1041.28015137,-1126.76977539,28.75903893,0.00000000,0.00000000,233.98559570); //object(ballypllr01_lvs) (15)
	CreateDynamicObject(3440,1026.41552734,-1120.18066406,25.25562668,0.00000000,0.00000000,0.00000000); //object(arptpillar01_lvs) (4)
	CreateDynamicObject(3441,1007.58197021,-1155.53833008,24.81053162,0.00000000,0.00000000,0.00000000); //object(luxorpillar02_lvs) (1)
	CreateDynamicObject(3441,999.94616699,-1155.40893555,24.82134056,0.00000000,0.00000000,0.00000000); //object(luxorpillar02_lvs) (2)
	CreateDynamicObject(3430,1035.49096680,-1122.87182617,24.55864906,0.00000000,0.00000000,320.00000000); //object(vegasbooth01) (2)
	CreateDynamicObject(1569,1020.94317627,-1120.86608887,22.87153816,0.00000000,0.00000000,0.00000000); //object(adam_v_door) (1)
	CreateDynamicObject(1569,1023.91271973,-1120.93212891,22.87459564,0.00000000,0.00000000,178.00000000); //object(adam_v_door) (2)
	CreateDynamicObject(1569,1023.91210938,-1120.93164062,22.87459564,0.00000000,0.00000000,177.99499512); //object(adam_v_door) (3)
	CreateDynamicObject(1569,1313.92419434,-897.46478271,38.59774017,0.00000000,0.00000000,0.00000000); //object(adam_v_door) (4)
	CreateDynamicObject(1569,1316.88085938,-897.45397949,38.59523392,0.00000000,0.00000000,180.00000000); //object(adam_v_door) (5)
	CreateDynamicObject(1569,1369.16906738,-1281.25610352,12.54687500,0.00000000,0.00000000,89.99450684); //object(adam_v_door) (6)
	CreateDynamicObject(1569,1369.17053223,-1278.29870605,12.54687500,0.00000000,0.00000000,269.99450684); //object(adam_v_door) (8)
	CreateDynamicObject(1499,1027.66113281,-1102.83386230,22.84784889,0.00000000,0.00000000,270.00000000); //object(gen_doorint05) (1)
	CreateDynamicObject(1499,1027.72229004,-1105.84887695,22.85137939,0.00000000,0.00000000,90.00000000); //object(gen_doorint05) (2)
	CreateDynamicObject(1499,1491.03649902,-1721.39331055,7.22286701,0.00000000,0.00000000,166.00000000); //object(gen_doorint05) (3)
	CreateDynamicObject(1499,1488.14660645,-1720.74499512,7.18083715,0.00000000,0.00000000,347.99694824); //object(gen_doorint05) (4)
	CreateDynamicObject(18766,1477.92431641,-1725.09582520,8.28641605,0.00000000,0.00000000,80.00000000); //object(lodcunte_landf4_03) (1)
	CreateDynamicObject(18766,1491.93383789,-1730.94348145,8.15452862,0.00000000,0.00000000,79.99694824); //object(lodcunte_landf4_03) (2)
	CreateDynamicObject(18766,1476.37304688,-1734.13671875,8.27564049,0.00000000,0.00000000,79.99694824); //object(lodcunte_landf4_03) (3)
	CreateDynamicObject(18766,1490.44726562,-1738.93920898,8.24715900,0.00000000,0.00000000,79.99694824); //object(lodcunte_landf4_03) (4)
	CreateDynamicObject(3863,1488.44335938,-1736.13867188,6.84728193,0.00000000,0.00000000,169.99694824); //object(marketstall03_sfxrf) (1)
	CreateDynamicObject(3863,1485.41247559,-1735.47119141,6.87285280,0.00000000,0.00000000,169.99694824); //object(marketstall03_sfxrf) (2)
	CreateDynamicObject(3863,1482.38476562,-1734.91601562,6.89819431,0.00000000,0.00000000,169.99145508); //object(marketstall03_sfxrf) (3)
	CreateDynamicObject(3863,1479.40527344,-1734.26367188,6.92331886,0.00000000,0.00000000,169.99145508); //object(marketstall03_sfxrf) (4)
	CreateDynamicObject(1441,1479.54760742,-1724.88879395,6.42587614,0.00000000,0.00000000,40.00000000); //object(dyn_box_pile_4) (1)
	CreateDynamicObject(1441,1482.21594238,-1724.32312012,6.39979696,0.00000000,0.00000000,309.99572754); //object(dyn_box_pile_4) (2)
	CreateDynamicObject(1441,1481.06933594,-1725.16943359,6.41299677,0.00000000,0.00000000,289.99572754); //object(dyn_box_pile_4) (3)
	CreateDynamicObject(1440,1483.71313477,-1724.54797363,6.24640512,0.00000000,0.00000000,0.00000000); //object(dyn_box_pile_3) (1)
	CreateDynamicObject(1440,1490.69165039,-1727.25988770,6.19115496,0.00000000,0.00000000,280.00000000); //object(dyn_box_pile_3) (2)
	CreateDynamicObject(1440,1490.74523926,-1729.18383789,6.18695116,0.00000000,0.00000000,239.99755859); //object(dyn_box_pile_3) (3)
	CreateDynamicObject(1431,1490.65795898,-1731.61108398,6.21143150,0.00000000,0.00000000,70.00000000); //object(dyn_box_pile) (1)
	CreateDynamicObject(1431,1489.89709473,-1733.49523926,6.22318745,0.00000000,0.00000000,39.99938965); //object(dyn_box_pile) (1)
	CreateDynamicObject(1431,1489.68701172,-1732.33752441,6.22376060,0.00000000,0.00000000,79.99572754); //object(dyn_box_pile) (1)
	CreateDynamicObject(1431,1478.72229004,-1727.38269043,6.32301044,0.00000000,0.00000000,79.99145508); //object(dyn_box_pile) (1)
	CreateDynamicObject(1431,1478.16992188,-1729.82080078,6.32210350,0.00000000,0.00000000,79.99145508); //object(dyn_box_pile) (1)
	CreateDynamicObject(1431,1479.03698730,-1728.92968750,6.31707478,0.00000000,0.00000000,79.99145508); //object(dyn_box_pile) (1)
	CreateDynamicObject(1431,1479.54907227,-1726.69628906,6.31785679,0.00000000,0.00000000,79.99145508); //object(dyn_box_pile) (1)
	CreateDynamicObject(1654,1489.35656738,-1735.88244629,6.68498659,0.00000000,0.00000000,210.00000000); //object(dynamite) (1)
	CreateDynamicObject(1654,1489.15722656,-1735.91235352,6.68498659,0.00000000,0.00000000,209.99816895); //object(dynamite) (2)
	CreateDynamicObject(1654,1489.46972656,-1735.66210938,6.68498659,0.00000000,0.00000000,209.99816895); //object(dynamite) (3)
	CreateDynamicObject(1654,1488.94238281,-1735.92382812,6.68498659,0.00000000,0.00000000,209.99816895); //object(dynamite) (4)
	CreateDynamicObject(1654,1489.54003906,-1735.83154297,6.68498659,0.00000000,0.00000000,209.99816895); //object(dynamite) (5)
	CreateDynamicObject(1654,1489.67285156,-1735.59667969,6.68498659,0.00000000,0.00000000,209.99816895); //object(dynamite) (6)
	CreateDynamicObject(2033,1488.60705566,-1735.98596191,6.52370071,0.00000000,0.00000000,0.00000000); //object(cj_sawnoff2) (1)
	CreateDynamicObject(2033,1488.30224609,-1735.83728027,6.52370071,0.00000000,0.00000000,0.00000000); //object(cj_sawnoff2) (2)
	CreateDynamicObject(2033,1487.89868164,-1735.69628906,6.52370071,0.00000000,0.00000000,0,00000000); //object(cj_sawnoff2) (3)
	CreateDynamicObject(2033,1487.49047852,-1735.60839844,6.52370071,0.00000000,0.00000000,0.00000000); //object(cj_sawnoff2) (4)
	CreateDynamicObject(2034,1488.85498047,-1735.26367188,6.52369690,0.00000000,0.00000000,260.00000000); //object(cj_sawnoff) (1)
	CreateDynamicObject(2034,1488.55688477,-1735.21728516,6.52369690,0.00000000,0.00000000,259.99694824); //object(cj_sawnoff) (2)
	CreateDynamicObject(2034,1488.26892090,-1735.13977051,6.52369690,0.00000000,0.00000000,259.99694824); //object(cj_sawnoff) (3)
	CreateDynamicObject(2034,1487.98706055,-1735.05297852,6.52369690,0.00000000,0.00000000,259.99694824); //object(cj_sawnoff) (4)
	CreateDynamicObject(2034,1487.66918945,-1735.00659180,6.52369690,0.00000000,0.00000000,259.99694824); //object(cj_sawnoff) (5)
	CreateDynamicObject(2034,1487.38989258,-1734.90637207,6.52369690,0.00000000,0.00000000,259.99694824); //object(cj_sawnoff) (6)
	CreateDynamicObject(2035,1486.34301758,-1735.28735352,6.54288721,0.00000000,0.00000000,170.00000000); //object(cj_m16) (1)
	CreateDynamicObject(2035,1486.33044434,-1734.84521484,6.54288721,0.00000000,0.00000000,169.99694824); //object(cj_m16) (2)
	CreateDynamicObject(2035,1486.34155273,-1734.38708496,6.54288721,0.00000000,0.00000000,169.99694824); //object(cj_m16) (3)
	CreateDynamicObject(2035,1485.22766113,-1734.19165039,6.54288721,0.00000000,0.00000000,169.99694824); //object(cj_m16) (4)
	CreateDynamicObject(2035,1485.14477539,-1734.59912109,6.54288721,0.00000000,0.00000000,169.99694824); //object(cj_m16) (5)
	CreateDynamicObject(2035,1485.06396484,-1735.00415039,6.54288721,0.00000000,0.00000000,169.99694824); //object(cj_m16) (6)
	CreateDynamicObject(2036,1483.16931152,-1734.67687988,6.57771778,0.00000000,0.00000000,170.00000000); //object(cj_psg1) (1)
	CreateDynamicObject(2036,1483.15734863,-1734.12670898,6.57771778,0.00000000,0.00000000,169.99694824); //object(cj_psg1) (2)
	CreateDynamicObject(2036,1483.16552734,-1733.74438477,6.57771778,0.00000000,0.00000000,169.99694824); //object(cj_psg1) (3)
	CreateDynamicObject(2036,1481.83276367,-1734.47924805,6.57771778,0.00000000,0.00000000,169.99694824); //object(cj_psg1) (4)
	CreateDynamicObject(2044,1481.44616699,-1734.00793457,6.57132435,0.00000000,0.00000000,90.00000000); //object(cj_mp5k) (1)
	CreateDynamicObject(2044,1481.54418945,-1733.56823730,6.57132435,0.00000000,0.00000000,90.00000000); //object(cj_mp5k) (2)
	CreateDynamicObject(2044,1481.81030273,-1733.58496094,6.57132435,0.00000000,0.00000000,90.00000000); //object(cj_mp5k) (3)
	CreateDynamicObject(2044,1482.06359863,-1733.66345215,6.57132435,0.00000000,0.00000000,90.00000000); //object(cj_mp5k) (4)
	CreateDynamicObject(2044,1482.34521484,-1733.64611816,6.57132435,0.00000000,0.00000000,90.00000000); //object(cj_mp5k) (5)
	CreateDynamicObject(2044,1482.27856445,-1734.11486816,6.57132435,0.00000000,0.00000000,90.00000000); //object(cj_mp5k) (6)
	CreateDynamicObject(2044,1482.00061035,-1734.15734863,6.57132435,0.00000000,0.00000000,90.00000000); //object(cj_mp5k) (7)
	CreateDynamicObject(2044,1481.74560547,-1734.07019043,6.57132435,0.00000000,0.00000000,90.00000000); //object(cj_mp5k) (8)
	CreateDynamicObject(2045,1480.67443848,-1733.50671387,6.66179276,0.00000000,0.00000000,170.00000000); //object(cj_bbat_nails) (1)
	CreateDynamicObject(2045,1480.46020508,-1733.51977539,6.66179276,0.00000000,0.00000000,169.99694824); //object(cj_bbat_nails) (2)
	CreateDynamicObject(2045,1480.26110840,-1733.46374512,6.66179276,0.00000000,0.00000000,169.99694824); //object(cj_bbat_nails) (3)
	CreateDynamicObject(2045,1480.01123047,-1733.44116211,6.66179276,0.00000000,0.00000000,169.99694824); //object(cj_bbat_nails) (4)
	CreateDynamicObject(2057,1478.41174316,-1733.67492676,6.73936987,0.00000000,0.00000000,0.00000000); //object(flame_tins) (1)
	CreateDynamicObject(2057,1478.52832031,-1733.28686523,6.73936987,0.00000000,0.00000000,10.00000000); //object(flame_tins) (2)
	CreateDynamicObject(2058,1479.19140625,-1733.37719727,6.57207489,0.00000000,0.00000000,0.00000000); //object(cj_gun_docs) (1)
	CreateDynamicObject(2060,1477.57714844,-1732.77819824,5.93273783,0.00000000,0.00000000,40.00000000); //object(cj_sandbag) (1)
	CreateDynamicObject(2060,1478.05847168,-1732.24633789,5.92976809,0.00000000,0.00000000,349.99572754); //object(cj_sandbag) (2)
	CreateDynamicObject(2061,1479.02697754,-1733.94738770,6.86084557,0.00000000,0.00000000,330.00000000); //object(cj_shells1) (1)
	CreateDynamicObject(2061,1479.47790527,-1734.02001953,6.86084557,0.00000000,0.00000000,359.99633789); //object(cj_shells1) (2)
	CreateDynamicObject(3594,1046.73242188,-1097.74511719,23.45930099,0.00000000,0.00000000,0.00000000); //object(la_fuckcar1) (1)
	CreateDynamicObject(3594,1046.75439453,-1089.77014160,23.45930099,0.00000000,0.00000000,0.00000000); //object(la_fuckcar1) (2)
	CreateDynamicObject(3594,1047.08654785,-1094.41296387,23.92490005,0.00000000,0.00000000,0.00000000); //object(la_fuckcar1) (3)
	CreateDynamicObject(1358,1041.54516602,-1082.12060547,24.03167152,0.00000000,0.00000000,0.00000000); //object(cj_skip_rubbish) (1)
	CreateDynamicObject(1358,1038.49084473,-1082.09020996,24.03167152,0.00000000,0.00000000,0.00000000); //object(cj_skip_rubbish) (2)
	CreateDynamicObject(1358,1034.73303223,-1082.06994629,24.03167152,0.00000000,0.00000000,0.00000000); //object(cj_skip_rubbish) (3)
	CreateDynamicObject(1431,1031.58068848,-1081.34716797,23.37573814,0.00000000,0.00000000,0.00000000); //object(dyn_box_pile) (8)
	CreateDynamicObject(1431,1029.14050293,-1081.13183594,23.37573814,0.00000000,0.00000000,0.00000000); //object(dyn_box_pile) (9)
	CreateDynamicObject(1431,1030.51367188,-1082.06140137,23.38247108,0.00000000,0.00000000,0.00000000); //object(dyn_box_pile) (10)
	CreateDynamicObject(1431,1031.97302246,-1083.14672852,23.37573814,0.00000000,0.00000000,0.00000000); //object(dyn_box_pile) (11)
	CreateDynamicObject(1431,1029.40185547,-1082.83288574,23.38247108,0.00000000,0.00000000,340.00000000); //object(dyn_box_pile) (12)
	CreateDynamicObject(1441,1026.31665039,-1099.85412598,23.48650742,0.00000000,0.00000000,320.00000000); //object(dyn_box_pile_4) (4)
	CreateDynamicObject(1441,1031.55932617,-1096.77197266,23.47977448,0.00000000,0.00000000,359.99877930); //object(dyn_box_pile_4) (5)
	CreateDynamicObject(1441,1028.59118652,-1098.41003418,23.47977448,0.00000000,0.00000000,29.99450684); //object(dyn_box_pile_4) (6)
	CreateDynamicObject(1440,1031.76293945,-1098.05249023,23.34724045,0.00000000,0.00000000,0.00000000); //object(dyn_box_pile_3) (4)
	CreateDynamicObject(1440,1031.33703613,-1098.91760254,23.34724045,0.00000000,0.00000000,0.00000000); //object(dyn_box_pile_3) (5)
	CreateDynamicObject(1440,1028.42626953,-1100.15307617,23.34724045,0.00000000,0.00000000,330.00000000); //object(dyn_box_pile_3) (6)
	CreateDynamicObject(1438,1036.63513184,-1106.75085449,22.82812500,0.00000000,0.00000000,320.00000000); //object(dyn_box_pile_2) (1)
	CreateDynamicObject(1438,1037.86010742,-1104.78198242,22.82812500,0.00000000,0.00000000,319.99877930); //object(dyn_box_pile_2) (2)
	CreateDynamicObject(3437,1267.68066406,-1158.40209961,28.68872643,0.00000000,0.00000000,0.00000000); //object(ballypllr01_lvs) (6)
	CreateDynamicObject(3437,1277.70581055,-1158.61389160,28.68872643,0.00000000,0.00000000,0.00000000); //object(ballypllr01_lvs) (6)
	CreateDynamicObject(3437,1326.16442871,-1160.47399902,28.68872643,0.00000000,0.00000000,0.00000000); //object(ballypllr01_lvs) (6)
	CreateDynamicObject(3437,1319.15173340,-1160.64416504,28.68872643,0.00000000,0.00000000,0.00000000); //object(ballypllr01_lvs) (6)
	CreateDynamicObject(3437,1244.80541992,-1177.00183105,28.37371826,0.00000000,0.00000000,310.00000000); //object(ballypllr01_lvs) (6)
	CreateDynamicObject(3437,1835.68261719,-1633.16137695,18.24012184,0.00000000,0.00000000,277.99572754); //object(ballypllr01_lvs) (6)
	CreateDynamicObject(3437,1835.61108398,-1641.28051758,18.24311066,0.00000000,0.00000000,277.99255371); //object(ballypllr01_lvs) (6)
	CreateDynamicObject(3437,1835.89257812,-1649.17199707,18.23134613,0.00000000,0.00000000,277.99255371); //object(ballypllr01_lvs) (6)
	CreateDynamicObject(3437,1835.56726074,-1657.10192871,18.24494171,0.00000000,0.00000000,277.99255371); //object(ballypllr01_lvs) (6)
	CreateDynamicObject(3437,1835.57580566,-1665.11218262,18.24458504,0.00000000,0.00000000,277.99255371); //object(ballypllr01_lvs) (6)
	CreateDynamicObject(3437,1835.04650879,-1672.92456055,18.26670456,0.00000000,0.00000000,277.99255371); //object(ballypllr01_lvs) (6)
	CreateDynamicObject(3437,1835.86535645,-1692.06713867,18.23248482,0.00000000,0.00000000,259.99255371); //object(ballypllr01_lvs) (6)
	CreateDynamicObject(3437,1836.24487305,-1700.21862793,18.21662521,0.00000000,0.00000000,259.99145508); //object(ballypllr01_lvs) (6)
	CreateDynamicObject(3437,1836.16735840,-1707.78845215,18.21986580,0.00000000,0.00000000,259.99145508); //object(ballypllr01_lvs) (6)
	CreateDynamicObject(3437,1836.19213867,-1715.55139160,18.21883011,0.00000000,0.00000000,259.99145508); //object(ballypllr01_lvs) (6)
	CreateDynamicObject(3437,1836.31665039,-1723.89367676,18.21362495,0.00000000,0.00000000,259.99145508); //object(ballypllr01_lvs) (6)
	CreateDynamicObject(3437,1836.41894531,-1732.23266602,18.20935059,0.00000000,0.00000000,259.99145508); //object(ballypllr01_lvs) (6)
	CreateDynamicObject(18647,1019.84735107,-1120.30249023,23.00402069,0.00000000,0.00000000,60.00000000); //object(wall1) (1)
	CreateDynamicObject(18647,1025.07934570,-1120.24829102,22.95932770,0.00000000,0.00000000,119.99633789); //object(wall1) (2)
	CreateDynamicObject(18648,995.01409912,-1130.61352539,32.85108948,0.00000000,0.00000000,90.00000000); //object(wall2) (1)
	CreateDynamicObject(18648,996.94683838,-1130.61486816,32.85193253,0.00000000,0.00000000,90.00000000); //object(wall2) (2)
	CreateDynamicObject(18648,998.90509033,-1130.61633301,32.85361481,0.00000000,0.00000000,90.00000000); //object(wall2) (3)
	CreateDynamicObject(18648,1000.85766602,-1130.61779785,32.83490753,0.00000000,0.00000000,90.00000000); //object(wall2) (4)
	CreateDynamicObject(18648,1002.67895508,-1130.61914062,32.83610535,0.00000000,0.00000000,90.00000000); //object(wall2) (5)
	CreateDynamicObject(18648,1042.24243164,-1130.61828613,32.84208298,0.00000000,0.00000000,90.00000000); //object(wall2) (6)
	CreateDynamicObject(18648,1044.22546387,-1130.61682129,32.82181931,0.00000000,0.00000000,90.00000000); //object(wall2) (7)
	CreateDynamicObject(18648,1046.10424805,-1130.61547852,32.82738876,0.00000000,0.00000000,90.00000000); //object(wall2) (8)
	CreateDynamicObject(18648,1048.10217285,-1130.61401367,32.87356949,0.00000000,0.00000000,90.00000000); //object(wall2) (9)
	CreateDynamicObject(18648,1050.05371094,-1130.61254883,32.87840652,0.00000000,0.00000000,90.00000000); //object(wall2) (10)
	CreateDynamicObject(18648,1017.60961914,-1121.72155762,35.57524109,0.00000000,0.00000000,90.00000000); //object(wall2) (11)
	CreateDynamicObject(18648,1019.62194824,-1121.73925781,35.57524109,0.00000000,0.00000000,90.00000000); //object(wall2) (12)
	CreateDynamicObject(18648,1021.59967041,-1121.75683594,35.57524109,0.00000000,0.00000000,90.00000000); //object(wall2) (13)
	CreateDynamicObject(18648,1023.54730225,-1121.77429199,35.57524109,0.00000000,0.00000000,90.00000000); //object(wall2) (14)
	CreateDynamicObject(18648,1025.45312500,-1121.79187012,35.57524109,0.00000000,0.00000000,90.00000000); //object(wall2) (15)
	CreateDynamicObject(18648,1027.14392090,-1121.79125977,35.57524109,0.00000000,0.00000000,90.00000000); //object(wall2) (16)
	CreateDynamicObject(18648,1019.62341309,-1120.23815918,26.33897591,0.00000000,0.00000000,62.00000000); //object(wall2) (17)
	CreateDynamicObject(18648,1022.41442871,-1121.01171875,26.20803070,0.00000000,0.00000000,89.99584961); //object(wall2) (18)
	CreateDynamicObject(18648,1024.88134766,-1120.35278320,26.19531250,0.00000000,0.00000000,119.99450684); //object(wall2) (19)
	CreateDynamicObject(18655,1025.98742676,-1120.33740234,22.87835121,0.00000000,0.00000000,70.00000000); //object(bridge) (1)
	CreateDynamicObject(18655,1018.58953857,-1119.90319824,22.89731598,0.00000000,0.00000000,119.99938965); //object(bridge) (2)

	// - Licencieros
	CreateDynamicObject(970,1761.95751953,-1682.16418457,13.11164665,0.00000000,0.00000000,0.00000000); //object(fencesmallb) (1)
	CreateDynamicObject(970,1761.95422363,-1677.80273438,13.11164188,0.00000000,0.00000000,0.00000000); //object(fencesmallb) (2)
	CreateDynamicObject(970,1761.91394043,-1673.32275391,13.11158276,0.00000000,0.00000000,0.00000000); //object(fencesmallb) (3)
	CreateDynamicObject(970,1761.90026855,-1668.23937988,13.11156273,0.00000000,0.00000000,0.00000000); //object(fencesmallb) (4)
	CreateDynamicObject(970,1761.89404297,-1664.50073242,13.11155319,0.00000000,0.00000000,0.00000000); //object(fencesmallb) (5)
	CreateDynamicObject(970,1761.92919922,-1659.97814941,13.11160469,0.00000000,0.00000000,0.00000000); //object(fencesmallb) (6)
	CreateDynamicObject(970,1763.95532227,-1662.06677246,13.11457348,0.00000000,0.00000000,270.00000000); //object(fencesmallb) (7)
	CreateDynamicObject(970,1763.96569824,-1666.09545898,13.11458874,0.00000000,0.00000000,270.00000000); //object(fencesmallb) (8)
	CreateDynamicObject(970,1763.95812988,-1670.24426270,13.11457825,0.00000000,0.00000000,270.00000000); //object(fencesmallb) (9)
	CreateDynamicObject(970,1763.96923828,-1674.34472656,13.11459446,0.00000000,0.00000000,270.00000000); //object(fencesmallb) (10)
	CreateDynamicObject(970,1763.98034668,-1678.42749023,13.11461067,0.00000000,0.00000000,270.00000000); //object(fencesmallb) (11)
	CreateDynamicObject(970,1763.99560547,-1680.07836914,13.11461067,0.00000000,0.00000000,270.00000000); //object(fencesmallb) (12)
	CreateDynamicObject(1215,1759.82775879,-1682.09570312,13.12136745,0.00000000,0.00000000,0.00000000); //object(bollardlight) (1)
	CreateDynamicObject(1215,1759.86535645,-1677.80664062,13.12142372,0.00000000,0.00000000,0.00000000); //object(bollardlight) (2)
	CreateDynamicObject(1215,1759.82507324,-1673.30615234,13.12136459,0.00000000,0.00000000,0.00000000); //object(bollardlight) (3)
	CreateDynamicObject(1215,1759.74316406,-1668.31933594,13.12124443,0.00000000,0.00000000,0.00000000); //object(bollardlight) (4)
	CreateDynamicObject(1215,1759.68493652,-1664.52270508,13.12115860,0.00000000,0.00000000,0.00000000); //object(bollardlight) (5)
	CreateDynamicObject(1215,1759.71105957,-1659.95727539,13.12119675,0.00000000,0.00000000,0.00000000); //object(bollardlight) (6)
	CreateDynamicObject(1569,1772.79077148,-1653.41320801,13.43266773,0.00000000,0.00000000,306.00000000); //object(adam_v_door) (1)
	CreateDynamicObject(1569,1774.52600098,-1655.84606934,13.44796085,0.00000000,0.00000000,125.99670410); //object(adam_v_door) (2)
	CreateDynamicObject(1569,-2031.40893555,-119.73522186,1034.17187500,0.00000000,0.00000000,0.00000000); //object(adam_v_door) (3)
	CreateDynamicObject(1569,-2025.97290039,-103.62377930,1034.17187500,0.00000000,0.00000000,180.00000000); //object(adam_v_door) (4)
	CreateDynamicObject(1569,-2028.89257812,-103.62792969,1034.17187500,0.00000000,0.00000000,0.00000000); //object(adam_v_door) (5)
	CreateDynamicObject(1569,-2028.41430664,-119.71759796,1034.17187500,0.00000000,0.00000000,180.00000000); //object(adam_v_door) (6)
	CreateDynamicObject(14415,-2018.89208984,-72.03988647,1034.08239746,0.00000000,0.00000000,0.00000000); //object(carter-floors01) (1)
	CreateDynamicObject(1569,-1993.40283203,-62.00051880,1027.91833496,0.00000000,0.00000000,269.99450684); //object(adam_v_door) (7)
	CreateDynamicObject(1569,-2039.42797852,-65.81327057,1027.93054199,0.00000000,0.00000000,89.98901367); //object(adam_v_door) (8)
	CreateDynamicObject(1569,-1993.37695312,-64.99804688,1027.91833496,0.00000000,0.00000000,89.98901367); //object(adam_v_door) (10)
	CreateDynamicObject(1569,-2039.43969727,-62.81329727,1027.93090820,0.00000000,0.00000000,269.98901367); //object(adam_v_door) (11)
	CreateDynamicObject(1491,-2011.04931641,-77.04943085,1027.91833496,0.00000000,0.00000000,0.00000000); //object(gen_doorint01) (1)
	CreateDynamicObject(1491,-2008.08142090,-77.02191925,1027.91833496,0.00000000,0.00000000,180.00000000); //object(gen_doorint01) (2)
	CreateDynamicObject(1491,-2011.06933594,-68.85163116,1027.91833496,0.00000000,0.00000000,0.00000000); //object(gen_doorint01) (3)
	CreateDynamicObject(1491,-2008.10021973,-68.82164001,1027.91833496,0.00000000,0.00000000,180.00000000); //object(gen_doorint01) (4)
	CreateDynamicObject(1491,-2026.96459961,-84.93977356,1027.91833496,0.00000000,0.00000000,89.99450684); //object(gen_doorint01) (5)
	CreateDynamicObject(1491,-2026.95874023,-81.77914429,1027.91833496,0.00000000,0.00000000,269.98901367); //object(gen_doorint01) (6)
	CreateDynamicObject(1491,-2031.67065430,-76.72061157,1027.92736816,0.00000000,0.00000000,179.98901367); //object(gen_doorint01) (7)
	CreateDynamicObject(1491,-2034.66674805,-76.70342255,1027.91833496,0.00000000,0.00000000,359.98352051); //object(gen_doorint01) (8)
	CreateDynamicObject(2198,-2009.24047852,-59.11746979,1027.91833496,0.00000000,0.00000000,270.00000000); //object(med_office2_desk_3) (1)
	CreateDynamicObject(2198,-2009.26293945,-61.77876282,1027.91833496,0.00000000,0.00000000,270.00000000); //object(med_office2_desk_3) (2)
	CreateDynamicObject(2198,-2009.26391602,-64.38420105,1027.91833496,0.00000000,0.00000000,270.00000000); //object(med_office2_desk_3) (3)
	CreateDynamicObject(2198,-2011.98291016,-59.12844086,1027.91833496,0.00000000,0.00000000,270.00000000); //object(med_office2_desk_3) (4)
	CreateDynamicObject(2198,-2011.99523926,-61.77922821,1027.91833496,0.00000000,0.00000000,270.00000000); //object(med_office2_desk_3) (5)
	CreateDynamicObject(2198,-2008.59985352,-80.03466034,1027.91833496,0.00000000,0.00000000,270.00000000); //object(med_office2_desk_3) (6)
	CreateDynamicObject(2198,-2014.41870117,-59.24824905,1027.91833496,0.00000000,0.00000000,270.00000000); //object(med_office2_desk_3) (7)
	CreateDynamicObject(2198,-2014.45495605,-61.76247406,1027.91833496,0.00000000,0.00000000,270.00000000); //object(med_office2_desk_3) (8)
	CreateDynamicObject(2198,-2014.51013184,-64.32015991,1027.91833496,0.00000000,0.00000000,270.00000000); //object(med_office2_desk_3) (9)
	CreateDynamicObject(2165,-2031.52441406,-63.88493347,1027.91833496,0.00000000,0.00000000,200.00000000); //object(med_office_desk_1) (1)
	CreateDynamicObject(1671,-2003.76831055,-60.69291306,1028.37854004,0.00000000,0.00000000,300.00000000); //object(swivelchair_a) (1)
	CreateDynamicObject(1671,-2010.51428223,-59.93007660,1028.37854004,0.00000000,0.00000000,90.00000000); //object(swivelchair_a) (3)
	CreateDynamicObject(1671,-2010.35327148,-62.50254440,1028.37854004,0.00000000,0.00000000,90.00000000); //object(swivelchair_a) (4)
	CreateDynamicObject(1671,-2003.01440430,-83.84319305,1028.37854004,0.00000000,0.00000000,252.00000000); //object(swivelchair_a) (5)
	CreateDynamicObject(1671,-2012.86962891,-65.04521179,1028.37854004,0.00000000,0.00000000,90.00000000); //object(swivelchair_a) (6)
	CreateDynamicObject(1671,-2012.99353027,-62.53418732,1028.37854004,0.00000000,0.00000000,90.00000000); //object(swivelchair_a) (7)
	CreateDynamicObject(1671,-2012.94995117,-59.92739868,1028.37854004,0.00000000,0.00000000,90.00000000); //object(swivelchair_a) (8)
	CreateDynamicObject(1671,-2015.66882324,-65.02046967,1028.37854004,0.00000000,0.00000000,90.00000000); //object(swivelchair_a) (9)
	CreateDynamicObject(1671,-2015.62109375,-62.56354141,1028.38488770,0.00000000,0.00000000,90.00000000); //object(swivelchair_a) (10)
	CreateDynamicObject(1671,-2015.66101074,-60.00591660,1028.38488770,0.00000000,0.00000000,90.00000000); //object(swivelchair_a) (11)
	CreateDynamicObject(3077,-2037.07702637,-60.26511002,1027.91833496,0.00000000,0.00000000,210.00000000); //object(nf_blackboard) (1)
	CreateDynamicObject(3077,-2003.53027344,-65.70800781,1027.91833496,0.00000000,0.00000000,59.99633789); //object(nf_blackboard) (2)
	CreateDynamicObject(2165,-2004.38378906,-61.78710938,1027.91833496,0.00000000,0.00000000,119.99816895); //object(med_office_desk_1) (3)
	CreateDynamicObject(2165,-2004.38378906,-61.78710938,1027.91833496,0.00000000,0.00000000,119.99816895); //object(med_office_desk_1) (4)
	CreateDynamicObject(1671,-2010.26757812,-65.08203125,1028.37854004,0.00000000,0.00000000,90.00000000); //object(swivelchair_a) (12)
	CreateDynamicObject(2198,-2011.97656250,-64.34765625,1027.91833496,0.00000000,0.00000000,270.00000000); //object(med_office2_desk_3) (13)
	CreateDynamicObject(2198,-2008.60498047,-83.02664948,1027.91833496,0.00000000,0.00000000,270.00000000); //object(med_office2_desk_3) (14)
	CreateDynamicObject(2198,-2010.98583984,-80.02887726,1027.91833496,0.00000000,0.00000000,270.00000000); //object(med_office2_desk_3) (15)
	CreateDynamicObject(2198,-2013.03027344,-80.01090240,1027.91833496,0.00000000,0.00000000,270.00000000); //object(med_office2_desk_3) (16)
	CreateDynamicObject(2198,-2015.09875488,-80.01183319,1027.91833496,0.00000000,0.00000000,270.00000000); //object(med_office2_desk_3) (17)
	CreateDynamicObject(2198,-2011.06262207,-82.88206482,1027.91833496,0.00000000,0.00000000,270.00000000); //object(med_office2_desk_3) (18)
	CreateDynamicObject(2198,-2013.12426758,-82.78381348,1027.91833496,0.00000000,0.00000000,270.00000000); //object(med_office2_desk_3) (19)
	CreateDynamicObject(2198,-2015.12231445,-82.78494263,1027.91833496,0.00000000,0.00000000,270.00000000); //object(med_office2_desk_3) (20)
	CreateDynamicObject(1671,-2009.74902344,-83.73333740,1028.37854004,0.00000000,0.00000000,91.99890137); //object(swivelchair_a) (13)
	CreateDynamicObject(1671,-2009.69934082,-80.85732269,1028.37854004,0.00000000,0.00000000,91.99401855); //object(swivelchair_a) (14)
	CreateDynamicObject(1671,-2012.09338379,-80.95852661,1028.37854004,0.00000000,0.00000000,91.99401855); //object(swivelchair_a) (15)
	CreateDynamicObject(1671,-2012.18566895,-83.57934570,1028.37854004,0.00000000,0.00000000,91.99401855); //object(swivelchair_a) (16)
	CreateDynamicObject(1671,-2014.16613770,-83.67246246,1028.37854004,0.00000000,0.00000000,91.99401855); //object(swivelchair_a) (17)
	CreateDynamicObject(1671,-2014.16223145,-81.00109100,1028.37854004,0.00000000,0.00000000,91.99401855); //object(swivelchair_a) (18)
	CreateDynamicObject(1671,-2016.25915527,-83.61965179,1028.37854004,0.00000000,0.00000000,91.99401855); //object(swivelchair_a) (19)
	CreateDynamicObject(1671,-2016.22399902,-80.88482666,1028.38488770,0.00000000,0.00000000,91.99401855); //object(swivelchair_a) (20)
	CreateDynamicObject(3077,-2002.73535156,-79.26074219,1027.91833496,0.00000000,0.00000000,119.99816895); //object(nf_blackboard) (3)
	CreateDynamicObject(3077,-2002.73535156,-79.26074219,1027.91833496,0.00000000,0.00000000,119.99816895); //object(nf_blackboard) (4)
	CreateDynamicObject(3077,-2029.31176758,-60.09536362,1027.91833496,0.00000000,0.00000000,149.99816895); //object(nf_blackboard) (5)
	CreateDynamicObject(2198,-2037.32226562,-68.43151855,1027.91833496,0.00000000,0.00000000,2.00000000); //object(med_office2_desk_3) (21)
	CreateDynamicObject(2198,-2034.47985840,-68.41234589,1027.91833496,0.00000000,0.00000000,1.99951172); //object(med_office2_desk_3) (22)
	CreateDynamicObject(2198,-2031.77404785,-68.28280640,1027.91833496,0.00000000,0.00000000,1.99951172); //object(med_office2_desk_3) (23)
	CreateDynamicObject(2198,-2029.01171875,-68.18672180,1027.91833496,0.00000000,0.00000000,1.99951172); //object(med_office2_desk_3) (24)
	CreateDynamicObject(2198,-2037.18017578,-70.70064545,1027.91833496,0.00000000,0.00000000,1.99951172); //object(med_office2_desk_3) (25)
	CreateDynamicObject(2198,-2034.48852539,-70.60029602,1027.91833496,0.00000000,0.00000000,1.99951172); //object(med_office2_desk_3) (26)
	CreateDynamicObject(2198,-2031.79943848,-70.55163574,1027.91833496,0.00000000,0.00000000,1.99951172); //object(med_office2_desk_3) (27)
	CreateDynamicObject(2198,-2029.06018066,-70.52679443,1027.91833496,0.00000000,0.00000000,1.99951172); //object(med_office2_desk_3) (29)
	CreateDynamicObject(2198,-2037.06652832,-72.95392609,1027.91833496,0.00000000,0.00000000,1.99951172); //object(med_office2_desk_3) (30)
	CreateDynamicObject(2198,-2034.50891113,-72.67854309,1027.91833496,0.00000000,0.00000000,1.99951172); //object(med_office2_desk_3) (31)
	CreateDynamicObject(2198,-2031.81213379,-72.52543640,1027.91833496,0.00000000,0.00000000,1.99951172); //object(med_office2_desk_3) (32)
	CreateDynamicObject(2198,-2029.06750488,-72.44458771,1027.91833496,0.00000000,0.00000000,1.99951172); //object(med_office2_desk_3) (33)
	CreateDynamicObject(1671,-2036.42968750,-74.09952545,1028.37854004,0.00000000,0.00000000,181.99401855); //object(swivelchair_a) (21)
	CreateDynamicObject(1671,-2033.89111328,-73.88761139,1028.37854004,0.00000000,0.00000000,181.98852539); //object(swivelchair_a) (22)
	CreateDynamicObject(1671,-2031.16735840,-73.87525177,1028.37854004,0.00000000,0.00000000,181.98852539); //object(swivelchair_a) (23)
	CreateDynamicObject(1671,-2028.53613281,-73.73830414,1028.37854004,0.00000000,0.00000000,181.98852539); //object(swivelchair_a) (24)
	CreateDynamicObject(1671,-2028.68652344,-71.55911255,1028.37854004,0.00000000,0.00000000,181.98852539); //object(swivelchair_a) (25)
	CreateDynamicObject(1671,-2031.38903809,-71.58805847,1028.37854004,0.00000000,0.00000000,181.98852539); //object(swivelchair_a) (26)
	CreateDynamicObject(1671,-2033.98962402,-71.76207733,1028.37854004,0.00000000,0.00000000,181.98852539); //object(swivelchair_a) (27)
	CreateDynamicObject(1671,-2036.53381348,-71.86657715,1028.37854004,0.00000000,0.00000000,181.98852539); //object(swivelchair_a) (28)
	CreateDynamicObject(1671,-2036.74890137,-69.47814941,1028.37854004,0.00000000,0.00000000,181.98852539); //object(swivelchair_a) (29)
	CreateDynamicObject(1671,-2033.99194336,-69.43881989,1028.37854004,0.00000000,0.00000000,181.98852539); //object(swivelchair_a) (30)
	CreateDynamicObject(1671,-2031.26123047,-69.38211823,1028.37854004,0.00000000,0.00000000,181.98852539); //object(swivelchair_a) (31)
	CreateDynamicObject(1671,-2028.35314941,-69.33782196,1028.37854004,0.00000000,0.00000000,181.98852539); //object(swivelchair_a) (32)
	CreateDynamicObject(2165,-2004.33691406,-84.02929688,1027.91833496,0.00000000,0.00000000,69.99938965); //object(med_office_desk_1) (5)
	CreateDynamicObject(2165,-2004.33691406,-84.02929688,1027.91833496,0.00000000,0.00000000,69.99938965); //object(med_office_desk_1) (6)
	CreateDynamicObject(2165,-2033.62878418,-64.23260498,1027.91833496,0.00000000,0.00000000,159.99511719); //object(med_office_desk_1) (7)
	CreateDynamicObject(1671,-2032.61804199,-62.94611359,1028.37854004,0.00000000,0.00000000,21.98852539); //object(swivelchair_a) (33)
	CreateDynamicObject(1671,-2033.84863281,-62.88584900,1028.37854004,0.00000000,0.00000000,331.98364258); //object(swivelchair_a) (34)
	CreateDynamicObject(1726,-2039.27648926,-78.24803162,1027.91833496,0.00000000,0.00000000,0.00000000); //object(mrk_seating2) (1)
	CreateDynamicObject(1726,-2039.92724609,-83.16760254,1027.91833496,0.00000000,0.00000000,90.00000000); //object(mrk_seating2) (3)
	CreateDynamicObject(1726,-2037.35229492,-83.77799225,1027.91833496,0.00000000,0.00000000,180.00000000); //object(mrk_seating2) (4)
	CreateDynamicObject(1726,-2039.91381836,-80.86668396,1027.91833496,0.00000000,0.00000000,90.00000000); //object(mrk_seating2) (6)
	CreateDynamicObject(2184,-2038.34301758,-79.93791199,1027.49291992,0.00000000,0.00000000,270.00000000); //object(med_office6_desk_2) (1)

	// - Interior del Banco
	CreateDynamicObject(14789,1424.69030800,-1004.06616200,1643.01867700,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(2774,1433.02624500,-1004.64392100,1635.81982400,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(2774,1429.29699700,-1004.61865200,1641.28112800,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(2774,1440.95703100,-979.68206800,1640.29772900,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(2774,1429.33715800,-979.54528800,1639.72338900,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(2774,1449.31408700,-984.50500500,1648.02319300,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(2774,1413.91406300,-984.51538100,1643.07348600,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(1886,1448.51013200,-1003.64294400,1647.09399400,19.76700000,0.00000000,223.35840000); //
	CreateDynamicObject(1886,1414.70654300,-980.60443100,1647.06164600,19.76700000,0.00000000,43.35840000); //
	CreateDynamicObject(2774,1430.41687000,-999.01727300,1638.72241200,0.00000000,269.75920000,0.00000000); //
	CreateDynamicObject(2774,1408.14929200,-998.99682600,1638.72241200,0.00000000,269.75920000,180.00000000); //
	CreateDynamicObject(2774,1443.57727100,-986.63464400,1638.72338900,0.00000000,269.75920000,270.00000000); //
	CreateDynamicObject(2774,1443.60449200,-998.99816900,1647.79748500,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(11359,1414.35620100,-988.98535200,1639.79589800,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(2774,1413.92736800,-986.01171900,1643.04699700,0.00000000,0.00000000,270.00000000); //
	CreateDynamicObject(2774,1413.76367200,-992.08538800,1643.67334000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(626,1427.55456500,-997.32299800,1640.76647900,0.00000000,0.00000000,135.00000000); //
	CreateDynamicObject(626,1427.48828100,-990.75250200,1640.84155300,0.00000000,0.00000000,135.00000000); //
	CreateDynamicObject(2773,1427.75671400,-995.78118900,1639.31018100,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(2773,1427.69494600,-992.84143100,1639.31018100,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(2773,1427.59692400,-989.12860100,1639.30151400,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(2773,1429.86315900,-982.92736800,1639.31018100,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(626,1427.66528300,-983.12860100,1640.84155300,0.00000000,0.00000000,236.25000000); //
	CreateDynamicObject(2773,1432.75585900,-982.99078400,1639.31018100,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(626,1434.64831500,-983.18890400,1640.84155300,0.00000000,0.00000000,236.25000000); //
	CreateDynamicObject(2773,1437.09143100,-983.05499300,1639.31018100,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(2773,1440.04028300,-983.01275600,1639.31018100,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(3462,1448.46691900,-993.01446500,1640.29797400,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(3462,1448.51208500,-982.99261500,1640.18151900,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(626,1441.63623000,-997.04772900,1640.74145500,0.00000000,0.00000000,146.25000000); //
	CreateDynamicObject(14632,1443.64868200,-995.93463100,1638.66772500,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(14632,1432.15637200,-1018.01525900,1639.98815900,0.00000000,0.00000000,270.00000000); //
	CreateDynamicObject(1514,1432.29492200,-998.85247800,1639.74011200,0.00000000,0.00000000,180.00000000); //
	CreateDynamicObject(1514,1438.35253900,-998.84674100,1639.81567400,0.00000000,0.00000000,180.00000000); //
	CreateDynamicObject(2773,1435.18383800,-996.75927700,1639.30151400,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(2773,1435.15246600,-993.93255600,1639.30151400,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(2773,1439.33862300,-996.65869100,1639.30151400,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(2773,1439.28894000,-994.00067100,1639.30151400,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(1723,1426.28015100,-994.86358600,1638.70727500,0.00000000,0.00000000,270.00000000); //
	CreateDynamicObject(1723,1426.24462900,-991.15045200,1638.73230000,0.00000000,0.00000000,270.00000000); //
	CreateDynamicObject(1723,1422.27746600,-996.93505900,1638.68225100,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(1723,1422.27929700,-993.21002200,1638.65722700,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(2637,1424.23242200,-992.17358400,1638.83874500,0.00000000,0.00000000,270.00000000); //
	CreateDynamicObject(2637,1424.22851600,-995.70416300,1638.83874500,0.00000000,0.00000000,270.00000000); //
	CreateDynamicObject(3657,1432.63330100,-987.73901400,1639.20239300,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(3657,1432.63110400,-986.97723400,1639.20239300,0.00000000,0.00000000,180.00000000); //
	CreateDynamicObject(3657,1438.11157200,-986.97753900,1639.20239300,0.00000000,0.00000000,180.00000000); //
	CreateDynamicObject(3657,1438.08630400,-987.73071300,1639.22741700,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(2961,1439.02832000,-999.82666000,1639.21130400,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(2961,1433.50561500,-999.82763700,1639.30139200,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(2946,1414.35522500,-990.51348900,1638.75561500,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(2946,1414.38024900,-987.39251700,1638.75500500,0.00000000,0.00000000,180.00000000); //
	CreateDynamicObject(2963,1424.16528300,-1004.81567400,1640.78112800,0.00000000,0.00000000,270.00000000); //
	CreateDynamicObject(2963,1426.80676300,-1004.83252000,1640.82690400,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(1886,1414.73059100,-993.52301000,1646.90856900,17.18870000,0.00000000,67.50000000); //
	CreateDynamicObject(2773,1431.41455100,-996.84582500,1639.30151400,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(2773,1431.47338900,-994.01709000,1639.30151400,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(632,1434.73535200,-987.75750700,1639.13122600,0.00000000,0.00000000,213.75000000); //
	CreateDynamicObject(2942,1417.71362300,-980.47515900,1639.36352500,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(1216,1443.28137200,-989.31127900,1639.38781700,0.00000000,0.00000000,270.00000000); //
	CreateDynamicObject(2942,1421.21716300,-980.44891400,1639.38549800,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(2942,1424.63049300,-980.52667200,1639.37146000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(1216,1443.27783200,-991.42486600,1639.42419400,0.00000000,0.00000000,270.00000000); //
	CreateDynamicObject(1216,1443.25122100,-987.27819800,1639.37622100,0.00000000,0.00000000,270.00000000); //
	CreateDynamicObject(1216,1443.25976600,-985.48498500,1639.37622100,0.00000000,0.00000000,270.00000000); //
	CreateDynamicObject(2773,1441.22863800,-993.04296900,1639.30151400,0.00000000,0.00000000,270.00000000); //
	CreateDynamicObject(2824,1424.29724100,-992.05493200,1639.24768100,0.00000000,0.00000000,78.75000000); //

	// - Area de Autos en Renta
	CreateDynamicObject(970,1359.10009766,-1663.77746582,13.16024876,0.00000000,0.00000000,320.00000000); //object(fencesmallb) (1)
	CreateDynamicObject(970,1362.72656250,-1665.06530762,13.11871719,0.00000000,0.00000000,359.99877930); //object(fencesmallb) (2)
	CreateDynamicObject(970,1358.90991211,-1631.14562988,13.15768242,0.00000000,0.00000000,39.99450684); //object(fencesmallb) (3)
	CreateDynamicObject(970,1362.56713867,-1629.83251953,13.12479687,0.00000000,0.00000000,359.99023438); //object(fencesmallb) (4)
	CreateDynamicObject(4638,1362.89770508,-1630.89013672,14.04707718,0.00000000,0.00000000,0.00000000); //object(paypark_lan01) (1)
	CreateDynamicObject(1215,1364.77294922,-1629.94116211,13.12198257,0.00000000,0.00000000,0.00000000); //object(bollardlight) (1)
	CreateDynamicObject(1215,1364.81567383,-1664.98779297,13.10363197,0.00000000,0.00000000,0.00000000); //object(bollardlight) (2)
	CreateDynamicObject(1568,1419.51843262,-1653.05786133,12.54687500,0.00000000,0.00000000,0.00000000); //object(chinalamp_sf) (1)
	CreateDynamicObject(1568,1419.52160645,-1644.34606934,12.53948593,0.00000000,0.00000000,0.00000000); //object(chinalamp_sf) (2)
	CreateDynamicObject(1568,1379.65454102,-1679.06298828,12.52070427,0.00000000,0.00000000,0.00000000); //object(chinalamp_sf) (3)
	CreateDynamicObject(1568,1368.33679199,-1673.39001465,12.53112411,0.00000000,0.00000000,0.00000000); //object(chinalamp_sf) (4)
	CreateDynamicObject(1568,1352.17626953,-1683.94812012,12.61250114,0.00000000,0.00000000,0.00000000); //object(chinalamp_sf) (5)
	CreateDynamicObject(1568,1352.31225586,-1677.89624023,12.61242771,0.00000000,0.00000000,0.00000000); //object(chinalamp_sf) (6)
	CreateDynamicObject(1568,1370.54003906,-1594.53771973,12.54687500,0.00000000,0.00000000,0.00000000); //object(chinalamp_sf) (7)
	CreateDynamicObject(1568,1375.66809082,-1598.01574707,12.54687500,0.00000000,0.00000000,0.00000000); //object(chinalamp_sf) (8)
	CreateDynamicObject(1568,1355.51574707,-1590.15856934,12.54119873,0.00000000,0.00000000,0.00000000); //object(chinalamp_sf) (9)
	CreateDynamicObject(1568,1347.97143555,-1588.20251465,12.43096733,0.00000000,0.00000000,0.00000000); //object(chinalamp_sf) (10)
	CreateDynamicObject(1568,1351.77233887,-1722.10620117,12.60778046,0.00000000,0.00000000,0.00000000); //object(chinalamp_sf) (11)
	CreateDynamicObject(1568,1345.81774902,-1722.19165039,12.57142830,0.00000000,0.00000000,0.00000000); //object(chinalamp_sf) (12)

	// - Entrada del Usuario
	CreateDynamicObject(16003,829.90722656,-1335.65722656,13.99449158,0.00000000,0.00000000,0.50000000); //object(drvin_ticket) (1)
	CreateDynamicObject(16003,829.93884277,-1336.93395996,13.99449158,0.00000000,0.00000000,0.49987793); //object(drvin_ticket) (3)
	CreateDynamicObject(970,833.13885498,-1337.28955078,13.09835625,0.00000000,0.00000000,0.00000000); //object(fencesmallb) (1)
	CreateDynamicObject(970,837.30999756,-1337.26330566,13.09835625,0.00000000,0.00000000,0.00000000); //object(fencesmallb) (2)
	CreateDynamicObject(970,841.44006348,-1337.25817871,13.09835625,0.00000000,0.00000000,0.00000000); //object(fencesmallb) (3)
	CreateDynamicObject(970,845.57196045,-1337.28320312,13.09835625,0.00000000,0.00000000,0.00000000); //object(fencesmallb) (4)
	CreateDynamicObject(970,847.62542725,-1335.14257812,13.15470409,0.00000000,0.00000000,270.00000000); //object(fencesmallb) (5)
	CreateDynamicObject(970,845.58233643,-1335.17700195,13.14185905,0.00000000,0.00000000,270.00000000); //object(fencesmallb) (6)
	CreateDynamicObject(970,843.49652100,-1335.22180176,13.12633514,0.00000000,0.00000000,270.00000000); //object(fencesmallb) (7)
	CreateDynamicObject(970,841.39471436,-1335.12475586,13.11468601,0.00000000,0.00000000,270.00000000); //object(fencesmallb) (8)
	CreateDynamicObject(970,839.32489014,-1335.19372559,13.09859276,0.00000000,0.00000000,270.00000000); //object(fencesmallb) (9)
	CreateDynamicObject(970,837.26300049,-1335.11816406,13.09835625,0.00000000,0.00000000,270.00000000); //object(fencesmallb) (10)
	CreateDynamicObject(970,835.20336914,-1335.20458984,13.09835625,0.00000000,0.00000000,270.00000000); //object(fencesmallb) (11)
	CreateDynamicObject(970,833.16479492,-1335.21374512,13.09835625,0.00000000,0.00000000,270.00000000); //object(fencesmallb) (12)
	CreateDynamicObject(970,826.26031494,-1338.46679688,13.08142662,0.00000000,0.00000000,0.00000000); //object(fencesmallb) (14)
	CreateDynamicObject(970,826.23260498,-1344.57360840,13.08390045,0.00000000,0.00000000,0.00000000); //object(fencesmallb) (16)
	CreateDynamicObject(4639,848.83380127,-1335.08398438,14.27717209,0.00000000,0.00000000,90.00000000); //object(paypark_lan02) (1)
	CreateDynamicObject(1256,816.18829346,-1345.42431641,13.18852806,0.00000000,0.00000000,270.00000000); //object(stonebench1) (1)
	CreateDynamicObject(1256,819.81866455,-1345.42578125,13.18232250,0.00000000,0.00000000,270.00000000); //object(stonebench1) (3)
	CreateDynamicObject(1256,812.71142578,-1345.40759277,13.19447136,0.00000000,0.00000000,270.00000000); //object(stonebench1) (4)
	CreateDynamicObject(1256,812.72912598,-1346.29431152,13.19444084,0.00000000,0.00000000,90.00000000); //object(stonebench1) (5)
	CreateDynamicObject(1256,816.20489502,-1346.29748535,13.18849945,0.00000000,0.00000000,90.00000000); //object(stonebench1) (6)
	CreateDynamicObject(1256,819.82910156,-1346.29113770,13.18230438,0.00000000,0.00000000,90.00000000); //object(stonebench1) (7)
	CreateDynamicObject(1235,821.61041260,-1345.92443848,13.02287865,0.00000000,0.00000000,0.00000000); //object(wastebin) (2)
	CreateDynamicObject(1235,817.98510742,-1345.86108398,13.02907848,0.00000000,0.00000000,0.00000000); //object(wastebin) (3)
	CreateDynamicObject(1235,814.43939209,-1345.79394531,13.03513813,0.00000000,0.00000000,0.00000000); //object(wastebin) (4)
	CreateDynamicObject(1235,810.93096924,-1345.82727051,13.04113483,0.00000000,0.00000000,0.00000000); //object(wastebin) (5)
	CreateDynamicObject(1224,869.08422852,-1341.24609375,13.16178894,0.00000000,0.00000000,320.00000000); //object(woodenbox) (1)
	CreateDynamicObject(1224,868.68218994,-1339.40112305,13.16178894,0.00000000,0.00000000,249.99877930); //object(woodenbox) (2)
	CreateDynamicObject(1224,870.07843018,-1340.07995605,13.16178894,0.00000000,0.00000000,237.99389648); //object(woodenbox) (3)
	CreateDynamicObject(1224,869.62542725,-1340.22033691,14.39123249,0.00000000,0.00000000,197.99133301); //object(woodenbox) (4)
	CreateDynamicObject(638,825.79467773,-1338.13488770,13.22549915,0.00000000,0.00000000,90.00000000); //object(kb_planter_bush) (2)
	CreateDynamicObject(638,825.82287598,-1345.07482910,13.22575092,0.00000000,0.00000000,90.00000000); //object(kb_planter_bush) (3)
	CreateDynamicObject(646,824.14727783,-1344.99743652,13.93221569,0.00000000,0.00000000,0.00000000); //object(veg_palmkb14) (2)
	CreateDynamicObject(646,824.07403564,-1337.96191406,13.94288731,0.00000000,0.00000000,0.00000000); //object(veg_palmkb14) (3)
	CreateDynamicObject(647,782.39300537,-1304.79174805,14.38860226,0.00000000,0.00000000,0.00000000); //object(new_bushsm) (1)
	CreateDynamicObject(647,784.91607666,-1302.08776855,14.38996601,0.00000000,0.00000000,0.00000000); //object(new_bushsm) (2)
	CreateDynamicObject(647,784.36163330,-1305.68176270,14.38746929,0.00000000,0.00000000,0.00000000); //object(new_bushsm) (3)
	CreateDynamicObject(1568,839.99316406,-1338.82971191,6.17187500,0.00000000,0.00000000,0.00000000); //object(chinalamp_sf) (1)
	CreateDynamicObject(1568,842.75939941,-1344.82080078,6.17187500,0.00000000,0.00000000,0.00000000); //object(chinalamp_sf) (2)
	CreateDynamicObject(1568,830.33264160,-1350.50158691,2.33593750,0.00000000,0.00000000,0.00000000); //object(chinalamp_sf) (3)
	CreateDynamicObject(1568,834.50506592,-1354.35803223,2.33593750,0.00000000,0.00000000,0.00000000); //object(chinalamp_sf) (5)
	CreateDynamicObject(1568,827.36193848,-1345.02770996,12.54262257,0.00000000,0.00000000,0.00000000); //object(chinalamp_sf) (6)
	CreateDynamicObject(1568,827.36791992,-1338.14538574,12.54022408,0.00000000,0.00000000,0.00000000); //object(chinalamp_sf) (7)
	CreateDynamicObject(1568,850.11041260,-1333.07348633,12.66134167,0.00000000,0.00000000,0.00000000); //object(chinalamp_sf) (8)
	CreateDynamicObject(1215,833.16436768,-1333.11865234,13.12758923,0.00000000,0.00000000,0.00000000); //object(bollardlight) (1)
	CreateDynamicObject(1215,835.17675781,-1333.11572266,13.14143562,0.00000000,0.00000000,0.00000000); //object(bollardlight) (2)
	CreateDynamicObject(1215,837.24871826,-1333.01757812,13.15836239,0.00000000,0.00000000,0.00000000); //object(bollardlight) (3)
	CreateDynamicObject(1215,839.31695557,-1333.10485840,13.17005634,0.00000000,0.00000000,0.00000000); //object(bollardlight) (4)
	CreateDynamicObject(1215,841.40313721,-1333.03588867,13.18626213,0.00000000,0.00000000,0.00000000); //object(bollardlight) (5)
	CreateDynamicObject(1215,843.46636963,-1333.13293457,13.19764709,0.00000000,0.00000000,0.00000000); //object(bollardlight) (6)
	CreateDynamicObject(1215,845.57421875,-1333.08813477,13.21332169,0.00000000,0.00000000,0.00000000); //object(bollardlight) (7)
	CreateDynamicObject(1215,847.59649658,-1333.05371094,13.22622299,0.00000000,0.00000000,0.00000000); //object(bollardlight) (8)
	CreateDynamicObject(1238,877.66192627,-1337.90698242,12.86505508,0.00000000,0.00000000,0.00000000); //object(trafficcone) (4)
	CreateDynamicObject(1216,827.23590088,-1347.97998047,13.23348618,0.00000000,0.00000000,270.00000000); //object(phonebooth1) (2)
	CreateDynamicObject(1216,827.21398926,-1348.55468750,13.23328876,0.00000000,0.00000000,270.00000000); //object(phonebooth1) (3)
	CreateDynamicObject(1216,827.20141602,-1349.17370605,13.23317432,0.00000000,0.00000000,270.00000000); //object(phonebooth1) (4)
	CreateDynamicObject(1216,827.17962646,-1349.78210449,13.23297787,0.00000000,0.00000000,270.00000000); //object(phonebooth1) (5)
	CreateDynamicObject(1216,827.13970947,-1350.43249512,13.23261738,0.00000000,0.00000000,270.00000000); //object(phonebooth1) (6)
	CreateDynamicObject(1238,875.41668701,-1337.98669434,12.86505508,0.00000000,0.00000000,0.00000000); //object(trafficcone) (4)
	CreateDynamicObject(1238,872.96331787,-1337.92956543,12.86505508,0.00000000,0.00000000,0.00000000); //object(trafficcone) (4)
	CreateDynamicObject(1238,870.21301270,-1337.89685059,12.86505508,0.00000000,0.00000000,0.00000000); //object(trafficcone) (4)
	CreateDynamicObject(1238,867.73797607,-1337.90881348,12.86505508,0.00000000,0.00000000,0.00000000); //object(trafficcone) (4)
	CreateDynamicObject(1238,874.25463867,-1338.84411621,12.86505508,0.00000000,0.00000000,0.00000000); //object(trafficcone) (4)
	CreateDynamicObject(1238,876.54907227,-1338.71179199,12.86505508,0.00000000,0.00000000,0.00000000); //object(trafficcone) (4)
	CreateDynamicObject(1238,871.57287598,-1338.76220703,12.86505508,0.00000000,0.00000000,0.00000000); //object(trafficcone) (4)


	// - Presidencia de Los Santos
	CreateDynamicObject(987,1295.41455078,-1292.10400391,12.53790474,0.00000000,0.00000000,179.74938965); //object(elecfence_bar) (3)
	CreateDynamicObject(3749,1269.81787109,-1337.76257324,17.84421539,0.00000000,0.00000000,270.00000000); //object(clubgate01_lax) (2)
	CreateDynamicObject(987,1283.47961426,-1292.30480957,12.36677361,0.00000000,0.00000000,179.74731445); //object(elecfence_bar) (14)
	CreateDynamicObject(987,1271.57507324,-1292.15344238,12.48079300,0.00000000,0.00000000,269.74731445); //object(elecfence_bar) (15)
	CreateDynamicObject(987,1271.45068359,-1304.12658691,12.48370361,0.00000000,0.00000000,269.74182129); //object(elecfence_bar) (16)
	CreateDynamicObject(987,1271.43420410,-1316.14208984,12.48661995,0.00000000,0.00000000,269.74182129); //object(elecfence_bar) (17)
	CreateDynamicObject(987,1271.56127930,-1347.89147949,12.50003052,0.00000000,0.00000000,269.74182129); //object(elecfence_bar) (18)
	CreateDynamicObject(987,1271.50415039,-1359.81481934,12.48416710,0.00000000,0.00000000,269.74182129); //object(elecfence_bar) (19)
	CreateDynamicObject(987,1271.36193848,-1383.80871582,12.34744835,0.00000000,0.00000000,1.24182129); //object(elecfence_bar) (20)
	CreateDynamicObject(987,1271.44433594,-1371.89453125,12.41926956,0.00000000,0.00000000,269.74182129); //object(elecfence_bar) (21)
	CreateDynamicObject(987,1283.19165039,-1383.53088379,12.36132050,0.00000000,0.00000000,63.24145508); //object(elecfence_bar) (23)
	CreateDynamicObject(987,1288.47265625,-1372.81823730,12.62480354,0.00000000,0.00000000,89.23730469); //object(elecfence_bar) (24)
	CreateDynamicObject(980,1270.26977539,-1337.72875977,15.10916138,0.00000000,0.00000000,270.00000000); //presidenciacerrada
	CreateDynamicObject(980,1270.26953125,-1337.72851562,8.35916138,0.00000000,0.00000000,270.00000000); //presidenciaabierta
	CreateDynamicObject(10401,1285.14965820,-1302.18310547,14.83024216,0.00000000,0.00000000,316.00000000); //object(hc_shed02_sfs) (1)
	CreateDynamicObject(10401,1285.48999023,-1322.33276367,14.83024216,0.00000000,0.00000000,315.99975586); //object(hc_shed02_sfs) (2)
	CreateDynamicObject(10401,1285.35351562,-1357.13305664,14.83024216,0.00000000,0.00000000,315.99975586); //object(hc_shed02_sfs) (3)
	CreateDynamicObject(3852,1310.87072754,-1317.77856445,35.94299698,0.00000000,0.00000000,90.00000000); //object(sf_jump) (1)
	CreateDynamicObject(3934,1303.12963867,-1298.35986328,34.65690613,0.00000000,0.00000000,90.00000000); //object(helipad01) (1)
	CreateDynamicObject(3934,1315.35705566,-1298.35595703,34.65856552,0.00000000,0.00000000,90.00000000); //object(helipad01) (2)
	CreateDynamicObject(1569,1287.14038086,-1348.40771484,12.57144260,0.00000000,0.00000000,270.00000000); //object(adam_v_door) (1)
	CreateDynamicObject(1569,1287.15625000,-1351.38696289,12.57915974,0.00000000,0.00000000,90.00000000); //object(adam_v_door) (2)

	// - SAMD y Alrededores
	CreateDynamicObject(710,1183.73901367,-1365.83312988,28.80465698,0.00000000,0.00000000,0.00000000); //object(vgs_palm01) (2)
	CreateDynamicObject(710,1181.39721680,-1297.99475098,28.81035423,0.00000000,0.00000000,0.00000000); //object(vgs_palm01) (4)
	CreateDynamicObject(710,1183.48071289,-1355.52185059,28.81391144,0.00000000,0.00000000,0.00000000); //object(vgs_palm01) (6)
	CreateDynamicObject(710,1217.95031738,-1382.55334473,27.91780472,0.00000000,0.00000000,0.00000000); //object(vgs_palm01) (7)
	CreateDynamicObject(710,1243.57360840,-1382.28308105,27.89097595,0.00000000,0.00000000,0.00000000); //object(vgs_palm01) (8)
	CreateDynamicObject(710,1243.50695801,-1293.41308594,27.90092468,0.00000000,0.00000000,0.00000000); //object(vgs_palm01) (9)
	CreateDynamicObject(710,1218.55651855,-1293.30419922,28.05579758,0.00000000,0.00000000,0.00000000); //object(vgs_palm01) (10)
	CreateDynamicObject(762,1224.55957031,-1365.66564941,14.75867081,0.00000000,0.00000000,0.00000000); //object(new_bushtest) (1)
	CreateDynamicObject(762,1235.33105469,-1370.73071289,14.89102173,0.00000000,0.00000000,30.00000000); //object(new_bushtest) (2)
	CreateDynamicObject(762,1225.12988281,-1306.20715332,14.00060844,0.00000000,0.00000000,29.99816895); //object(new_bushtest) (3)
	CreateDynamicObject(762,1237.06884766,-1305.68432617,14.16143990,0.00000000,0.00000000,29.99816895); //object(new_bushtest) (4)
	CreateDynamicObject(762,1232.07897949,-1332.68786621,15.40407944,0.00000000,0.00000000,29.99816895); //object(new_bushtest) (5)
	CreateDynamicObject(1569,1171.72656250,-1324.78857422,14.43068504,0.00000000,0.00000000,90.00000000); //object(adam_v_door) (1)
	CreateDynamicObject(1569,1160.33630371,-1330.45922852,30.49830246,0.00000000,0.00000000,0.00000000); //object(adam_v_door) (2)
	CreateDynamicObject(1569,1171.71679688,-1321.82421875,14.42965698,0.00000000,0.00000000,270.00000000); //object(adam_v_door) (3)
	CreateDynamicObject(1569,1163.31079102,-1330.49548340,30.48366928,0.00000000,0.00000000,180.00000000); //object(adam_v_door) (4)
	CreateDynamicObject(11489,1221.30712891,-1335.25146484,12.41010189,0.00000000,0.00000000,270.00000000); //object(dam_statues) (1)
	CreateDynamicObject(3934,1167.39062500,-1300.03479004,30.48851776,0.00000000,0.00000000,270.00000000); //object(helipad01) (1)
	CreateDynamicObject(3934,1167.30017090,-1316.02099609,30.48437119,0.00000000,0.00000000,270.00000000); //object(helipad01) (2)
	CreateDynamicObject(3934,1155.74377441,-1315.96301270,30.50411987,0.00000000,0.00000000,270.00000000); //object(helipad01) (3)
	CreateDynamicObject(3934,1155.57885742,-1299.95349121,30.50739670,0.00000000,0.00000000,270.00000000); //object(helipad01) (4)

	// - Zona Central de LS (Comisaria, Banco, Ayuntamiento, Tienda de Ropa)
	CreateDynamicObject(710,1546.63073730,-1686.89477539,28.50810242,0.00000000,0.00000000,0.00000000); //object(vgs_palm01) (2)
	CreateDynamicObject(710,1546.87414551,-1693.78076172,28.50810242,0.00000000,0.00000000,0.00000000); //object(vgs_palm01) (3)
	CreateDynamicObject(710,1547.06054688,-1664.38269043,28.50812149,0.00000000,0.00000000,0.00000000); //object(vgs_palm01) (4)
	CreateDynamicObject(710,1546.79772949,-1657.83581543,28.50812149,0.00000000,0.00000000,0.00000000); //object(vgs_palm01) (5)
	CreateDynamicObject(710,1542.38684082,-1638.62048340,28.56827164,0.00000000,0.00000000,0.00000000); //object(vgs_palm01) (6)
	CreateDynamicObject(710,1541.72253418,-1648.43127441,28.56827164,0.00000000,0.00000000,0.00000000); //object(vgs_palm01) (7)
	CreateDynamicObject(710,1541.24511719,-1702.47998047,28.56827164,0.00000000,0.00000000,0.00000000); //object(vgs_palm01) (8)
	CreateDynamicObject(710,1541.74584961,-1713.27575684,28.56827164,0.00000000,0.00000000,0.00000000); //object(vgs_palm01) (9)
	CreateDynamicObject(710,1518.89746094,-1748.02722168,28.63354111,0.00000000,0.00000000,0.00000000); //object(vgs_palm01) (10)
	CreateDynamicObject(710,1527.37316895,-1748.34228516,28.63354111,0.00000000,0.00000000,0.00000000); //object(vgs_palm01) (11)
	CreateDynamicObject(710,1538.04980469,-1748.75878906,28.63354111,0.00000000,0.00000000,0.00000000); //object(vgs_palm01) (12)
	CreateDynamicObject(710,1545.85852051,-1748.26379395,28.63354111,0.00000000,0.00000000,0.00000000); //object(vgs_palm01) (13)
	CreateDynamicObject(710,1554.28686523,-1760.03063965,28.63354111,0.00000000,0.00000000,0.00000000); //object(vgs_palm01) (14)
	CreateDynamicObject(710,1554.21618652,-1752.75695801,28.63354111,0.00000000,0.00000000,0.00000000); //object(vgs_palm01) (15)
	CreateDynamicObject(710,1442.96386719,-1748.49645996,28.63354111,0.00000000,0.00000000,0.00000000); //object(vgs_palm01) (16)
	CreateDynamicObject(710,1433.28430176,-1748.31518555,28.63354111,0.00000000,0.00000000,0.00000000); //object(vgs_palm01) (17)
	CreateDynamicObject(710,1425.45153809,-1748.83532715,28.63354111,0.00000000,0.00000000,0.00000000); //object(vgs_palm01) (18)
	CreateDynamicObject(710,1419.50878906,-1748.98608398,28.63354111,0.00000000,0.00000000,0.00000000); //object(vgs_palm01) (19)
	CreateDynamicObject(710,1405.87377930,-1755.35900879,28.63354111,0.00000000,0.00000000,0.00000000); //object(vgs_palm01) (20)
	CreateDynamicObject(710,1406.16833496,-1761.73327637,28.63354111,0.00000000,0.00000000,0.00000000); //object(vgs_palm01) (21)
	CreateDynamicObject(710,1456.12988281,-1712.02478027,29.13354111,0.00000000,0.00000000,0.00000000); //object(vgs_palm01) (22)
	CreateDynamicObject(710,1463.80029297,-1712.28381348,29.13354111,0.00000000,0.00000000,0.00000000); //object(vgs_palm01) (23)
	CreateDynamicObject(710,1493.32995605,-1712.25598145,29.13354111,0.00000000,0.00000000,0.00000000); //object(vgs_palm01) (24)
	CreateDynamicObject(710,1475.78210449,-1665.89953613,29.13988113,0.00000000,0.00000000,0.00000000); //object(vgs_palm01) (25)
	CreateDynamicObject(710,1500.63964844,-1712.30566406,29.13354111,0.00000000,0.00000000,0.00000000); //object(vgs_palm01) (26)
	CreateDynamicObject(710,1484.39306641,-1665.69360352,29.13988113,0.00000000,0.00000000,0.00000000); //object(vgs_palm01) (27)
	CreateDynamicObject(805,1503.26684570,-1625.67407227,14.93839645,0.00000000,0.00000000,0.00000000); //object(genveg_bush11) (1)
	CreateDynamicObject(805,1503.74609375,-1622.79040527,13.43839645,0.00000000,0.00000000,0.00000000); //object(genveg_bush11) (2)
	CreateDynamicObject(805,1503.91418457,-1619.16687012,14.43839645,0.00000000,0.00000000,0.00000000); //object(genveg_bush11) (3)
	CreateDynamicObject(805,1501.01171875,-1619.45861816,14.18839645,0.00000000,0.00000000,0.00000000); //object(genveg_bush11) (4)
	CreateDynamicObject(805,1500.50146484,-1623.13256836,14.43839645,0.00000000,0.00000000,0.00000000); //object(genveg_bush11) (5)
	CreateDynamicObject(805,1499.13610840,-1625.67724609,14.18839645,0.00000000,0.00000000,0.00000000); //object(genveg_bush11) (6)
	CreateDynamicObject(805,1499.93627930,-1622.05090332,14.18839645,0.00000000,0.00000000,0.00000000); //object(genveg_bush11) (7)
	CreateDynamicObject(805,1459.52026367,-1624.85266113,14.43839645,0.00000000,0.00000000,0.00000000); //object(genveg_bush11) (8)
	CreateDynamicObject(805,1455.74633789,-1625.12036133,14.18839645,0.00000000,0.00000000,0.00000000); //object(genveg_bush11) (9)
	CreateDynamicObject(805,1458.42016602,-1622.94775391,14.18839645,0.00000000,0.00000000,0.00000000); //object(genveg_bush11) (10)
	CreateDynamicObject(805,1455.37780762,-1620.29748535,14.43839645,0.00000000,0.00000000,0.00000000); //object(genveg_bush11) (11)
	CreateDynamicObject(805,1455.59741211,-1617.90002441,14.18839645,0.00000000,0.00000000,0.00000000); //object(genveg_bush11) (12)
	CreateDynamicObject(805,1457.50903320,-1619.04479980,14.43839645,0.00000000,0.00000000,0.00000000); //object(genveg_bush11) (13)
	CreateDynamicObject(805,1459.18005371,-1620.44494629,14.18839645,0.00000000,0.00000000,0.00000000); //object(genveg_bush11) (14)
	CreateDynamicObject(805,1486.33117676,-1665.34887695,14.20255089,0.00000000,0.00000000,0.00000000); //object(genveg_bush11) (15)
	CreateDynamicObject(805,1483.02331543,-1666.80737305,13.95255089,0.00000000,0.00000000,0.00000000); //object(genveg_bush11) (16)
	CreateDynamicObject(805,1482.62512207,-1664.46520996,13.95255089,0.00000000,0.00000000,0.00000000); //object(genveg_bush11) (17)
	CreateDynamicObject(805,1478.55651855,-1666.63769531,14.20255089,0.00000000,0.00000000,0.00000000); //object(genveg_bush11) (18)
	CreateDynamicObject(805,1478.81945801,-1664.68945312,13.95255089,0.00000000,0.00000000,0.00000000); //object(genveg_bush11) (19)
	CreateDynamicObject(805,1474.78186035,-1664.25683594,13.95255089,0.00000000,0.00000000,0.00000000); //object(genveg_bush11) (20)
	CreateDynamicObject(805,1473.63525391,-1667.28771973,13.95255089,0.00000000,0.00000000,0.00000000); //object(genveg_bush11) (21)
	CreateDynamicObject(805,1477.13781738,-1667.30139160,13.95255089,0.00000000,0.00000000,0.00000000); //object(genveg_bush11) (22)
	CreateDynamicObject(805,1472.17431641,-1664.65075684,14.20255089,0.00000000,0.00000000,0.00000000); //object(genveg_bush11) (23)
	CreateDynamicObject(805,1486.83947754,-1667.33325195,14.45255089,0.00000000,0.00000000,0.00000000); //object(genveg_bush11) (24)
	CreateDynamicObject(805,1480.85925293,-1668.38281250,13.95255089,0.00000000,0.00000000,0.00000000); //object(genveg_bush11) (25)
	CreateDynamicObject(805,1471.10949707,-1667.69982910,13.95255089,0.00000000,0.00000000,0.00000000); //object(genveg_bush11) (26)
	CreateDynamicObject(805,1462.72717285,-1685.71203613,13.94620895,0.00000000,0.00000000,0.00000000); //object(genveg_bush11) (27)
	CreateDynamicObject(805,1459.78186035,-1685.87194824,14.44620895,0.00000000,0.00000000,0.00000000); //object(genveg_bush11) (28)
	CreateDynamicObject(805,1460.50488281,-1689.10961914,14.44620895,0.00000000,0.00000000,0.00000000); //object(genveg_bush11) (29)
	CreateDynamicObject(805,1462.25634766,-1688.33093262,14.44620895,0.00000000,0.00000000,0.00000000); //object(genveg_bush11) (30)
	CreateDynamicObject(805,1459.13635254,-1695.52124023,14.19620895,0.00000000,0.00000000,0.00000000); //object(genveg_bush11) (31)
	CreateDynamicObject(805,1461.37695312,-1696.19628906,14.19620895,0.00000000,0.00000000,0.00000000); //object(genveg_bush11) (32)
	CreateDynamicObject(805,1459.67150879,-1698.45959473,14.44620895,0.00000000,0.00000000,0.00000000); //object(genveg_bush11) (33)
	CreateDynamicObject(805,1462.83740234,-1708.34936523,14.19620895,0.00000000,0.00000000,0.00000000); //object(genveg_bush11) (34)
	CreateDynamicObject(805,1459.78967285,-1711.92565918,13.94620895,0.00000000,0.00000000,0.00000000); //object(genveg_bush11) (35)
	CreateDynamicObject(805,1459.54406738,-1709.48559570,14.69620895,0.00000000,0.00000000,0.00000000); //object(genveg_bush11) (36)
	CreateDynamicObject(805,1498.88610840,-1709.13000488,14.19620895,0.00000000,0.00000000,0.00000000); //object(genveg_bush11) (37)
	CreateDynamicObject(805,1496.36462402,-1709.97924805,14.19620895,0.00000000,0.00000000,0.00000000); //object(genveg_bush11) (38)
	CreateDynamicObject(805,1497.94091797,-1706.84436035,14.52811623,0.00000000,0.00000000,0.00000000); //object(genveg_bush11) (39)
	CreateDynamicObject(805,1494.78234863,-1700.77636719,14.19620895,0.00000000,0.00000000,0.00000000); //object(genveg_bush11) (40)
	CreateDynamicObject(805,1496.55480957,-1699.92919922,13.94620895,0.00000000,0.00000000,0.00000000); //object(genveg_bush11) (41)
	CreateDynamicObject(805,1495.62768555,-1697.73193359,14.19620895,0.00000000,0.00000000,0.00000000); //object(genveg_bush11) (42)
	CreateDynamicObject(805,1496.35021973,-1687.67053223,14.19620895,0.00000000,0.00000000,0.00000000); //object(genveg_bush11) (43)
	CreateDynamicObject(805,1497.92370605,-1688.55651855,14.19620895,0.00000000,0.00000000,0.00000000); //object(genveg_bush11) (44)
	CreateDynamicObject(805,1496.46203613,-1690.56286621,14.22121620,0.00000000,0.00000000,0.00000000); //object(genveg_bush11) (45)
	CreateDynamicObject(805,1497.10961914,-1691.08544922,14.69620895,0.00000000,0.00000000,0.00000000); //object(genveg_bush11) (46)
	CreateDynamicObject(970,1493.66223145,-1682.17749023,14.09835625,0.00000000,0.00000000,0.00000000); //object(fencesmallb) (1)
	CreateDynamicObject(970,1500.14648438,-1682.18322754,14.09835625,0.00000000,0.00000000,0.00000000); //object(fencesmallb) (2)
	CreateDynamicObject(970,1497.07421875,-1682.17700195,14.09835625,0.00000000,0.00000000,0.00000000); //object(fencesmallb) (3)
	CreateDynamicObject(970,1502.24768066,-1684.28125000,14.09835625,0.00000000,0.00000000,270.00000000); //object(fencesmallb) (4)
	CreateDynamicObject(970,1502.23803711,-1688.42956543,14.09835625,0.00000000,0.00000000,270.00000000); //object(fencesmallb) (5)
	CreateDynamicObject(970,1502.22985840,-1692.54626465,14.09835625,0.00000000,0.00000000,270.00000000); //object(fencesmallb) (6)
	CreateDynamicObject(970,1502.24340820,-1696.69860840,14.09835625,0.00000000,0.00000000,270.00000000); //object(fencesmallb) (7)
	CreateDynamicObject(970,1502.27062988,-1700.83154297,14.09835625,0.00000000,0.00000000,270.00000000); //object(fencesmallb) (8)
	CreateDynamicObject(970,1502.27124023,-1704.97436523,14.09835625,0.00000000,0.00000000,270.00000000); //object(fencesmallb) (9)
	CreateDynamicObject(970,1502.27941895,-1709.14331055,14.09835625,0.00000000,0.00000000,270.00000000); //object(fencesmallb) (10)
	CreateDynamicObject(970,1502.27709961,-1711.74206543,14.09835625,0.00000000,0.00000000,270.00000000); //object(fencesmallb) (11)
	CreateDynamicObject(970,1500.15698242,-1713.86779785,14.09835625,0.00000000,0.00000000,180.00000000); //object(fencesmallb) (12)
	CreateDynamicObject(970,1496.04272461,-1713.86071777,14.09835625,0.00000000,0.00000000,179.99450684); //object(fencesmallb) (13)
	CreateDynamicObject(970,1493.64648438,-1713.86804199,14.09835625,0.00000000,0.00000000,179.99450684); //object(fencesmallb) (14)
	CreateDynamicObject(970,1491.58154297,-1711.80847168,14.09835625,0.00000000,0.00000000,89.99450684); //object(fencesmallb) (16)
	CreateDynamicObject(970,1491.57006836,-1707.67163086,14.09835625,0.00000000,0.00000000,89.99450684); //object(fencesmallb) (17)
	CreateDynamicObject(970,1491.57043457,-1703.50170898,14.09835625,0.00000000,0.00000000,89.99450684); //object(fencesmallb) (18)
	CreateDynamicObject(970,1491.56127930,-1699.35729980,14.09835625,0.00000000,0.00000000,89.99450684); //object(fencesmallb) (19)
	CreateDynamicObject(970,1491.55737305,-1695.20629883,14.09835625,0.00000000,0.00000000,89.99450684); //object(fencesmallb) (20)
	CreateDynamicObject(970,1491.55969238,-1691.05371094,14.09835625,0.00000000,0.00000000,89.99450684); //object(fencesmallb) (21)
	CreateDynamicObject(970,1491.55566406,-1686.89916992,14.09835625,0.00000000,0.00000000,89.99450684); //object(fencesmallb) (22)
	CreateDynamicObject(970,1491.57214355,-1684.31091309,14.09835625,0.00000000,0.00000000,89.99450684); //object(fencesmallb) (23)
	CreateDynamicObject(970,1454.85278320,-1684.25073242,14.09835625,0.00000000,0.00000000,89.99450684); //object(fencesmallb) (24)
	CreateDynamicObject(970,1454.87780762,-1688.41857910,14.09835625,0.00000000,0.00000000,89.99450684); //object(fencesmallb) (25)
	CreateDynamicObject(970,1454.87353516,-1692.54711914,14.09835625,0.00000000,0.00000000,89.99450684); //object(fencesmallb) (26)
	CreateDynamicObject(970,1454.87133789,-1696.67456055,14.09835625,0.00000000,0.00000000,89.99450684); //object(fencesmallb) (27)
	CreateDynamicObject(970,1454.87622070,-1700.82080078,14.09835625,0.00000000,0.00000000,89.99450684); //object(fencesmallb) (28)
	CreateDynamicObject(970,1454.86450195,-1705.00952148,14.09835625,0.00000000,0.00000000,89.99450684); //object(fencesmallb) (29)
	CreateDynamicObject(970,1454.85144043,-1709.15075684,14.09835625,0.00000000,0.00000000,89.99450684); //object(fencesmallb) (30)
	CreateDynamicObject(970,1454.87121582,-1711.72863770,14.09835625,0.00000000,0.00000000,89.99450684); //object(fencesmallb) (31)
	CreateDynamicObject(970,1456.96655273,-1713.80969238,14.09835625,0.00000000,0.00000000,359.99450684); //object(fencesmallb) (32)
	CreateDynamicObject(970,1461.10290527,-1713.82006836,14.09835625,0.00000000,0.00000000,359.98901367); //object(fencesmallb) (33)
	CreateDynamicObject(970,1463.33447266,-1713.81188965,14.09835625,0.00000000,0.00000000,359.98901367); //object(fencesmallb) (34)
	CreateDynamicObject(970,1465.41174316,-1711.77355957,14.09835625,0.00000000,0.00000000,269.98901367); //object(fencesmallb) (35)
	CreateDynamicObject(970,1465.41589355,-1707.63476562,14.09835625,0.00000000,0.00000000,269.98901367); //object(fencesmallb) (36)
	CreateDynamicObject(970,1465.42749023,-1703.48767090,14.09835625,0.00000000,0.00000000,269.98901367); //object(fencesmallb) (37)
	CreateDynamicObject(970,1465.42993164,-1699.34326172,14.09835625,0.00000000,0.00000000,269.98901367); //object(fencesmallb) (38)
	CreateDynamicObject(970,1465.44775391,-1695.21496582,14.09835625,0.00000000,0.00000000,269.98901367); //object(fencesmallb) (39)
	CreateDynamicObject(970,1465.47021484,-1691.10485840,14.09835625,0.00000000,0.00000000,269.98901367); //object(fencesmallb) (40)
	CreateDynamicObject(970,1465.49475098,-1686.94909668,14.09835625,0.00000000,0.00000000,269.98901367); //object(fencesmallb) (41)
	CreateDynamicObject(970,1465.47753906,-1684.21887207,14.09835625,0.00000000,0.00000000,269.98901367); //object(fencesmallb) (42)
	CreateDynamicObject(970,1463.40429688,-1682.14208984,14.09835625,0.00000000,0.00000000,179.98901367); //object(fencesmallb) (43)
	CreateDynamicObject(970,1459.27270508,-1682.15563965,14.09835625,0.00000000,0.00000000,179.98352051); //object(fencesmallb) (44)
	CreateDynamicObject(970,1456.83154297,-1682.13342285,14.09835625,0.00000000,0.00000000,179.98352051); //object(fencesmallb) (45)
	CreateDynamicObject(970,1471.02246094,-1669.96264648,14.10469818,0.00000000,0.00000000,179.98352051); //object(fencesmallb) (46)
	CreateDynamicObject(970,1475.19213867,-1669.95288086,14.10469818,0.00000000,0.00000000,179.98352051); //object(fencesmallb) (47)
	CreateDynamicObject(970,1479.35253906,-1669.96118164,14.10469818,0.00000000,0.00000000,179.98352051); //object(fencesmallb) (49)
	CreateDynamicObject(970,1483.56323242,-1669.98181152,14.10469818,0.00000000,0.00000000,179.98352051); //object(fencesmallb) (50)
	CreateDynamicObject(970,1487.75769043,-1670.00842285,14.10469818,0.00000000,0.00000000,179.98352051); //object(fencesmallb) (51)
	CreateDynamicObject(970,1489.81933594,-1667.94738770,14.10469818,0.00000000,0.00000000,89.98352051); //object(fencesmallb) (53)
	CreateDynamicObject(970,1489.80871582,-1663.82690430,14.10469818,0.00000000,0.00000000,89.98352051); //object(fencesmallb) (54)
	CreateDynamicObject(970,1487.72692871,-1661.79443359,14.10469818,0.00000000,0.00000000,359.98352051); //object(fencesmallb) (55)
	CreateDynamicObject(970,1483.55493164,-1661.80529785,14.10469818,0.00000000,0.00000000,359.97802734); //object(fencesmallb) (56)
	CreateDynamicObject(970,1479.43261719,-1661.82934570,14.10469818,0.00000000,0.00000000,359.97802734); //object(fencesmallb) (57)
	CreateDynamicObject(970,1475.32421875,-1661.81506348,14.10469818,0.00000000,0.00000000,359.97802734); //object(fencesmallb) (58)
	CreateDynamicObject(970,1471.18200684,-1661.80090332,14.10469818,0.00000000,0.00000000,359.97802734); //object(fencesmallb) (59)
	CreateDynamicObject(970,1468.88757324,-1663.93530273,14.10469818,0.00000000,0.00000000,269.97802734); //object(fencesmallb) (60)
	CreateDynamicObject(970,1468.87231445,-1668.00695801,14.10469818,0.00000000,0.00000000,269.97802734); //object(fencesmallb) (61)
	CreateDynamicObject(970,1503.61669922,-1615.01306152,14.34054375,0.00000000,0.00000000,179.98352051); //object(fencesmallb) (62)
	CreateDynamicObject(970,1499.43261719,-1615.02978516,14.34054375,0.00000000,0.00000000,179.98352051); //object(fencesmallb) (63)
	CreateDynamicObject(970,1497.31787109,-1617.10290527,14.34054375,0.00000000,0.00000000,89.98352051); //object(fencesmallb) (64)
	CreateDynamicObject(970,1497.32116699,-1621.21472168,14.34054375,0.00000000,0.00000000,89.98352051); //object(fencesmallb) (65)
	CreateDynamicObject(970,1497.31665039,-1625.35668945,14.34054375,0.00000000,0.00000000,89.98352051); //object(fencesmallb) (66)
	CreateDynamicObject(970,1461.80749512,-1624.79052734,14.34054375,0.00000000,0.00000000,89.98352051); //object(fencesmallb) (67)
	CreateDynamicObject(970,1461.83520508,-1620.63269043,14.34054375,0.00000000,0.00000000,89.98352051); //object(fencesmallb) (68)
	CreateDynamicObject(970,1461.82958984,-1617.07031250,14.34054375,0.00000000,0.00000000,89.98352051); //object(fencesmallb) (69)
	CreateDynamicObject(970,1459.73486328,-1615.00598145,14.34054375,0.00000000,0.00000000,359.98352051); //object(fencesmallb) (70)
	CreateDynamicObject(970,1455.61889648,-1615.04602051,14.34054375,0.00000000,0.00000000,359.97802734); //object(fencesmallb) (71)
	CreateDynamicObject(1568,1505.49523926,-1615.30859375,13.78906250,0.00000000,0.00000000,0.00000000); //object(chinalamp_sf) (1)
	CreateDynamicObject(1568,1497.61486816,-1615.37756348,13.78906250,0.00000000,0.00000000,0.00000000); //object(chinalamp_sf) (2)
	CreateDynamicObject(1568,1497.69982910,-1626.48913574,13.78906250,0.00000000,0.00000000,0.00000000); //object(chinalamp_sf) (3)
	CreateDynamicObject(1568,1454.25036621,-1615.40026855,13.78906250,0.00000000,0.00000000,0.00000000); //object(chinalamp_sf) (4)
	CreateDynamicObject(1568,1461.48742676,-1615.29467773,13.78906250,0.00000000,0.00000000,0.00000000); //object(chinalamp_sf) (5)
	CreateDynamicObject(1568,1461.50463867,-1626.43237305,13.78906250,0.00000000,0.00000000,0.00000000); //object(chinalamp_sf) (6)
	CreateDynamicObject(1568,1469.19335938,-1662.07727051,13.55321693,0.00000000,0.00000000,0.00000000); //object(chinalamp_sf) (7)
	CreateDynamicObject(1568,1469.18103027,-1669.68566895,13.55321693,0.00000000,0.00000000,0.00000000); //object(chinalamp_sf) (8)
	CreateDynamicObject(1568,1489.63208008,-1669.78466797,13.55321693,0.00000000,0.00000000,0.00000000); //object(chinalamp_sf) (9)
	CreateDynamicObject(1568,1489.56579590,-1662.09655762,13.55321693,0.00000000,0.00000000,0.00000000); //object(chinalamp_sf) (10)
	CreateDynamicObject(1568,1491.89147949,-1682.44995117,13.54687500,0.00000000,0.00000000,0.00000000); //object(chinalamp_sf) (11)
	CreateDynamicObject(1568,1501.95983887,-1682.54125977,13.54687500,0.00000000,0.00000000,0.00000000); //object(chinalamp_sf) (12)
	CreateDynamicObject(1568,1544.72534180,-1715.09155273,12.98160744,0.00000000,0.00000000,0.00000000); //object(chinalamp_sf) (13)
	CreateDynamicObject(1568,1491.96667480,-1713.60351562,13.54687500,0.00000000,0.00000000,0.00000000); //object(chinalamp_sf) (14)
	CreateDynamicObject(1568,1455.18969727,-1713.46337891,13.54687500,0.00000000,0.00000000,0.00000000); //object(chinalamp_sf) (15)
	CreateDynamicObject(1568,1464.86035156,-1713.47448730,13.45932674,0.00000000,0.00000000,0.00000000); //object(chinalamp_sf) (16)
	CreateDynamicObject(1568,1455.12060547,-1682.43859863,13.54687500,0.00000000,0.00000000,0.00000000); //object(chinalamp_sf) (17)
	CreateDynamicObject(1568,1465.22766113,-1682.39489746,13.54687500,0.00000000,0.00000000,0.00000000); //object(chinalamp_sf) (18)
	CreateDynamicObject(1568,1449.72082520,-1745.62255859,13.04687500,0.00000000,0.00000000,0.00000000); //object(chinalamp_sf) (19)
	CreateDynamicObject(1568,1449.72583008,-1751.13562012,13.04687500,0.00000000,0.00000000,0.00000000); //object(chinalamp_sf) (20)
	CreateDynamicObject(1568,1402.75598145,-1745.55419922,13.04687500,0.00000000,0.00000000,0.00000000); //object(chinalamp_sf) (21)
	CreateDynamicObject(1568,1402.77612305,-1767.58959961,13.04687500,0.00000000,0.00000000,0.00000000); //object(chinalamp_sf) (22)
	CreateDynamicObject(1568,1408.40722656,-1767.48437500,13.04687500,0.00000000,0.00000000,0.00000000); //object(chinalamp_sf) (23)
	CreateDynamicObject(1568,1512.10864258,-1745.50939941,13.04687500,0.00000000,0.00000000,0.00000000); //object(chinalamp_sf) (24)
	CreateDynamicObject(1568,1512.17004395,-1751.16992188,13.04687500,0.00000000,0.00000000,0.00000000); //object(chinalamp_sf) (25)
	CreateDynamicObject(1568,1556.86193848,-1813.06555176,13.04687500,0.00000000,0.00000000,0.00000000); //object(chinalamp_sf) (26)
	CreateDynamicObject(1568,1550.34118652,-1767.78649902,13.04687500,0.00000000,0.00000000,0.00000000); //object(chinalamp_sf) (27)
	CreateDynamicObject(1568,1556.95764160,-1767.71667480,13.04687500,0.00000000,0.00000000,0.00000000); //object(chinalamp_sf) (28)
	CreateDynamicObject(1568,1556.91699219,-1745.46093750,13.04687500,0.00000000,0.00000000,0.00000000); //object(chinalamp_sf) (29)
	CreateDynamicObject(1568,1550.94091797,-1813.03051758,13.04687500,0.00000000,0.00000000,0.00000000); //object(chinalamp_sf) (30)
	CreateDynamicObject(1568,1556.84912109,-1834.32653809,13.03918266,0.00000000,0.00000000,0.00000000); //object(chinalamp_sf) (31)
	CreateDynamicObject(1568,1540.50109863,-1834.44714355,13.04687500,0.00000000,0.00000000,0.00000000); //object(chinalamp_sf) (32)
	CreateDynamicObject(1568,1540.55065918,-1830.32312012,13.04687500,0.00000000,0.00000000,0.00000000); //object(chinalamp_sf) (33)
	CreateDynamicObject(1568,1517.27966309,-1834.41418457,13.03918266,0.00000000,0.00000000,0.00000000); //object(chinalamp_sf) (34)
	CreateDynamicObject(1568,1517.23510742,-1830.44726562,13.03918362,0.00000000,0.00000000,0.00000000); //object(chinalamp_sf) (35)
	CreateDynamicObject(1568,1491.62402344,-1834.34228516,13.04687595,0.00000000,0.00000000,0.00000000); //object(chinalamp_sf) (36)
	CreateDynamicObject(1568,1491.68127441,-1830.36340332,13.04687405,0.00000000,0.00000000,0.00000000); //object(chinalamp_sf) (37)
	CreateDynamicObject(1568,1468.49401855,-1834.44030762,13.04687500,0.00000000,0.00000000,0.00000000); //object(chinalamp_sf) (38)
	CreateDynamicObject(1568,1468.48889160,-1830.34057617,13.04687500,0.00000000,0.00000000,0.00000000); //object(chinalamp_sf) (39)
	CreateDynamicObject(1568,1442.84167480,-1834.29199219,13.04687500,0.00000000,0.00000000,0.00000000); //object(chinalamp_sf) (40)
	CreateDynamicObject(1568,1442.84558105,-1830.27062988,13.04687500,0.00000000,0.00000000,0.00000000); //object(chinalamp_sf) (41)
	CreateDynamicObject(1568,1421.96618652,-1834.35986328,13.03918266,0.00000000,0.00000000,0.00000000); //object(chinalamp_sf) (42)
	CreateDynamicObject(1568,1422.00280762,-1830.40124512,13.03918266,0.00000000,0.00000000,0.00000000); //object(chinalamp_sf) (43)
	CreateDynamicObject(1568,1409.27978516,-1812.24792480,13.03918266,0.00000000,0.00000000,0.00000000); //object(chinalamp_sf) (44)
	CreateDynamicObject(1568,1402.88708496,-1812.18701172,13.03918266,0.00000000,0.00000000,0.00000000); //object(chinalamp_sf) (45)
	CreateDynamicObject(1568,1402.85998535,-1834.33264160,13.03918266,0.00000000,0.00000000,0.00000000); //object(chinalamp_sf) (46)
	CreateDynamicObject(6462,1513.47644043,-1588.31616211,14.39186478,0.00000000,0.00000000,180.00000000); //object(pier04a_law2) (1)
	CreateDynamicObject(970,1539.68640137,-1638.42919922,13.53308868,0.00000000,0.00000000,89.98352051); //object(fencesmallb) (72)
	CreateDynamicObject(970,1541.80090332,-1636.34973145,13.53308868,0.00000000,0.00000000,359.98352051); //object(fencesmallb) (73)
	CreateDynamicObject(970,1539.70227051,-1642.58618164,13.53308868,0.00000000,0.00000000,269.97802734); //object(fencesmallb) (74)
	CreateDynamicObject(970,1539.70825195,-1646.73657227,13.53308868,0.00000000,0.00000000,269.97802734); //object(fencesmallb) (75)
	CreateDynamicObject(970,1546.07336426,-1666.55847168,13.47293854,0.00000000,0.00000000,179.97802734); //object(fencesmallb) (76)
	CreateDynamicObject(970,1539.73046875,-1648.65332031,13.53308868,0.00000000,0.00000000,269.97802734); //object(fencesmallb) (77)
	CreateDynamicObject(970,1541.55175781,-1700.21960449,13.53308868,0.00000000,0.00000000,179.97802734); //object(fencesmallb) (78)
	CreateDynamicObject(970,1544.04455566,-1658.08288574,13.47293854,0.00000000,0.00000000,89.97253418); //object(fencesmallb) (80)
	CreateDynamicObject(970,1544.03869629,-1662.21911621,13.47293854,0.00000000,0.00000000,89.96704102); //object(fencesmallb) (81)
	CreateDynamicObject(970,1544.03247070,-1664.49218750,13.47293854,0.00000000,0.00000000,89.96704102); //object(fencesmallb) (82)
	CreateDynamicObject(970,1543.91345215,-1686.64843750,13.47291946,0.00000000,0.00000000,89.96704102); //object(fencesmallb) (83)
	CreateDynamicObject(970,1543.94726562,-1690.74023438,13.47291946,0.00000000,0.00000000,89.96704102); //object(fencesmallb) (84)
	CreateDynamicObject(970,1543.93237305,-1693.32128906,13.47291946,0.00000000,0.00000000,89.96704102); //object(fencesmallb) (85)
	CreateDynamicObject(970,1546.11035156,-1655.99414062,13.47293854,0.00000000,0.00000000,179.97253418); //object(fencesmallb) (88)
	CreateDynamicObject(970,1545.99609375,-1684.51281738,13.47291946,0.00000000,0.00000000,179.97253418); //object(fencesmallb) (89)
	CreateDynamicObject(970,1545.98669434,-1695.39135742,13.47291946,0.00000000,0.00000000,179.97253418); //object(fencesmallb) (90)
	CreateDynamicObject(970,1541.78906250,-1650.79394531,13.53308868,0.00000000,0.00000000,179.97253418); //object(fencesmallb) (91)
	CreateDynamicObject(970,1541.54748535,-1715.45764160,13.53308868,0.00000000,0.00000000,179.97253418); //object(fencesmallb) (92)
	CreateDynamicObject(970,1539.47509766,-1713.35583496,13.53308868,0.00000000,0.00000000,89.97253418); //object(fencesmallb) (93)
	CreateDynamicObject(970,1539.47155762,-1709.19409180,13.53308868,0.00000000,0.00000000,89.96704102); //object(fencesmallb) (94)
	CreateDynamicObject(970,1539.46813965,-1705.03051758,13.53308868,0.00000000,0.00000000,89.96704102); //object(fencesmallb) (95)
	CreateDynamicObject(970,1539.47509766,-1702.28369141,13.53308868,0.00000000,0.00000000,89.96704102); //object(fencesmallb) (96)
	CreateDynamicObject(1568,1501.88671875,-1713.48632812,13.63357544,0.00000000,0.00000000,0.00000000); //object(chinalamp_sf) (47)
	CreateDynamicObject(1568,1539.89880371,-1715.01867676,12.98160744,0.00000000,0.00000000,0.00000000); //object(chinalamp_sf) (48)
	CreateDynamicObject(1568,1544.54919434,-1700.64184570,12.98160744,0.00000000,0.00000000,0.00000000); //object(chinalamp_sf) (49)
	CreateDynamicObject(1568,1540.11083984,-1700.56176758,12.98160744,0.00000000,0.00000000,0.00000000); //object(chinalamp_sf) (50)
	CreateDynamicObject(1568,1544.25451660,-1685.10070801,12.92143822,0.00000000,0.00000000,0.00000000); //object(chinalamp_sf) (51)
	CreateDynamicObject(1568,1544.20483398,-1694.98474121,12.92143822,0.00000000,0.00000000,0.00000000); //object(chinalamp_sf) (53)
	CreateDynamicObject(1568,1544.34057617,-1656.36755371,12.92145729,0.00000000,0.00000000,0.00000000); //object(chinalamp_sf) (54)
	CreateDynamicObject(1568,1544.34289551,-1666.23083496,12.92145729,0.00000000,0.00000000,0.00000000); //object(chinalamp_sf) (55)
	CreateDynamicObject(1568,1544.48461914,-1650.46179199,12.98160744,0.00000000,0.00000000,0.00000000); //object(chinalamp_sf) (56)
	CreateDynamicObject(1568,1540.14440918,-1650.50158691,12.98160744,0.00000000,0.00000000,0.00000000); //object(chinalamp_sf) (57)
	CreateDynamicObject(1568,1544.53100586,-1636.82812500,12.98160744,0.00000000,0.00000000,0.00000000); //object(chinalamp_sf) (58)
	CreateDynamicObject(1568,1540.08068848,-1636.68054199,12.98160744,0.00000000,0.00000000,0.00000000); //object(chinalamp_sf) (59)
	CreateDynamicObject(1569,1555.87561035,-1674.10375977,15.19531250,0.00000000,0.00000000,270.00000000); //object(adam_v_door) (1)
	CreateDynamicObject(1569,1555.87292480,-1677.08117676,15.19531250,0.00000000,0.00000000,90.00000000); //object(adam_v_door) (2)
	CreateDynamicObject(1569,1482.54736328,-1772.66406250,17.79660606,0.00000000,0.00000000,180.00000000); //object(adam_v_door) (3)
	CreateDynamicObject(1569,1479.57604980,-1772.66406250,17.80064774,0.00000000,0.00000000,359.99450684); //object(adam_v_door) (4)
	CreateDynamicObject(1569,1410.26403809,-1700.75903320,12.53948593,0.00000000,0.00000000,49.98901367); //object(adam_v_door) (5)
	CreateDynamicObject(11454,1496.21679688,-1576.09533691,12.52187538,0.00000000,0.00000000,180.00000000); //object(des_nwmedcen) (1)
	CreateDynamicObject(1569,1412.15039062,-1698.46386719,12.53948593,0.00000000,0.00000000,229.98229980); //object(adam_v_door) (8)
	CreateDynamicObject(1569,1497.40759277,-1583.18029785,12.56895542,0.00000000,0.00000000,359.98352051); //object(adam_v_door) (9)
	CreateDynamicObject(9949,1506.17919922,-1569.26623535,24.39822960,0.00000000,0.00000000,90.00000000); //object(pier1_sfe) (1)
	CreateDynamicObject(1569,1500.36035156,-1583.18029785,12.56339836,0.00000000,0.00000000,179.97802734); //object(adam_v_door) (11)
	CreateDynamicObject(7586,1518.41870117,-1550.57067871,36.95443726,0.00000000,0.00000000,0.00000000); //object(miragebuild07) (1)
	CreateDynamicObject(7586,1477.71398926,-1549.44091797,36.95443726,0.00000000,0.00000000,0.00000000); //object(miragebuild07) (2)
	CreateDynamicObject(3049,1549.74340820,-1617.74169922,14.78900909,0.00000000,0.00000000,89.74731445); //object(des_quarrygate) (4)
	CreateDynamicObject(3049,1549.81884766,-1632.24169922,14.62494659,0.00000000,0.00000000,89.74731445); //object(des_quarrygate) (5)
	CreateDynamicObject(3049,1549.76989746,-1636.64318848,14.79750156,0.00000000,0.00000000,89.74731445); //object(des_quarrygate) (6)
	CreateDynamicObject(3049,1549.81835938,-1632.24121094,17.92493057,0.00000000,0.00000000,89.74731445); //object(des_quarrygate) (7)
	CreateDynamicObject(3049,1549.76953125,-1636.64257812,17.97248650,0.00000000,0.00000000,89.74731445); //object(des_quarrygate) (8)
	CreateDynamicObject(3049,1549.74316406,-1617.74121094,18.03902054,0.00000000,0.00000000,89.74731445); //object(des_quarrygate) (9)
	CreateDynamicObject(3049,1540.81176758,-1617.74572754,18.16660118,0.00000000,0.00000000,179.24731445); //object(des_quarrygate) (10)
	CreateDynamicObject(3049,1545.26464844,-1617.80664062,18.16660118,0.00000000,0.00000000,179.24194336); //object(des_quarrygate) (11)
	CreateDynamicObject(3049,1539.67089844,-1613.37365723,18.16550446,0.00000000,0.00000000,90.49194336); //object(des_quarrygate) (12)
	CreateDynamicObject(3049,1539.65563965,-1608.90527344,18.16550446,0.00000000,0.00000000,90.48889160); //object(des_quarrygate) (13)
	CreateDynamicObject(3049,1539.63891602,-1604.49975586,18.16550446,0.00000000,0.00000000,90.48889160); //object(des_quarrygate) (14)
	CreateDynamicObject(3049,1544.14770508,-1602.38220215,18.15341759,0.00000000,0.00000000,0.48889160); //object(des_quarrygate) (15)
	CreateDynamicObject(3049,1539.67675781,-1602.32421875,18.16550446,0.00000000,0.00000000,90.48889160); //object(des_quarrygate) (16)
	CreateDynamicObject(3049,1548.62597656,-1602.34741211,18.15341759,0.00000000,0.00000000,0.48889160); //object(des_quarrygate) (17)
	CreateDynamicObject(3049,1561.81457520,-1602.35693359,18.15341759,0.00000000,0.00000000,359.73889160); //object(des_quarrygate) (18)
	CreateDynamicObject(3049,1553.08105469,-1602.33203125,18.15341759,0.00000000,0.00000000,0.48889160); //object(des_quarrygate) (32)
	CreateDynamicObject(3049,1557.43066406,-1602.35058594,18.15341759,0.00000000,0.00000000,359.73632812); //object(des_quarrygate) (33)
	CreateDynamicObject(3049,1566.21301270,-1602.35644531,18.15341759,0.00000000,0.00000000,359.73632812); //object(des_quarrygate) (34)
	CreateDynamicObject(3049,1554.21398926,-1617.76782227,14.78900909,0.00000000,0.00000000,359.73632812); //object(des_quarrygate) (35)
	CreateDynamicObject(3049,1575.09643555,-1602.35400391,18.15341759,0.00000000,0.00000000,359.73632812); //object(des_quarrygate) (36)
	CreateDynamicObject(3049,1579.44372559,-1602.35717773,18.15341759,0.00000000,0.00000000,359.73632812); //object(des_quarrygate) (37)
	CreateDynamicObject(3049,1583.83728027,-1602.37475586,18.15341759,0.00000000,0.00000000,359.73632812); //object(des_quarrygate) (38)
	CreateDynamicObject(3049,1588.18786621,-1602.40515137,18.15341759,0.00000000,0.00000000,359.73632812); //object(des_quarrygate) (39)
	CreateDynamicObject(3049,1592.55102539,-1602.42504883,18.15341759,0.00000000,0.00000000,359.73632812); //object(des_quarrygate) (40)
	CreateDynamicObject(3049,1596.99853516,-1602.45886230,18.15341759,0.00000000,0.00000000,359.73632812); //object(des_quarrygate) (41)
	CreateDynamicObject(3049,1601.42346191,-1602.45190430,18.15341759,0.00000000,0.00000000,359.73632812); //object(des_quarrygate) (42)
	CreateDynamicObject(3049,1605.77282715,-1602.46813965,18.15341759,0.00000000,0.00000000,359.73632812); //object(des_quarrygate) (43)
	CreateDynamicObject(3049,1608.03930664,-1602.43103027,18.16401482,0.00000000,0.00000000,359.73632812); //object(des_quarrygate) (44)
	CreateDynamicObject(3049,1608.07666016,-1606.91589355,18.16401482,0.00000000,0.00000000,269.73632812); //object(des_quarrygate) (45)
	CreateDynamicObject(3049,1608.07714844,-1611.33020020,18.16401482,0.00000000,0.00000000,269.73083496); //object(des_quarrygate) (46)
	CreateDynamicObject(3049,1608.03796387,-1615.81164551,18.16401482,0.00000000,0.00000000,269.73083496); //object(des_quarrygate) (47)
	CreateDynamicObject(3049,1607.98522949,-1620.23901367,18.16401482,0.00000000,0.00000000,269.73083496); //object(des_quarrygate) (48)
	CreateDynamicObject(3049,1607.96923828,-1624.63061523,18.16401482,0.00000000,0.00000000,269.73083496); //object(des_quarrygate) (49)
	CreateDynamicObject(3049,1607.95324707,-1629.04809570,18.16401482,0.00000000,0.00000000,269.73083496); //object(des_quarrygate) (50)
	CreateDynamicObject(3049,1607.92773438,-1633.35070801,18.16401482,0.00000000,0.00000000,269.73083496); //object(des_quarrygate) (51)
	CreateDynamicObject(3049,1607.92480469,-1637.73266602,18.16401482,0.00000000,0.00000000,269.73083496); //object(des_quarrygate) (52)
	CreateDynamicObject(3049,1603.41979980,-1637.94555664,18.15709686,0.00000000,0.00000000,180.23083496); //object(des_quarrygate) (53)
	CreateDynamicObject(3049,1539.81054688,-1617.72558594,18.16660118,0.00000000,0.00000000,179.24194336); //object(des_quarrygate) (54)
	CreateDynamicObject(2990,1549.80273438,-1627.28320312,16.29679298,0.00000000,0.00000000,270.00000000); //lspdcerrado1
	CreateDynamicObject(2990,1549.80688477,-1637.01391602,16.29679298,0.00000000,0.00000000,270.00000000); //lspdabierto1
	CreateDynamicObject(3055,1588.51342773,-1637.88916016,14.63154793,0.00000000,0.00000000,359.50000000); //lspdcerrado2
	CreateDynamicObject(3055,1588.51269531,-1637.88867188,8.83157539,0.00000000,0.00000000,359.49462891); //lspdabierto2
	CreateDynamicObject(3089,1582.62548828,-1637.89465332,13.71216488,0.00000000,0.00000000,0.00000000); //lspdcerrado3
	CreateDynamicObject(3089,1581.37597656,-1637.89123535,13.71216488,0.00000000,0.00000000,0.00000000); //lspdabierto3
	CreateDynamicObject(1491,1577.31323242,-1637.36926270,12.56616020,0.00000000,0.00000000,90.00000000); //object(gen_doorint01) (1)
	CreateDynamicObject(2737,1579.80261230,-1637.58593750,14.59777451,0.00000000,0.00000000,180.00000000); //object(police_nb_car) (1)
	CreateDynamicObject(2737,1579.80566406,-1637.53588867,14.59933567,0.00000000,0.00000000,180.00000000); //object(police_nb_car) (2)
	CreateDynamicObject(2610,1577.63378906,-1634.07727051,13.38783646,0.00000000,0.00000000,90.00000000); //object(cj_p_fileing2) (2)
	CreateDynamicObject(2610,1577.63793945,-1634.57629395,13.38783646,0.00000000,0.00000000,90.00000000); //object(cj_p_fileing2) (3)
	CreateDynamicObject(2610,1577.65625000,-1635.07226562,13.38783646,0.00000000,0.00000000,90.00000000); //object(cj_p_fileing2) (4)
	CreateDynamicObject(2608,1577.49426270,-1634.47888184,15.62654114,0.00000000,0.00000000,90.00000000); //object(polce_shelf) (1)
	CreateDynamicObject(2606,1578.58190918,-1633.04504395,15.34379959,20.50000000,0.00000000,0.00000000); //object(cj_police_counter2) (1)
	CreateDynamicObject(2606,1580.56164551,-1633.04504395,15.34391117,20.75000000,0.00000000,0.00000000); //object(cj_police_counter2) (2)
	CreateDynamicObject(2606,1581.96032715,-1634.21142578,15.34438038,20.25000000,0.00000000,270.00000000); //object(cj_police_counter2) (3)
	CreateDynamicObject(2606,1581.96032715,-1636.18505859,15.34142780,18.25000000,0.00000000,270.00000000); //object(cj_police_counter2) (4)
	CreateDynamicObject(2596,1581.88146973,-1637.51171875,16.05531693,19.00000000,0.00000000,220.00000000); //object(cj_sex_tv) (1)
	CreateDynamicObject(2190,1581.66711426,-1636.31542969,13.66085529,0.00000000,0.00000000,228.00000000); //object(pc_1) (1)
	CreateDynamicObject(2190,1581.77258301,-1634.52307129,13.66085529,0.00000000,0.00000000,277.99926758); //object(pc_1) (2)
	CreateDynamicObject(2192,1581.37670898,-1632.97485352,13.68869972,0.00000000,0.00000000,30.00000000); //object(fan_1) (1)
	CreateDynamicObject(1840,1582.24047852,-1639.05627441,16.88060760,0.00000000,0.00000000,129.00000000); //object(speaker_2) (1)
	CreateDynamicObject(2002,1577.92041016,-1635.57763672,12.56240082,0.00000000,0.00000000,90.00000000); //object(water_coolnu) (1)
	CreateDynamicObject(1671,1580.25036621,-1635.91064453,13.01977062,0.00000000,0.00000000,80.00000000); //object(swivelchair_a) (1)
	CreateDynamicObject(1671,1580.23291016,-1634.73901367,13.02179050,0.00000000,0.00000000,109.99694824); //object(swivelchair_a) (2)
	CreateDynamicObject(10401,1560.44299316,-1622.13085938,14.83824730,0.00000000,0.00000000,46.00000000); //object(hc_shed02_sfs) (1)
	CreateDynamicObject(996,1550.60095215,-1632.93957520,13.30791378,0.00000000,0.00000000,0.00000000); //object(lhouse_barrier1) (1)
	CreateDynamicObject(996,1558.77233887,-1632.92724609,13.30794334,0.00000000,0.00000000,0.00000000); //object(lhouse_barrier1) (2)
	CreateDynamicObject(996,1567.00378418,-1632.88085938,13.30805683,0.00000000,0.00000000,0.00000000); //object(lhouse_barrier1) (3)
	CreateDynamicObject(996,1550.54370117,-1622.21972656,13.29563046,0.00000000,0.00000000,0.00000000); //object(lhouse_barrier1) (4)
	CreateDynamicObject(996,1572.92797852,-1690.14025879,5.96750546,0.00000000,0.00000000,270.00000000); //object(lhouse_barrier1) (5)
	CreateDynamicObject(996,1566.99145508,-1622.24816895,13.29563046,0.00000000,0.00000000,0.00000000); //object(lhouse_barrier1) (6)
	CreateDynamicObject(1251,1553.35437012,-1622.96398926,12.48749733,0.00000000,0.00000000,270.00000000); //object(smashbar) (1)
	CreateDynamicObject(1251,1560.14721680,-1622.95581055,12.48749733,0.00000000,0.00000000,270.00000000); //object(smashbar) (2)
	CreateDynamicObject(1251,1566.89489746,-1622.95263672,12.48749733,0.00000000,0.00000000,270.00000000); //object(smashbar) (3)
	CreateDynamicObject(1251,1573.64318848,-1622.94702148,12.48749733,0.00000000,0.00000000,270.00000000); //object(smashbar) (4)
	CreateDynamicObject(1251,1553.32873535,-1632.74621582,12.48749733,0.00000000,0.00000000,90.00000000); //object(smashbar) (5)
	CreateDynamicObject(1251,1560.17224121,-1632.72033691,12.48749733,0.00000000,0.00000000,90.00000000); //object(smashbar) (6)
	CreateDynamicObject(1251,1567.01074219,-1632.72094727,12.48749733,0.00000000,0.00000000,90.00000000); //object(smashbar) (7)
	CreateDynamicObject(1251,1573.86450195,-1632.73181152,12.48749733,0.00000000,0.00000000,90.00000000); //object(smashbar) (8)
	CreateDynamicObject(996,1537.39672852,-1664.63330078,13.13156796,0.00000000,0.00000000,270.00000000); //object(lhouse_barrier1) (8)
	CreateDynamicObject(996,1537.42822266,-1673.91894531,13.13156796,0.00000000,0.00000000,270.00000000); //object(lhouse_barrier1) (9)
	CreateDynamicObject(997,1534.19555664,-1664.02368164,12.38281250,0.00000000,0.00000000,0.00000000); //object(lhouse_barrier3) (1)
	CreateDynamicObject(997,1534.28039551,-1681.40893555,12.38281250,0.00000000,0.00000000,0.00000000); //object(lhouse_barrier3) (2)
	CreateDynamicObject(1569,1566.57373047,-1667.35144043,27.42146301,0.00000000,0.00000000,180.00000000); //object(adam_v_door) (12)
	CreateDynamicObject(1569,1563.60913086,-1667.37646484,27.40872955,0.00000000,0.00000000,359.99450684); //object(adam_v_door) (13)
	CreateDynamicObject(1569,1563.60839844,-1667.37597656,27.40872955,0.00000000,0.00000000,359.99450684); //object(adam_v_door) (14)
	CreateDynamicObject(1569,1570.12182617,-1689.62011719,5.22398472,0.00000000,0.00000000,179.99450684); //object(adam_v_door) (15)
	CreateDynamicObject(1569,1567.14587402,-1689.62011719,5.22377872,0.00000000,0.00000000,359.99450684); //object(adam_v_door) (16)
	CreateDynamicObject(996,1558.78222656,-1622.22851562,13.29563046,0.00000000,0.00000000,0.00000000); //object(lhouse_barrier1) (11)
	CreateDynamicObject(996,1574.19189453,-1698.25903320,5.96750546,0.00000000,0.00000000,0.00000000); //object(lhouse_barrier1) (12)
	CreateDynamicObject(3934,1564.16027832,-1643.89941406,27.40211487,0.00000000,0.00000000,0.00000000); //object(helipad01) (1)
	CreateDynamicObject(3934,1564.11206055,-1655.58776855,27.39560699,0.00000000,0.00000000,0.00000000); //object(helipad01) (2)
	CreateDynamicObject(3049,1570.61425781,-1602.35839844,18.15341759,0.00000000,0.00000000,359.73632812); //object(des_quarrygate) (55)
	CreateDynamicObject(3049,1558.67944336,-1617.81323242,14.78900909,0.00000000,0.00000000,359.73632812); //object(des_quarrygate) (56)
	CreateDynamicObject(3049,1563.16601562,-1617.82275391,14.78900909,0.00000000,0.00000000,359.73632812); //object(des_quarrygate) (57)
	CreateDynamicObject(3049,1567.67553711,-1617.87365723,14.78900909,0.00000000,0.00000000,359.73632812); //object(des_quarrygate) (58)
	CreateDynamicObject(3049,1572.15075684,-1617.96203613,14.78900909,0.00000000,0.00000000,359.73632812); //object(des_quarrygate) (59)
	CreateDynamicObject(3049,1576.62841797,-1617.99755859,14.78900909,0.00000000,0.00000000,359.73632812); //object(des_quarrygate) (60)
	CreateDynamicObject(3049,1580.41040039,-1615.88159180,14.62494659,0.00000000,0.00000000,29.73632812); //object(des_quarrygate) (61)
	CreateDynamicObject(3049,1589.03369141,-1606.73083496,14.62494659,0.00000000,0.00000000,59.73449707); //object(des_quarrygate) (62)
	CreateDynamicObject(2909,1583.42614746,-1613.08398438,13.68922234,0.00000000,0.00000000,310.00000000); //lspdcerrado4
	CreateDynamicObject(3049,1591.31616211,-1602.88244629,14.62494659,0.00000000,0.00000000,59.73022461); //object(des_quarrygate) (63)
	CreateDynamicObject(2909,1583.42578125,-1613.08398438,11.13922691,0.00000000,0.00000000,309.99572754); //lspdabierto4
	CreateDynamicObject(1568,1578.91052246,-1620.40771484,12.54687500,0.00000000,0.00000000,0.00000000); //object(chinalamp_sf) (60)
	CreateDynamicObject(1568,1591.42199707,-1608.13806152,12.38281250,0.00000000,0.00000000,0.00000000); //object(chinalamp_sf) (61)
	for(new h = VV_DESDE; h < sizeof(CInformacion); h++)
	{
		CreateVehicle(CInformacion[h][cModel],CInformacion[h][cLocationx],CInformacion[h][cLocationy],CInformacion[h][cLocationz]+1.0,CInformacion[h][cAngle],CInformacion[h][cColorOne],CInformacion[h][cColorTwo],60000);//60000
		AddVehicleComponent(h,CInformacion[h][cNitro]);
		AddVehicleComponent(h,CInformacion[h][cLlantas]);
		AddVehicleComponent(h,CInformacion[h][cAleron]);
		AddVehicleComponent(h,CInformacion[h][cParachoDelan]);
		AddVehicleComponent(h,CInformacion[h][cParachoTrase]);
		AddVehicleComponent(h,CInformacion[h][cHidraulica]);
		AddVehicleComponent(h,CInformacion[h][cTecho]);
		AddVehicleComponent(h,CInformacion[h][cEscape]);
		AddVehicleComponent(h,CInformacion[h][cParachoDesco]);
		AddVehicleComponent(h,CInformacion[h][cEmbellecedor]);
		AddVehicleComponent(h,CInformacion[h][cEmbellecedor2]);
		ChangeVehiclePaintjob(h, CInformacion[h][cPaintJob]);
		GetVehicleParamsEx(h,engine,lights,alarm,doors,bonnet,boot,objective);
		SetVehicleParamsEx(h,engine,0,0,CInformacion[h][cLock],0,0,0);
		SetVehicleParamsEx(h,engine,0,0,CInformacion[h][cLock],0,0,0);
	}
	for(new h = 0; h < sizeof(CInformacion); h++)
	{
        new DB:archivo = db_open("Res/Matriculas.db");
	 	new DBResult:qresult;
	 	new query[256];
	 	new mstring[128];
	 	format(query, sizeof(query), "SELECT matricula FROM matriculas WHERE id='%d'", h);
		qresult = db_query(archivo, query);
		db_get_field(qresult, 0, mstring, sizeof(mstring));
		db_free_result(qresult);
		if(strlen(mstring))
		{
	        CarMatricula[h] = strval(mstring);
	        db_close(archivo);
		}
		else
		{
			CarMatricula[h] = matriculainit;
			matriculainit++;
			if(VehiculosVenta(h))
		    {
                format(query, sizeof(query), "INSERT INTO matriculas (id, matricula, modelo) VALUES (%d, %d, '%s')", h, CarMatricula[h], VehicleName[GetVehicleModel(h)-400]);
				qresult = db_query(archivo, query);
				db_free_result(qresult);
		    }
		}
		SetVehicleToRespawn(h);
		db_close(archivo);
	}
	for(new z=0;z<MAX_VEHICLES;z++)
	{
        VehiculoEmbargado[z] = 0;
        CarPuenteado[z] = 0;
	}
	return 1;
}

/* -= Extensiones =- */
public LimpiarChat(playerid, lineas) { if(IsPlayerConnected(playerid)) { for(new i=0; i<lineas; i++) { SendClientMessage(playerid, BLANCO, " "); } } return 1; }
public DetenerMusica() { for(new i = 0; i < MAX_PLAYERS; i++) { if(IsPlayerConnected(i)) { PlayerPlaySound(i, 1069, 0.0, 0.0, 0.0);	} } }
public PlayerToPoint(Float:radi, playerid, Float:x, Float:y, Float:z) { if(IsPlayerConnected(playerid)) { new Float:oldposx, Float:oldposy, Float:oldposz; new Float:tempposx, Float:tempposy, Float:tempposz; GetPlayerPos(playerid, oldposx, oldposy, oldposz); tempposx = (oldposx -x); tempposy = (oldposy -y); tempposz = (oldposz -z); if (((tempposx < radi) && (tempposx > -radi)) && ((tempposy < radi) && (tempposy > -radi)) && ((tempposz < radi) && (tempposz > -radi))) {	return 1; } } return 0; }
public ProcesandoRol(playerid)
{
	new string[256];
	new PTRol = Informacion[playerid][TestRol];
	LimpiarChat(playerid, 20);
	if(Informacion[playerid][TestRol] < 4)
	{
		PlayerPlaySound(playerid, 1085, 0.0, 0.0, 0.0);
		format(string, sizeof(string), "* Lo siento, usted no alcanza el minimo de puntos de rol necesarios [%d/10]", PTRol);
		SendClientMessage(playerid, ROJO, string);
		Informacion[playerid][TestRol] = 999;
		Kick(playerid);
	}
	else if(Informacion[playerid][TestRol] == 5)
	{
	    SendClientMessage(playerid, GRIS, "Lo siento, te daremos otra oportunidad para poder jugar");
	    ShowPlayerDialog(playerid, TRol, DIALOG_STYLE_LIST, "{FEB800}[1/10]: {FFFFFF}�Qu� es DeathMatch?","1| Matar o Herir a un usuario sin alguna raz�n\n2| Insultar a alguien por canales OOC\n3| Saltar varias veces seguidas para viajar mas r�pido","Seleccionar","");
		Informacion[playerid][TestRol] = 0;
	}
	else if(Informacion[playerid][TestRol] > 6)
	{
        new Rstring[64];
		PlayerPlaySound(playerid, 1057, 0.0, 0.0, 0.0);
        if(Informacion[playerid][TestRol] == 10) { Rstring = "Roleador Destacado"; }
        else if(Informacion[playerid][TestRol] == 9) { Rstring = "Roleador Semi-Destacado"; }
		else if(Informacion[playerid][TestRol] == 8) { Rstring = "Roleador con experiencia "; }
		else if(Informacion[playerid][TestRol] == 7) { Rstring = "Roleador satisfactorio"; }
		else if(Informacion[playerid][TestRol] == 6) { Rstring = "Roleador aceptale"; }
		else if(Informacion[playerid][TestRol] == 5) { Rstring = "Roleador apenas aceptable"; }
		else { Rstring = "Roler"; }
		format(string, sizeof(string), "{FEB800}* Felicidades, su calificaci�n de rol ha superado los requisitos m�nimos [%d/10]", PTRol);
		SendClientMessage(playerid, VERDE, string);
		format(string, sizeof(string), "{FEB800}* Clasificaci�n: {FFFFFF}%s", Rstring);
		SendClientMessage(playerid, VERDE, string);
		ShowPlayerDialog(playerid, SEXO, DIALOG_STYLE_MSGBOX, " ","{FEB800}Bienvenido(a) al registro IC de Las Vegas City RolePlay\n{FFFFFF}A continuaci�n te haremos una serie de preguntas\nrecuerda que los datos que indiques aqu� ir�n �nicamente  hacia tu jugador virtual.\nEmpezemos pregunt�ndote tu sexualidad.\n�Cu�l es tu sexo?","Hombre","Mujer");
		TogglePlayerControllable(playerid, CONGELADO);
		SetPlayerPos(playerid, 2479.0295,-1428.6256,28.8438);
		SetPlayerCameraPos(playerid, 2494.3103,-1402.4548,50.2451);
		SetPlayerCameraLookAt(playerid, 2420.3765,-1487.6748,50.2451);
		return 1;
	}
	return 1;
}

public TimerVectorial()
{
	GuardarEstadisticas();
	GuardarValores();
    ActualizarVehiculos();
    GuardarSatelites();
	GuardarTiendas();
	for(new i = 0; i < MAX_PLAYERS; i++)
	{
	    if(AntiBug[i] == 1)
	    {
    	 	SendClientMessage(i, ROJO, "Opcode 0x00000643 auto-updated for 30 seconds -> Res/Estadisticas.ini <-");
    	 	SendClientMessage(i, ROJO, "Opcode 0x00000644 auto-updated for 30 seconds -> Res/Valores.ini <-");
    	 	SendClientMessage(i, ROJO, "Opcode 0x00000645 auto-updated for 30 seconds -> Res/Coches.cfg <-");
     	 	SendClientMessage(i, ROJO, "Opcode 0x00000646 auto-updated for 30 seconds -> Res/Matriculas.db <-");
     	 	SendClientMessage(i, ROJO, "Opcode 0x00000647 auto-updated for 30 seconds -> Res/Satelites.ini <-");
     	 	SendClientMessage(i, ROJO, "Opcode 0x00000648 auto-updated for 30 seconds -> Res/Productos.ini <-");
    	 }
    }
}

public TimerGeneral()
{
	for(new i = 0; i < MAX_PLAYERS; i++)
	{
	    new string[256];
		if(ProgresoReparacion[i] > 0)
		{
			ProgresoReparacion[i] += 1;
			ShowProgressBarForPlayer(i, RepairConexion[i]);
		    if(ProgresoReparacion[i] == 1) { SetProgressBarValue(RepairConexion[i], 1);	}
		    if(ProgresoReparacion[i] == 2) { SetProgressBarValue(RepairConexion[i], 2);	}
		    if(ProgresoReparacion[i] == 3) { SetProgressBarValue(RepairConexion[i], 3); }
		    if(ProgresoReparacion[i] == 4) { SetProgressBarValue(RepairConexion[i], 4); }
		    if(ProgresoReparacion[i] == 5) { SetProgressBarValue(RepairConexion[i], 5); }
		    if(ProgresoReparacion[i] == 6) { SetProgressBarValue(RepairConexion[i], 6); }
		    if(ProgresoReparacion[i] == 7) { SetProgressBarValue(RepairConexion[i], 7); }
		    if(ProgresoReparacion[i] == 8) { SetProgressBarValue(RepairConexion[i], 8); }
		    if(ProgresoReparacion[i] == 9) { SetProgressBarValue(RepairConexion[i], 9); }
		    if(ProgresoReparacion[i] == 10) { SetProgressBarValue(RepairConexion[i], 10); }
		    if(ProgresoReparacion[i] == 11) { SetProgressBarValue(RepairConexion[i], 11); }
		    if(ProgresoReparacion[i] == 12) { SetProgressBarValue(RepairConexion[i], 12); }
		    if(ProgresoReparacion[i] == 13) { SetProgressBarValue(RepairConexion[i], 13); }
		    if(ProgresoReparacion[i] == 14) { SetProgressBarValue(RepairConexion[i], 14); }
		    if(ProgresoReparacion[i] == 15) { SetProgressBarValue(RepairConexion[i], 15); }
		    if(ProgresoReparacion[i] == 16) { SetProgressBarValue(RepairConexion[i], 16); }
		    if(ProgresoReparacion[i] == 17) { SetProgressBarValue(RepairConexion[i], 17); }
		    if(ProgresoReparacion[i] == 18) { SetProgressBarValue(RepairConexion[i], 18); }
		    if(ProgresoReparacion[i] == 19) { SetProgressBarValue(RepairConexion[i], 19); }
		    if(ProgresoReparacion[i] == 20) { SetProgressBarValue(RepairConexion[i], 20); }
		    if(ProgresoReparacion[i] == 21) { SetProgressBarValue(RepairConexion[i], 21); }
		    if(ProgresoReparacion[i] == 22) { SetProgressBarValue(RepairConexion[i], 22); }
		    if(ProgresoReparacion[i] == 23) { SetProgressBarValue(RepairConexion[i], 23); }
		    if(ProgresoReparacion[i] == 24) { SetProgressBarValue(RepairConexion[i], 24); }
		    if(ProgresoReparacion[i] == 25) { SetProgressBarValue(RepairConexion[i], 25); }
		    if(ProgresoReparacion[i] == 26) { SetProgressBarValue(RepairConexion[i], 26); }
		    if(ProgresoReparacion[i] == 27) { SetProgressBarValue(RepairConexion[i], 27); }
		    if(ProgresoReparacion[i] == 28) { SetProgressBarValue(RepairConexion[i], 28); }
		    if(ProgresoReparacion[i] == 29) { SetProgressBarValue(RepairConexion[i], 29); }
		    if(ProgresoReparacion[i] == 30) { SetProgressBarValue(RepairConexion[i], 30); }
		    if(ProgresoReparacion[i] == 31) { SetProgressBarValue(RepairConexion[i], 31); }
		    if(ProgresoReparacion[i] == 32) { SetProgressBarValue(RepairConexion[i], 32); }
		    if(ProgresoReparacion[i] == 33) { SetProgressBarValue(RepairConexion[i], 33); }
		    if(ProgresoReparacion[i] == 34) { SetProgressBarValue(RepairConexion[i], 34); }
		    if(ProgresoReparacion[i] == 35) { SetProgressBarValue(RepairConexion[i], 35); }
		    if(ProgresoReparacion[i] == 36) { SetProgressBarValue(RepairConexion[i], 36); }
		    if(ProgresoReparacion[i] == 37) { SetProgressBarValue(RepairConexion[i], 37); }
		    if(ProgresoReparacion[i] == 38) { SetProgressBarValue(RepairConexion[i], 38); }
		    if(ProgresoReparacion[i] == 39) { SetProgressBarValue(RepairConexion[i], 39); }
		    if(ProgresoReparacion[i] == 40) { SetProgressBarValue(RepairConexion[i], 40); }
		    if(ProgresoReparacion[i] == 41) { SetProgressBarValue(RepairConexion[i], 41); }
		    if(ProgresoReparacion[i] == 42) { SetProgressBarValue(RepairConexion[i], 42); }
		    if(ProgresoReparacion[i] == 43) { SetProgressBarValue(RepairConexion[i], 43); }
		    if(ProgresoReparacion[i] == 44) { SetProgressBarValue(RepairConexion[i], 44); }
		    if(ProgresoReparacion[i] == 45) { SetProgressBarValue(RepairConexion[i], 45); }
		    if(ProgresoReparacion[i] == 46) { SetProgressBarValue(RepairConexion[i], 46); }
		    if(ProgresoReparacion[i] == 47) { SetProgressBarValue(RepairConexion[i], 47); }
		    if(ProgresoReparacion[i] == 48) { SetProgressBarValue(RepairConexion[i], 48); }
		    if(ProgresoReparacion[i] == 49) { SetProgressBarValue(RepairConexion[i], 49); }
		    if(ProgresoReparacion[i] == 50) { SetProgressBarValue(RepairConexion[i], 50); }
		    if(ProgresoReparacion[i] == 51) { SetProgressBarValue(RepairConexion[i], 51); }
		    if(ProgresoReparacion[i] == 52) { SetProgressBarValue(RepairConexion[i], 52); }
		    if(ProgresoReparacion[i] == 53) { SetProgressBarValue(RepairConexion[i], 53); }
		    if(ProgresoReparacion[i] == 54) { SetProgressBarValue(RepairConexion[i], 54); }
		    if(ProgresoReparacion[i] == 55) { SetProgressBarValue(RepairConexion[i], 55); }
		    if(ProgresoReparacion[i] == 56) { SetProgressBarValue(RepairConexion[i], 56); }
		    if(ProgresoReparacion[i] == 57) { SetProgressBarValue(RepairConexion[i], 57); }
		    if(ProgresoReparacion[i] == 58) { SetProgressBarValue(RepairConexion[i], 58); }
		    if(ProgresoReparacion[i] == 59) { SetProgressBarValue(RepairConexion[i], 59); }
		    if(ProgresoReparacion[i] == 61) { SetProgressBarValue(RepairConexion[i], 60); }
		    if(ProgresoReparacion[i] == 62) { SetProgressBarValue(RepairConexion[i], 61); }
		    if(ProgresoReparacion[i] == 63) { SetProgressBarValue(RepairConexion[i], 62); }
		    if(ProgresoReparacion[i] == 64) { SetProgressBarValue(RepairConexion[i], 63); }
		    if(ProgresoReparacion[i] == 65) { SetProgressBarValue(RepairConexion[i], 64); }
		    if(ProgresoReparacion[i] == 66) { SetProgressBarValue(RepairConexion[i], 65); }
		    if(ProgresoReparacion[i] == 67) { SetProgressBarValue(RepairConexion[i], 66); }
		    if(ProgresoReparacion[i] == 68) { SetProgressBarValue(RepairConexion[i], 67); }
		    if(ProgresoReparacion[i] == 69) { SetProgressBarValue(RepairConexion[i], 68); }
		    if(ProgresoReparacion[i] == 70) { SetProgressBarValue(RepairConexion[i], 69); }
		    if(ProgresoReparacion[i] == 71) { SetProgressBarValue(RepairConexion[i], 70); }
		    if(ProgresoReparacion[i] == 72) { SetProgressBarValue(RepairConexion[i], 71); }
		    if(ProgresoReparacion[i] == 73) { SetProgressBarValue(RepairConexion[i], 72); }
		    if(ProgresoReparacion[i] == 74) { SetProgressBarValue(RepairConexion[i], 73); }
		    if(ProgresoReparacion[i] == 75) { SetProgressBarValue(RepairConexion[i], 74); }
		    if(ProgresoReparacion[i] == 76) { SetProgressBarValue(RepairConexion[i], 75); }
		    if(ProgresoReparacion[i] == 77) { SetProgressBarValue(RepairConexion[i], 76); }
		    if(ProgresoReparacion[i] == 78) { SetProgressBarValue(RepairConexion[i], 77); }
		    if(ProgresoReparacion[i] == 79) { SetProgressBarValue(RepairConexion[i], 78); }
		    if(ProgresoReparacion[i] == 80) { SetProgressBarValue(RepairConexion[i], 80); }
		    if(ProgresoReparacion[i] == 81) { SetProgressBarValue(RepairConexion[i], 81); }
		    if(ProgresoReparacion[i] == 82) { SetProgressBarValue(RepairConexion[i], 82); }
		    if(ProgresoReparacion[i] == 83) { SetProgressBarValue(RepairConexion[i], 83); }
		    if(ProgresoReparacion[i] == 84) { SetProgressBarValue(RepairConexion[i], 84); }
		    if(ProgresoReparacion[i] == 85) { SetProgressBarValue(RepairConexion[i], 85); }
		    if(ProgresoReparacion[i] == 86) { SetProgressBarValue(RepairConexion[i], 86); }
		    if(ProgresoReparacion[i] == 87) { SetProgressBarValue(RepairConexion[i], 87); }
		    if(ProgresoReparacion[i] == 88) { SetProgressBarValue(RepairConexion[i], 88); }
		    if(ProgresoReparacion[i] == 89) { SetProgressBarValue(RepairConexion[i], 89); }
		    if(ProgresoReparacion[i] == 90) { SetProgressBarValue(RepairConexion[i], 90); }
		    if(ProgresoReparacion[i] == 91) { SetProgressBarValue(RepairConexion[i], 91); }
		    if(ProgresoReparacion[i] == 92) { SetProgressBarValue(RepairConexion[i], 92); }
		    if(ProgresoReparacion[i] == 93) { SetProgressBarValue(RepairConexion[i], 93); }
		    if(ProgresoReparacion[i] == 94) { SetProgressBarValue(RepairConexion[i], 94); }
		    if(ProgresoReparacion[i] == 95) { SetProgressBarValue(RepairConexion[i], 95); }
		    if(ProgresoReparacion[i] == 96) { SetProgressBarValue(RepairConexion[i], 96); }
		    if(ProgresoReparacion[i] == 97) { SetProgressBarValue(RepairConexion[i], 97); }
		    if(ProgresoReparacion[i] == 98) { SetProgressBarValue(RepairConexion[i], 98); }
		    if(ProgresoReparacion[i] == 99) { SetProgressBarValue(RepairConexion[i], 99); }
		    if(ProgresoReparacion[i] == 100)
			{
			    SendClientMessage(i, VERDE, "�Bien echo!, has reparado la antena, SATV puede volver a emitir radio");
			    ProgresoReparacion[i] = 0;
				TogglePlayerControllable(i, DESCONGELADO);
				HideProgressBarForPlayer(i, RepairConexion[i]);
				TextDrawHideForPlayer(i, Text:Repair_Box);
				TextDrawHideForPlayer(i, Text:Repair_Text);
				if(AntenaG1 == 1) { AntenaG1 = 0; }
				if(AntenaG2 == 1) { AntenaG2 = 0; }
				if(AntenaG3 == 1) { AntenaG3 = 0; }
				if(AntenaG4 == 1) { AntenaG4 = 0; }
				if(AntenaG5 == 1) { AntenaG5 = 0; }
			}
		}
		if(TiempoViaje[i] > 0)
		{
		    if(TiempoViaje[i] > 10)
			{
				TiempoViaje[i] = 1;
				if(ConductorTAXI[i] < 999)
				{
					if(IsPlayerConnected(ConductorTAXI[i]))
					{
      					CostoTAXI[i] += ValorTransporte[ConductorTAXI[i]];
					    CostoTAXI[ConductorTAXI[i]] = CostoTAXI[i];
					}
				}
			}
		    TiempoViaje[i] += 1;
			new Veh = GetPlayerVehicleID(i);
		    format(string, sizeof(string), "~g~Chofer: ~w~%s~n~~g~Linea: ~w~%d~n~~g~Tarifa: ~w~$%d~n~~g~Tiempo: ~w~%d/10~n~~g~Gasto: ~w~$%d", NombreEx(ConductorTAXI[i]), CarMatricula[Veh], ValorTransporte[i], TiempoViaje[i], CostoTAXI[i]);
			TextDrawSetString(Text:Taxi_Leter[i], string);
			TextDrawShowForPlayer(i, Text:Taxi_Box);
			TextDrawShowForPlayer(i, Text:Taxi_Titulo);
			TextDrawShowForPlayer(i, Text:Taxi_Leter[i]);
		}
		if(IsPlayerConnected(i))
	  	{
			if(GetPlayerSpecialAction(i) == SPECIAL_ACTION_USEJETPACK)
			{
			    LimpiarChat(i, 20);
				format(string, sizeof(string), "[ANTICHEAT]> Usuario %s ha sido automaticamente baneado por utilizar un Jetpack", NombreEx(i),i);
				MensajeADMIN(ROJO, string);
				SendClientMessage(i, ROJO, "Has sido auto-baneado por nuestro anticheat, razon: Opcode 0x00001442 (Utilizar Jetpack)");
				Informacion[i][Bloqueo] = 1;
				Ban(i);
			}
		}
		if(TimerTutorial[i] >= 1)
		{
		    TimerTutorial[i] += 1;
			LimpiarChat(i, 20);
			TogglePlayerControllable(i, CONGELADO);
			PlayerPlaySound(i, 1097, 0.0, 0.0, 0.0);
			SetPlayerCameraPos(i, 745.1561,-679.9824,163.6466);
			SetPlayerCameraLookAt(i, 752.5494,-896.0423,62.9555);
			SetPlayerPos(i, 701.0815,-833.3028,65.4416);
		    if(TimerTutorial[i] == 2)
		    {
				TextDrawSetString(TituloT,"~r~~n~~n~~n~Tutorial");
				TextDrawSetString(Linea1T,"~w~~n~~n~~n~~n~Ahora te mostraremos un pequeno tutorial donde te informaremos las noticias");
				TextDrawSetString(Linea2T,"~w~~n~~n~~n~~n~actualizaciones sobre nuestro servidor, recuerda que si te quedas con");
				TextDrawSetString(Linea3T,"~w~~n~~n~~n~~n~dudas puedes concurrir a un miembro del staff Comandondo el comando ~g~/duda");
				MostrarTut(i);
			}
		    else if(TimerTutorial[i] == 15)
		    {
				TextDrawSetString(TituloT,"~r~~n~~n~Departamento de Administracion");
				TextDrawSetString(Linea1T,"~w~~n~~n~~n~Nosotros vamos a estar las 24 horas al tanto de nuestros usuarios");
				TextDrawSetString(Linea2T,"~w~~n~~n~~n~y asistencia tecnica cuando lo necesiten, cumpliendo con nuestro deber");
				TextDrawSetString(Linea3T,"~w~~n~~n~~n~que es ofreserles nuestra maxima atencion para que usted disfrute el servidor");
				MostrarTut(i);
	   	    }
		    else if(TimerTutorial[i] == 25)
		    {
				TextDrawSetString(TituloT,"~r~~n~~n~~n~Departamento de Programacion");
				TextDrawSetString(Linea1T,"~w~~n~~n~~n~~n~Vamos a estar al tanto de todas las fallas que se encuentren en el servidor");
				TextDrawSetString(Linea2T,"~w~~n~~n~~n~~n~para que usted, y todos nuestros usuarios tengan un estancia mas comoda");
				TextDrawSetString(Linea3T,"~w~~n~~n~~n~~n~recuerda que si encuentras fallas Comando el comando ~g~/bug");
				MostrarTut(i);
	   	    }
		    else if(TimerTutorial[i] == 35)
		    {
				TextDrawSetString(TituloT,"~r~~n~~n~~n~Cuentas Premium");
				TextDrawSetString(Linea1T,"~w~~n~~n~~n~~n~Si quieres obtener beneficios de todos los tamanos y tipos");
				TextDrawSetString(Linea2T,"~w~~n~~n~~n~~n~recurre a contratar nuestro servicio premium para usuarios");
				MostrarTut(i);
	   	    }
		    else if(TimerTutorial[i] == 45)
		    {
				TextDrawSetString(TituloT,"~r~~n~~n~~n~Actualizaciones");
				TextDrawSetString(Linea1T,"~w~~n~~n~~n~~n~Estaremos en constante actualizacion para su bienestar en el servidor");
				TextDrawSetString(Linea2T,"~w~~n~~n~~n~~n~en cada actualizacion se a�adiran nuevas cosas, tanto originales como buenas");
				TextDrawSetString(Linea3T,"~w~~n~~n~~n~~n~Recuerda que puedes dar ideas, y hacer crecer el servidor");
				MostrarTut(i);
	   	    }
		    else if(TimerTutorial[i] == 55)
		    {
				TextDrawSetString(TituloT,"~r~~n~~n~~n~Hacks/Cheats");
				TextDrawSetString(Linea1T,"~w~~n~~n~~n~~n~Esperemos que estes al tanto de que los hacks o cheats estan prohibidos");
				TextDrawSetString(Linea2T,"~w~~n~~n~~n~~n~y se hara muy dificil la apelacion al baneo dado por un miembro del staff");
				TextDrawSetString(Linea3T,"~w~~n~~n~~n~~n~avisamos que nuestro servidor contiene anticheat");
				MostrarTut(i);
	   	    }
		    else if(TimerTutorial[i] == 65)
		    {
				TextDrawSetString(TituloT,"~r~~n~~n~~n~TeamSpeak 3");
				TextDrawSetString(Linea1T,"~w~~n~~n~~n~~n~Tambien contamos con un servidor TeamSpeak, para poder utilizar el microfono");
				TextDrawSetString(Linea2T,"~w~~n~~n~~n~~n~como herramienta de comunicaciones para los usaurios");
				TextDrawSetString(Linea3T,"~w~~n~~n~~n~~n~Recuerda que no debes realizar comentarios que signifiquen ~r~MG");
				MostrarTut(i);
	   	    }
		    else if(TimerTutorial[i] == 75)
		    {
				TextDrawSetString(TituloT,"~r~~n~~n~~n~Otros Servidores");
				TextDrawSetString(Linea1T,"~w~~n~~n~~n~~n~A medida que vallamos extendiendonos, iremos dominando nuevos territorios");
				TextDrawSetString(Linea2T,"~w~~n~~n~~n~~n~Tanto en Counter-Strike, Halo, Word of Warcraft como en SAMP");
				TextDrawSetString(Linea3T,"~w~~n~~n~~n~~n~Si tienes mas dudas sobre esto visita nuestra web");
				MostrarTut(i);
	   	    }
		    else if(TimerTutorial[i] == 85)
		    {
				TextDrawSetString(TituloT,"~r~~n~~n~~n~Fin del Tutorial");
				TextDrawSetString(Linea1T,"~w~~n~~n~~n~~n~Muchas gracias por leer nuestro tutorial sobre el la comunidad");
				TextDrawSetString(Linea2T,"~w~~n~~n~~n~~n~Esperemos que disfrute su estancia en el servidor con relax y comodidad");
				TextDrawSetString(Linea3T,"~w~~n~~n~~n~~n~Atentamente: ~g~Departamento de Administracion");
				MostrarTut(i);
		    }
		    else if(TimerTutorial[i] == 95)
		    {
				DetenerMusica();
				TimerTutorial[i] = 0;
				TextDrawHideForPlayer(i,TituloT);
				TextDrawHideForPlayer(i,Linea1T);
				TextDrawHideForPlayer(i,Linea2T);
				TextDrawHideForPlayer(i,Linea3T);
				TogglePlayerControllable(i, DESCONGELADO);
			    SetPlayerPos(i, 822.9386,-1363.1880,-0.5078);
			    SetPlayerHoldingObject(i, 1210, 6, 0.289999, 0.079999, -0.000000, 0.000000, -100.000000, 1.000000);
			    SetPlayerCameraPos(i, 829.4680,-1359.3710,1.9473);
			    SetPlayerCameraLookAt(i, 823.3722,-1361.8103,-0.3735);
			    SetPlayerFacingAngle(i, 316);
			    ApplyAnimation(i,"PED","WALK_player",4.1,1,1,1,1,1);
		       	PlayerPlaySound(i, 1149, 0, 0, 0);
		       	SetPlayerInterior(i, 0);
				SetTimerEx("ProcesoFinal", 5000, false, "id", i);
			}
		}
	}
}

public ProcesoFinal(playerid)
{
	TogglePlayerControllable(playerid, DESCONGELADO);
    SetPlayerPos(playerid, 836.7759,-1341.3685,7.1719);
    SetPlayerCameraPos(playerid, 818.5844,-1341.4609,13.5250);
    SetPlayerCameraLookAt(playerid, 824.0968,-1341.8304,13.5156);
    SetPlayerFacingAngle(playerid, 92);
    ApplyAnimation(playerid,"PED","WALK_player",4.1,1,1,1,1,1);
    SetTimerEx("FinalDelTutorial", 9000, false, "i", playerid);
    return 1;
}

public FinalDelTutorial(playerid)
{
	TextDrawHideForPlayer(playerid, Barra1);
	TextDrawHideForPlayer(playerid, Barra2);
    LimpiarChat(playerid, 10);
	Informacion[playerid][Registrado] = 1;
	Informacion[playerid][Nivel] = 1;
	TextDrawHideForPlayer(playerid, Barra1);
	TextDrawHideForPlayer(playerid, Barra2);
	SendClientMessage(playerid, NARANJA,"** �Bienvenido a Los Santos! **");
	SendClientMessage(playerid, VERDE,"�Obtienes $1500 extra!");
	GivePlayerMoney(playerid, 1500);
	SetPlayerVirtualWorld(playerid, 0);
	SetPlayerInterior(playerid, 0);
	Informacion[playerid][Interior] = 0;
	SetCameraBehindPlayer(playerid);
	ClearAnimations(playerid);
	TogglePlayerControllable(playerid, DESCONGELADO);
	return 1;
}

public MensajeSAPD(color, string[])
{
	for(new i = 0; i < MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i))
		{
		    if(Informacion[i][Faccion] == SAPD)
		    {
				SendClientMessage(i, color, string);
			}
		}
	}
}

public MensajeMECA(color, string[])
{
	for(new i = 0; i < MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i))
		{
		    if(Informacion[i][Faccion] == MECA)
		    {
				SendClientMessage(i, color, string);
			}
		}
	}
}

public MensajeSATV(color, string[])
{
	for(new i = 0; i < MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i))
		{
		    if(Informacion[i][Faccion] == SATV)
		    {
				SendClientMessage(i, color, string);
			}
		}
	}
}

public MensajeLICE(color, string[])
{
	for(new i = 0; i < MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i))
		{
		    if(Informacion[i][Faccion] == SATV)
		    {
				SendClientMessage(i, color, string);
			}
		}
	}
}

public MensajeGOB(color, string[])
{
	for(new i = 0; i < MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i))
		{
		    if(Informacion[i][Faccion] == PRES)
		    {
				SendClientMessage(i, color, string);
			}
		}
	}
}

public MensajeSAMD(color, string[])
{
	for(new i = 0; i < MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i))
		{
		    if(Informacion[i][Faccion] == SAMD)
		    {
				SendClientMessage(i, color, string);
			}
		}
	}
}

public MensajeTAXI(color, string[])
{
	for(new i = 0; i < MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i))
		{
		    if(Informacion[i][Faccion] == TAXI)
		    {
				SendClientMessage(i, color, string);
			}
		}
	}
}

public MensajeADMIN(color, string[])
{
	for(new i = 0; i < MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i))
		{
		    if(Informacion[i][Admin] > 0)
		    {
				SendClientMessage(i, color, string);
			}
		}
	}
}

public RangoCercano(Float:radi, playerid, string[],col1,col2,col3,col4,col5)
{
	if(IsPlayerConnected(playerid))
	{
		new Float:posx, Float:posy, Float:posz;
		new Float:oldposx, Float:oldposy, Float:oldposz;
		new Float:tempposx, Float:tempposy, Float:tempposz;
		GetPlayerPos(playerid, oldposx, oldposy, oldposz);
		//radi = 2.0; //Trigger Radius
		for(new i = 0; i < MAX_PLAYERS; i++)
		{
			if(IsPlayerConnected(i))
			{
				if(!Amplificador[i])
				{
					GetPlayerPos(i, posx, posy, posz);
					tempposx = (oldposx -posx);
					tempposy = (oldposy -posy);
					tempposz = (oldposz -posz);
					//printf("DEBUG: X:%f Y:%f Z:%f",posx,posy,posz);
					if (((tempposx < radi/16) && (tempposx > -radi/16)) && ((tempposy < radi/16) && (tempposy > -radi/16)) && ((tempposz < radi/16) && (tempposz > -radi/16)))
					{
						SendClientMessage(i, col1, string);
					}
					else if (((tempposx < radi/8) && (tempposx > -radi/8)) && ((tempposy < radi/8) && (tempposy > -radi/8)) && ((tempposz < radi/8) && (tempposz > -radi/8)))
					{
						SendClientMessage(i, col2, string);
					}
					else if (((tempposx < radi/4) && (tempposx > -radi/4)) && ((tempposy < radi/4) && (tempposy > -radi/4)) && ((tempposz < radi/4) && (tempposz > -radi/4)))
					{
						SendClientMessage(i, col3, string);
					}
					else if (((tempposx < radi/2) && (tempposx > -radi/2)) && ((tempposy < radi/2) && (tempposy > -radi/2)) && ((tempposz < radi/2) && (tempposz > -radi/2)))
					{
						SendClientMessage(i, col4, string);
					}
					else if (((tempposx < radi) && (tempposx > -radi)) && ((tempposy < radi) && (tempposy > -radi)) && ((tempposz < radi) && (tempposz > -radi)))
					{
						SendClientMessage(i, col5, string);
					}
				}
				else
				{
					SendClientMessage(i, col1, string);
				}
			}
		}
	}//not connected
	return 1;
}

public RangoCercanoS(Float:radi, playerid, targetid)
{
    if(IsPlayerConnected(playerid)&&IsPlayerConnected(targetid))
	{
		new Float:posx, Float:posy, Float:posz;
		new Float:oldposx, Float:oldposy, Float:oldposz;
		new Float:tempposx, Float:tempposy, Float:tempposz;
		GetPlayerPos(playerid, oldposx, oldposy, oldposz);
		//radi = 2.0; //Trigger Radius
		GetPlayerPos(targetid, posx, posy, posz);
		tempposx = (oldposx -posx);
		tempposy = (oldposy -posy);
		tempposz = (oldposz -posz);
		//printf("DEBUG: X:%f Y:%f Z:%f",posx,posy,posz);
		if (((tempposx < radi) && (tempposx > -radi)) && ((tempposy < radi) && (tempposy > -radi)) && ((tempposz < radi) && (tempposz > -radi)))
		{
			return 1;
		}
	}
	return 0;
}

public JugadoresCerca(p1)
{
    new x,Float:dis,Float:dis2,player;
    player = -1;
    dis = 99999.99;
    for(x=0;x<MAX_PLAYERS;x++)
    {
        if(IsPlayerConnected(x))
        {
            if(x != p1)
            {
                dis2 = DistanciaEntreDosJugadores(x,p1);
                if(dis2 < dis && dis2 != -1.00)
                {
                    dis = dis2;
                    player = x;
                }
            }
        }
    }
    return player;
}

public Float:DistanciaEntreDosJugadores(p1,p2)
{
    new Float:x1,Float:y1,Float:z1,Float:x2,Float:y2,Float:z2;
    if(!IsPlayerConnected(p1) || !IsPlayerConnected(p2))
    {
        return -1.00;
    }
    GetPlayerPos(p1,x1,y1,z1);
    GetPlayerPos(p2,x2,y2,z2);
    return floatsqroot(floatpower(floatabs(floatsub(x2,x1)),2)+floatpower(floatabs(floatsub(y2,y1)),2)+floatpower(floatabs(floatsub(z2,z1)),2));
}

public TiempoLimipiar(playerid)
{
	ClearAnimations(playerid,1);
}

public AnimacionCaido(playerid)
{
    GameTextForPlayer(playerid, "~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~r~Tazeado", 5000, 3);
    ApplyAnimation(playerid,"KNIFE","knife_hit_3",4.1,0,1,1,0,0,1);
	TogglePlayerControllable(playerid, CONGELADO);
}

public GuardarValores()
{
	new coordsstring[128];
	format(coordsstring, sizeof(coordsstring), "%d, %d, %d, %d, %d, %d, %d, %d, %d", NumeroLoterico, CajaGobierno, Impuestos, BancoSangre, DepositoSangre, RetiroSangre, PrestamoViceCityS, PrestamoLibertyCityS, BancoGanzuas);
	new File: file2 = fopen("Res/Valores.ini", io_write);
	fwrite(file2, coordsstring);
	fclose(file2);
	return 1;
}

public GuardarTiendas()
{
	new coordsstring[128];
	format(coordsstring, sizeof(coordsstring), "%d, %d, %d", ProductosTienda1, ProductosTienda2, ProductosTienda3);
	new File: file2 = fopen("Res/Productos.ini", io_write);
	fwrite(file2, coordsstring);
	fclose(file2);
	return 1;
}

public CargarTiendas()
{
	new arrCoords[11][64];
	new strFromFile2[256];
	new File: file = fopen("Res/Productos.ini", io_read);
	if (file)
	{
		fread(file, strFromFile2);
		print("-> Productos de 24/7 (Productos.ini) cargada exitosamente");
		split(strFromFile2, arrCoords, ',');
		ProductosTienda1 = strval(arrCoords[0]);
		ProductosTienda2 = strval(arrCoords[1]);
		ProductosTienda3 = strval(arrCoords[2]);
		fclose(file);
		if(ResAntiDebug == 0 || ResAntiDebug == 1) { } else { GameModeExit(); }
	} else { GameModeExit(); }
	return 1;
}

public GuardarSatelites()
{
	new coordsstring[128];
	format(coordsstring, sizeof(coordsstring), "%d, %d, %d, %d, %d", AntenaG1, AntenaG2, AntenaG3, AntenaG4, AntenaG5);
	new File: file2 = fopen("Res/Satelites.ini", io_write);
	fwrite(file2, coordsstring);
	fclose(file2);
	return 1;
}

public CargarSatelites()
{
	new arrCoords[11][64];
	new strFromFile2[256];
	new File: file = fopen("Res/Satelites.ini", io_read);
	if (file)
	{
		fread(file, strFromFile2);
		print("-> Satelites SA:TV (Satelites.ini) cargada exitosamente");
		split(strFromFile2, arrCoords, ',');
		AntenaG1 = strval(arrCoords[0]);
		AntenaG2 = strval(arrCoords[1]);
		AntenaG3 = strval(arrCoords[2]);
		AntenaG4 = strval(arrCoords[3]);
		AntenaG5 = strval(arrCoords[4]);
		fclose(file);
		if(ResAntiDebug == 0 || ResAntiDebug == 1) { } else { GameModeExit(); }
	} else { GameModeExit(); }
	return 1;
}

public CargarValores()
{
	new arrCoords[11][64];
	new strFromFile2[256];
	new File: file = fopen("Res/Valores.ini", io_read);
	if (file)
	{
		fread(file, strFromFile2);
		split(strFromFile2, arrCoords, ',');
		NumeroLoterico = strval(arrCoords[0]);
		CajaGobierno = strval(arrCoords[1]);
		Impuestos = strval(arrCoords[2]);
		BancoSangre = strval(arrCoords[3]);
		DepositoSangre = strval(arrCoords[4]);
		RetiroSangre = strval(arrCoords[5]);
		PrestamoViceCityS = strval(arrCoords[6]);
		PrestamoLibertyCityS = strval(arrCoords[7]);
		BancoGanzuas = strval(arrCoords[7]);
		print("-> Valores del sistema (Valores.ini) cargada exitosamente");
		fclose(file);
		if(ResAntiDebug == 0 || ResAntiDebug == 1) { } else { GameModeExit(); }
	} else { GameModeExit(); }
	return 1;
}

public GuardarEstadisticas()
{
	new coordsstring[256];
	format(coordsstring, sizeof(coordsstring), "%d,%d,%d,%d,%d,%d,%d,%d,%d",ReportesTotales,ConexionesEntrantes,UsuariosMasculinos,UsuariosFemeninos,UsuariosLS,UsuariosSF,UsuariosLV,Actualizaciones,ChatsIngresados);
	new File: file2 = fopen("/Res/Estadisticas.ini", io_write);
	fwrite(file2, coordsstring);
	fclose(file2);
	return 1;
}

public CargarEstadisticas()
{
	new arrCoords[9][64];
	new strFromFile2[256];
	new File: file = fopen("/Res/Estadisticas.ini", io_read);
	if (file)
	{
		fread(file, strFromFile2);
		split(strFromFile2, arrCoords, ',');
		ReportesTotales = strval(arrCoords[0]);
		ConexionesEntrantes = strval(arrCoords[1]);
		UsuariosMasculinos = strval(arrCoords[2]);
		UsuariosFemeninos = strval(arrCoords[3]);
		UsuariosLS = strval(arrCoords[4]);
		UsuariosSF = strval(arrCoords[5]);
		UsuariosLV = strval(arrCoords[6]);
		Actualizaciones = strval(arrCoords[7]);
		ChatsIngresados = strval(arrCoords[8]);
		print(" ");
		print("-> Estadisticas del sistema (Estadisticas.ini) cargada exitosamente");
		fclose(file);
		if(Debug == 0 || Debug == 1) { } else { GameModeExit(); } } else { GameModeExit();
	}
	return 1;
}

public split(const strsrc[], strdest[][], delimiter)
{
	new i, li;
	new aNum;
	new len;
	while(i <= strlen(strsrc)){
    if(strsrc[i]==delimiter || i==strlen(strsrc)){
    len = strmid(strdest[aNum], strsrc, li, i, 128);
    strdest[aNum][len] = 0;
    li = i+1;
    aNum++;	} i++; }
	return 1;
}

public OnPlayerExitVehicle(playerid, vehicleid)
{
    HideProgressBarForPlayer(playerid, CarMotor[playerid]);
    Motor[playerid] = 0; encendiendo[vehicleid] = 0;
	SetProgressBarValue(CarMotor[playerid], Motor[playerid]);
	TextDrawHideForPlayer(playerid, Motor_Box);
	TextDrawHideForPlayer(playerid, Motor_Titulo);
	return 1;
}

public ArrancandoV(playerid)
{
    new vehicleid = GetPlayerVehicleID(playerid);
	if(IsPlayerInAnyVehicle(playerid))
	{
	    GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);
	    if(encendiendo[vehicleid] == 1 && VArrancado[GetPlayerVehicleID(playerid)] == 0)
	    {
	        Motor[playerid] ++;
			SetProgressBarValue(CarMotor[playerid], Motor[playerid]);
			UpdateProgressBar(CarMotor[playerid], playerid);
			ShowProgressBarForPlayer(playerid, CarMotor[playerid]);
			TextDrawShowForPlayer(playerid, Motor_Box);
			TextDrawShowForPlayer(playerid, Motor_Titulo);
			new veh = GetPlayerVehicleID(playerid);
			if (Motor[playerid] > 99)
			{
    			encendiendo[vehicleid] = 0;
				Motor[playerid]		  = 0;
				HideProgressBarForPlayer(playerid, CarMotor[playerid]);
				SetProgressBarValue(CarMotor[playerid], Motor[playerid]);
				SendClientMessage(playerid, BLANCO, "El vehiculo ha arrancado con exito!");
				PlayerPlaySound(playerid, 1150, 0.0, 0.0, 0.0);
				new s[256];
				format(s, sizeof(s), "* %s ha conseguido encender el motor de su veh�culo.", NombreEx(playerid));
				RangoCercano(10, playerid, s, VIOLETA, VIOLETA, VIOLETA, VIOLETA, VIOLETA);
				SetVehicleParamsEx(veh, VEHICLE_PARAMS_ON, lights, alarm, doors, bonnet, boot, objective);
				VArrancado[GetPlayerVehicleID(playerid)] = 1;
				TextDrawHideForPlayer(playerid, Motor_Box);
				TextDrawHideForPlayer(playerid, Motor_Titulo);
				KillTimer(MotorS[playerid]);
			}
		}
	}
	return 1;
}

public Lotteria(number)
{
	new NumeroLotericoFallen = 0;
	new string[256];
	new winner[MAX_PLAYER_NAME];
	format(string, sizeof(string), "�AVISO!, el numero ganador de hoy es: %d!", number);
    SendClientMessageToAll(VERDE, string);
    for(new i = 0; i < MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i))
		{
		    if(Informacion[i][Loteria] != 999)
		    {
			    if(Informacion[i][Loteria] == number)
			    {
			        NumeroLotericoFallen = 1;
			        GetPlayerName(i, winner, sizeof(winner));
					format(string, sizeof(string), "* * �FELICIDADES!, has sido el afortunado ganador de $%d", NumeroLoterico);
					SendClientMessage(i, AMARILLO, string);
					GivePlayerMoney(i, NumeroLoterico);
			    }
			    else
			    {
			        SendClientMessage(i, GRIS, "* Lo siento, no has ganado la loteria");
			    }
			}
			Informacion[i][Loteria] = 999;
		}
	}
	if(NumeroLotericoFallen)
	{
	    new rand = random(125000); rand += 15789;
	    NumeroLoterico = rand;
	    GuardarValores();
	    format(string, sizeof(string), "El pozo de loteria ha iniciado en $%d", NumeroLoterico);
		SendClientMessageToAll(AMARILLO, string);
	}
	else
	{
	    new rand = random(15000); rand += 2158;
	    NumeroLoterico += rand;
	    GuardarValores();
	    format(string, sizeof(string), "El pozo de loteria ha sido aumentada en $%d", NumeroLoterico);
		SendClientMessageToAll(AMARILLO, string);
	}
	return 1;
}
public VehiculoCercano(p1)
{
	new x,Float:dis,Float:dis2,car;
	car = -1;
	dis = 99999.99;
	for (x=0;x<MAX_VEHICLES;x++)
	{
		dis2 = DistanciaEntreCarPer(x,p1);
		if(dis2 < dis && dis2 != -1.00)
		{
			dis = dis2;
			car = x;
		}
	}
	return car;
}

public Float:DistanciaEntreCarPer(c1,p2)
{
	new Float:x1,Float:y1,Float:z1,Float:x2,Float:y2,Float:z2;
	if(!IsPlayerConnected(p2))
	{
		return -1.00;
	}
	GetVehiclePos(c1,x1,y1,z1);
	GetPlayerPos(p2,x2,y2,z2);
	return floatsqroot(floatpower(floatabs(floatsub(x2,x1)),2)+floatpower(floatabs(floatsub(y2,y1)),2)+floatpower(floatabs(floatsub(z2,z1)),2));
}

public TogglearMatricula(playerid)
{
	TextDrawHideForPlayer(playerid, Text:M_Fondo);
	TextDrawHideForPlayer(playerid, Text:M_Fondo2);
	TextDrawHideForPlayer(playerid, Text:M_Titulo);
	TextDrawHideForPlayer(playerid, Text:M_Texto[playerid]);
	return 1;
}

public VehiculosVenta(carid)
{
	if(carid >= VV_DESDE && carid <= TOTAL_VEH) { return 1; }
	return 0;
}

public CargarVehiculos()
{
	new arrCoords[24][64];
	new strFromFile2[256];
	new File: file = fopen("Res/Coches.cfg", io_read);
	if (file)
	{
		print("-> Coches del sistema (Coches.cfg) cargada exitosamente");
		print("-> Matriculas del sistema (Matriculas.db) cargada exitosamente");
	    new idx = VV_DESDE;
		while (idx < sizeof(CInformacion))
		{
			fread(file, strFromFile2);
			split(strFromFile2, arrCoords, ',');
			CInformacion[idx][cModel] = strval(arrCoords[0]);
			CInformacion[idx][cLocationx] = floatstr(arrCoords[1]);
			CInformacion[idx][cLocationy] = floatstr(arrCoords[2]);
			CInformacion[idx][cLocationz] = floatstr(arrCoords[3]);
			CInformacion[idx][cAngle] = floatstr(arrCoords[4]);
			CInformacion[idx][cColorOne] = strval(arrCoords[5]);
			CInformacion[idx][cColorTwo] = strval(arrCoords[6]);
  			strmid(CInformacion[idx][cNameD], arrCoords[7], 0, strlen(arrCoords[7]), 255);
			CInformacion[idx][cVenta] = strval(arrCoords[8]);
			CInformacion[idx][cLock] = strval(arrCoords[9]);
			CInformacion[idx][cTComprado] = strval(arrCoords[10]);
			CInformacion[idx][cGPS] = strval(arrCoords[11]);
			CInformacion[idx][cPaintJob] = strval(arrCoords[12]);
			CInformacion[idx][cNitro] = strval(arrCoords[13]);
			CInformacion[idx][cLlantas] = strval(arrCoords[14]);
			CInformacion[idx][cAleron] = strval(arrCoords[15]);
			CInformacion[idx][cParachoDelan] = strval(arrCoords[16]);
			CInformacion[idx][cParachoTrase] = strval(arrCoords[17]);
			CInformacion[idx][cHidraulica] = strval(arrCoords[18]);
			CInformacion[idx][cTecho] = strval(arrCoords[19]);
			CInformacion[idx][cEscape] = strval(arrCoords[20]);
			CInformacion[idx][cParachoDesco] = strval(arrCoords[21]);
			CInformacion[idx][cEmbellecedor] = strval(arrCoords[22]);
			CInformacion[idx][cEmbellecedor2] = strval(arrCoords[23]);
		  	idx++;
		}
	}
	return 1;
}

public ActualizarVehiculos()
{
	new idx;
	new File: file2;
	idx = VV_DESDE;
 	while (idx < sizeof(CInformacion))
	{
		new coordsstring[128];
		format(coordsstring, sizeof(coordsstring), "%d,%f,%f,%f,%f,%d,%d,%s,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d\n",/*%d,%d,%d,%d*/
 		CInformacion[idx][cModel],//
		CInformacion[idx][cLocationx],//
		CInformacion[idx][cLocationy],//
		CInformacion[idx][cLocationz],//
		CInformacion[idx][cAngle],//
		CInformacion[idx][cColorOne],//
		CInformacion[idx][cColorTwo],//
		CInformacion[idx][cNameD],//
		CInformacion[idx][cVenta],//
		CInformacion[idx][cLock],
		CInformacion[idx][cTComprado],
		CInformacion[idx][cGPS],
		CInformacion[idx][cPaintJob],
		CInformacion[idx][cNitro],
		CInformacion[idx][cLlantas],
		CInformacion[idx][cAleron],
		CInformacion[idx][cParachoDelan],
		CInformacion[idx][cParachoTrase],
		CInformacion[idx][cHidraulica],
		CInformacion[idx][cTecho],
		CInformacion[idx][cEscape],
		CInformacion[idx][cParachoDesco],
		CInformacion[idx][cEmbellecedor],
		CInformacion[idx][cEmbellecedor2]);
		if(idx == VV_DESDE)
		{
			file2 = fopen("Res/Coches.cfg", io_write);
		}
		else
		{
			file2 = fopen("Res/Coches.cfg", io_append);
		}
		fwrite(file2, coordsstring);
		idx++;
		fclose(file2);
	}
	return 1;
}

public Float:GetDistanceBetweenPlayers(p1,p2)
{
	new Float:x1,Float:y1,Float:z1,Float:x2,Float:y2,Float:z2;
	if(!IsPlayerConnected(p1) || !IsPlayerConnected(p2))
	{
		return -1.00;
	}
	GetPlayerPos(p1,x1,y1,z1);
	GetPlayerPos(p2,x2,y2,z2);
	return floatsqroot(floatpower(floatabs(floatsub(x2,x1)),2)+floatpower(floatabs(floatsub(y2,y1)),2)+floatpower(floatabs(floatsub(z2,z1)),2));
}

public CargandoProductos(playerid)
{
	SetPlayerCheckpoint(playerid, 1349.6041,-1772.2300,13.2550,8.0);
	SendClientMessage(playerid, BLANCO, "Ve al siguiente checkpoint de color {AA0000}ROJO {FFFFFF}en el mapa");
	TogglePlayerControllable(playerid, DESCONGELADO);
	PasosTrabajo[playerid] = 2;
	return 1;
}

public CargandoProductos2(playerid)
{
	SetPlayerCheckpoint(playerid, 1859.4712,-1852.8618,13.3507, 8.0);
	SendClientMessage(playerid, BLANCO, "Ve al siguiente checkpoint de color {AA0000}ROJO {FFFFFF}en el mapa");
	TogglePlayerControllable(playerid, DESCONGELADO);
	PasosTrabajo[playerid] = 3;
	ProductosTienda1 += 100;
	return 1;
}

public CargandoProductos3(playerid)
{
	SetPlayerCheckpoint(playerid, 1330.3240,-896.6905,39.3508, 8.0);
	SendClientMessage(playerid, BLANCO, "Ve al siguiente checkpoint de color {AA0000}ROJO {FFFFFF}en el mapa");
	TogglePlayerControllable(playerid, DESCONGELADO);
	PasosTrabajo[playerid] = 4;
	ProductosTienda2 += 100;
	return 1;
}

public CargandoProductos4(playerid)
{
	SetPlayerCheckpoint(playerid, 390.8301,-1759.1317,7.9093, 8.0);
	SendClientMessage(playerid, BLANCO, "Ve al siguiente checkpoint de color {AA0000}ROJO {FFFFFF}en el mapa");
	TogglePlayerControllable(playerid, DESCONGELADO);
	ProductosTienda3 += 100;
	PasosTrabajo[playerid] = 5;
	return 1;
}

public TimerAnuncios() { AnunciosActivados = 1; return 1; }

public Unloading(playerid)
{
	TextDrawHideForPlayer(playerid, Text:L_FONDO);
	TextDrawHideForPlayer(playerid, Text:L_TITULO);
	TextDrawHideForPlayer(playerid, Text:L_VERSION);
	TextDrawHideForPlayer(playerid, Text:L_CARGANDO);
	TogglePlayerControllable(playerid, DESCONGELADO);
	return 1;
}

public SyncUp()
{
	SyncTime();
	DollahScoreUpdate();
}

public SyncTime()
{
	new string[64];
	new tmphour;
	new tmpminute;
	new tmpsecond;
	gettime(tmphour, tmpminute, tmpsecond);
	FixHour(tmphour);
	tmphour = shifthour;
	if ((tmphour > ghour) || (tmphour == 0 && ghour == 23))
	{
		format(string, sizeof(string), "La hora ha sido actualizada correctamente -> %d:00",tmphour);
		SendClientMessageToAll(VERDE,string);
		ghour = tmphour;
		PayDay();
		if (realtime)
		{
			SetWorldTime(tmphour);
		}
	}
}
public DollahScoreUpdate()
{
	new LevScore;
	for(new i=0; i<MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i))
		{
   			LevScore = Informacion[i][Nivel];
			SetPlayerScore(i, LevScore);
		}
	}
	return 1;
}

public FixHour(hour)
{
	hour = timeshift+hour;
	if (hour < 0)
	{
		hour = hour+24;
	}
	else if (hour > 23)
	{
		hour = hour-24;
	}
	shifthour = hour;
	return 1;
}

public PayDay()
{
	new string[128];
    new hora, minutos, segundos;
    gettime(hora, minutos, segundos);
    SetWorldTime(hora);
	for(new h = VV_DESDE; h < sizeof(CInformacion); h++)
	{
	    if(CInformacion[h][cTComprado] >= 1)
		{
			CInformacion[h][cTComprado] = CInformacion[h][cTComprado]-1;
		}
		else
		{
			CInformacion[h][cVenta] = 0;
			CInformacion[h][cTComprado] = 0;
	        strmid(CInformacion[h][cNameD], "Dealership", 0, strlen("Dealership"), 999);
		}
	}
	for(new i = 0; i < MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i))
		{
		    Informacion[i][Experiencia] += 1;
			if(Informacion[i][TarjetaCredito] == 0)
			{
				SendClientMessage(i, GRIS, "Lo siento, no puedes recibir ninguna paga horaria porque no tienes cuenta bancaria");
				return 1;
			}
			SendClientMessage(i, DORADO, "-------------> {FFFFFF}San Andreas Bank State {FEB800}<-------------");
			format(string, sizeof(string), "Impuestos Estatales: {FFFFFF}-$%d", Impuestos);
			SendClientMessage(i, DORADO, string);
			GivePlayerMoney(i, -Impuestos);
			CajaGobierno += Impuestos;
			format(string, sizeof(string), "Infracci�nes a la Propiedad: {FFFFFF}%d", Informacion[i][Multas]);
			SendClientMessage(i, DORADO, string);
			SendClientMessage(i, DORADO, "Salario de paga Normal: {FFFFFF}$750");
			Informacion[i][DineroBanco] += 750;
			if(Informacion[i][Faccion] >= 1) {	SendClientMessage(i, DORADO, "Bonificaci�n por Faccion: {FFFFFF}$670");	Informacion[i][DineroBanco] += 670;	}
			if(Informacion[i][Lider] == 1) { SendClientMessage(i, DORADO, "Bonificaci�n por Liderazgo: {FFFFFF}$1870"); Informacion[i][DineroBanco] += 1870;	}
			if(Informacion[i][Premium] >= 1) { SendClientMessage(i, DORADO, "Bonificaci�n por Cuenta Premium: {FFFFFF}$5870"); Informacion[i][DineroBanco] += 5870; }
			if(Informacion[i][Admin] >= 1) { SendClientMessage(i, DORADO, "Bonificaci�n por Membresia de Staff: {FFFFFF}$2170"); Informacion[i][DineroBanco] += 2170; }
			if(Informacion[i][Experiencia] >= 10) { ActivarCheckeador[i] = 1; }
			SendClientMessage(i, DORADO, "_____________________________________________");
			format(string, sizeof(string), "Nuevo balance de cuentas: $%d", Informacion[i][DineroBanco]);
			SendClientMessage(i, DORADO, string);
			print("Opcode 0x00043 -> Payday realizado con exito");
		}
	}
	return 1;
}

public VehiculosSAPD(carid) { if(carid >= 1 && carid <= 46) { return 1; } return 0; }
public VehiculosSAMD(carid) { if(carid >= 47 && carid <= 58) { return 1; } return 0; }
public VehiculosSAGO(carid) { if(carid >= 59 && carid <= 79) { return 1; } return 0; }
public VehiculosTAXI(carid) { if(carid >= 80 && carid <= 103) { return 1; } return 0; }
public VehiculosSATV(carid) { if(carid >= 104 && carid <= 114) { return 1; } return 0; }
public VehiculosMECA(carid) { if(carid >= 115 && carid <= 125) { return 1; } return 0; }
public VehiculosLICE(carid) { if(carid >= 126 && carid <= 130) { return 1; } return 0; }
public VehiculosRENT(carid) { if(carid >= 131 && carid <= 147) { return 1; } return 0; }
public VehiculosJOB1(carid) { if(carid >= 148 &&  carid <= 152) { return 1; } return 0; }

/* -= Extensiones Stock =- */
stock NombreEx(jug)
{
    new string[24];
    GetPlayerName(jug,string,24);
    new str[24];
    strmid(str,string,0,strlen(string),24);
    for(new i = 0; i < MAX_PLAYER_NAME; i++)
    {
        if (str[i] == '_') str[i] = ' ';
    }
    return str;
}

stock MostrarTut(i)
{
	TextDrawShowForPlayer(i,TituloT);
	TextDrawShowForPlayer(i,Linea1T);
	TextDrawShowForPlayer(i,Linea2T);
	TextDrawShowForPlayer(i,Linea3T);
}

stock ComandoErroneo(playerid, comando[])
{
	new mError[256];
	format(mError, sizeof(mError), "Lo siento, el comando %s no existe, utilize /ayuda para mas informaci�n", comando);
	SendClientMessage(playerid, GRIS, mError);
	return 1;
}

strtok(const string[], &index)
{
	new length = strlen(string);
	while ((index < length) && (string[index] <= ' '))
	{
		index++;
	}

	new offset = index;
	new result[20];
	while ((index < length) && (string[index] > ' ') && ((index - offset) < (sizeof(result) - 1)))
	{
		result[index - offset] = string[index];
		index++;
	}
	result[index - offset] = EOS;
	return result;
}

stock GuardarAuto(zmodelo, Float:zX, Float:zY, Float:zZ, Float:zA, zcolor1, zcolor2, zfaccion)
{
    new inf[64], File:autos;
    #if defined USE_LIST
    if(!fexist("Res/FaccionVeh.ini"))autos = fopen("Res/FaccionVeh.ini", io_write);
    else autos = fopen("fautos.ini", io_append);
    #else
    autos = fopen("Res/FaccionVeh.ini", io_write);
    #endif
    VehFactionInfo[cModelo] = zmodelo;
    VehFactionInfo[cX] = zX;
    VehFactionInfo[cY] = zY;
    VehFactionInfo[cZ] = zZ;
    VehFactionInfo[cA] = zA;
    VehFactionInfo[cColor] = zcolor1;
    VehFactionInfo[cColor2] = zcolor2;
    VehFactionInfo[cFaccion] = zfaccion;
    format(inf, 64, "%d %f %f %f %f %d %d %d\r\n",
    VehFactionInfo[cModelo],
    VehFactionInfo[cX],
    VehFactionInfo[cY],
    VehFactionInfo[cZ],
    VehFactionInfo[cA],
    VehFactionInfo[cColor],
    VehFactionInfo[cColor2],
    VehFactionInfo[cFaccion]);
    fwrite(autos, inf);
    printf("Vehiculo guardado %s", inf);
    return fclose(autos);
}

EsNumerico(const string[])
{
	for (new i = 0, xd = strlen(string); i < xd; i++)
	{
		if (string[i] > '9' || string[i] < '0') return 0;
	}
	return 1;
}

stock CheckFire(playerid)
{

    new Float: X1, Float: Y1, Float: Z1;
    new Float: X2, Float: Y2, Float: Z2;
    new Float: X3, Float: Y3, Float: Z3;
    new Float: X4, Float: Y4, Float: Z4;
    new Float: X5, Float: Y5, Float: Z5;
    new Float: X6, Float: Y6, Float: Z6;
    new Float: X7, Float: Y7, Float: Z7;
    new Float: X8, Float: Y8, Float: Z8;
    new Float: X9, Float: Y9, Float: Z9;
    new Float: X10, Float: Y10, Float: Z10;
    new Float: X11, Float: Y11, Float: Z11;
    new Float: X12, Float: Y12, Float: Z12;
    new Float: X13, Float: Y13, Float: Z13;
    new Float: X14, Float: Y14, Float: Z14;
    new Float: X15, Float: Y15, Float: Z15;
    new Float: X16, Float: Y16, Float: Z16;
    new Float: X17, Float: Y17, Float: Z17;
    new Float: X18, Float: Y18, Float: Z18;
    new Float: X19, Float: Y19, Float: Z19;
    new Float: X20, Float: Y20, Float: Z20;
    GetObjectPos(O_FIRE_1, X1, Y1, Z1);
    GetObjectPos(O_FIRE_2, X2, Y2, Z2);
    GetObjectPos(O_FIRE_3, X3, Y3, Z3);
    GetObjectPos(O_FIRE_4, X4, Y4, Z4);
    GetObjectPos(O_FIRE_5, X5, Y5, Z5);
    GetObjectPos(O_FIRE_6, X6, Y6, Z6);
    GetObjectPos(O_FIRE_7, X7, Y7, Z7);
    GetObjectPos(O_FIRE_8, X8, Y8, Z8);
    GetObjectPos(O_FIRE_9, X9, Y9, Z9);
    GetObjectPos(O_FIRE_10, X10, Y10, Z10);
    GetObjectPos(O_FIRE_11, X11, Y11, Z11);
    GetObjectPos(O_FIRE_12, X12, Y12, Z12);
    GetObjectPos(O_FIRE_13, X13, Y13, Z13);
    GetObjectPos(O_FIRE_14, X14, Y14, Z14);
    GetObjectPos(O_FIRE_15, X15, Y15, Z15);
    GetObjectPos(O_FIRE_16, X16, Y16, Z16);
    GetObjectPos(O_FIRE_17, X17, Y17, Z17);
    GetObjectPos(O_FIRE_18, X18, Y18, Z18);
    GetObjectPos(O_FIRE_19, X19, Y19, Z19);
    GetObjectPos(O_FIRE_20, X20, Y20, Z20);
    if(GetPlayerWeapon(playerid) == 42)
    {
        if(IsPlayerInRangeOfPoint(playerid, 6.0, X1, Y1, Z1))
        {
			if(ServicioSAMD[playerid] != 1)
			{
				SendClientMessage(playerid, GRIS, "Lo siento, has apagado el fuego, pero no recibes nada por no estar de servicio en modo 1");
			    GameTextForPlayer(playerid, "+1 llama extinguida", 3000, 5);
	            DestroyObject(O_FIRE_1);
	            PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
			}
			SendClientMessage(playerid, GRIS, "Lo siento, has apagado el fuego, pero no recibes nada por no estar de servicio en modo 1");
		    GameTextForPlayer(playerid, "+1 llama extinguida", 3000, 5);
			GivePlayerMoney(playerid, 50);
	        DestroyObject(O_FIRE_1);
	        PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
		}
        if(IsPlayerInRangeOfPoint(playerid, 6.0, X2, Y2, Z2))
        {
			if(ServicioSAMD[playerid] != 1)
			{
				SendClientMessage(playerid, GRIS, "Lo siento, has apagado el fuego, pero no recibes nada por no estar de servicio en modo 1");
			    GameTextForPlayer(playerid, "+1 llama extinguida", 3000, 5);
	            DestroyObject(O_FIRE_2);
	            PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
			}
			GameTextForPlayer(playerid, "+1 llama extinguida", 3000, 5);
            GivePlayerMoney(playerid, 50);
            DestroyObject(O_FIRE_2);
            PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
        }
        if(IsPlayerInRangeOfPoint(playerid, 6.0, X3, Y3, Z3))
        {
			if(ServicioSAMD[playerid] != 1)
			{
				SendClientMessage(playerid, GRIS, "Lo siento, has apagado el fuego, pero no recibes nada por no estar de servicio en modo 1");
			    GameTextForPlayer(playerid, "+1 llama extinguida", 3000, 5);
	            DestroyObject(O_FIRE_3);
	            PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
			}
		    GameTextForPlayer(playerid, "+1 llama extinguida", 3000, 5);
            GivePlayerMoney(playerid, 50);
            DestroyObject(O_FIRE_3);
            PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
        }
        if(IsPlayerInRangeOfPoint(playerid, 6.0, X4, Y4, Z4))
        {
			if(ServicioSAMD[playerid] != 1)
			{
				SendClientMessage(playerid, GRIS, "Lo siento, has apagado el fuego, pero no recibes nada por no estar de servicio en modo 1");
			    GameTextForPlayer(playerid, "+1 llama extinguida", 3000, 5);
	            DestroyObject(O_FIRE_4);
	            PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
			}
		    GameTextForPlayer(playerid, "+1 llama extinguida", 3000, 5);
            GivePlayerMoney(playerid, 50);
            DestroyObject(O_FIRE_4);
            PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
        }
        if(IsPlayerInRangeOfPoint(playerid, 6.0, X5, Y5, Z5))
        {
			if(ServicioSAMD[playerid] != 1)
			{
				SendClientMessage(playerid, GRIS, "Lo siento, has apagado el fuego, pero no recibes nada por no estar de servicio en modo 1");
			    GameTextForPlayer(playerid, "+1 llama extinguida", 3000, 5);
	            DestroyObject(O_FIRE_5);
	            PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
			}
			GameTextForPlayer(playerid, "+1 llama extinguida", 3000, 5);
            GivePlayerMoney(playerid, 50);
            DestroyObject(O_FIRE_5);
            PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
        }
        if(IsPlayerInRangeOfPoint(playerid, 6.0, X6, Y6, Z6))
        {
			if(ServicioSAMD[playerid] != 1)
			{
				SendClientMessage(playerid, GRIS, "Lo siento, has apagado el fuego, pero no recibes nada por no estar de servicio en modo 1");
			    GameTextForPlayer(playerid, "+1 llama extinguida", 3000, 5);
	            DestroyObject(O_FIRE_6);
	            PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
			}
			GameTextForPlayer(playerid, "+1 llama extinguida", 3000, 5);
            GivePlayerMoney(playerid, 50);
            DestroyObject(O_FIRE_6);
            PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
        }
        if(IsPlayerInRangeOfPoint(playerid, 6.0, X7, Y7, Z7))
        {
			if(ServicioSAMD[playerid] != 1)
			{
				SendClientMessage(playerid, GRIS, "Lo siento, has apagado el fuego, pero no recibes nada por no estar de servicio en modo 1");
			    GameTextForPlayer(playerid, "+1 llama extinguida", 3000, 5);
	            DestroyObject(O_FIRE_7);
	            PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
			}
			GameTextForPlayer(playerid, "+1 llama extinguida", 3000, 5);
            GivePlayerMoney(playerid, 50);
            DestroyObject(O_FIRE_7);
            PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
        }
        if(IsPlayerInRangeOfPoint(playerid, 6.0, X8, Y8, Z8))
        {
			if(ServicioSAMD[playerid] != 1)
			{
				SendClientMessage(playerid, GRIS, "Lo siento, has apagado el fuego, pero no recibes nada por no estar de servicio en modo 1");
			    GameTextForPlayer(playerid, "+1 llama extinguida", 3000, 5);
	            DestroyObject(O_FIRE_8);
	            PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
			}
			GameTextForPlayer(playerid, "+1 llama extinguida", 3000, 5);
            GivePlayerMoney(playerid, 50);
            DestroyObject(O_FIRE_8);
            PlayerPlaySound(playerid, 1056, 00, 0.0, 0.0);
        }
        if(IsPlayerInRangeOfPoint(playerid, 6.0, X9, Y9, Z9))
        {
			if(ServicioSAMD[playerid] != 1)
			{
				SendClientMessage(playerid, GRIS, "Lo siento, has apagado el fuego, pero no recibes nada por no estar de servicio en modo 1");
			    GameTextForPlayer(playerid, "+1 llama extinguida", 3000, 5);
	            DestroyObject(O_FIRE_9);
        		PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
			}
			GameTextForPlayer(playerid, "+1 llama extinguida", 3000, 5);
            GivePlayerMoney(playerid, 50);
            DestroyObject(O_FIRE_9);
            PlayerPlaySound(playerid, 1056, 00, 0.0, 0.0);
        }
        if(IsPlayerInRangeOfPoint(playerid, 6.0, X10, Y10, Z10))
        {
			if(ServicioSAMD[playerid] != 1)
			{
				SendClientMessage(playerid, GRIS, "Lo siento, has apagado el fuego, pero no recibes nada por no estar de servicio en modo 1");
			    GameTextForPlayer(playerid, "+1 llama extinguida", 3000, 5);
	            DestroyObject(O_FIRE_10);
	            PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
			}
			GameTextForPlayer(playerid, "+1 llama extinguida", 3000, 5);
            GivePlayerMoney(playerid, 50);
            DestroyObject(O_FIRE_10);
            PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
		}
        if(IsPlayerInRangeOfPoint(playerid, 6.0, X11, Y11, Z11))
        {
			if(ServicioSAMD[playerid] != 1)
			{
				SendClientMessage(playerid, GRIS, "Lo siento, has apagado el fuego, pero no recibes nada por no estar de servicio en modo 1");
			    GameTextForPlayer(playerid, "+1 llama extinguida", 3000, 5);
	            DestroyObject(O_FIRE_11);
	            PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
		}
	        GameTextForPlayer(playerid, "+1 llama extinguida", 3000, 5);
            GivePlayerMoney(playerid, 50);
            DestroyObject(O_FIRE_11);
            PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
		}
        if(IsPlayerInRangeOfPoint(playerid, 6.0, X12, Y12, Z12))
        {
			if(ServicioSAMD[playerid] != 1)
			{
				SendClientMessage(playerid, GRIS, "Lo siento, has apagado el fuego, pero no recibes nada por no estar de servicio en modo 1");
			    GameTextForPlayer(playerid, "+1 llama extinguida", 3000, 5);
	            DestroyObject(O_FIRE_12);
	            PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
			}
		    GameTextForPlayer(playerid, "+1 llama extinguida", 3000, 5);
            GivePlayerMoney(playerid, 50);
            DestroyObject(O_FIRE_12);
            PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
		}
        if(IsPlayerInRangeOfPoint(playerid, 6.0, X13, Y13, Z13))
        {
			if(ServicioSAMD[playerid] != 1)
			{
				SendClientMessage(playerid, GRIS, "Lo siento, has apagado el fuego, pero no recibes nada por no estar de servicio en modo 1");
			    GameTextForPlayer(playerid, "+1 llama extinguida", 3000, 5);
	            DestroyObject(O_FIRE_13);
	            PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
			}
		    GameTextForPlayer(playerid, "+1 llama extinguida", 3000, 5);
            GivePlayerMoney(playerid, 50);
            DestroyObject(O_FIRE_13);
            PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
		}
        if(IsPlayerInRangeOfPoint(playerid, 6.0, X14, Y14, Z14))
        {
			if(ServicioSAMD[playerid] != 1)
			{
				SendClientMessage(playerid, GRIS, "Lo siento, has apagado el fuego, pero no recibes nada por no estar de servicio en modo 1");
			    GameTextForPlayer(playerid, "+1 llama extinguida", 3000, 5);
	            DestroyObject(O_FIRE_14);
	            PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
			}
			GameTextForPlayer(playerid, "+1 llama extinguida", 3000, 5);
            GivePlayerMoney(playerid, 50);
            DestroyObject(O_FIRE_14);
            PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
		}
        if(IsPlayerInRangeOfPoint(playerid, 6.0, X15, Y15, Z15))
        {
			if(ServicioSAMD[playerid] != 1)
			{
				SendClientMessage(playerid, GRIS, "Lo siento, has apagado el fuego, pero no recibes nada por no estar de servicio en modo 1");
			    GameTextForPlayer(playerid, "+1 llama extinguida", 3000, 5);
	            DestroyObject(O_FIRE_15);
	            PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
			}
		    GameTextForPlayer(playerid, "+1 llama extinguida", 3000, 5);
            GivePlayerMoney(playerid, 50);
            DestroyObject(O_FIRE_15);
            PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
		}
        if(IsPlayerInRangeOfPoint(playerid, 6.0, X16, Y16, Z16))
        {
			if(ServicioSAMD[playerid] != 1)
			{
				SendClientMessage(playerid, GRIS, "Lo siento, has apagado el fuego, pero no recibes nada por no estar de servicio en modo 1");
			    GameTextForPlayer(playerid, "+1 llama extinguida", 3000, 5);
	            DestroyObject(O_FIRE_16);
	            PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
			}
			GameTextForPlayer(playerid, "+1 llama extinguida", 3000, 5);
            GivePlayerMoney(playerid, 50);
            DestroyObject(O_FIRE_16);
            PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
		}
        if(IsPlayerInRangeOfPoint(playerid, 6.0, X17, Y17, Z17))
        {
			if(ServicioSAMD[playerid] != 1)
			{
				SendClientMessage(playerid, GRIS, "Lo siento, has apagado el fuego, pero no recibes nada por no estar de servicio en modo 1");
			    GameTextForPlayer(playerid, "+1 llama extinguida", 3000, 5);
	            DestroyObject(O_FIRE_17);
	            PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
			}
			GameTextForPlayer(playerid, "+1 llama extinguida", 3000, 5);
            GivePlayerMoney(playerid, 50);
            DestroyObject(O_FIRE_17);
            PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
		}
        if(IsPlayerInRangeOfPoint(playerid, 6.0, X18, Y18, Z18))
        {
			if(ServicioSAMD[playerid] != 1)
			{
				SendClientMessage(playerid, GRIS, "Lo siento, has apagado el fuego, pero no recibes nada por no estar de servicio en modo 1");
			    GameTextForPlayer(playerid, "+1 llama extinguida", 3000, 5);
	            DestroyObject(O_FIRE_18);
	            PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
			}
			GameTextForPlayer(playerid, "+1 llama extinguida", 3000, 5);
            GivePlayerMoney(playerid, 50);
            DestroyObject(O_FIRE_18);
            PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
		}
        if(IsPlayerInRangeOfPoint(playerid, 6.0, X19, Y19, Z19))
        {
			if(ServicioSAMD[playerid] != 1)
			{
				SendClientMessage(playerid, GRIS, "Lo siento, has apagado el fuego, pero no recibes nada por no estar de servicio en modo 1");
			    GameTextForPlayer(playerid, "+1 llama extinguida", 3000, 5);
	            DestroyObject(O_FIRE_19);
	            PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
		    }
		    GameTextForPlayer(playerid, "+1 llama extinguida", 3000, 5);
            GivePlayerMoney(playerid, 50);
            DestroyObject(O_FIRE_19);
            PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
		}
        if(IsPlayerInRangeOfPoint(playerid, 6.0, X20, Y20, Z20))
        {
			if(ServicioSAMD[playerid] != 1)
			{
				SendClientMessage(playerid, GRIS, "Lo siento, has apagado el fuego, pero no recibes nada por no estar de servicio en modo 1");
			    GameTextForPlayer(playerid, "+1 llama extinguida", 3000, 5);
	            DestroyObject(O_FIRE_20);
	            PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
   			}
		    GameTextForPlayer(playerid, "+1 llama extinguida", 3000, 5);
            GivePlayerMoney(playerid, 50);
            DestroyObject(O_FIRE_20);
            PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
  		}
    }
}

stock EsBicicleta(carid)
{
	if(GetVehicleModel(carid) == 510 || GetVehicleModel(carid) == 509 || GetVehicleModel(carid) == 481)
	{
		return 1;
	}
	return 0;
}

