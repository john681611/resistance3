// Written by Patxitron [UTUM]
// Based on =BTC=_revive scripts by =BTC= Giallustio
// Player tags based on namedisplay script for Arma 2 by Marker and Melbo.
//
// This script allows a vehicle to be a mobile supplies and repair base that rearms, refuels, and repairs other vehicles.
// In order to do the action, both the mobile supplies and the resupply objetive must be stopped and landed. When action
// menu is selected (driver) it drains all fuel, repairs, rearms, and refuels.
//
// The mobile supplies vehicles are organized by sides (blufor, opfor, guerrilla and civilians). One mobile supplies vehicle
// can repair, rearm and refuel any vehicle of any side, but in the map, only the mobile supplies vehicles of your own
// side are shown.
//
// How to use it:
//
// * Place the following line in the init.sqf file:
// call compile preprocessFile "core\scripts\mobile_supplies_init.sqf";
//
// * Edit your mission and give a name to each vehicle you want to be a mobile supplies vehicle.
//
// * Edit the file "Patxitron_MobileSupplies\mobile_supplies_init.sqf" and fill in the arrays with the names
// of the mobile supplies vehicles of each side.
//


////////////////// EDITABLE \\\\\\\\\\\\\\\\\\\\\\\\\\
PTXTRN_MBSP_respawn = 30; // value <= 0 do not respawn destroyed mobile supplies vehicles, value = n -> where n > 0, respawn destroyed mobile supplies vehicles after n seconds.

PTXTRN_MBSP_teleport_west = [base,base2]; // List of objects that allow teleporting to the mobile supplies in the blufor side.
PTXTRN_MBSP_teleport_east = []; // List of vehicles that allow teleporting to the mobile supplies in the opfor side.
PTXTRN_MBSP_teleport_guer = []; // List of vehicles that allow teleporting to the mobile supplies in the guerrilla side.
PTXTRN_MBSP_teleport_civ = []; // List of vehicles that allow teleporting to the mobile supplies in the civilian side.

PTXTRN_MBSP_msveh_west = [Supplies_0,Supplies_1]; // List of vehicles that will be mobile supplies in the blufor side.
PTXTRN_MBSP_msveh_east = []; // List of vehicles that will be mobile supplies in the opfor side.
PTXTRN_MBSP_msveh_guer = []; // List of vehicles that will be mobile supplies in the guerrilla side.
PTXTRN_MBSP_msveh_civ = []; // List of vehicles that will be mobile supplies in the civilian side.

PTXTRN_show_player_tag = 150; // Show a tag with targeted player info if distance is less than specified. Set it to 0 to disable.
PTXTRN_show_player_marker = 300; // Show a marker in map with own group's players names if distance is less than specified. Set it to 0 to disable.

////////////////// Don't edit below \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

call compile preprocessFile "core\scripts\mobile_repair_functions.sqf";

if(isServer) then {
	if(0 < count PTXTRN_MBSP_msveh_west) then {
		_side = PTXTRN_MBSP_msveh_west call PTXTRN_MBSP_msveh_Set_Server;
	};
	if(0 < count PTXTRN_MBSP_msveh_east) then {
		_side = PTXTRN_MBSP_msveh_east call PTXTRN_MBSP_msveh_Set_Server;
	};
	if(0 < count PTXTRN_MBSP_msveh_guer) then {
		_side = PTXTRN_MBSP_msveh_guer call PTXTRN_MBSP_msveh_Set_Server;
	};
	if(0 < count PTXTRN_MBSP_msveh_civ) then {
		_side = PTXTRN_MBSP_msveh_civ call PTXTRN_MBSP_msveh_Set_Server;
	};
}; // if(isServer)
	

//Init
[] spawn {
	waitUntil {!isNull player};
	waitUntil {player == player};
	PTXTRN_MBSP_side = playerSide;
	PTXTRN_MBSP_side_vehicles = [];
	_side_teleports = [];
	switch (true) do {
		case (PTXTRN_MBSP_side == west) : {
			PTXTRN_MBSP_side_vehicles = PTXTRN_MBSP_msveh_west;
			_side_teleports = PTXTRN_MBSP_teleport_west;
		};
		case (PTXTRN_MBSP_side == east) : {
			PTXTRN_MBSP_side_vehicles = PTXTRN_MBSP_msveh_east;
			_side_teleports = PTXTRN_MBSP_teleport_west;
		};
		case (str (PTXTRN_MBSP_side) == "guer") : {
			PTXTRN_MBSP_side_vehicles = PTXTRN_MBSP_msveh_guer;
			_side_teleports = PTXTRN_MBSP_teleport_guer;
		};
		case (PTXTRN_MBSP_side == civilian) : {
			PTXTRN_MBSP_side_vehicles = PTXTRN_MBSP_msveh_civ;
			_side_teleports = PTXTRN_MBSP_teleport_civ;
		};
	};
	{
		private ["_veh_name", "_spawn"];
		_veh_name = str(_x);
		_x call PTXTRN_MBSP_msveh_Provisional_Set_Loadout;
		_spawn = [_x, _veh_name] spawn PTXTRN_MBSP_msveh_marker;
		{
			_x addAction [("<t color=""#ED2744"">") + ("Teleport to " + _veh_name) + "</t>", {[_this select 1, _this select 3] call PTXTRN_MBSP_msveh_teleport}, _veh_name];
		} foreach _side_teleports;
	} foreach PTXTRN_MBSP_side_vehicles;
	if(PTXTRN_show_player_tag > 0) then {_markers = [PTXTRN_show_player_tag] spawn PTXTRN_Player_Tag;};
	if(PTXTRN_show_player_marker > 0) then {
		player addEventHandler ["killed", {[[name player], "PTXTRN_Player_Delete_Marker", playableUnits, false] spawn BIS_fnc_MP;}];
		_markers = [PTXTRN_show_player_marker] spawn PTXTRN_Player_Marker;
	};
}; // spawn

if(true) exitWith {};
