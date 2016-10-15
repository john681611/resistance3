// Array of Markers/AOs
_level1 = ["old_base_1_1","old_base_1_2","old_base_1_3"];
_level2 = ["old_base_2_1","old_base_2_2"];
_level3 = ["airfield_1_1","airfield_1_2","airfield_1_3","airfield_1_4","airfield_1_5","airfield_1_6"];


_clearedMarker = []; _addArray = [];

// Array of loot
_BasicLoot = ["Box_NATO_Wps_F","B_supplyCrate_F","C_supplyCrate_F"];
_CommonLoot = ["B_MRAP_01_hmg_F","B_Truck_01_covered_F","B_Truck_01_medical_F"];
_MediumLoot = ["B_MBT_01_cannon_F","B_APC_Wheeled_01_cannon_F","B_APC_Tracked_01_rcws_F"];


_MarkerName = _this select 0;
_LootCaseEnder = 0;

_basicPos = [_markerName,0,[],[100,"I_Heli_Transport_02_F"]] call SHK_pos;
_commonPos = [_markerName,0,[],[100,"I_Heli_Transport_02_F"]] call SHK_pos;
_mediumPos = [_markerName,0,[],[100,"I_Heli_Transport_02_F"]] call SHK_pos;

// Determine what type of AO we have
if (isServer) then {


		if (_MarkerName in _level1)then
			{_basicPosMarker = createMarker [format ["bloot%1",random 100000],_basicPos]; _basicPosMarker setMarkerType "mil_dot"; _basicPosMarker setMarkerText "Loot"; _basicPosMarker setmarkerColor "ColorGreen";
			_rewardBasic = _BasicLoot select floor(random count _BasicLoot) createVehicle getMarkerPos _basicPosMarker;
			};

		if (_MarkerName in _level2) then
			{_commonPosMarker = createMarker [format ["bloot%1",random 100000],_commonPos]; _commonPosMarker setMarkerType "mil_dot"; _commonPosMarker setMarkerText "Loot"; _commonPosMarker setmarkerColor "ColorGreen";
			_rewardCommon = _CommonLoot select floor(random count _CommonLoot) createVehicle getMarkerPos _commonPosMarker;
			 };

		if (_MarkerName in _level3)then
			{_mediumPosMarker = createMarker [format ["bloot%1",random 100000],_mediumPos]; _mediumPosMarker setMarkerType "mil_dot"; _mediumPosMarker setMarkerText "Loot"; _mediumPosMarker setmarkerColor "ColorGreen";
			_rewardMedium = _MediumLoot select floor(random count _MediumLoot) createVehicle getMarkerPos _mediumPosMarker;
			 };


		
	};