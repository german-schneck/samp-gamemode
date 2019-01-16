# San Andreas Multiplayer Gamemode


## A glimpse into the past:

About 8 and 9 years ago (when I was 13 and 14 years old) I developed some projects in a language called ``Pawn``. These projects were intended for game servers for San Andreas Roleplay.

I found these codes today, after having lost them during all that time and today I decided to share them so that people who are still developing this type of thing can take examples or ideas.

#### What is "Pawn"?

Pawn is a language developed by ITB CompuPhase in 1998. It is commonly used on platforms where anyone can add their own code.

Pawn source files are compiled to a binary file for better runtime. The Pawn compiler produces P-Code (or Bytecode) that runs on an abstract machine. The basis of Pawn's design and its respective interpreter are: Speed of execution, stability and simplicity.

#### "Hello World" in Pawn
```
main()
{
    print("¡Hola, mundo!");
}
```

#### Recurrent uses:
- The use of this language is common in servers and systems that allow the user to program their own code, as in the case of San Andreas Multiplayer, Half-Life, Counter-Strike and Vice City Multiplayer.

- WOWCube - writing application games for this game console, and its emulator.

- Pawn has also been used as a language for industrial controllers (PLC), as is the case with the StxLadder programming environment, which allows Pawn to be combined with the Ladder graphic language to make control logics, command electronic devices, read analogue inputs, relays, etc.

## About what's in this repository

### Game Scripts:

Inside the folder ``./gamemodes`` there are files. ``gm1.pwn`` and ``gm2.pwn``

These two files are different game modes, I've uploaded these of a large amount that I had as they are the most code they have created. (Between 12k and 20k lines of code)

Highlights:
- The scripts have a user system, in which by entering the password you can access the user's information. These users are registered in a .ini file in ``./scriptfiles/Res/Userdata/``.

- Vehicle purchase/sale system
- License plates for each vehicle in SQLite.
- System of purchase/sale of properties (businesses / houses)
- 7 Factions (Police, Medical, Government, Taxi Drivers, Journalists, Car / Airplane / Boat Instructors and Mechanics). `and in another one of the gamemodes there are more, including máfias.`
- Lottery System.
- Gasoline in each vehicle.
- Fines System
- Bridge in vehicles
- Drunk system
- Radio reception system (Satellites)
- Rent a car / motorbike
- Car modification system.
- Bank system, deposits and transfers.
- Anti-trap system.
- Fire extinguishing
-
... `and more (I don't count them because it's difficult for me after so many years)`

## Very important:
> These game modes were created in 2012 and 2013 so I don't know about any bugs.
>  
> So I would not personally recommend to be used by compelto. (or yes, but you will have to draw your conclusions).


## How to run?
> **IMPORTANT:** Before you start you should make sure that there is a `.amx` file within gamemodes. (These are obtained only by compiling the `.pwn` file)
>

#### Steps:
- First, you must tell the executable which game mode you want to run. To do this you have to edit the file ``server.cfg``
- Once you have the first step completed. Just run ``samp-server.exe`` if you are a Windows user.

**Note: *If you want to run this on GNU/Linux, you can do so by downloading the server directed to this platform on its official website.*** (Information below).

#### Configuration:
- **rcon_password** - Admin password.
- **password** - Server password (default: test)
- **maxplayers** - Max users of the server. (default: 500)
- **port** - Listener port of your server.
- **gamemode0** - Game mode, here you should enter the name of your gamemode (default: gm1)
- **announce** - Indicate with a 0 if you want your server to be private and 1 if you want it to be public.
- **plugins** - Server plugins, I recommend not to edit this line if you don't know what it is.
- **maxnpc** - Enter the number of NPC bots allowed. By default it is set to 0 because there are no bots in these gamemodes.
- **weburl** - Here you indicate the url of your web, in this case is 127.0.0.1.

## To compile:

### Windows:
Inside the repository there is a folder called ``pawno`` and inside it there is an executed one called ``pawno.exe``

This is the IDE specialized in this language and already brings with it the compiler.

### GNU/Linux (and Mac):
You will need to use some alternative IDE to the one mentioned above.

Here are some that might interest you.

**QuickPawn (Editor + Compiler)**
[http://www.em-creations.co.uk/downloads/](https://)

**CodeBlocks (Only editor)**
[http://www.codeblocks.org/](https://)

**Visual Studio Code**
There's also an extension for VSCode, which I haven't used but it wouldn't be wrong to try.
[https://marketplace.visualstudio.com/items?itemName=southclaws.vscode-pawn](https://)

## Links

**San Andreas Multiplayer**

- Website:
[https://www.sa-mp.com/](https://)

- Download:
[https://www.sa-mp.com/download](https://)

- **Official** Forum:
[https://forum.sa-mp.com/index.php](https://)

- Spanish Forum
[https://pawnscript.com/foro/](https://)

**Grand Theft Auto SA - Official website**
[http://www.rockstargames.com/sanandreas/](https://)

**Pawn Official Website**
[https://www.compuphase.com/pawn/pawn.htm](https://)
