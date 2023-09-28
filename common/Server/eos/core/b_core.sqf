if (!isServer) exitWith {};
private ["_fGroup", "_cargoType", "_vehType", "_CHside", "_mkrAgl", "_initialLaunch", "_pause", "_eosZone", "_hints", "_waves", "_aGroup", "_side", "_actCond", "_enemyFaction", "_mAH", "_mAN", "_distance", "_grp", "_cGroup", "_bGroup", "_CHType", "_time", "_timeout", "_faction"];

_mkr=(_this select 0);
_mPos=markerPos(_this select 0);_mkrX=getMarkerSize _mkr select 0;_mkrY=getMarkerSize _mkr select 1;_mkrAgl=markerDir _mkr;
_infantry=(_this select 1);
_PApatrols=_infantry select 0;_PAgroupSize=_infantry select 1;
_LVeh=(_this select 2);
_LVehGroups=_LVeh select 0;_LVgroupSize=_LVeh select 1;
_AVeh=(_this select 3);
_AVehGroups=_AVeh select 0;
_SVeh=(_this select 4);
_CHGroups=_SVeh select 0;_fSize=_SVeh select 1;
_settings=(_this select 5);
_faction=_settings select 0;_mA=_settings select 1;_side=_settings select 2;
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
_basSettings=(_this select 6);
_pause=_basSettings select 0;
_waves=_basSettings select 1;
_timeout=_basSettings select 2;
_eosZone=_basSettings select 3;
_hints=_basSettings select 4;
_initialLaunch= if (count _this > 7) then {
	_this select 7
} else {
	false
};

_Placement=(_mkrX + 500);

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

if (_side==east) then {
	_enemyFaction="east";
};
if (_side==west) then {
	_enemyFaction="west";
};
if (_side==independent) then {
	_enemyFaction="GUER";
};
if (_side==civilian) then {
	_enemyFaction="civ";
};

if isMultiplayer then {
	if (_heightLimit) then {
		_actCond="{
			vehicle _x in thisList && isPlayer _x && ((getPosATL _x) select 2) < 5
		} count playableunits > 0";
	} else {
		_actCond="{
			vehicle _x in thisList && isPlayer _x
		} count playableunits > 0";
	};
} else {
	if (_heightLimit) then {
		_actCond="{
			vehicle _x in thisList && isPlayer _x && ((getPosATL _x) select 2) < 5
		} count allUnits > 0";
	} else {
		_actCond="{
			vehicle _x in thisList && isPlayer _x
		} count allUnits > 0";
	};
};

_basActivated = createTrigger ["EmptyDetector", _mPos];
_basActivated setTriggerArea [_mkrX, _mkrY, _mkrAgl, false];
_basActivated setTriggerActivation ["ANY", "PRESENT", true];
_basActivated setTriggerStatements [_actCond, "", ""];

// _mkr setMarkerColor bastionColor;
// _mkr setMarkerAlpha _mAN;

// waitUntil {
	triggerActivated _basActivated
};

// _mkr setMarkerColor bastionColor;
// _mkr setMarkerAlpha _mAH;

// _bastActive = createTrigger ["EmptyDetector", _mPos];
// _bastActive setTriggerArea [_mkrX, _mkrY, _mkrAgl, false];
// _bastActive setTriggerActivation ["any", "PRESENT", true];
// _bastActive setTriggerTimeout [1, 1, 1, true];
// _bastActive setTriggerStatements [_actCond, "", ""];

// _bastClear = createTrigger ["EmptyDetector", _mPos];
// _bastClear setTriggerArea [(_mkrX+(_Placement*0.3)), (_mkrY+(_Placement*0.3)), _mkrAgl, false];
// _bastClear setTriggerActivation [_enemyFaction, "NOT PRESENT", true];
// _bastClear setTriggerStatements ["this", "", ""];

// PAUSE if REQUESTED
if (_pause > 0 and !_initialLaunch) then {
	for "_counter" from 1 to _pause do {
		if (_hints) then {
			hint format ["Attack ETA : %1", (_pause - _counter)];
		};
		sleep 1;
	};
};

// spawn PATROLS
_aGroup=[];
for "_counter" from 1 to _PApatrols do {
	_pos = [_mPos, _Placement, random 360] call BIS_fnc_relPos;
	_grp=[_pos, _PAgroupSize, _faction, _side, true] call EOS_fnc_spawngroup;
	_aGroup set [count _aGroup, _grp];
	if (_debug) then {
		diag_log (format ["Spawned Patrol: %1", _counter]);
		0= [_mkr, _counter, "patrol", getPos (leader _grp)] call EOS_debug
	};
};

// spawn LIGHT vehicles
_bGrp=[];
for "_counter" from 1 to _LVehGroups do {
	_newpos = [_mPos, (_Placement +200), random 360] call BIS_fnc_relPos;
	if (surfaceIsWater _newpos) then {
		_vehType=8;
		_cargoType=10;
	} else {
		_vehType=7;
		_cargoType=9;
	};

	_bGroup=[_newpos, _side, _faction, _vehType]call EOS_fnc_spawnvehicle;

	if ((_LVgroupSize select 0) > 0) then {
		0=[(_bGroup select 0), _LVgroupSize, (_bGroup select 2), _faction, _cargoType] call eos_fnc_setcargo;
	};

	0=[(_bGroup select 2), "LIGskill"] call eos_fnc_grouphandlers;
	_bGrp set [count _bGrp, _bGroup];
	if (_debug) then {
		diag_log format ["Light Vehicle:%1 - r%2", _counter, _LVehGroups];
		0= [_mkr, _counter, "Light Veh", (getPos leader (_bGroup select 2))] call EOS_debug
	};
};

// spawn ARMOURED vehicles
_cGrp=[];
for "_counter" from 1 to _AVehGroups do {
	_newpos = [_mPos, _Placement, random 360] call BIS_fnc_relPos;
	if (surfaceIsWater _newpos) then {
		_vehType=8;
	} else {
		_vehType=2;
	};
	_cGroup=[_newpos, _side, _faction, _vehType]call EOS_fnc_spawnvehicle;

	0=[(_cGroup select 2), "ARMskill"] call eos_fnc_grouphandlers;
	_cGrp set [count _cGrp, _cGroup];
	if (_debug) then {
		diag_log format ["Armoured:%1 - r%2", _counter, _AVehGroups];
		0= [_mkr, _counter, "Armour", (getPos leader (_cGroup select 2))] call EOS_debug
	};
};

// spawn HELICOPTERS
_fGrp=[];
for "_counter" from 1 to _CHGroups do {
	if ((_fSize select 0) > 0) then {
		_vehType=4
	} else {
		_vehType=3
	};
	_newpos = [(markerPos _mkr), 1500, random 360] call BIS_fnc_relPos;
	_fGroup=[_newpos, _side, _faction, _vehType, "fly"]call EOS_fnc_spawnvehicle;
	_CHside=_side;
	_fGrp set [count _fGrp, _fGroup];

	if ((_fSize select 0) > 0) then {
		_cargoGrp = createGroup _side;
		0=[(_fGroup select 0), _fSize, _cargoGrp, _faction, 9] call eos_fnc_setcargo;
		0=[_cargoGrp, "INFskill"] call eos_fnc_grouphandlers;

		_fGroup set [count _fGroup, _cargoGrp];
		null = [_mkr, _fGroup, _counter] execvm "Server\eos\functions\TransportUnload_fnc.sqf";
	} else {
		_wp1 = (_fGroup select 2) addWaypoint [(markerPos _mkr), 0];
		_wp1 setWaypointSpeed "FULL";
		_wp1 setWaypointType "SAD";
	};
	if (_debug) then {
		diag_log format ["Chopper:%1", _counter];
		0= [_mkr, _counter, "Chopper", (getPos leader (_fGroup select 2))] call EOS_debug
	};
};

// ADD waypoints
{
	_getToMarker = _x addWaypoint [_mPos, 0];
	_getToMarker setWaypointType "SAD";
	_getToMarker setWaypointSpeed "NORMAL";
	_getToMarker setWaypointBehaviour "AWARE";
	_getToMarker setWaypointFormation "NO CHANGE";
}forEach _aGroup;

{
	_getToMarker = (_x select 2) addWaypoint [_mPos, 0];
	_getToMarker setWaypointType "SAD";
	_getToMarker setWaypointSpeed "NORMAL";
	_getToMarker setWaypointBehaviour "AWARE";
	_getToMarker setWaypointFormation "NO CHANGE";
}forEach _cGrp;

{
	_pos = [_mPos, (_mkrX + 50), random 360] call BIS_fnc_relPos;
	_getToMarker = (_x select 2) addWaypoint [_pos, 0];
	_getToMarker setWaypointType "UNLOAD";
	_getToMarker setWaypointSpeed "NORMAL";
	_getToMarker setWaypointBehaviour "AWARE";
	_getToMarker setWaypointFormation "NO CHANGE";
	_wp = (_x select 2) addWaypoint [_mPos, 1];
	_wp setWaypointType "SAD";
	_wp setWaypointSpeed "NORMAL";
	_wp setWaypointBehaviour "AWARE";
	_wp setWaypointFormation "NO CHANGE";
}forEach _bGrp;

// waitUntil {
	triggerActivated _bastActive
};


for "_counter" from 1 to _timeout do {
	if (_hints) then {
		if (_waves > 1) then {
			hint format ["Next wave ETA : %1", (_timeout - _counter)];
		};
	};
	sleep 1;
	// if (!triggeractivated _bastActive || getmarkercolor _mkr == "colorblack") exitWith
	// {
		// hint "Zone lost. You must re-capture it";
		// _mkr setMarkerColor hostileColor;
		// _mkr setMarkerAlpha _mAN;

		// if (_eosZone) then {
			// null = [_mkr, [_PApatrols, _PAgroupSize], [_PApatrols, _PAgroupSize], [_LVehGroups, _LVgroupSize], [_AVehGroups, 0, 0, 0], [_faction, _mA, 350, _CHside]] execVM "Server\eos\core\EOS_Core.sqf";

			//
		};
		
		// _waves=0;
		//
	};
};

_waves=(_waves - 1);

// if (triggerActivated _bastActive and triggerActivated _bastClear and (_waves < 1)) then
// {
	// if (_hints) then {
		hint "Waves complete";
	};
	
	// _mkr setMarkerColor VictoryColor;
	// _mkr setMarkerAlpha _mAN;

	//
} else {
	if (_waves >= 1) then {
		if (_hints) then {
			hint "Reinforcements inbound";
		};
		null = [_mkr, [_PApatrols, _PAgroupSize], [_LVehGroups, _LVgroupSize], [_AVehGroups], [_CHGroups, _fSize], _settings, [_pause, _waves, _timeout, _eosZone, _hints], true] execVM "Server\eos\core\b_core.sqf";
	};
	//
};


// waitUntil {
	getmarkercolor _mkr == "colorblack" or getMarkerColor _mkr == VictoryColor or getMarkerColor _mkr == hostileColor or !triggerActivated _bastActive
};

// if (_debug) then {
	diag_log "delete units";
};

// {
	// {
		deleteVehicle _x
	} forEach units _x;
	
	//
}forEach _aGroup;


// if (count _cGrp > 0) then
// {
	// {
		_vehicle = _x select 0;
		
		// _crew = _x select 1;
		// _grp = _x select 2;
		// {
			deleteVehicle _x
		} forEach (_crew);
		
		// if (!(vehicle player == _vehicle)) then
		// {
			{
				deleteVehicle _x
			} forEach[_vehicle];
		};
		
		// {
			deleteVehicle _x
		} forEach units _grp;
		
		// deleteGroup _grp;
		//
	}forEach _cGrp;
	
	//
};


// if (count _bGrp > 0) then
// {
	// {
		_vehicle = _x select 0;
		
		// _crew = _x select 1;
		// _grp = _x select 2;
		// {
			deleteVehicle _x
		} forEach (_crew);
		
		// if (!(vehicle player == _vehicle)) then
		// {
			{
				deleteVehicle _x
			} forEach[_vehicle];
		};
		
		// {
			deleteVehicle _x
		} forEach units _grp;
		
		// deleteGroup _grp;
		//
	}forEach _bGrp;
	
	//
};


// // CACHE HELICOPTER TRANSPORT
// if (count _fGrp > 0) then
// {
	// {
		_vehicle = _x select 0;
		_crew = _x select 1;_grp = _x select 2; _cargoGrp = _x select 3;
		// {
			deleteVehicle _x
		} forEach (_crew);
		
		// if (!(vehicle player == _vehicle)) then {
			{
				deleteVehicle _x
			} forEach[_vehicle];
		};
		
		// {
			deleteVehicle _x
		} forEach units _grp;
		deleteGroup _grp;
		// {
			deleteVehicle _x
		} forEach units _cargoGrp;
		deleteGroup _cargoGrp;

		//
	}forEach _fGrp;
};


// deleteVehicle _bastActive;deleteVehicle _bastClear;deleteVehicle _basActivated;
// if (getmarkercolor _mkr == "colorblack") then {
	_mkr setMarkerAlpha 0;
};