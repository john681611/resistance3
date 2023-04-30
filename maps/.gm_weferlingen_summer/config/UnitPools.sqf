private
[
	"_tempArray", "_InfPool", "_MotPool", "_ACHPool", "_CHPool", "_uavPool", "_stPool", "_shipPool", "_diverPool", "_crewPool", "_heliCrew", "_ArmPool", "_boxPool"
];
_faction = (_this select 0);
_type = (_this select 1);
_tempArray = [];
#include "..\Server\eos\UnitPools\gm_dk_80.sqf";
#include "..\Server\eos\UnitPools\gm_dk_80_sf.sqf";
#include "..\Server\eos\UnitPools\gm_dk_90.sqf";
#include "..\Server\eos\UnitPools\gm_dk_90_sf.sqf";
#include "..\Server\eos\UnitPools\gm_eger_80.sqf";
#include "..\Server\eos\UnitPools\gm_eger_border.sqf";
#include "..\Server\eos\UnitPools\gm_pol_80.sqf";
#include "..\Server\eos\UnitPools\gm_pol_80_sf.sqf";
#include "..\Server\eos\UnitPools\gm_wger_80.sqf";
#include "..\Server\eos\UnitPools\gm_wger_80_sf.sqf";
#include "..\Server\eos\UnitPools\gm_wger_90.sqf";
#include "..\Server\eos\UnitPools\gm_wger_border.sqf";
switch (_faction)
	do {
	// EAST E GER FACTION
	case 0:
	{
		_InfPool = gm_eger_80_InfPool + [];
		_ArmPool = gm_eger_80_ArmPool + [];
		_MotPool = gm_eger_80_MotPool + [];
		_ACHPool =gm_eger_80_ACHPool + [];
		_CHPool = gm_eger_80_CHPool + [];
		_uavPool = gm_eger_80_uavPool + [];
		_stPool = gm_eger_80_stPool + [];
		_shipPool = gm_eger_80_shipPool + [];
		_diverPool = gm_eger_80_diverPool + [];
		_crewPool = gm_eger_80_crewPool + [];
		_heliCrew = gm_eger_80_heliCrew + [];
		_boxPool = gm_eger_80_boxPool + [];
	};
	// EAST E GER BORDER FACTION
	case 1:
	{
		_InfPool = gm_eger_border_InfPool + [];
		_ArmPool = gm_eger_border_ArmPool + [];
		_MotPool = gm_eger_border_MotPool + [];
		_ACHPool =gm_eger_border_ACHPool + [];
		_CHPool = gm_eger_border_CHPool + [];
		_uavPool = gm_eger_border_uavPool + [];
		_stPool = gm_eger_border_stPool + [];
		_shipPool = gm_eger_border_shipPool + [];
		_diverPool = gm_eger_border_diverPool + [];
		_crewPool = gm_eger_border_crewPool + [];
		_heliCrew = gm_eger_border_heliCrew + [];
		_boxPool = gm_eger_border_boxPool + [];
	};
	// EAST POL 80s FACTION
	case 2:
	{
		_InfPool = gm_pol_80_InfPool + [];
		_ArmPool = gm_pol_80_ArmPool + [];
		_MotPool = gm_pol_80_MotPool + [];
		_ACHPool =gm_pol_80_ACHPool + [];
		_CHPool = gm_pol_80_CHPool + [];
		_uavPool = gm_pol_80_uavPool + [];
		_stPool = gm_pol_80_stPool + [];
		_shipPool = gm_pol_80_shipPool + [];
		_diverPool = gm_pol_80_diverPool + [];
		_crewPool = gm_pol_80_crewPool + [];
		_heliCrew = gm_pol_80_heliCrew + [];
		_boxPool = gm_pol_80_boxPool + [];
	};
	// EAST POL 80 SF
	case 3:
	{
		_InfPool = gm_pol_80_sf_InfPool + [];
		_ArmPool = gm_pol_80_sf_ArmPool + [];
		_MotPool = gm_pol_80_sf_MotPool + [];
		_ACHPool =gm_pol_80_sf_ACHPool + [];
		_CHPool = gm_pol_80_sf_CHPool + [];
		_uavPool = gm_pol_80_sf_uavPool + [];
		_stPool = gm_pol_80_sf_stPool + [];
		_shipPool = gm_pol_80_sf_shipPool + [];
		_diverPool = gm_pol_80_sf_diverPool + [];
		_crewPool = gm_pol_80_sf_crewPool + [];
		_heliCrew = gm_pol_80_sf_heliCrew + [];
		_boxPool = gm_pol_80_sf_boxPool + [];
	};
	// INDEPENDENT DENMARK 80 FACTION
	case 4:
	{
		_InfPool = gm_dk_80_InfPool + [];
		_ArmPool = gm_dk_80_ArmPool + [];
		_MotPool = gm_dk_80_MotPool + [];
		_ACHPool =gm_dk_80_ACHPool + [];
		_CHPool = gm_dk_80_CHPool + [];
		_uavPool = gm_dk_80_uavPool + [];
		_stPool = gm_dk_80_stPool + [];
		_shipPool = gm_dk_80_shipPool + [];
		_diverPool = gm_dk_80_diverPool + [];
		_crewPool = gm_dk_80_crewPool + [];
		_heliCrew = gm_dk_80_heliCrew + [];
		_boxPool = gm_dk_80_boxPool + [];
	};
	// INDEPENDENT DENMARK 80 SF
	case 5:
	{
		_InfPool = gm_dk_80_sf_InfPool + [];
		_ArmPool = gm_dk_80_sf_ArmPool + [];
		_MotPool = gm_dk_80_sf_MotPool + [];
		_ACHPool =gm_dk_80_sf_ACHPool + [];
		_CHPool = gm_dk_80_sf_CHPool + [];
		_uavPool = gm_dk_80_sf_uavPool + [];
		_stPool = gm_dk_80_sf_stPool + [];
		_shipPool = gm_dk_80_sf_shipPool + [];
		_diverPool = gm_dk_80_sf_diverPool + [];
		_crewPool = gm_dk_80_sf_crewPool + [];
		_heliCrew = gm_dk_80_sf_heliCrew + [];
		_boxPool = gm_dk_80_sf_boxPool + [];	
	};

	// INDEPENDENT DENMARK 90
	case 6:
	{
		_InfPool = gm_dk_90_InfPool + [];
		_ArmPool = gm_dk_90_ArmPool + [];
		_MotPool = gm_dk_90_MotPool + [];
		_ACHPool =gm_dk_90_ACHPool + [];
		_CHPool = gm_dk_90_CHPool + [];
		_uavPool = gm_dk_90_uavPool + [];
		_stPool = gm_dk_90_stPool + [];
		_shipPool = gm_dk_90_shipPool + [];
		_diverPool = gm_dk_90_diverPool + [];
		_crewPool = gm_dk_90_crewPool + [];
		_heliCrew = gm_dk_90_heliCrew + [];
		_boxPool = gm_dk_90_boxPool + [];	
	};

	// INDEPENDENT DENMARK 90 SF
	case 7:
	{
		_InfPool = gm_dk_90_sf_InfPool + [];
		_ArmPool = gm_dk_90_sf_ArmPool + [];
		_MotPool = gm_dk_90_sf_MotPool + [];
		_ACHPool =gm_dk_90_sf_ACHPool + [];
		_CHPool = gm_dk_90_sf_CHPool + [];
		_uavPool = gm_dk_90_sf_uavPool + [];
		_stPool = gm_dk_90_sf_stPool + [];
		_shipPool = gm_dk_90_sf_shipPool + [];
		_diverPool = gm_dk_90_sf_diverPool + [];
		_crewPool = gm_dk_90_sf_crewPool + [];
		_heliCrew = gm_dk_90_sf_heliCrew + [];
		_boxPool = gm_dk_90_sf_boxPool + [];	
	};

	// INDEPENDENT W GER 80
	case 8:
	{
		_InfPool = gm_wger_80_InfPool + [];
		_ArmPool = gm_wger_80_ArmPool + [];
		_MotPool = gm_wger_80_MotPool + [];
		_ACHPool =gm_wger_80_ACHPool + [];
		_CHPool = gm_wger_80_CHPool + [];
		_uavPool = gm_wger_80_uavPool + [];
		_stPool = gm_wger_80_stPool + [];
		_shipPool = gm_wger_80_shipPool + [];
		_diverPool = gm_wger_80_diverPool + [];
		_crewPool = gm_wger_80_crewPool + [];
		_heliCrew = gm_wger_80_heliCrew + [];
		_boxPool = gm_wger_80_boxPool + [];	
	};

	// INDEPENDENT W GER 80 SF
	case 9:
	{
		_InfPool = gm_wger_80_sf_InfPool + [];
		_ArmPool = gm_wger_80_sf_ArmPool + [];
		_MotPool = gm_wger_80_sf_MotPool + [];
		_ACHPool =gm_wger_80_sf_ACHPool + [];
		_CHPool = gm_wger_80_sf_CHPool + [];
		_uavPool = gm_wger_80_sf_uavPool + [];
		_stPool = gm_wger_80_sf_stPool + [];
		_shipPool = gm_wger_80_sf_shipPool + [];
		_diverPool = gm_wger_80_sf_diverPool + [];
		_crewPool = gm_wger_80_sf_crewPool + [];
		_heliCrew = gm_wger_80_sf_heliCrew + [];
		_boxPool = gm_wger_80_sf_boxPool + [];
	};

	// INDEPENDENT W GER 90
	case 10:
	{
		_InfPool = gm_wger_90_InfPool + [];
		_ArmPool = gm_wger_90_ArmPool + [];
		_MotPool = gm_wger_90_MotPool + [];
		_ACHPool =gm_wger_90_ACHPool + [];
		_CHPool = gm_wger_90_CHPool + [];
		_uavPool = gm_wger_90_uavPool + [];
		_stPool = gm_wger_90_stPool + [];
		_shipPool = gm_wger_90_shipPool + [];
		_diverPool = gm_wger_90_diverPool + [];
		_crewPool = gm_wger_90_crewPool + [];
		_heliCrew = gm_wger_90_heliCrew + [];
		_boxPool = gm_wger_90_boxPool + [];
	};

	// INDEPENDENT W GER BORDER
	case 11:
	{
		_InfPool = gm_wger_border_InfPool + [];
		_ArmPool = gm_wger_border_ArmPool + [];
		_MotPool = gm_wger_border_MotPool + [];
		_ACHPool =gm_wger_border_ACHPool + [];
		_CHPool = gm_wger_border_CHPool + [];
		_uavPool = gm_wger_border_uavPool + [];
		_stPool = gm_wger_border_stPool + [];
		_shipPool = gm_wger_border_shipPool + [];
		_diverPool = gm_wger_border_diverPool + [];
		_crewPool = gm_wger_border_crewPool + [];
		_heliCrew = gm_wger_border_heliCrew + [];
		_boxPool = gm_wger_border_boxPool + [];
	};
};

////////////////////////////////////////////////////////////////////////////////////////
switch (_type)
	do {

	case 0:
	{
		_tempArray = _InfPool;
	};

	case 1:
	{
		_tempArray = _diverPool;
	};

	// CREATE ARMOUR & CREW
	case 2:
	{
		_tempArray = [_ArmPool, _crewPool] call eos_fnc_setCrewedUnit;
	};

	// CREATE ATTACK CHOPPER & CREW
	case 3:
	{
		_tempArray = [_ACHPool, _heliCrew] call eos_fnc_setCrewedUnit;
	};

	// CREATE TRANSPORT CHOPPER & CREW
	case 4:
	{
		_tempArray = [_CHPool, _heliCrew] call eos_fnc_setCrewedUnit;
	};

	// CREATE STATIC & CREW
	case 5:
	{
		_tempArray = [_stPool, _crewPool] call eos_fnc_setCrewedUnit;
	};
	case 6:
	{
		_tempArray = selectRandomWeighted _uavPool;
	};

	// CREATE TRANSPORT & CREW
	case 7:
	{
		_tempArray = [_MotPool, _crewPool] call eos_fnc_setCrewedUnit;
	};

	// CREATE BOAT & DIVER CREW
	case 8:
	{
		_tempArray = [_shipPool, _diverPool] call eos_fnc_setCrewedUnit;
	};

	// CREATE CARGO
	case 9:
	{
		_temparray = _InfPool;
	};

	// CREATE DIVER CARGO
	case 10:
	{
		_temparray = _diverPool;
	};

	case 11:
	{
		_tempUnit = selectRandomWeighted _boxPool;
		_temparray set[count _temparray, _tempUnit];
	};
};
_tempArray
