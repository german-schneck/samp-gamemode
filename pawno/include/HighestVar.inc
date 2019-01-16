#include <a_samp>


stock FindHighestVariable(text[])
{
	new VariableName[MAX_PLAYER_NAME];
	new Highest;
	new CurrentID=0;
	do
	{
	    if(text[CurrentID] > Highest)
	    {
	        GetPlayerName(CurrentID, VariableName, sizeof(VariableName));
	        Highest = text[CurrentID];
	    }
	    CurrentID++;
	}
	while(CurrentID<MAX_PLAYERS);
	return VariableName;
}

stock FindHighestVariableValue(text[])
{
	new Highest;
	new CurrentID=0;
	do
	{
	    if(text[CurrentID] > Highest)
	    {
	        Highest = text[CurrentID];
	    }
	    CurrentID++;
	}
	while(CurrentID<MAX_PLAYERS);
	return Highest;
}

stock SetPlayerToPoint(playerid, Float:CoordsX[], Float:CoordsY[], Float:CoordsZ[], id)
{
	new pos = id;
	SetPlayerPos(playerid, Float:CoordsX[pos], Float:CoordsY[pos], Float:CoordsZ[pos]);
}

stock SetPlayerToPointID(playerid, id)
{
	SetPlayerPos(playerid, Float:CoordsX[id], Float:CoordsY[id], FloaT:CoordsZ[id]);
}