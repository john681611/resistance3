if (!isServer) exitWith {};
Bastion_Spawn = compile preprocessfilelinenumbers "Server\eos\core\b_launch.sqf";
private ["_newpos", "_cargoType", "_vehType", "_dGrp", "_gGrp", "_gGrps", "_mkrAgl", "_side", "_bGroup", "_civZone", "_fGrp", "_fSize", "_fGrps", "_eGrp", "_eGrps", "_dGrps", "_aMin", "_aSize", "_aGrps", "_aGrp", "_bMin", "_units", "_bSize", "_bGrps", "_bGrp", "_trig", "_cache", "_grp", "_crew", "_vehicle", "_actCond", "_mAN", "_mAH", "_distance", "_mA", "_settings", "_cGrp", "_cSize", "_cGrps", "_taken", "_clear", "_enemyFaction", "_faction", "_n", "_eosAct", "_eosActivated", "_debug", "_mkr", "_mPos", "_mkrX", "_mkrY", "_delay"];

_mkr=(_this select 0);
_mPos=markerPos(_this select 0);
_mkrX=getMarkerSize _mkr select 0;
_mkrY=getMarkerSize _mkr select 1;
_mkrAgl=markerDir _mkr;
_a=(_this select 1);
_aGrps=_a select 0;_aSize=_a select 1;_aMin=_aSize select 0;
_b=(_this select 2);
_bGrps=_b select 0;_bSize=_b select 1;_bMin=_bSize select 0;
_c=(_this select 3);
_cGrps=_c select 0;_cSize=_c select 1;
_d=(_this select 4);
_dGrps=_d select 0;_eGrps=_d select 1;_fGrps=_d select 2;_fSize=_d select 3;_gGrps = _d select 4;
_settings=(_this select 5);
_faction=_settings select 0;_mA=_settings select 1;_distance=_settings select 2;_side=_settings select 3;
_heightLimit=if (count _settings > 4) then {
	_settings select 4
} else {
	false
};
_debug=if (count _settings > 5) then {
	_settings select 5
} else {
	false
};
_cache= if (count _this > 6) then {
	_this select 6
} else {
	false
};

_renforced = false;

if (_side==east) then {
	_enemyFaction="east";
	_civZone=false;
};
if (_side==west) then {
	_enemyFaction="west";
	_civZone=false;
};
if (_side==independent) then {
	_enemyFaction="GUER";
	_civZone=false;
};
if (_side==civilian) then {
	_enemyFaction="civ";
	_civZone=true;
};

if (_mA==0) then {
	_mAH = 1;
	_mAN = 0.5;
};
if (_mA==1) then {
	_mAH = 0;
	_mAN = 0;
};
if (_mA==2) then {
	_mAH = 0.5;
	_mAN = 0.5;
};

// INITIATE ZONE
_trig=format ["EOSTrigger%1", _mkr];

if (!_cache) then {
	_eosActivated = createTrigger ["EmptyDetector", _mPos, false];
	_eosActivated setTriggerArea [(_distance+_mkrX), (_distance+_mkrY), _mkrAgl, false, 150];
	_eosActivated setTriggerActivation ["ANY", "PRESENT", true];

	server setVariable [_trig, _eosActivated];
} else {
	_eosActivated=server getVariable _trig;
};

_mkr setMarkerAlpha _mAN;
if (!(getMarkerColor _mkr == VictoryColor)) then // if MARKER IS GREEN do not CHANGE COLOUR
{
	_mkr setMarkerColor hostileColor;
};

waitUntil {
	count (allPlayers inAreaArray _eosActivated) > 0
};// WAIT UNTIL PLAYERS in ZONE
if (!(getmarkercolor _mkr == "colorblack")) then {
	if (!(getMarkerColor _mkr == VictoryColor)) then {
		_mkr setMarkerAlpha _mAH;
	};

	// spawn HOUSE PATROLS
	for "_counter" from 1 to _aGrps do {
		if (isnil "_aGrp") then {
			_aGrp=[];
		};
		if (_aMin > 0) then {
			_aGroup=[_mPos, _aSize, _faction, _side, false] call EOS_fnc_spawngroup;
			if (!surfaceIsWater _mPos) then {
				0=[_mPos, units _aGroup, _mkrX, 0, [0, 20], true, true] call shk_fnc_fillhouse;
				if (isClass(configfile >> "CfgPatches" >> "lambs_wp")) then {
					_p = [_mkr,true] call SHK_pos;
					[_aGroup, _mPos, _mkrX, [], true] call lambs_wp_fnc_taskGarrison;
				};
			} else {
				if (isClass(configfile >> "CfgPatches" >> "lambs_wp")) then {
					[_aGroup, _mPos, 250] call lambs_wp_fnc_taskPatrol;
				} else {
					0 = [_aGroup, _mkr] call EOS_fnc_taskpatrol;
				};
			};
			_aGrp set [count _aGrp, _aGroup];
			0=[_aGroup, "INFskill"] call eos_fnc_grouphandlers;
			if (_debug) then {
				diag_log (format ["Spawned House Patrol: %1", _counter]);
				0= [_mkr, _counter, "House Patrol", getPos (leader _aGroup)] call EOS_debug
			};
		};
	};

	// spawn PATROLS
	for "_counter" from 1 to _bGrps do {
		if (isnil "_bGrp") then {
			_bGrp=[];
		};
		if (_bMin > 0) then {
			_pos=[_mkr, 50] call EOS_fnc_findSafePos;
			_bGroup=[_pos, _bSize, _faction, _side, true] call EOS_fnc_spawngroup;
			if (isClass(configfile >> "CfgPatches" >> "lambs_wp")) then {
				[_bGroup, _pos, 250] call lambs_wp_fnc_taskPatrol;
			} else {
				0 = [_bGroup, _mkr] call EOS_fnc_taskpatrol;
			};
			_bGrp set [count _bGrp, _bGroup];

			0=[_bGroup, "INFskill"] call eos_fnc_grouphandlers;
			if (_debug) then {
				diag_log (format ["Spawned Patrol: %1", _counter]);
				0= [_mkr, _counter, "patrol", getPos (leader _bGroup)] call EOS_debug
			};
		};
		sleep 0.25;
	};

	// spawn LIGHT vehicles
	for "_counter" from 1 to _cGrps do {
		if (isnil "_cGrp") then {
			_cGrp=[];
		};

		_newpos=[_mkr, 100] call EOS_fnc_findSafePos;
		if (surfaceIsWater _newpos) then {
			_vehType=8;
			_cargoType=10;
		} else {
			_vehType=7;
			_cargoType=9;
		};

		_cGroup=[_newpos, _side, _faction, _vehType]call EOS_fnc_spawnvehicle;
		if ((_cSize select 0) > 0) then {
			0=[(_cGroup select 0), _cSize, (_cGroup select 2), _faction, _cargoType] call eos_fnc_setcargo;
		};

		0=[(_cGroup select 2), "LIGskill"] call eos_fnc_grouphandlers;
		if (isClass(configfile >> "CfgPatches" >> "lambs_wp")) then {
			[_cGroup select 2, _mPos, 400] call lambs_wp_fnc_taskPatrol;
		} else {
			0 = [(_cGroup select 2), _mkr] call EOS_fnc_taskpatrol;
		};
		_cGrp set [count _cGrp, _cGroup];

		if (_debug) then {
			diag_log format ["Light Vehicle:%1 - r%2", _counter, _cGrps];
			0= [_mkr, _counter, "Light Veh", (getPos leader (_cGroup select 2))] call EOS_debug
		};
		sleep 0.25;
	};

	// spawn ARMOURED vehicles
	for "_counter" from 1 to _dGrps do {
		if (isnil "_dGrp") then {
			_dGrp=[];
		};

		_newpos=[_mkr, 100] call EOS_fnc_findSafePos;
		if (surfaceIsWater _newpos) then {
			_vehType=8;
		} else {
			_vehType=2;
		};

		_dGroup=[_newpos, _side, _faction, _vehType]call EOS_fnc_spawnvehicle;
		0=[(_dGroup select 0), [4, 10], (_dGroup select 2), _faction, 9] call eos_fnc_setcargo;

		0=[(_dGroup select 2), "ARMskill"] call eos_fnc_grouphandlers;

		if (isClass(configfile >> "CfgPatches" >> "lambs_wp")) then {
			[_dGroup select 2, _mPos, 250] call lambs_wp_fnc_taskPatrol;
		} else {
			0 = [(_dGroup select 2), _mkr] call EOS_fnc_taskpatrol;
		};

		_dGrp set [count _dGrp, _dGroup];

		if (_debug) then {
			diag_log format ["Armoured:%1 - r%2", _counter, _dGrps];
			0= [_mkr, _counter, "Armour", (getPos leader (_dGroup select 2))] call EOS_debug
		};
		sleep 0.25;
	};

	// spawn STATIC PLACEMENTS
	for "_counter" from 1 to _eGrps do {
		if (surfaceIsWater _mPos) exitWith {};
		if (isnil "_eGrp") then {
			_eGrp=[];
		};

		_newpos=[_mkr, 50] call EOS_fnc_findSafePos;

		_eGroup=[_newpos, _side, _faction, 5]call EOS_fnc_spawnvehicle;
		0=[(_eGroup select 2), "STAskill"] call eos_fnc_grouphandlers;
		_eGrp set [count _eGrp, _eGroup];

		if (_debug) then {
			diag_log format ["Static:%1", _counter];
			0= [_mkr, _counter, "Static", (getPos leader (_eGroup select 2))] call EOS_debug
		};
		sleep 0.25;
	};

	// spawn CHOPPER
	for "_counter" from 1 to _fGrps do {
		if (isnil "_fGrp") then {
			_fGrp=[];
		};
		_vehType=3;
		_newpos=[_mkr, 200] call EOS_fnc_findSafePos;
		_fGroup=[_newpos, _side, _faction, _vehType, "fly"]call EOS_fnc_spawnvehicle;
		_fGrp set [count _fGrp, _fGroup];

		_wp1 = (_fGroup select 2) addWaypoint [(markerPos _mkr), 0];
		_wp1 setWaypointSpeed "FULL";
		_wp1 setWaypointType "SAD";
		0=[(_fGroup select 2), "AIRskill"] call eos_fnc_grouphandlers;

		if (_debug) then {
			diag_log format ["Chopper:%1", _counter];
			0= [_mkr, _counter, "Chopper", (getPos leader (_fGroup select 2))] call EOS_debug
		};
		sleep 0.25;
	};

	// spawn BOXS
	_boxMarkers = [];
	for "_counter" from 1 to _gGrps do {
		if (surfaceIsWater _mPos) exitWith {};
		if (isNil "_gGrp") then {
			_gGrp=[];
		};
		_newpos=[_mkr, 50] call EOS_fnc_findSafePos;

		_gGroup=[_newpos, _side, _faction, 11]call EOS_fnc_spawnvehicle;
		0=[_mPos, [(_gGroup select 0)], _mkrX, 0, [0, 20], true, true] call shk_fnc_fillhouse;
		_i = 0;
		while { (count nearestObjects [(_gGroup select 0), ["Man", "ReammoBox_F"], 1]) > 1 and _i <= 5 } do {
			0=[_mPos, [(_gGroup select 0)], _mkrX, 0, [0, 20], true, true] call shk_fnc_fillhouse;
			_i = _i + 1;
		};
		_bpos = getPos (_gGroup select 0);
		_bm = createMarker [format ["%1", _bpos ], _bpos];
		_bm setMarkerShape "ICON";
		_bm setMarkerType "mil_triangle";
		_bm setMarkerAlpha 0;
		_boxMarkers set [count _boxMarkers, [_bm, (_gGroup select 0)]];
		_gGrp set [count _gGrp, _gGroup];

		if (_debug) then {
			diag_log format ["Box:%1", _counter];
			0= [_mkr, _counter, "Box", (getPos leader (_gGroup select 2))] call EOS_debug
		};
		sleep 0.25;
	};

	// spawn ALT TRIGGERS
	_clear = createTrigger ["EmptyDetector", _mPos, false];
	_clear setTriggerArea [_mkrX, _mkrY, _mkrAgl, false, 50];
	_clear setTriggerActivation [_enemyFaction, "NOT PRESENT", true];
	_unitCount = 3;
	switch true do {
		case (_mkrX >= 350): {
			_unitCount = 10;
		};
		case (_mkrX >= 300): {
			_unitCount = 8;
		};
		case (_mkrX >= 250): {
			_unitCount = 5;
		};
		default {
			_unitCount = 3;
		};
	};
	_condition = format ["(count thislist - (('StaticWeapon' countType thislist) + ('UGV_02_Base_F' countType thislist))) <= %1 and
	('LandVehicle' countType thislist)- (('StaticWeapon' countType thislist) + ('UGV_02_Base_F' countType thislist)) == 0", _unitCount];
	_clear setTriggerStatements [_condition, "", ""];

	__renforcement = createTrigger ["EmptyDetector", _mPos, false];
	__renforcement setTriggerArea [_mkrX, _mkrY, _mkrAgl, false, 50];
	__renforcement setTriggerActivation [_enemyFaction, "NOT PRESENT", true];
	_unitCount = 12;
	switch true do {
		case (_mkrX >= 350): {
			_unitCount = 40;
		};
		case (_mkrX >= 300): {
			_unitCount = 32;
		};
		case (_mkrX >= 250): {
			_unitCount = 12;
		};
		default {
			_unitCount = 12;
		};
	};
	_condition = format ["(count thislist - (('StaticWeapon' countType thislist) + ('UGV_02_Base_F' countType thislist))) <= %1", _unitCount];
	__renforcement setTriggerStatements [_condition, "", ""];

	_eosAct=true;
	_delay = 300;
	while { sleep 5;
	_eosAct } do {
		// if player LEAVES THE AREA or ZONE DEACTIVATED
		if (count (allPlayers inAreaArray _eosActivated) == 0) then {
			_delay = _delay -5;
		} else {
			_delay = 300;
		};

		if (_delay <= 0) then {
			// CACHE LIGHT vehicles
			if (!isnil "_cGrp") then {
				{
					_vehicle = _x select 0;
					_crew = _x select 1;_grp = _x select 2;
					if (!alive _vehicle || {
						!alive _x
					} forEach _crew) then {
						_cGrps= _cGrps - 1;
					};
					{
						deleteVehicle _x
					} forEach (_crew);
					if (!(vehicle player == _vehicle) && _vehicle in list _eosActivated) then {
						{
							deleteVehicle _x
						} forEach[_vehicle];
					};
					{
						deleteVehicle _x
					} forEach units _grp;
					deleteGroup _grp;
				}forEach _cGrp;
				if (_debug) then {
					diag_log format ["ID:c%1", _cGrps];
				};
			};

			// CACHE ARMOURED vehicles
			if (!isnil "_dGrp") then {
				{
					_vehicle = _x select 0;
					_crew = _x select 1;_grp = _x select 2;
					if (!alive _vehicle || {
						!alive _x
					} forEach _crew) then {
						_dGrps= _dGrps - 1;
					};
					{
						deleteVehicle _x
					} forEach (_crew);
					if (!(vehicle player == _vehicle) && _vehicle in list _eosActivated) then {
						{
							deleteVehicle _x
						} forEach[_vehicle];
					};
					{
						deleteVehicle _x
					} forEach units _grp;
					deleteGroup _grp;
				}forEach _dGrp;
				if (_debug) then {
					diag_log format ["ID:c%1", _dGrps];
				};
			};

			// CACHE PATROL INFANTRY
			if (!isnil "_bGrp") then {
				{
					if ({
						!alive _x
					} forEach units _x) then {
						_bGrps= _bGrps - 1;
					};
					{
						deleteVehicle _x
					} forEach units _x;
					deleteGroup _x;
				}forEach _bGrp;
			};

			// CACHE HOUSE INFANTRY
			if (!isnil "_aGrp") then {
				{
					if ({
						!alive _x
					} forEach units _x) then {
						_aGrps= _aGrps - 1;
					};
					{
						deleteVehicle _x
					} forEach units _x;
					deleteGroup _x;
				}forEach _aGrp;
			};

			// CACHE MORTARS
			if (!isnil "_eGrp") then {
				{
					_vehicle = _x select 0;
					_crew = _x select 1;_grp = _x select 2;
					if (!alive _vehicle || {
						!alive _x
					} forEach _crew) then {
						_eGrps= _eGrps - 1;
					};
					{
						deleteVehicle _x
					} forEach (_crew);
					if ((!(vehicle player == _vehicle)) && _vehicle in list _eosActivated) then {
						{
							deleteVehicle _x
						} forEach[_vehicle];
					};
					{
						deleteVehicle _x
					} forEach units _grp;
					deleteGroup _grp;
				}forEach _eGrp;
			};

			// CACHE HELICOPTER TRANSPORT
			if (!isnil "_fGrp") then {
				{
					_vehicle = _x select 0;
					_crew = _x select 1;_grp = _x select 2; _cargoGrp = _x select 3;
					if (!alive _vehicle || {
						!alive _x
					} forEach _crew) then {
						_fGrps= _fGrps - 1;
					};
					{
						deleteVehicle _x
					} forEach (_crew);
					if (!(vehicle player == _vehicle) && _vehicle in list _eosActivated) then {
						{
							deleteVehicle _x
						} forEach[_vehicle];
					};
					{
						deleteVehicle _x
					} forEach units _grp;
					deleteGroup _grp;
					if (!isnil "_cargoGrp") then {
						{
							deleteVehicle _x
						} forEach units _cargoGrp;
						deleteGroup _cargoGrp;
					};
				}forEach _fGrp;
			};

			// CACHE BOX
			if (!isnil "_gGrp") then {
				{
					_vehicle = _x select 0;
					_crew = _x select 1;_grp = _x select 2;
					if (!alive _vehicle) then {
						_gGrps = _gGrps - 1;
					};
					if ((!(vehicle player == _vehicle)) && _vehicle in list _eosActivated) then {
						{
							deleteVehicle _x
						} forEach[_vehicle];
					};
				}forEach _gGrp;
				_boxMarkers = [];
			};
			_eosAct=false;
			_mkr setMarkerAlpha _mAN;
		} else {
			if (triggerActivated _clear && !_civZone && getMarkerColor _mkr != VictoryColor && (count (allPlayers inAreaArray _eosActivated) > 0)) then {
				_cGrps=0;
				_aGrps=0;_bGrps=0;_dGrps=0;_eGrps=0;_fGrps=0;_gGrps=0;
				// count Zone as clear and increase cleared count
				["TaskSucceeded", ["", "Zone Captured"]] remoteExec ["BIS_fnc_showNotification", 0];
				[]	execVM "Server\Zone_Complete.sqf";
				_mkr setMarkerColor VictoryColor;
				{
					if (alive (_x select 1)) then {
						(_x select 0) setMarkerAlpha 1;
					}
				} forEach _boxMarkers;
			} else {
				if (!triggerActivated _clear && getMarkerColor _mkr != hostileColor) then {
					["TaskFailed", ["", "Zone Lost"]] remoteExec ["BIS_fnc_showNotification", 0];
					_mkr setMarkerColor hostileColor;
					_mkr setMarkerAlpha _mAH;
					{
						(_x select 0) setMarkerAlpha 0;
					} forEach _boxMarkers;
				};
				if (!_renforced && !triggerActivated _clear && triggerActivated __renforcement && !_civZone && getMarkerColor _mkr != VictoryColor && (count (allPlayers inAreaArray _eosActivated) > 0)) then {
					_occures = 0;
					_rounds = 0;
					_rate = [180, 360] call BIS_fnc_randomInt;
					_vehicles = 0;
					_armour = 0;
					_helos = 0;

					switch true do {
						case (_mkrX >= 350): {
							_occures = [0, 1] call BIS_fnc_randomInt;
							_rounds = [1, 2] call BIS_fnc_randomInt;
							_vehicles = [2, 3] call BIS_fnc_randomInt;
							_armour = [0, 2] call BIS_fnc_randomInt;
							_helos = [0, 2] call BIS_fnc_randomInt;
						};
						case (_mkrX >= 300): {
							_occures = [0, 3] call BIS_fnc_randomInt;
							_rounds = [1, 2] call BIS_fnc_randomInt;
							_vehicles = [1, 2] call BIS_fnc_randomInt;
							_armour = [0, 1] call BIS_fnc_randomInt;
							_helos = [0, 1] call BIS_fnc_randomInt;
						};
						case (_mkrX >= 250): {};
						default {};
					};

					if (_occures == 1) then {
						null = [[_mkr], [0, 0], [2, 2], [2], [2, 2], [_faction, 0, _side], [30, _rounds, _rate, false, true]] call Bastion_Spawn;
					};
					_renforced = true;
				};
			};
		};
	};

	deleteVehicle _clear;
	{
		deleteMarker (_x select 0);
	} forEach _boxMarkers;
	{
		if (side _x == _side) then {
			deleteVehicle _x
		}
	} forEach list _eosActivated;

	if (!(getmarkercolor _mkr == "colorblack")) then {
		null = [_mkr, [_aGrps, _aSize], [_bGrps, _bSize], [_cGrps, _cSize], [_dGrps, _eGrps, _fGrps, _fSize, _gGrps], _settings, true] execVM "Server\eos\core\eos_core.sqf";
	} else {
		_Mkr setMarkerAlpha 0;
	};
};