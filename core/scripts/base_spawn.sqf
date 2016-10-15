_base1mkr = ["base_1_1"];
_base2mkr = ["base_1_2"];
_base3mkr = ["base_1_3"];
_base4mkr = ["base_1_4"];
_base5mkr = ["base_1_5"];

_base1flag = [base_1];
_base2flag = [base_3];
_base3flag = [base_3];
_base4flag = [base_4];
_base5flag = [base_5];

_flagMarker = _this select 0;

_PermanentGround = ["I_MBT_03_cannon_F","I_APC_tracked_03_cannon_F","I_APC_Wheeled_03_cannon_F"];
_lootPos = [_flagMarker,0,[],[200,"I_Heli_Transport_02_F"]] call SHK_pos;
_serivcePos = [_flagMarker,0,[],[200,"I_Heli_Transport_02_F"]] call SHK_pos;

// Determine which base was captured, change the flag to FIA texture and make it a spawn point
if (isServer) then {
	
		if(_flagMarker in _base1mkr) then
			{base_1 setFlagTexture "\A3\Data_F\Flags\Flag_FIA_CO.paa"; 
			base1spawn = [west, "base_1_1"] call BIS_fnc_addRespawnPosition;
			_lootMarker = createMarker [format ["permanent%1",random 100000],_lootPos]; _lootMarker setMarkerType "respawn_armor"; _lootMarker setmarkerColor "ColorBLUFOR";
			_PermanentLoot = _PermanentGround select floor(random count _PermanentGround) createVehicle getMarkerPos _lootMarker;
			veh = [_PermanentGround, 30, 1800, 0, FALSE, FALSE] execVM "vehicle.sqf";
			_serviceMarker = createMarker [format ["gvs_veh_1"],_serivcePos]; _lootMarker setMarkerType "b_service"; _lootMarker setmarkerColor "ColorBLUFOR";
			};

		if (_flagMarker in _base2mkr) then
			{base_2 setFlagTexture "\A3\Data_F\Flags\Flag_FIA_CO.paa";
			base2spawn = [west, "base_1_2"] call BIS_fnc_addRespawnPosition;
			_lootMarker = createMarker [format ["permanent%1",random 100000],_lootPos]; _lootMarker setMarkerType "respawn_armor"; _lootMarker setmarkerColor "ColorBLUFOR";
			_PermanentLoot = _PermanentGround select floor(random count _PermanentGround) createVehicle getMarkerPos _lootMarker;
			veh = [_PermanentGround, 30, 1800, 0, FALSE, FALSE] execVM "vehicle.sqf";
			_serviceMarker = createMarker [format ["gvs_veh_2"],_serivcePos]; _lootMarker setMarkerType "b_service"; _lootMarker setmarkerColor "ColorBLUFOR";
			};

		if (_flagMarker in _base3mkr)then
			{base_3 setFlagTexture "\A3\Data_F\Flags\Flag_FIA_CO.paa";
			base3spawn = [west, "base_1_3"] call BIS_fnc_addRespawnPosition;
			_lootMarker = createMarker [format ["permanent%1",random 100000],_lootPos]; _lootMarker setMarkerType "respawn_armor"; _lootMarker setmarkerColor "ColorBLUFOR";
			_PermanentLoot = _PermanentGround select floor(random count _PermanentGround) createVehicle getMarkerPos _lootMarker;
			veh = [_PermanentGround, 30, 1800, 0, FALSE, FALSE] execVM "vehicle.sqf";
			_serviceMarker = createMarker [format ["gvs_veh_3"],_serivcePos]; _lootMarker setMarkerType "b_service"; _lootMarker setmarkerColor "ColorBLUFOR";
			};

		if (_flagMarker in _base4mkr)then
			{base_4 setFlagTexture "\A3\Data_F\Flags\Flag_FIA_CO.paa";
			base4spawn = [west, "base_1_4"] call BIS_fnc_addRespawnPosition;
			_lootMarker = createMarker [format ["permanent%1",random 100000],_lootPos]; _lootMarker setMarkerType "respawn_armor"; _lootMarker setmarkerColor "ColorBLUFOR";
			_PermanentLoot = _PermanentGround select floor(random count _PermanentGround) createVehicle getMarkerPos _lootMarker;
			veh = [_PermanentGround, 30, 1800, 0, FALSE, FALSE] execVM "vehicle.sqf";
			_serviceMarker = createMarker [format ["gvs_veh_4"],_serivcePos]; _lootMarker setMarkerType "b_service"; _lootMarker setmarkerColor "ColorBLUFOR";
			};

		if (_flagMarker in _base5mkr)then
			{base_5 setFlagTexture "\A3\Data_F\Flags\Flag_FIA_CO.paa";
			base5spawn = [west, "base_1_5"] call BIS_fnc_addRespawnPosition;
			_lootMarker = createMarker [format ["permanent%1",random 100000],_lootPos]; _lootMarker setMarkerType "respawn_armor"; _lootMarker setmarkerColor "ColorBLUFOR";
			_PermanentLoot = _PermanentGround select floor(random count _PermanentGround) createVehicle getMarkerPos _lootMarker;
			veh = [_PermanentGround, 30, 1800, 0, FALSE, FALSE] execVM "vehicle.sqf";
			_serviceMarker = createMarker [format ["gvs_veh_5"],_serivcePos]; _lootMarker setMarkerType "b_service"; _lootMarker setmarkerColor "ColorBLUFOR";
			};

		};
	