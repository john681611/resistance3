waitUntil {time > 2};
if(!isClass(configFile>>"cfgPatches">>"ace_common")) then {
	[]execVM "R3F_LOG\init.sqf";
} else {
	missionNamespace setVariable ["ACE_maxWeightCarry",1000000000];
	missionNamespace setVariable ["ACE_maxWeightDrag",1000000000];
	missionNamespace setVariable ["ace_respawn_savePreDeathGear", false];
	_fnc_makeDraggable = {  
    	params ["_object"]; 
    	[_object, true, [0,1.5,0], 0] call ace_dragging_fnc_setDraggable;  
	};
	//Supply
	["I_supplyCrate_F", "init", _fnc_makeDraggable, true, [], true] call CBA_fnc_addClassEventHandler;
	["O_supplyCrate_F", "init", _fnc_makeDraggable, true, [], true] call CBA_fnc_addClassEventHandler;
	["C_T_supplyCrate_F", "init", _fnc_makeDraggable, true, [], true] call CBA_fnc_addClassEventHandler;
	["C_supplyCrate_F", "init", _fnc_makeDraggable, true, [], true] call CBA_fnc_addClassEventHandler;
	["IG_supplyCrate_F", "init", _fnc_makeDraggable, true, [], true] call CBA_fnc_addClassEventHandler;
	["C_IDAP_supplyCrate_F", "init", _fnc_makeDraggable, true, [], true] call CBA_fnc_addClassEventHandler;
	["I_EAF_supplyCrate_F", "init", _fnc_makeDraggable, true, [], true] call CBA_fnc_addClassEventHandler;
	["B_supplyCrate_F", "init", _fnc_makeDraggable, true, [], true] call CBA_fnc_addClassEventHandler;
	//vehicleAmmo
	["Box_East_AmmoVeh_F", "init", _fnc_makeDraggable, true, [], true] call CBA_fnc_addClassEventHandler;
	["Box_IND_AmmoVeh_F", "init", _fnc_makeDraggable, true, [], true] call CBA_fnc_addClassEventHandler;
	["Box_EAF_AmmoVeh_F", "init", _fnc_makeDraggable, true, [], true] call CBA_fnc_addClassEventHandler;
	["Box_NATO_AmmoVeh_F", "init", _fnc_makeDraggable, true, [], true] call CBA_fnc_addClassEventHandler;
};
waitUntil {!isNull player && !isnil "KeyNumber" };
if(!isClass(configFile>>"cfgPatches">>"ace_common")) then {
	[] execVM "outlw_magRepack\MagRepack_init_sv.sqf";
};

{
	_box = _x select 0;
	[
		_box,
		MasterBoxArsernalContent
	] call RES_fnc_setArsenal;
	if(isClass(configFile>>"cfgPatches">>"ace_common")) then {
			[_box, 
			["ACE_fieldDressing","ACE_packingBandage","ACE_elasticBandage","ACE_tourniquet","ACE_splint","ACE_morphine","ACE_adenosine","ACE_epinephrine","ACE_plasmaIV","ACE_plasmaIV_500","ACE_plasmaIV_250","ACE_salineIV","ACE_salineIV_500","ACE_salineIV_250","ACE_bloodIV","ACE_bloodIV_500","ACE_bloodIV_250","ACE_quikclot","ACE_personalAidKit","ACE_surgicalKit","ACE_bodyBag","ACE_EarPlugs","ACE_EntrenchingTool","ACE_Flashlight_KSF1","ACE_MapTools"],
			 true] call BIS_fnc_addVirtualItemCargo;
		};
	if(isClass(configFile >> "CfgPatches" >> "tfar_core")) then {
			[_box, 
			["TFAR_anprc152","TFAR_rf7800str","TFAR_microdagr"],
			 true] call BIS_fnc_addVirtualItemCargo;
			 [_box, 
			 ["TFAR_rt1523g","TFAR_rt1523g_big","TFAR_rt1523g_sage","TFAR_rt1523g_green","TFAR_rt1523g_black","TFAR_rt1523g_fabric","TFAR_rt1523g_bwmod","TFAR_rt1523g_big_bwmod","TFAR_rt1523g_big_bwmod_tropen","TFAR_rt1523g_big_rhs","TFAR_rt1523g_rhs"]
			, true] call BIS_fnc_addVirtualBackpackCargo;
		};
} forEach MasterBoxes;
