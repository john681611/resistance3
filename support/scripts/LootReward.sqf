// Array of Markers/AOs
_towerMarker = ["tower_1","tower_2","tower_3"];
_baseMarker = ["base_1_1","base_1_2","base_1_3","base_1_4","base_1_5","base_1_6","base_1_7"];
_airfieldMarker = ["airfield_1_1","airfield_1_2","airfield_1_3","airfield_1_4","airfield_1_5","airfield_1_6"];
_cityMarker = ["city_1","city_2","city_3"];
_hillMarker = + ztownloc;
_villageMarker = + ztowns;
_townMarker = + ztownm;

_clearedMarker = []; _addArray = [];

// Array of loot
_BasicLoot = ["Box_IND_Wps_F","Box_East_Ammo_F","IG_SupplyCrate_F","B_G_Offroad_01_armed_F","I_Truck_02_box_F","O_Truck_03_box_F","I_MRAP_03_F","O_MRAP_02_F","I_Truck_02_transport_F","O_Truck_03_transport_F","Box_IND_Grenades_F"];
_CommonLoot = ["Box_NATO_Wps_F","Box_IND_WpsLaunch_F","Box_East_WpsLaunch_F","I_MRAP_03_hmg_F","O_MRAP_02_hmg_F","I_MRAP_03_gmg_F","O_MRAP_02_gmg_F"];
_MediumLoot = ["Box_NATO_WpsSpecial_F","Box_IND_WpsSpecial_F","Box_East_WpsSpecial_F","O_APC_Wheeled_02_rcws_F","B_APC_Tracked_01_CRV_F"];
_RareLoot = ["C_supplyCrate_F","I_APC_Wheeled_03_cannon_F","I_APC_tracked_03_cannon_F","O_APC_Tracked_02_AA_F"];
_AirLoot = ["B_Heli_Light_01_F","B_Heli_Light_01_armed_F","I_Plane_Fighter_03_CAS_F","O_Plane_CAS_02_F","I_Heli_Transport_02_F","I_Heli_light_03_F","I_Heli_light_03_unarmed_F","O_Heli_Light_02_F","O_Heli_Light_02_unarmed_F","O_Heli_Attack_02_F"];
_cityLoot = ["I_MBT_03_cannon_F","O_APC_Tracked_02_cannon_F","O_MBT_02_cannon_F","O_MBT_02_arty_F"];
_supportLoot = ["I_Truck_02_box_F","O_Truck_03_box_F","I_Truck_02_transport_F","O_Truck_03_transport_F","B_Heli_Light_01_F","I_Heli_Transport_02_F"];

_MarkerName = _this select 0;
_LootCaseEnder = 0;

_basicPos = [_markerName,0,[],[100,"I_Heli_Transport_02_F"]] call SHK_pos;
_commonPos = [_markerName,0,[],[100,"I_Heli_Transport_02_F"]] call SHK_pos;
_mediumPos = [_markerName,0,[],[100,"I_Heli_Transport_02_F"]] call SHK_pos;
_rarePos = [_markerName,0,[],[100,"I_Heli_Transport_02_F"]] call SHK_pos;
_airPos = [_markerName,0,[],[100,"I_Heli_Transport_02_F"]] call SHK_pos;
_cityPos = [_markerName,0,[],[100,"I_Heli_Transport_02_F"]] call SHK_pos;


// Determine what type of AO we have
if (isServer) then {


		if (_MarkerName in _hillMarker) then
			{ _basicPosMarker = createMarker [format ["loot%1",random 100000],_basicPos]; _basicPosMarker setMarkerType "mil_dot"; _basicPosMarker setMarkerText "Loot"; _basicPosMarker setmarkerColor "ColorGreen";
			_rewardBasic = _BasicLoot select floor(random count _BasicLoot) createVehicle getMarkerPos _basicPosMarker;
			if (_rewardBasic in _supportLoot) then { _NULL = [_rewardBasic] execVM "core\scripts\IgiLoad.sqf";};
			};


		if (_MarkerName in _villageMarker)then
			{ _basicPosMarker = createMarker [format ["loot%1",random 100000],_basicPos]; _basicPosMarker setMarkerType "mil_dot"; _basicPosMarker setMarkerText "Loot"; _basicPosMarker setmarkerColor "ColorGreen";
			_rewardBasic = _BasicLoot select floor(random count _BasicLoot) createVehicle getMarkerPos _basicPosMarker;
			_commonPosMarker = createMarker [format ["loot%1",random 100000],_commonPos]; _commonPosMarker setMarkerType "mil_dot"; _commonPosMarker setMarkerText "Loot"; _commonPosMarker setmarkerColor "ColorGreen";
			_rewardCommon = _CommonLoot select floor(random count _CommonLoot) createVehicle getMarkerPos _commonPosMarker;
			if (_rewardCommon in _supportLoot) then { _NULL = [_rewardCommon] execVM "core\scripts\IgiLoad.sqf";};
			if (_rewardBasic in _supportLoot) then { _NULL = [_rewardBasic] execVM "core\scripts\IgiLoad.sqf";};
			};

		if (_MarkerName in _townMarker) then
			{ _NULL =[_MarkerName] call Kinch_TownReinforce;
			_basicPosMarker = createMarker [format ["loot%1",random 100000],_basicPos]; _basicPosMarker setMarkerType "mil_dot"; _basicPosMarker setMarkerText "Loot"; _basicPosMarker setmarkerColor "ColorGreen";
			_rewardBasic = _BasicLoot select floor(random count _BasicLoot) createVehicle getMarkerPos _basicPosMarker;
			_commonPosMarker = createMarker [format ["loot%1",random 100000],_commonPos]; _commonPosMarker setMarkerType "mil_dot"; _commonPosMarker setMarkerText "Loot"; _commonPosMarker setmarkerColor "ColorGreen";
			_rewardCommon = _CommonLoot select floor(random count _CommonLoot) createVehicle getMarkerPos _commonPosMarker;
			_mediumPosMarker = createMarker [format ["loot%1",random 100000],_mediumPos]; _mediumPosMarker setMarkerType "mil_dot"; _mediumPosMarker setMarkerText "Loot"; _mediumPosMarker setmarkerColor "ColorGreen";
			_rewardMedium = _MediumLoot select floor(random count _MediumLoot) createVehicle getMarkerPos _mediumPosMarker;
			if (_rewardCommon in _supportLoot) then { _NULL = [_rewardCommon] execVM "core\scripts\IgiLoad.sqf";};
			if (_rewardBasic in _supportLoot) then { _NULL = [_rewardBasic] execVM "core\scripts\IgiLoad.sqf";};
			};

		if(_MarkerName in _towerMarker) then
			{ _commonPosMarker = createMarker [format ["loot%1",random 100000],_commonPos]; _commonPosMarker setMarkerType "mil_dot"; _commonPosMarker setMarkerText "Loot"; _commonPosMarker setmarkerColor "ColorGreen";
			_rewardCommon = _CommonLoot select floor(random count _CommonLoot) createVehicle getMarkerPos _commonPosMarker;
			if (_rewardCommon in _supportLoot) then { _NULL = [_rewardCommon] execVM "core\scripts\IgiLoad.sqf";};
			_NULL =[_MarkerName] call Kinch_TowerCheck;
			};

		if (_MarkerName in _baseMarker)then
			{ _basicPosMarker = createMarker [format ["loot%1",random 100000],_basicPos]; _basicPosMarker setMarkerType "mil_dot"; _basicPosMarker setMarkerText "Loot"; _basicPosMarker setmarkerColor "ColorGreen";
			_rewardBasic = _BasicLoot select floor(random count _BasicLoot) createVehicle getMarkerPos _basicPosMarker;
			_commonPosMarker = createMarker [format ["loot%1",random 100000],_commonPos]; _commonPosMarker setMarkerType "mil_dot"; _commonPosMarker setMarkerText "Loot"; _commonPosMarker setmarkerColor "ColorGreen";
			_rewardCommon = _CommonLoot select floor(random count _CommonLoot) createVehicle getMarkerPos _commonPosMarker;
			_mediumPosMarker = createMarker [format ["loot%1",random 100000],_mediumPos]; _mediumPosMarker setMarkerType "mil_dot"; _mediumPosMarker setMarkerText "Loot"; _mediumPosMarker setmarkerColor "ColorGreen";
			_rewardMedium = _MediumLoot select floor(random count _MediumLoot) createVehicle getMarkerPos _mediumPosMarker;
			_rarePosMarker = createMarker [format ["loot%1",random 100000],_rarePos]; _rarePosMarker setMarkerType "mil_dot"; _rarePosMarker setMarkerText "Loot"; _rarePosMarker setmarkerColor "ColorGreen";
			_rewardRare = _RareLoot select floor(random count _RareLoot) createVehicle getMarkerPos _rarePosMarker;
			if (_rewardCommon in _supportLoot) then { _NULL = [_rewardCommon] execVM "core\scripts\IgiLoad.sqf";};
			if (_rewardBasic in _supportLoot) then { _NULL = [_rewardBasic] execVM "core\scripts\IgiLoad.sqf";};
			_NULL =[_MarkerName] call Kinch_BaseSpawn;
			};

		if (_MarkerName in _airfieldMarker)then
			{ _basicPosMarker = createMarker [format ["loot%1",random 100000],_basicPos]; _basicPosMarker setMarkerType "mil_dot"; _basicPosMarker setMarkerText "Loot"; _basicPosMarker setmarkerColor "ColorGreen";
			_rewardBasic = _BasicLoot select floor(random count _BasicLoot) createVehicle getMarkerPos _basicPosMarker;
			_commonPosMarker = createMarker [format ["loot%1",random 100000],_commonPos]; _commonPosMarker setMarkerType "mil_dot"; _commonPosMarker setMarkerText "Loot"; _commonPosMarker setmarkerColor "ColorGreen";
			_rewardCommon = _CommonLoot select floor(random count _CommonLoot) createVehicle getMarkerPos _commonPosMarker;
			_mediumPosMarker = createMarker [format ["loot%1",random 100000],_mediumPos]; _mediumPosMarker setMarkerType "mil_dot"; _mediumPosMarker setMarkerText "Loot"; _mediumPosMarker setmarkerColor "ColorGreen";
			_rewardMedium = _MediumLoot select floor(random count _MediumLoot) createVehicle getMarkerPos _mediumPosMarker;
			_airPosMarker = createMarker [format ["loot%1",random 100000],_airPos]; _airPosMarker setMarkerType "mil_dot"; _airPosMarker setMarkerText "Loot"; _airPosMarker setmarkerColor "ColorGreen";
			_rewardAir = _AirLoot select floor(random count _AirLoot) createVehicle getMarkerPos _airPosMarker;
			if (_rewardAir in _supportLoot) then { _NULL = [_rewardAir] execVM "core\scripts\IgiLoad.sqf";};
			if (_rewardCommon in _supportLoot) then { _NULL = [_rewardCommon] execVM "core\scripts\IgiLoad.sqf";};
			if (_rewardBasic in _supportLoot) then { _NULL = [_rewardBasic] execVM "core\scripts\IgiLoad.sqf";};
			call Kinch_AirfieldCheck;
			};
			
		if (_MarkerName in _cityMarker)then
			{ _basicPosMarker = createMarker [format ["loot%1",random 100000],_basicPos]; _basicPosMarker setMarkerType "mil_dot"; _basicPosMarker setMarkerText "Loot"; _basicPosMarker setmarkerColor "ColorGreen";
			_rewardBasic = _BasicLoot select floor(random count _BasicLoot) createVehicle getMarkerPos _basicPosMarker;
			_commonPosMarker = createMarker [format ["loot%1",random 100000],_commonPos]; _commonPosMarker setMarkerType "mil_dot"; _commonPosMarker setMarkerText "Loot"; _commonPosMarker setmarkerColor "ColorGreen";
			_rewardCommon = _CommonLoot select floor(random count _CommonLoot) createVehicle getMarkerPos _commonPosMarker;
			_mediumPosMarker = createMarker [format ["loot%1",random 100000],_mediumPos]; _mediumPosMarker setMarkerType "mil_dot"; _mediumPosMarker setMarkerText "Loot"; _mediumPosMarker setmarkerColor "ColorGreen";
			_rewardMedium = _MediumLoot select floor(random count _MediumLoot) createVehicle getMarkerPos _mediumPosMarker;
			_rarePosMarker = createMarker [format ["loot%1",random 100000],_rarePos]; _airPosMarker setMarkerType "mil_dot"; _rarePosMarker setMarkerText "Loot"; _rarePosMarker setmarkerColor "ColorGreen";
			_rewardRare = _RareLoot select floor(random count _RareLoot) createVehicle getMarkerPos _RarePosMarker;
			_cityPosMarker = createMarker [format ["loot%1",random 100000],_cityPos]; _airPosMarker setMarkerType "mil_dot"; _cityPosMarker setMarkerText "Loot"; _cityPosMarker setmarkerColor "ColorGreen";
			_rewardcity = _cityLoot select floor(random count _cityLoot) createVehicle getMarkerPos _cityPosMarker;
			if (_rewardCommon in _supportLoot) then { _NULL = [_rewardCommon] execVM "core\scripts\IgiLoad.sqf";};
			call Kinch_CityCheck;
			};
	};