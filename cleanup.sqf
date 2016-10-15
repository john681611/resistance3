if (!isServer) exitWith {};
ServerClean = 0;
publicVariable "ServerClean";
//Auto cleaning
If ((isMultiplayer) && (isDedicated)) then {
	[] execVM "cleanupAuto.sqf";
};
//Actioned Clean server
while {true} do {
	sleep 1;
	ServerFPS = str diag_fps;
	groupNum = count allgroups;
	deadNum = count alldead;
	publicVariable "ServerFPS";
	publicVariable "groupNum";
	publicVariable "deadNum";
	waitUntil {ServerClean == 1};
		sleep 1;
		{deleteVehicle _x;} count allDead;
		{deleteVehicle _x;} count (allMissionObjects "CraterLong");
		{deleteVehicle _x;} count (allMissionObjects "WeaponHolder");
		{deleteVehicle _x;} count (allMissionObjects "GroundWeaponHolder");
		{deleteVehicle _x;} count (allMissionObjects "WeaponHolderSimulated");
		{if ((count units _x) == 0) then {deleteGroup _x;};} count allGroups;
		sleep 3;
		ServerFPS = str diag_fps;
		groupNum = count allgroups;
		deadNum = count alldead;
		publicVariable "ServerFPS";
		publicVariable "groupNum";
		publicVariable "deadNum";
		ServerCleaned = 1;
		publicVariable "ServerCleaned";
		diag_log format ["Server cleaned. Server FPS: = %1. Groups: %2. Dead: %3", ServerFPS, groupNum, deadNum];
		ServerClean = 0;
		publicVariable "ServerClean";
};