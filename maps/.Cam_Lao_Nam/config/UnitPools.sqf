private
[
	"_tempArray", "_InfPool", "_MotPool", "_ACHPool", "_CHPool", "_uavPool", "_stPool", "_shipPool", "_diverPool", "_crewPool", "_heliCrew", "_ArmPool", "_boxPool"
];
_faction = (_this select 0);
_type = (_this select 1);
_tempArray = [];
#include "UnitPools\arvn.sqf";
#include "UnitPools\macv.sqf";
#include "UnitPools\pavn.sqf";
#include "UnitPools\vc.sqf";

switch (_faction)
	do {
	// EAST PAVN FACTION
	case 0:
	{
		_InfPool = pavn_InfPool + [];
		_ArmPool = pavn_ArmPool + [];
		_MotPool = pavn_MotPool + [];
		_ACHPool =pavn_ACHPool + [];
		_CHPool = pavn_CHPool + [];
		_uavPool = pavn_uavPool + [];
		_stPool = pavn_stPool + [];
		_shipPool = pavn_shipPool + [];
		_diverPool = pavn_diverPool + [];
		_crewPool = pavn_crewPool + [];
		_heliCrew = pavn_heliCrew + [];
		_boxPool = pavn_boxPool + [];
	};
	// ARVN FACTION
	case 1:
	{
		_InfPool = arvn_InfPool + [];
		_ArmPool = arvn_ArmPool + [];
		_MotPool = arvn_MotPool + [];
		_ACHPool =arvn_ACHPool + [];
		_CHPool = arvn_CHPool + [];
		_uavPool = arvn_uavPool + [];
		_stPool = arvn_stPool + [];
		_shipPool = arvn_shipPool + [];
		_diverPool = arvn_diverPool + [];
		_crewPool = arvn_crewPool + [];
		_heliCrew = arvn_heliCrew + [];
		_boxPool = arvn_boxPool + [];
	};
	// INDEPENDENT VC FACTION
	case 2:
	{
		_InfPool = vc_InfPool + [];
		_ArmPool = vc_ArmPool + [];
		_MotPool = vc_MotPool + [];
		_ACHPool =vc_ACHPool + [];
		_CHPool = vc_CHPool + [];
		_uavPool = vc_uavPool + [];
		_stPool = vc_stPool + [];
		_shipPool = vc_shipPool + [];
		_diverPool = vc_diverPool + [];
		_crewPool = vc_crewPool + [];
		_heliCrew = vc_heliCrew + [];
		_boxPool = vc_boxPool + [];
	};
	// MACV
	case 3:
	{
		_InfPool = macv_InfPool + [];
		_ArmPool = macv_ArmPool + [];
		_MotPool = macv_MotPool + [];
		_ACHPool =macv_ACHPool + [];
		_CHPool = macv_CHPool + [];
		_uavPool = macv_uavPool + [];
		_stPool = macv_stPool + [];
		_shipPool = macv_shipPool + [];
		_diverPool = macv_diverPool + [];
		_crewPool = macv_crewPool + [];
		_heliCrew = macv_heliCrew + [];
		_boxPool = macv_boxPool + [];
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
