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
// call compile preprocessFile "Patxitron_MobileSupplies\mobile_supplies_init.sqf";
//
// * Edit your mission and give a name to each vehicle you want to be a mobile supplies vehicle.
//
// * Edit the file "Patxitron_MobileSupplies\mobile_supplies_init.sqf" and fill in the arrays with the names
// of the mobile supplies vehicles of each side.
//



PTXTRN_MBSP_msveh_Provisional_Set_Loadout = {
	_veh = _this;
	clearItemCargo _veh;
	clearMagazineCargo _veh;
	clearWeaponCargo _veh;
	_veh addMagazineCargoGlobal  ["30Rnd_556x45_Stanag", 30];
	_veh addMagazineCargoGlobal  ["9Rnd_45ACP_Mag", 15];
	_veh addMagazineCargoGlobal  ["RPG32_F", 5];
	_veh addItemCargoGlobal  ["FirstAidKit", 20];
	_veh addMagazineCargoGlobal  ["SmokeShell", 5];
	_veh addMagazineCargoGlobal  ["SmokeShellRed", 5];
	_veh addMagazineCargoGlobal  ["SmokeShellGreen", 5];
	_veh addMagazineCargoGlobal  ["handgrenade", 40];
};

PTXTRN_MBSP_msveh_Rearm = {
	_target = _this select 0;
	_supplier = _this select 1;
	//_type = (getDescription _target) select 0;
	_type = typeOf _target;
	if(!alive _target) exitWith{};
	if(local _target) then {
		_target setFuel 0;
		_target VehicleChat "Repairing ...";
	};
	if(local _supplier) then {
		_supplier VehicleChat format ["Repairing %1...", _type];
	};
	if(local _supplier || local _target) then {
		sleep 15;
	};
	if(local _target) then {
		_target setDammage 0;
		_target VehicleChat "Rearming ...";
		_target setObjectTextureGlobal [0,"ambience\modules\images\fia_camo.paa"];
	};
	if(local _supplier) then {
		_supplier VehicleChat format ["Rearming %1...", _type];
	};
	if(local _supplier || local _target) then {
		sleep 10;
	};
	if(local _target) then {
		_target setVehicleAmmo 1;
		_target VehicleChat "Refuelling ...";
		_target setObjectTextureGlobal [1,"ambience\modules\images\fia_camo.paa"];
	};
	if(local _supplier) then {
		_supplier VehicleChat format ["Refuelling %1...", _type];
	};
	if(local _supplier || local _target) then {
		sleep 5;
	};
	if(local _target) then {
		_target setFuel 1;
		_target VehicleChat "Finished.";
		_target setObjectTextureGlobal [2,"ambience\modules\images\fia_camo.paa"];
	};
	if(local _supplier) then {
		_supplier VehicleChat format ["Finished %1.", _type];
	};
	if(true) exitWith{};
};



PTXTRN_MBSP_msveh_marker = {
	_veh = _this select 0;
	_veh_name = _this select 1;
	_marker = format ["%1_marker", _veh_name];
	_veh addAction [
		"<t color='#11ff11'>Resupply and repair</t>",
		{
			[
				[vehicle (_this select 1), _this select 0],
				"PTXTRN_MBSP_msveh_Rearm",
				nil,
				false
			] spawn BIS_fnc_MP
		},
		[],
		10,
		true,
		true,
		"",
		"_this != (vehicle _this) &&  _this == driver (vehicle _this) && (vehicle _this) != _target && speed _target <= 5 && speed _target >= -3 && speed (vehicle _this) <= 5 && speed (vehicle _this) >= -3 && (getPos (vehicle _this)) select 2 <= 2 && (getPos _target) select 2 <= 2"
	];
	deleteMarkerLocal _marker;
	createmarkerLocal [_marker, getPos _veh];
	_marker setmarkertypeLocal "mil_dot";
	_marker setMarkerTextLocal format ["%1", _veh_name];
	_marker setmarkerColorlocal "ColorGreen";
	_marker setMarkerSizeLocal [0.5, 0.5];
	hint format ["%1 is available!", _veh_name];
	while {Alive _veh} do {
		_pos = getPos _veh;
		_marker setMarkerPosLocal _pos;
		{
			if(!(_x getVariable ["has_resupply_action", false])) then {
				_x addAction [
					"<t color='#11ff11'>Resupply and repair</t>",
					{
						[
							[_this select 0, vehicle (_this select 1)],
							"PTXTRN_MBSP_msveh_Rearm",
							nil,
							false
						] spawn BIS_fnc_MP
					},
					[],
					10,
					true,
					true,
					"",
					"_this != (vehicle _this) &&  _this == driver (vehicle _this) && (vehicle _this) != _target && ((vehicle _this) getVariable ['PTXTRN_MBSP_Vehicle_name', '']) != '' && speed _target <= 5 && speed _target >= -3 && speed (vehicle _this) <= 5 && speed (vehicle _this) >= -3 && (getPos (vehicle _this)) select 2 <= 2 && (getPos _target) select 2 <= 2"
				];
				_x setVariable ["has_resupply_action", true];
			};
		} foreach (_pos nearObjects 50);
		if (speed _veh <= 5 && speed _veh >= -3) then {
			_marker setMarkerTextLocal format ["%1 deployed", _veh_name];
			_marker setmarkerColorlocal "ColorGreen";
		} else {
			_marker setMarkerTextLocal format ["%1 is moving", _veh_name];
			_marker setmarkerColorlocal "ColorBlack";
		};
		sleep 2;
	};
	hint format ["%1 has been destroyed!", _veh_name];
	_marker setMarkerTextLocal format ["%1 destroyed!", _veh_name];
	_marker setmarkerColorlocal "ColorRed";
	if(true) exitWith{};
};



PTXTRN_MBSP_msveh_client_respawn = {
	_veh  = _this select 0;
	_name = _this select 1;
	_found = -1;
	for "_i" from 0 to ((count PTXTRN_MBSP_side_vehicles) - 1) do {
		if (-1 == _found && _name == (PTXTRN_MBSP_side_vehicles select _i) getVariable "PTXTRN_MBSP_Vehicle_name") then {
			_found = _i;
		};
	};
	if (-1 != _found) then {
		PTXTRN_MBSP_side_vehicles set [_found, _veh];
	} else {
		PTXTRN_MBSP_side_vehicles set [count PTXTRN_MBSP_side_vehicles, _veh];
	};
	_veh setVariable ["PTXTRN_MBSP_Vehicle_name", _name];
	_veh call PTXTRN_MBSP_msveh_Provisional_Set_Loadout;
	_spawn = [_veh, _name] spawn PTXTRN_MBSP_msveh_marker;
};



PTXTRN_MBSP_msveh_respawn = {
	_veh  = _this select 0;
	_var  = _this select 1;
	_type = typeOf _veh;
	waitUntil {sleep 2; !Alive _veh};
	_dir  = getDir _veh;
	_pos  = getPos _veh;
	sleep PTXTRN_MBSP_respawn;
	deleteVehicle _veh;
	_veh = createVehicle [_type, (_pos findEmptyPosition [1, 500, _type]), [], 0, "NONE"];
	_veh setDir _dir;
	_veh setVelocity [0, 0, -1];
	[[_veh, _var], "PTXTRN_MBSP_msveh_client_respawn", nil, false] spawn BIS_fnc_MP;
	_resp = [_veh, _var] spawn PTXTRN_MBSP_msveh_respawn;
	//_veh setPos _pos;
	if(true) exitWith{};
};



PTXTRN_MBSP_msveh_teleport = {
	_unit = _this select 0;
	_who = _unit;
	_var = _this select 1;
	_veh = objNull;
	_unit_veh = vehicle _unit;
	if(_unit_veh != _unit) then {
		if(_unit == driver _unit_veh) then {
			_who = _unit_veh;
		};
	};
	while {isNull _veh} do {
		{if(format ["%1", _x getVariable "PTXTRN_MBSP_Vehicle_name"] == _var && Alive _x) then {_veh = _x;};} foreach PTXTRN_MBSP_side_vehicles;
		sleep 1;
	};
	if(!Alive _veh) then {
		_unit sideChat "Can not teleport. The spawn point is destroyed";
	} else {
		if(speed _veh <= 5 && speed _veh >= -3) then {
			_who setPos ((getPos _veh) findEmptyPosition [10, 300]);
		} else {
			_unit sideChat "Can not teleport. The spawn point is moving. Wait until it stops";
		};
	};
	if(true) exitWith{};
};



PTXTRN_MBSP_msveh_Set_Server = {
	{
		private ["_veh_name"];
		_veh_name = str (_x);
		_x setVariable ["PTXTRN_MBSP_Vehicle_name", _veh_name, true];
		if(0 < PTXTRN_MBSP_respawn) then {
			_resp = [_x, _veh_name] spawn PTXTRN_MBSP_msveh_respawn;
		};
	} foreach _this;
	if(true) exitWith{};
};



PTXTRN_Player_Tag = {
	_refresh = 0.5;
	_distance = _this select 0;
	while {true} do {
   // PLAYER NAME CHECK AND DISPLAY
        _target = cursorTarget;
        if (_target isKindOf "Man" && player == vehicle player) then{
			if((side _target == playerSide) && (player distance _target) < _distance) then {
				_weaponsplayer = weapons _target;
				_name = name _target;
				_nameString = "<t size='0.5' shadow='2' color='#7FFF00'>" + format['%1 %2',_target getVariable ['unitname', name _target]] + "</t>";
				_weaponsplayer =  _weaponsplayer select 0;
				_weaponsplayername = getText (configFile >> "CfgWeapons" >> _weaponsplayer >> "displayname");
				_weaponspic = getText (configFile >> "CfgWeapons" >> _weaponsplayer >> "picture");
				_rank = [_target,"displayNameShort"] call BIS_fnc_rankParams;
	// PRINT THE RANK/NAME/WEAPON ONSCREEN
				_nameString = format ["<t size='0.5' color='#f0e68c'>%4. </t><t size='0.5' color='#f0e68c'>%1</t><br/><t size='0.5' color='#f0e68c'>%2</t><br/><img size='0.8' image='%3'/><br/>",_name, _weaponsplayername,_weaponspic,_rank];
				[_nameString,0.5,0.9,_refresh,0,0,3] spawn bis_fnc_dynamicText;

			};
		};
		sleep _refresh;
	};
};



PTXTRN_Player_Marker = {
	_refresh = 1.5;
	_distance = _this select 0;
	while {true} do {
		{
			if(_x != player && (group player) == (group _x)) then {
				private ["_name", "_marker"];
				_name = name _x;
				_marker = format ["%1_player_marker", _name];
				deleteMarkerLocal _marker;
				if(Alive _x && (player distance _x) < _distance) then {
					createmarkerLocal [_marker, getPos _x];
					_marker setmarkertypeLocal "mil_dot";
					_marker setMarkerTextLocal format ["%1", _name];
					_marker setmarkerColorlocal "ColorBlue";
					_marker setMarkerSizeLocal [0.5, 0.5];
				};
			};
			sleep 0.1;
		} foreach playableUnits;
		sleep _refresh;
	};
};



PTXTRN_Player_Delete_Marker = {
	_name = _this select 0;
	_marker = format ["%1_player_marker", _name];
	deleteMarkerLocal _marker;
};
