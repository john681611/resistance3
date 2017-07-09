if (!isServer) exitWith {};
private ["_newpos","_cargoType","_vehType","_dGrp","_gGrp","_gGrps","_mkrAgl","_side","_bGroup","_civZone","_fGrp","_fSize","_fGrps","_eGrp","_eGrps","_dGrps","_aMin","_aSize","_aGrps","_aGrp","_bMin","_units","_bSize","_bGrps","_bGrp","_trig","_cache","_grp","_crew","_vehicle","_actCond","_mAN","_mAH","_distance","_mA","_settings","_cGrp","_cSize","_cGrps","_taken","_clear","_enemyFaction","_faction","_n","_eosAct","_eosActivated","_debug","_mkr","_mPos","_mkrX","_mkrY"];

_mkr=(_this select 0);_mPos=markerpos(_this select 0);
_mkrX=getMarkerSize _mkr select 0;
_mkrY=getMarkerSize _mkr select 1;
_mkrAgl=markerDir _mkr;
_a=(_this select 1);_aGrps=_a select 0;_aSize=_a select 1;_aMin=_aSize select 0;
_b=(_this select 2);_bGrps=_b select 0;_bSize=_b select 1;_bMin=_bSize select 0;
_c=(_this select 3);_cGrps=_c select 0;_cSize=_c select 1;
_d=(_this select 4);_dGrps=_d select 0;_eGrps=_d select 1;_fGrps=_d select 2;_fSize=_d select 3;_gGrps =  _d select 4;
_settings=(_this select 5);_faction=_settings select 0;_mA=_settings select 1;_distance=_settings select 2;_side=_settings select 3;
_heightLimit=if (count _settings > 4) then {_settings select 4} else {false};
_debug=if (count _settings > 5) then {_settings select 5} else {false};
_cache= if (count _this > 6) then {_this select 6} else {false};




	if (_side==EAST) then {_enemyFaction="east";_civZone=false;};
	if (_side==WEST) then {_enemyFaction="west";_civZone=false;};
	if (_side==INDEPENDENT) then {_enemyFaction="GUER";_civZone=false;};
	if (_side==CIVILIAN) then {_enemyFaction="civ";_civZone=true;};

	if (_mA==0) then {_mAH = 1;_mAN = 0.5;};
	if (_mA==1) then {_mAH = 0;_mAN = 0;};
	if (_mA==2) then {_mAH = 0.5;_mAN = 0.5;};

// INITIATE ZONE
_trig=format ["EOSTrigger%1",_mkr];

if (!_cache) then {
		_eosActivated = createTrigger ["EmptyDetector",_mPos];
		_eosActivated setTriggerArea [(_distance+_mkrX),(_distance+_mkrY),_mkrAgl,FALSE,50];
		_eosActivated setTriggerActivation ["ANYPLAYER","PRESENT",true];
		_eosActivated setTriggerTimeout [5, 5, 5, true];
		_eosActivated setTriggerStatements ["this", "", ""];


			server setvariable [_trig,_eosActivated];
					}else{
				_eosActivated=server getvariable _trig;
					};

					_mkr setmarkerAlpha _mAN;
						if (!(getmarkercolor _mkr == VictoryColor)) then 	//IF MARKER IS GREEN DO NOT CHANGE COLOUR
							{
						_mkr setmarkercolor hostileColor;
							};

waituntil {triggeractivated _eosActivated};	//WAIT UNTIL PLAYERS IN ZONE
if (!(getmarkercolor _mkr == "colorblack"))then {
	if (!(getmarkercolor _mkr == VictoryColor)) then {_mkr setmarkerAlpha _mAH;};

// SPAWN HOUSE PATROLS
	for "_counter" from 1 to _aGrps do {
	if (isnil "_aGrp") then {_aGrp=[];};
		if (_cache) then {
				_cacheGrp=format ["HP%1",_counter];
				_units=_eosActivated getvariable _cacheGrp;
						_aSize=[_units,_units];
						_aMin=_aSize select 0;
							if (_debug)then{diag_log format ["ID:%1,restore - %2",_cacheGrp,_units];};
							};
								if (_aMin > 0) then {
										_aGroup=[_mPos,_aSize,_faction,_side,false] call EOS_fnc_spawngroup;
										if (!surfaceiswater _mPos) then {
											0=[_mPos,units _aGroup,_mkrX,0,[0,20],true,true] call shk_fnc_fillhouse;
												}else{
												0 = [_aGroup,_mkr] call EOS_fnc_taskpatrol;
													};
												_aGrp set [count _aGrp,_aGroup];
												0=[_aGroup,"INFskill"] call eos_fnc_grouphandlers;
if (_debug) then {diag_log (format ["Spawned House Patrol: %1",_counter]);0= [_mkr,_counter,"House Patrol",getpos (leader _aGroup)] call EOS_debug};
												};
		};

// SPAWN PATROLS
	for "_counter" from 1 to _bGrps do {
	if (isnil "_bGrp") then {_bGrp=[];};
		if (_cache) then {
				_cacheGrp=format ["PA%1",_counter];
				_units=_eosActivated getvariable _cacheGrp;
					_bSize=[_units,_units];
					_bMin=_bSize select 0;
					if (_debug)then{diag_log format ["ID:%1,restore - %2",_cacheGrp,_units];};
						};
							if (_bMin > 0) then {
								  _pos=[_mkr,50] call EOS_fnc_findSafePos;
									_bGroup=[_pos,_bSize,_faction,_side,true] call EOS_fnc_spawngroup;
										0 = [_bGroup,_mkr] call EOS_fnc_taskpatrol;
										_bGrp set [count _bGrp,_bGroup];

										0=[_bGroup,"INFskill"] call eos_fnc_grouphandlers;
if (_debug) then {diag_log (format ["Spawned Patrol: %1",_counter]);0= [_mkr,_counter,"patrol",getpos (leader _bGroup)] call EOS_debug};
												};
												sleep 0.25;
		};

//SPAWN LIGHT VEHICLES
	for "_counter" from 1 to _cGrps do {
	if (isnil "_cGrp") then {_cGrp=[];};

		_newpos=[_mkr,50] call EOS_fnc_findSafePos;
			if (surfaceiswater _newpos) then {_vehType=8;_cargoType=10;}else{_vehType=7;_cargoType=9;};

					_cGroup=[_newpos,_side,_faction,_vehType]call EOS_fnc_spawnvehicle;
				if ((_cSize select 0) > 0) then{
						0=[(_cGroup select 0),_cSize,(_cGroup select 2),_faction,_cargoType] call eos_fnc_setcargo;
						};

							0=[(_cGroup select 2),"LIGskill"] call eos_fnc_grouphandlers;
								0 = [(_cGroup select 2),_mkr] call EOS_fnc_taskpatrol;
								_cGrp set [count _cGrp,_cGroup];

if (_debug) then {diag_log format ["Light Vehicle:%1 - r%2",_counter,_cGrps];0= [_mkr,_counter,"Light Veh",(getpos leader (_cGroup select 2))] call EOS_debug};
sleep 0.25;
		};

//SPAWN ARMOURED VEHICLES
	for "_counter" from 1 to _dGrps do {
	if (isnil "_dGrp") then {_dGrp=[];};

		_newpos=[_mkr,50] call EOS_fnc_findSafePos;
			if (surfaceiswater _newpos) then {_vehType=8;}else{_vehType=2;};

					_dGroup=[_newpos,_side,_faction,_vehType]call EOS_fnc_spawnvehicle;

						0=[(_dGroup select 2),"ARMskill"] call eos_fnc_grouphandlers;
						0 = [(_dGroup select 2),_mkr] call EOS_fnc_taskpatrol;
							_dGrp set [count _dGrp,_dGroup];

if (_debug) then {diag_log format ["Armoured:%1 - r%2",_counter,_dGrps];0= [_mkr,_counter,"Armour",(getpos leader (_dGroup select 2))] call EOS_debug};
sleep 0.25;
		};

//SPAWN STATIC PLACEMENTS
	for "_counter" from 1 to _eGrps do {
		if (surfaceiswater _mPos) exitwith {};
		if (isnil "_eGrp") then {_eGrp=[];};

		_newpos=[_mkr,50] call EOS_fnc_findSafePos;

					_eGroup=[_newpos,_side,_faction,5]call EOS_fnc_spawnvehicle;
						0=[(_eGroup select 2),"STAskill"] call eos_fnc_grouphandlers;
							_eGrp set [count _eGrp,_eGroup];

if (_debug) then {diag_log format ["Static:%1",_counter];0= [_mkr,_counter,"Static",(getpos leader (_eGroup select 2))] call EOS_debug};
sleep 0.25;
		};

//SPAWN CHOPPER
	for "_counter" from 1 to _fGrps do {
	if (isnil "_fGrp") then {_fGrp=[];};
		if ((_fSize select 0) > 0) then {_vehType=4}else{_vehType=3};
				_newpos = [(markerpos _mkr), 1500, random 360] call BIS_fnc_relPos;
						_fGroup=[_newpos,_side,_faction,_vehType,"fly"]call EOS_fnc_spawnvehicle;
						_fGrp set [count _fGrp,_fGroup];


if ((_fSize select 0) > 0) then {
	_cargoGrp = createGroup _side;
		0=[(_fGroup select 0),_fSize,_cargoGrp,_faction,9] call eos_fnc_setcargo;
			0=[_cargoGrp,"INFskill"] call eos_fnc_grouphandlers;
		_fGroup set [count _fGroup,_cargoGrp];
			null = [_mkr,_fGroup,_counter] execvm "Server\eos\functions\TransportUnload_fnc.sqf";
				}else{
					_wp1 = (_fGroup select 2) addWaypoint [(markerpos _mkr), 0];
					_wp1 setWaypointSpeed "FULL";
					_wp1 setWaypointType "SAD";};

						0=[(_fGroup select 2),"AIRskill"] call eos_fnc_grouphandlers;

if (_debug) then {diag_log format ["Chopper:%1",_counter];0= [_mkr,_counter,"Chopper",(getpos leader (_fGroup select 2))] call EOS_debug};
sleep 0.25;
			};

			//SPAWN BOXS
				for "_counter" from 1 to _gGrps do {
					if (surfaceiswater _mPos) exitwith {};
					if (isNil "_gGrp") then {_gGrp=[];};
					_newpos=[_mkr,50] call EOS_fnc_findSafePos;

								_gGroup=[_newpos,_side,_faction,11]call EOS_fnc_spawnvehicle;
									0=[_mPos,[(_gGroup select 0)],_mkrX,0,[0,20],true,true] call shk_fnc_fillhouse;
									_i = 0;
									while{(count nearestObjects [(_gGroup select 0), ["Man","ReammoBox_F"], 1]) > 1 AND _i <= 5} do {
										0=[_mPos,[(_gGroup select 0)],_mkrX,0,[0,20],true,true] call shk_fnc_fillhouse;
										_i = _i + 1;
									};
										_gGrp set [count _gGrp,_gGroup];

			if (_debug) then {diag_log format ["Box:%1",_counter];0= [_mkr,_counter,"Box",(getpos leader (_gGroup select 2))] call EOS_debug};
			sleep 0.25;
					};

//SPAWN ALT TRIGGERS
			_clear = createTrigger ["EmptyDetector",_mPos];
			_clear setTriggerArea [_mkrX,_mkrY,_mkrAgl,FALSE,50];
			_clear setTriggerActivation [_enemyFaction,"NOT PRESENT",true];
			_clear setTriggerStatements ["count thislist <= 3 AND ('LandVehicle' countType thislist)-('StaticWeapon' countType thislist) == 0","",""];
			_eosAct=true;
			_delay = 300;
while {_eosAct} do {
	// IF PLAYER LEAVES THE AREA OR ZONE DEACTIVATED
	if (!triggeractivated _eosActivated) then {
		_delay = _delay -5;
	} else {
		_delay = 300;
	};

	if (_delay <= 0) then	{
	//CACHE LIGHT VEHICLES
		if (!isnil "_cGrp") then
					{
							{	_vehicle = _x select 0;_crew = _x select 1;_grp = _x select 2;
										if (!alive _vehicle || {!alive _x} foreach _crew) then { _cGrps= _cGrps - 1;};
													{deleteVehicle _x} forEach (_crew);
															if (!(vehicle player == _vehicle)) then {{deleteVehicle _x} forEach[_vehicle];};
																				{deleteVehicle _x} foreach units _grp;deleteGroup _grp;
							}foreach _cGrp;
		if (_debug) then {diag_log format ["ID:c%1",_cGrps];};};

		// CACHE ARMOURED VEHICLES
			if (!isnil "_dGrp") then
					{
							{	_vehicle = _x select 0;_crew = _x select 1;_grp = _x select 2;
										if (!alive _vehicle || {!alive _x} foreach _crew) then {_dGrps= _dGrps - 1;};
													{deleteVehicle _x} forEach (_crew);
															if (!(vehicle player == _vehicle)) then {{deleteVehicle _x} forEach[_vehicle];};
																				{deleteVehicle _x} foreach units _grp;deleteGroup _grp;
							}foreach _dGrp;
			if (_debug) then {diag_log format ["ID:c%1",_dGrps];};};

	// CACHE PATROL INFANTRY
			if (!isnil "_bGrp") then {
					_n=0;
							{	_n=_n+1;_units={alive _x} count units _x;
							_cacheGrp=format ["PA%1",_n];
			if (_debug) then{diag_log format ["ID:%1,cache - %2",_cacheGrp,_units];};
							_eosActivated setvariable [_cacheGrp,_units, false];
							{deleteVehicle _x} foreach units _x;deleteGroup _x;
							}foreach _bGrp;
					};

	// CACHE HOUSE INFANTRY
		if (!isnil "_aGrp") then
					{		_n=0;
							{	_n=_n+1;_units={alive _x} count units _x;_cacheGrp=format ["HP%1",_n];
		if (_debug) then{diag_log format ["ID:%1,cache - %2",_cacheGrp,_units];};
							_eosActivated setvariable [_cacheGrp,_units, false];
							{deleteVehicle _x} foreach units _x;deleteGroup _x;
							}foreach _aGrp;
					};

	// CACHE MORTARS
		if (!isnil "_eGrp") then
					{
							{	_vehicle = _x select 0;_crew = _x select 1;_grp = _x select 2;
										if (!alive _vehicle || {!alive _x} foreach _crew) then {_eGrps= _eGrps - 1;};
															{deleteVehicle _x} forEach (_crew);
																if ((!(vehicle player == _vehicle)) && _vehicle in list _eosActivated) then {{deleteVehicle _x} forEach[_vehicle];};
																		{deleteVehicle _x} foreach units _grp;deleteGroup _grp;
							}foreach _eGrp;};

	// CACHE HELICOPTER TRANSPORT
		if (!isnil "_fGrp") then
					{
							{	_vehicle = _x select 0;_crew = _x select 1;_grp = _x select 2; _cargoGrp = _x select 3;
										if (!alive _vehicle || {!alive _x} foreach _crew) then {_fGrps= _fGrps - 1;};
															{deleteVehicle _x} forEach (_crew);
																if (!(vehicle player == _vehicle)) then {{deleteVehicle _x} forEach[_vehicle];};
																		{deleteVehicle _x} foreach units _grp;deleteGroup _grp;
																		if (!isnil "_cargoGrp") then {
																		{deleteVehicle _x} foreach units _cargoGrp;deleteGroup _cargoGrp;};

							}foreach _fGrp;};


	// CACHE BOX
							if (!isnil "_gGrp") then
										{
												{	_vehicle = _x select 0;_crew = _x select 1;_grp = _x select 2;
															if (!alive _vehicle) then {_gGrps = _gGrps - 1;};
																					if ((!(vehicle player == _vehicle)) && _vehicle in list _eosActivated) then {{deleteVehicle _x} forEach[_vehicle];};
												}foreach _gGrp;};

	_eosAct=false;
};
	if (triggeractivated _clear && !_civZone)exitwith {
				_cGrps=0;_aGrps=0;_bGrps=0;_dGrps=0;_eGrps=0;_fGrps=0;_gGrps=0;
				//Count Zone as clear and increase cleared count
				while {triggeractivated _eosActivated} do
						{
							if (!triggeractivated _clear && getmarkercolor _mkr  != hostileColor) then {
									//Count Zone as clear and increase cleared count
										["TaskFailed",["","Zone Lost"]] remoteExec ["BIS_fnc_showNotification", 0];
										_mkr setmarkercolor hostileColor;
										_mkr setmarkerAlpha _mAH;
							} else {
								if(getmarkercolor _mkr  != VictoryColor)then{
									["TaskSucceeded",["","Zone Captured"]] remoteExec ["BIS_fnc_showNotification", 0];
									[]	execVM "Server\Zone_Complete.sqf";
									if((random 1) > 0.75) then {
										//call counterProcess;
									};
									_mkr setmarkercolor VictoryColor;
									_mkr setmarkerAlpha _mAN;
								};
						};
				sleep 1;
				};
// PLAYER LEFT ZONE
			_eosAct=false;
			};
			sleep 5;
			};

deletevehicle _clear;
{ if (side _x == _side) then { deletevehicle _x} } forEach list _eosActivated;

if (!(getmarkercolor _mkr == "colorblack")) then {
	null = [_mkr,[_aGrps,_aSize],[_bGrps,_bSize],[_cGrps,_cSize],[_dGrps,_eGrps,_fGrps,_fSize,_gGrps],_settings,true] execVM "Server\eos\core\eos_core.sqf";
	}else{_Mkr setmarkeralpha 0;};
	};
