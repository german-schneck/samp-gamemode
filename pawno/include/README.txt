MidoStream - Object Streamer - By MidoBan
------------------------------------------

MidoStream is my new object streamer. I decided making a new object streamer because any of the object streamers i found lacked lots of functions that are needed.
Therefore, many ppl used a streamer, and in addition, had some objects that aren't in the streamer.
The streamer has all the functions u need in order to manage all of your objects in it without exeptions.


The functions:
--------------

CreateStreamObject(modelid,Float:xpos,Float:ypos,Float:zpos,Float:xrot,Float:yrot,Float:zrot,Float:viewdist) - Create a streamed object
DestroyStreamObject(id) - Destroy a streamed object
GetStreamObjectPos(id,&Float:xpos,&Float:ypos,&Float:zpos) - Get the position of a streamed object
GetStreamObjectRot(id,&Float:xrot,&Float:yrot,&Float:zrot) - Get the rotation of a streamed object
SetStreamObjectPos(id,Float:xpos,Float:ypos,Float:zpos) - Set the position of a streamed object
SetStreamObjectRot(id,Float:xrot,Float:yrot,Float:zrot) - Set the rotation of a streamed object
AttachStreamObjectToPlayer(id,playerid,Float:xoff,Float:yoff,Float:zoff,Float:xrot,Float:yrot,Float:zrot) - Attach a streamed object to a player
MoveStreamObject(id2,Float:movx,Float:movy,Float:movz,Float:speed) - Move a streamed object
MidoStreamDisconnect(playerid) - Goes under OnPlayerDisconnect

Like CreateObject, the ID of the CreateStreamObject(...) can be also stored in a variable, for example:

new obj;
obj = CreateStreamObject(...);

Installation:
-------------

In order to use the the streamer, all you need to do is:

Place MidoStream.inc in your includes folder
Place MidoStream.pwn in your filterscripts folder
Compile MidoStream.pwn
Put MidoStream in your server.cfg
On The first script in your server.cfg or in a script where u have a working OnPlayerDisconnect function, put this:

public OnPlayerDisconnect(playerid,reason)
{
    MidoStreamDisconnect(playerid);
}

Thats it! now you can freely use all the functions above.