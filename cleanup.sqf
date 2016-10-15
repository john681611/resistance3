private ["_canDeleteGroup","_group","_groups","_units"];

while {true} do {
	sleep 4200 + (random 1000);
	{deleteVehicle _x;} count allDead;
	sleep 1;
	{deleteVehicle _x;} count (allMissionObjects "CraterLong");
	sleep 1;
	{deleteVehicle _x;} count (allMissionObjects "WeaponHolder");
	sleep 1;
	{deleteVehicle _x;} count (allMissionObjects "GroundWeaponHolder");
	sleep 1;
	{deleteVehicle _x;} count (allMissionObjects "WeaponHolderSimulated");
	sleep 1;
	{if ((count units _x) == 0) then {deleteGroup _x;};} count allGroups;
};
