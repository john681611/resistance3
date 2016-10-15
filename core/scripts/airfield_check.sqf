_airfield1mkr = ["airfield_1_1"];
_airfield2mkr = ["airfield_1_2"];
_airfield3mkr = ["airfield_1_3"];
_airfield4mkr = ["airfield_1_4"];
_airfield5mkr = ["airfield_1_5"];
_airfield6mkr = ["airfield_1_6"];

_airfieldMarker = _this select 0;

_PermanentAir = ["B_Heli_Light_01_F","B_Heli_Light_01_armed_F","I_Heli_Transport_02_F","I_Heli_light_03_F","I_Heli_light_03_unarmed_F"];
_lootPos = [_airfieldMarker,0,[],[200,"I_Heli_Transport_02_F"]] call SHK_pos;
_serivcePos = [_airfieldMarker,0,[],[200,"I_Heli_Transport_02_F"]] call SHK_pos;

if (isServer) then {
	switch (true) do {
		case (_airfieldMarker in _airfield1mkr):
			{PAPABEAR SideChat "We have captured the Molos Airfield.";
			["Taskairfield1","succeeded"] call SHK_Taskmaster_upd;
			airfield1spawn = [west, "airfield_1_1"] call BIS_fnc_addRespawnPosition;
			_lootMarker = createMarker [format ["permanent%1",random 100000],_lootPos]; _lootMarker setMarkerType "respawn_air"; _lootMarker setmarkerColor "ColorBLUFOR";
			_PermanentLoot = _PermanentAir select floor(random count _PermanentAir) createVehicle getMarkerPos _lootMarker;
			veh = [_PermanentAir, 30, 1800, 0, FALSE, FALSE] execVM "vehicle.sqf";
			_serviceMarker = createMarker [format ["gvs_hel_1"],_serivcePos]; _lootMarker setMarkerType "b_service"; _lootMarker setmarkerColor "ColorBLUFOR";
			if (true) exitWith {};};

		case (_airfieldMarker in _airfield2mkr):
			{ PAPABEAR SideChat "We have captured the Almyra Airfield.";
			["Taskairfield2","succeeded"] call SHK_Taskmaster_upd;
			airfield2spawn = [west, "airfield_1_2"] call BIS_fnc_addRespawnPosition;
			_lootMarker = createMarker [format ["permanent%1",random 100000],_lootPos]; _lootMarker setMarkerType "respawn_air"; _lootMarker setmarkerColor "ColorBLUFOR";
			_PermanentLoot = _PermanentAir select floor(random count _PermanentAir) createVehicle getMarkerPos _lootMarker;
			veh = [_PermanentAir, 30, 1800, 0, FALSE, FALSE] execVM "vehicle.sqf";
			_serviceMarker = createMarker [format ["gvs_hel_2"],_serivcePos]; _lootMarker setMarkerType "b_service"; _lootMarker setmarkerColor "ColorBLUFOR";
			if (true) exitWith {};};

		case (_airfieldMarker in _airfield3mkr):
			{ PAPABEAR SideChat "We have captured the Airbase Airfield.";
			["Taskairfield3","succeeded"] call SHK_Taskmaster_upd;
			airfield3spawn = [west, "airfield_1_3"] call BIS_fnc_addRespawnPosition;
			_lootMarker = createMarker [format ["permanent%1",random 100000],_lootPos]; _lootMarker setMarkerType "respawn_air"; _lootMarker setmarkerColor "ColorBLUFOR";
			_PermanentLoot = _PermanentAir select floor(random count _PermanentAir) createVehicle getMarkerPos _lootMarker;
			veh = [_PermanentAir, 30, 1800, 0, FALSE, FALSE] execVM "vehicle.sqf";
			_serviceMarker = createMarker [format ["gvs_hel_3"],_serivcePos]; _lootMarker setMarkerType "b_service"; _lootMarker setmarkerColor "ColorBLUFOR";
			if (true) exitWith {}; };

		case (_airfieldMarker in _airfield4mkr):
			{ PAPABEAR SideChat "We have captured the Southeast Airfield.";
			["Taskairfield4","succeeded"] call SHK_Taskmaster_upd;
			airfield4spawn = [west, "airfield_1_4"] call BIS_fnc_addRespawnPosition;
			_lootMarker = createMarker [format ["permanent%1",random 100000],_lootPos]; _lootMarker setMarkerType "respawn_air"; _lootMarker setmarkerColor "ColorBLUFOR";
			_PermanentLoot = _PermanentAir select floor(random count _PermanentAir) createVehicle getMarkerPos _lootMarker;
			veh = [_PermanentAir, 30, 1800, 0, FALSE, FALSE] execVM "vehicle.sqf";
			_serviceMarker = createMarker [format ["gvs_hel_4"],_serivcePos]; _lootMarker setMarkerType "b_service"; _lootMarker setmarkerColor "ColorBLUFOR";
			if (true) exitWith { }; };

		case (_airfieldMarker in _airfield5mkr):
			{ PAPABEAR SideChat "We have captured the AAC Airfield.";
			["Taskairfield5","succeeded"] call SHK_Taskmaster_upd;
			airfield5spawn = [west, "airfield_1_5"] call BIS_fnc_addRespawnPosition;
			_lootMarker = createMarker [format ["permanent%1",random 100000],_lootPos]; _lootMarker setMarkerType "respawn_air"; _lootMarker setmarkerColor "ColorBLUFOR";
			_PermanentLoot = _PermanentAir select floor(random count _PermanentAir) createVehicle getMarkerPos _lootMarker;
			veh = [_PermanentAir, 30, 1800, 0, FALSE, FALSE] execVM "vehicle.sqf";
			_serviceMarker = createMarker [format ["gvs_hel_5"],_serivcePos]; _lootMarker setMarkerType "b_service"; _lootMarker setmarkerColor "ColorBLUFOR";
			if (true) exitWith {};};

		case (_airfieldMarker in _airfield6mkr):
			{ PAPABEAR SideChat "We havecaptured the Northwest Airfield.";
			["Taskairfield6","succeeded"] call SHK_Taskmaster_upd;
			airfield6spawn = [west, "airfield_1_6"] call BIS_fnc_addRespawnPosition;
			_lootMarker = createMarker [format ["permanent%1",random 100000],_lootPos]; _lootMarker setMarkerType "respawn_air"; _lootMarker setmarkerColor "ColorBLUFOR";
			_PermanentLoot = _PermanentAir select floor(random count _PermanentAir) createVehicle getMarkerPos _lootMarker;
			veh = [_PermanentAir, 30, 1800, 0, FALSE, FALSE] execVM "vehicle.sqf";
			_serviceMarker = createMarker [format ["gvs_hel_6"],_serivcePos]; _lootMarker setMarkerType "b_service"; _lootMarker setmarkerColor "ColorBLUFOR";
			if (true) exitWith {};};

		};
	};