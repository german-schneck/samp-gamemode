#include <a_samp>
#if defined steam
	#endinput
#endif
#define steam

#undef MAX_OBJECTS
#define MAX_OBJECTS 255

#define STEAM_ICONS 200
#define STEAM_OBJECTS 2000
#define STEAM_CHECKPOINTS 100

#define DRAW_DISTANCE_ICONS 250.0
#define DRAW_DISTANCE_OBJECTS 75.0

#pragma unused Icon,Object,Checkpoint,CheckpointsToShow

forward Steamer();
forward AddStaticIcon(Float:x,Float:y,Float:z,markertype,color);
forward AddStaticObject(model,Float:x,Float:y,Float:z,Float:rx,Float:ry,Float:rz);
forward CreateCheckpoint(Float:x,Float:y,Float:z,Float:size);
forward DestroyCheckpoint(checkpointid);
forward ShowCheckpointForPlayer(playerid,checkpointid);
forward HideCheckpointForPlayer(playerid,checkpointid);
forward ShowCheckpointForAll(checkpointid);
forward HideCheckpointForAll(checkpointid);


/*

	native AddStaticIcon(Float:x,Float:y,Float:z,markertype,color);
	native AddStaticObject(model,Float:x,Float:y,Float:z,Float:rx,Float:ry,Float:rz);
	native CreateCheckpoint(Float:x,Float:y,Float:z,Float:size);
	native DestroyCheckpoint(checkpointid);
	native ShowCheckpointForPlayer(playerid,checkpointid);
	native HideCheckpointForPlayer(playerid,checkpointid);
	native ShowCheckpointForAll(checkpointid);
	native HideCheckpointForAll(checkpointid);

*/

public OnGameModeInit()
{
    SetTimer("Steamer",1000,1);
    CallLocalFunction("steam_OnGameModeInit"," ");
}

enum CheckpointEnum
{
	Float:checkpoint_x,
	Float:checkpoint_y,
	Float:checkpoint_z,
	Float:checkpoint_size
}

enum IconEnum
{
	Float:icon_x,
	Float:icon_y,
	Float:icon_z,
	icon_markertype,
	icon_color
};

enum ObjectEnum
{
	object_model,
	Float:object_x,
	Float:object_y,
	Float:object_z,
	Float:object_rx,
	Float:object_ry,
	Float:object_rz
};

new Icon[STEAM_ICONS][IconEnum];
new Object[STEAM_OBJECTS][ObjectEnum];
new Checkpoint[STEAM_CHECKPOINTS][CheckpointEnum];
new CheckpointsToShow[MAX_PLAYERS][STEAM_CHECKPOINTS];


public CreateCheckpoint(Float:x,Float:y,Float:z,Float:size)
{
	static checkpoint_checkpointid;
	checkpoint_checkpointid++;
	Checkpoint[checkpoint_checkpointid][checkpoint_x] = x;
	Checkpoint[checkpoint_checkpointid][checkpoint_y] = y;
	Checkpoint[checkpoint_checkpointid][checkpoint_z] = z;
	Checkpoint[checkpoint_checkpointid][checkpoint_size] = size;
	return checkpoint_checkpointid;
}

public DestroyCheckpoint(checkpointid)
{
	Checkpoint[checkpointid][checkpoint_x] = 0;
	Checkpoint[checkpointid][checkpoint_y] = 0;
	Checkpoint[checkpointid][checkpoint_z] = 0;
	Checkpoint[checkpointid][checkpoint_size] = 0;
}

public ShowCheckpointForPlayer(playerid,checkpointid)
{
	CheckpointsToShow[playerid][checkpointid] = 1;
}

public HideCheckpointForPlayer(playerid,checkpointid)
{
	CheckpointsToShow[playerid][checkpointid] = 0;
}

public ShowCheckpointForAll(checkpointid)
{
	for(new i = 0;i < MAX_PLAYERS;i++) CheckpointsToShow[i][checkpointid] = 1;
}

public HideCheckpointForAll(checkpointid)
{
	for(new i = 0;i < MAX_PLAYERS;i++) CheckpointsToShow[i][checkpointid] = 0;
}

stock Float:distance(Float:x1,Float:y1,Float:z1,Float:x2,Float:y2,Float:z2)
{
	return Float:floatsqroot(floatpower(floatabs(floatsub(x2,x1)),2)+floatpower(floatabs(floatsub(y2,y1)),2)+floatpower(floatabs(floatsub(z2,z1)),2));
}

stock GetClosestCheckpoint(playerid,Float:x,Float:y,Float:z)
{
	new Float:closest = 9999.9999;
	new j = -1;
	for(new i = 0;i < STEAM_CHECKPOINTS;i++)
	{
	    if(CheckpointsToShow[playerid][i] == 1)
	    {
			if(distance(x,y,z,Checkpoint[i][checkpoint_x],Checkpoint[i][checkpoint_y],Checkpoint[i][checkpoint_z]) < closest)
			{
			    closest = distance(x,y,z,Checkpoint[i][checkpoint_x],Checkpoint[i][checkpoint_y],Checkpoint[i][checkpoint_z]);
			    j = i;
			}
		}
	}
	return j;
}

public AddStaticObject(model,Float:x,Float:y,Float:z,Float:rx,Float:ry,Float:rz)
{
	static object_objectid;
	if(object_objectid < STEAM_OBJECTS)
	{
		object_objectid++;
		Object[object_objectid][object_model] = model;
		Object[object_objectid][object_x] = x;
		Object[object_objectid][object_y] = y;
		Object[object_objectid][object_z] = z;
		Object[object_objectid][object_rx] = rx;
		Object[object_objectid][object_ry] = ry;
		Object[object_objectid][object_rz] = rz;
	}
}

public AddStaticIcon(Float:x,Float:y,Float:z,markertype,color)
{
	static icon_iconid;
	icon_iconid++;
	Icon[icon_iconid][icon_x] = x;
	Icon[icon_iconid][icon_y] = y;
	Icon[icon_iconid][icon_z] = z;
	Icon[icon_iconid][icon_markertype] = markertype;
	Icon[icon_iconid][icon_color] = color;
}
new ObjectID[MAX_OBJECTS];

new ObjectsShown[MAX_PLAYERS] = 0;
public Steamer()
{
	for(new i = 0;i < MAX_PLAYERS;i++)
	{
	    if(IsPlayerConnected(i))
	    {
	    	new Float:x,Float:y,Float:z;
	    	GetPlayerPos(i,x,y,z);
	    	
	    	// objects
			for(new j = 0; j < sizeof(Object);j++)
			{
			    if(j < STEAM_OBJECTS)
			    {
			    	if(distance(x,y,z,Object[j][object_x],Object[j][object_y],Object[j][object_z])<DRAW_DISTANCE_OBJECTS)
					{
					    if(ObjectsShown[i] < MAX_OBJECTS)
					    {
						    if(!IsValidPlayerObject(i,ObjectID[j]))
						    {
						    	ObjectsShown[i]+=1;
								ObjectID[j] = CreatePlayerObject(i,Object[j][object_model],Object[j][object_x],Object[j][object_y],Object[j][object_z],Object[j][object_rx],Object[j][object_ry],Object[j][object_rz]);
							}
						}
					}
					else
					{
					    if(IsValidPlayerObject(i,ObjectID[j]))
					    {
							DestroyPlayerObject(i,ObjectID[j]);
							ObjectID[j] = 0;
							ObjectsShown[i]-=1;
						}
					}
			    }
			}
			
			// map icons
	        for(new k = 0;k < 32;k++)RemovePlayerMapIcon(i,k);
	        new iid;
			for(new j = 0; j < sizeof(Icon);j++)
			{
			    if(j < STEAM_ICONS)
			    {
			    	if(distance(x,y,z,Icon[j][icon_x],Icon[j][icon_y],Icon[j][icon_z])<DRAW_DISTANCE_ICONS) SetPlayerMapIcon(i,iid++,Icon[j][icon_x],Icon[j][icon_y],Icon[j][icon_x],Icon[j][icon_markertype],0);
			    }
			}
			// checkpoints
			new checkpoint = GetClosestCheckpoint(i,x,y,z);
			if(checkpoint != -1) SetPlayerCheckpoint(i,Checkpoint[checkpoint][checkpoint_x],Checkpoint[checkpoint][checkpoint_y],Checkpoint[checkpoint][checkpoint_z],Checkpoint[checkpoint][checkpoint_size]);
	    }
	}
}
forward steam_OnGameModeInit();

#if defined callback
	#define callback_OnGameModeInit steam_OnGameModeInit
#else
	#define OnGameModeInit steam_OnGameModeInit
#endif
									/*        by Kapil  */
