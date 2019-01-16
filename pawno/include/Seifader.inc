/*
							Seifader - Screen Fader by Seif
*/
/*x---------------------------------Important-------------------------------------x*/
//**INCLUDES**//
#include <a_samp>
//**PRAGMAS**//

//**MISC**//

/*x---------------------------------Defining-------------------------------------x*/
//**COLORS*//

	//Some colors I made
/*#define GREEN 			0x21DD00FF
#define RED 			0xE60000FF
#define ADMIN_RED 		0xFB0000FF
#define YELLOW 			0xFFFF00FF
#define ORANGE 			0xF97804FF
#define LIGHTRED 		0xFF8080FF
#define LIGHTBLUE 		0x00C2ECFF
#define PURPLE 			0xB360FDFF
#define BLUE 			0x1229FAFF
#define LIGHTGREEN 		0x38FF06FF
#define DARKPINK 		0xE100E1FF
#define DARKGREEN 		0x008040FF
#define ANNOUNCEMENT 	0x6AF7E1FF
#define GREY 			0xCECECEFF
#define PINK 			0xD52DFFFF
#define DARKGREY    	0x626262FF
#define AQUAGREEN   	0x03D687FF
#define WHITE 			0xFFFFFFFF*/
//**MISC**//

//**VARIABLES**//
new colorfade[MAX_PLAYERS];
new Text:screenfade[MAX_PLAYERS];
// **FORWARDS** //
forward ScreenFade(playerid, color, speed, maxalpha);
forward ScreenFadeColor(playerid, color, speed, maxalpha);
forward OnPlayerScreenFade(playerid, color, speed);
forward OnPlayerScreenColorFade(playerid, color, speed);
// **NATIVES** //
/*
	native Seifader_OnInit();
	native Seifader_OnExit();
	native FadePlayerScreen(playerid, color, speed, maxalpha);
	native FadePlayerScreenToColor(playerid, color, speed, maxalpha);
	native Seifader_OnPlayerDisconnect(playerid);
*/
/*x---------------------------------CallBacks-------------------------------------x*/
stock Seifader_OnInit()
{
    for(new all = 0; all < MAX_PLAYERS; all++)
	{
	    screenfade[all] = TextDrawCreate(0.0, 0.0, "_");
		TextDrawFont(screenfade[all], 1);
		TextDrawLetterSize(screenfade[all], 0.0, 50.0);
		TextDrawUseBox(screenfade[all], true);
		TextDrawColor(screenfade[all], 0);
		TextDrawBoxColor(screenfade[all], 0);
		colorfade[all] = 0;
	}
}

stock Seifader_OnExit()
{
    for(new all = 0; all < MAX_PLAYERS; all++) TextDrawDestroy(screenfade[all]);
}

stock Seifader_OnPlayerDisconnect(playerid)
{
	TextDrawHideForPlayer(playerid, screenfade[playerid]);
}

stock FadePlayerScreen(playerid, color, speed, maxalpha)
{
    colorfade[playerid] = color;
    TextDrawBoxColor(screenfade[playerid], color);
	TextDrawShowForPlayer(playerid, screenfade[playerid]);
	SetTimerEx("ScreenFade", 100, 0, "dddd", playerid, color, speed, maxalpha);
}

stock FadePlayerScreenToColor(playerid, color, speed, maxalpha)
{
	color -= maxalpha;
	colorfade[playerid] = color;
    TextDrawBoxColor(screenfade[playerid], color);
	TextDrawShowForPlayer(playerid, screenfade[playerid]);
	SetTimerEx("ScreenFadeColor", 100, 0, "dddd", playerid, color, speed, maxalpha);
}

public ScreenFade(playerid, color, speed, maxalpha)
{
	if (color <= (colorfade[playerid] - maxalpha))
	{
	    TextDrawHideForPlayer(playerid, screenfade[playerid]);
	    OnPlayerScreenFade(playerid, color, speed);
	}
	else
	{
		color -= speed;
		if (color <= (colorfade[playerid] - maxalpha)) color = (colorfade[playerid] - maxalpha);
		TextDrawBoxColor(screenfade[playerid], color);
		TextDrawShowForPlayer(playerid, screenfade[playerid]);
		SetTimerEx("ScreenFade", 100, 0, "dddd", playerid, color, speed, maxalpha);
 	}
}

public ScreenFadeColor(playerid, color, speed, maxalpha)
{
	if (color >= (colorfade[playerid] + maxalpha))
	{
	    OnPlayerScreenColorFade(playerid, color, speed);
	}
	else
	{
		color += speed;
		if (color >= (colorfade[playerid] + maxalpha)) return;
		TextDrawBoxColor(screenfade[playerid], color);
		TextDrawShowForPlayer(playerid, screenfade[playerid]);
		SetTimerEx("ScreenFadeColor", 100, 0, "dddd", playerid, color, speed, maxalpha);
 	}
}

/*public OnPlayerScreenFade(playerid, color, speed)
{
	return 1;
}

public OnPlayerScreenColorFade(playerid, color, speed)
{
	return 1;
}*/