waitUntil { isPlayer player };

if (hasInterface AND !isServer) then {
	private ["_cam","_camx","_camy","_camz","_object"];
	
	titleText ["Iron Fists welcome you to a different kind of War...", "BLACK IN",9999];

	playMusic "EventTrack01a_F_EPA";

	waituntil {!(isnull player)};
	sleep 1;
	
	_object = player;
	_camx = getposATL player select 0;
	_camy = getposATL player select 1;
	_camz = getposATL player select 2;
	
	_cam = "camera" CamCreate [_camx -500 ,_camy + 500,_camz+500];
	
	_cam CamSetTarget player;
	_cam CameraEffect ["Internal","Back"];
	_cam CamCommit 0;
	
	_cam camsetpos [_camx - 20 ,_camy + 20,_camz+5];
	_cam CamCommit 20;
	sleep 5;
	
	titleText ["Iron Fists welcome you to Resistance: Altis\nYour War, Your Way", "BLACK IN",20];
		
	sleep 15;
			
	_cam CameraEffect ["Terminate","Back"];
	CamDestroy _cam;

	waitUntil{!(isNil "BIS_fnc_init")};

	[str ("Resistance"), str(date select 1) + "." + str(date select 2) + "." + str(date select 0), str("Northwest Altis")] call BIS_fnc_infoText;

	sleep 5;

	playMusic "";

	titleText ["Please read the server rules billboard\nJoin our TeamSpeak 81.19.212.66.\nTeamwork is encouraged and essential to take each AO quickly.\nTask Force Radio's are used on this server but not needed.","PLAIN"]; sleep 15; titleFadeOut 2;

};
["InitializePlayer", [player]] call BIS_fnc_dynamicGroups;  