postData = {
	_output = format ["Cleaning Process. Server FPS: = %1. Groups: %2. Dead: %3", str diag_fps, count allgroups, count alldead];
	[_output] remoteExec ["SystemChat", -2];
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
	sleep 10;
	[] call postData;
};
publicVariable "cleanServer";


addMissionEventHandler ["PlayerDisconnected", {
	params ["_id", "_uid", "_name", "_jip", "_owner", "_idstr"];
	private _playercount = Count playableUnits;
	if (_playercount == 0) then {
		[] spawn cleanServer;
		_cleanServerBlocker = true;
	};
}];

