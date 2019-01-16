//==============================================================================
/*
				New vehicle's functions created by Martin_M
*/
//==============================================================================
new VehicleColor1[MAX_VEHICLES],VehicleColor2[MAX_VEHICLES],VehiclePaintjob[MAX_VEHICLES];

stock CreateStaticVehicle(modelID,Float:X,Float:Y,Float:Z,Float:F,color1,color2)
{
	new vehicleid = AddStaticVehicle(modelID,X,Y,Z,F,color1,color2);
	VehicleColor1[vehicleid] = color1;
	VehicleColor2[vehicleid] = color2;
	return vehicleid;
}

stock CreateStaticVehicleEx(modelID,Float:X,Float:Y,Float:Z,Float:F,color1,color2,respawnTime)
{
	new vehicleid = AddStaticVehicleEx(modelID,X,Y,Z,F,color1,color2,respawnTime);
	VehicleColor1[vehicleid] = color1;
	VehicleColor2[vehicleid] = color2;
	return vehicleid;
}

stock AddVehicle(modelID,Float:X,Float:Y,Float:Z,Float:F,color1,color2,respawnTime)
{
	new vehicleid = CreateVehicle(modelID,X,Y,Z,F,color1,color2,respawnTime);
	VehicleColor1[vehicleid] = color1;
	VehicleColor2[vehicleid] = color2;
	return vehicleid;
}

stock ChangeVehiclePaintjobEx(vehicleid,paintjobid) // By WackoX
{
    VehiclePaintjob[vehicleid] = paintjobid;
    ChangeVehiclePaintjob(vehicleid,paintjobid);
}

stock GetVehicleColor1(vehicleid)
{
	return VehicleColor1[vehicleid];
}

stock GetVehicleColor2(vehicleid)
{
	return VehicleColor2[vehicleid];
}

stock GetVehiclePaintjob(vehicleid) // By WackoX
{
	return VehiclePaintjob[vehicleid];
}
//==============================================================================