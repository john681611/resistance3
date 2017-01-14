postData = {
	_output = format ["Server cleaning. Server FPS: = %1. Groups: %2. Dead: %3", str diag_fps, count allgroups, count alldead];
	[_output, "SystemChat", true, false, true] call BIS_fnc_MP;
	diag_log _output;
};
cleanServer = {
	[] call postData;
	{deleteVehicle _x;} count allDead;
	{deleteVehicle _x;} count (allMissionObjects "CraterLong");
	{deleteVehicle _x;} count (allMissionObjects "WeaponHolder");
	{deleteVehicle _x;} count (allMissionObjects "GroundWeaponHolder");
	{deleteVehicle _x;} count (allMissionObjects "WeaponHolderSimulated");
	{if ((count units _x) == 0) then {deleteGroup _x;};} count allGroups;
	[] call postData;
};
publicVariable "cleanServer";

while {true} do {
	sleep 3600;
	Playercount = Count playableUnits;
	if (Playercount == 0) then {
		[] call cleanServer;
	};
};
