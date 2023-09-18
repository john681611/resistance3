private
[
	"_tempArray", "_InfPool", "_MotPool", "_ACHPool", "_CHPool", "_uavPool", "_stPool", "_shipPool", "_diverPool", "_crewPool", "_heliCrew", "_ArmPool", "_boxPool"
];
_faction = (_this select 0);
_type = (_this select 1);
_tempArray = [];
#include "..\Server\eos\UnitPools\3CB_Ard_Army.sqf";
#include "..\Server\eos\UnitPools\3CB_Ard_SF.sqf";
#include "..\Server\eos\UnitPools\3CB_BAF_MTP.sqf";
#include "..\Server\eos\UnitPools\3CB_Ch_Red.sqf";
#include "..\Server\eos\UnitPools\RHS_AFRF.sqf";
#include "..\Server\eos\UnitPools\RHS_PMC_D.sqf";
#include "..\Server\eos\UnitPools\RHS_USARMY_D.sqf";
#include "..\Server\eos\UnitPools\RHS_USARMY_SF.sqf";
switch (_faction)
	do {
	// EAST CSAT FACTION
	case 0:
	{
		_InfPool = UK3CB_Ard_Army_InfPool + [];
		_ArmPool = UK3CB_Ard_Army_ArmPool + [];
		_MotPool = UK3CB_Ard_Army_MotPool + [];
		_ACHPool =UK3CB_Ard_Army_ACHPool + [];
		_CHPool = UK3CB_Ard_Army_CHPool + [];
		_uavPool = UK3CB_Ard_Army_uavPool + [];
		_stPool = UK3CB_Ard_Army_stPool + [];
		_shipPool = UK3CB_Ard_Army_shipPool + [];
		_diverPool = UK3CB_Ard_Army_diverPool + [];
		_crewPool = UK3CB_Ard_Army_crewPool + [];
		_heliCrew = UK3CB_Ard_Army_heliCrew + [];
		_boxPool = UK3CB_Ard_Army_boxPool + [];
	};
	// WEST NATO FACTION
	case 1:
	{
		_InfPool = UK3CB_Ard_SF_InfPool + [];
		_ArmPool = UK3CB_Ard_SF_ArmPool + [];
		_MotPool = UK3CB_Ard_SF_MotPool + [];
		_ACHPool =UK3CB_Ard_SF_ACHPool + [];
		_CHPool = UK3CB_Ard_SF_CHPool + [];
		_uavPool = UK3CB_Ard_SF_uavPool + [];
		_stPool = UK3CB_Ard_SF_stPool + [];
		_shipPool = UK3CB_Ard_SF_shipPool + [];
		_diverPool = UK3CB_Ard_SF_diverPool + [];
		_crewPool = UK3CB_Ard_SF_crewPool + [];
		_heliCrew = UK3CB_Ard_SF_heliCrew + [];
		_boxPool = UK3CB_Ard_SF_boxPool + [];
	};
	// INDEPENDENT AAF FACTION
	case 2:
	{
		_InfPool = UK3CB_Ch_Red_InfPool + [];
		_ArmPool = UK3CB_Ch_Red_ArmPool + [];
		_MotPool = UK3CB_Ch_Red_MotPool + [];
		_ACHPool =UK3CB_Ch_Red_ACHPool + [];
		_CHPool = UK3CB_Ch_Red_CHPool + [];
		_uavPool = UK3CB_Ch_Red_uavPool + [];
		_stPool = UK3CB_Ch_Red_stPool + [];
		_shipPool = UK3CB_Ch_Red_shipPool + [];
		_diverPool = UK3CB_Ch_Red_diverPool + [];
		_crewPool = UK3CB_Ch_Red_crewPool + [];
		_heliCrew = UK3CB_Ch_Red_heliCrew + [];
		_boxPool = UK3CB_Ch_Red_boxPool + [];
	};
	// NATO PACIFIC
	case 3:
	{
		_InfPool = RHS_AFRF_InfPool + [];
		_ArmPool = RHS_AFRF_ArmPool + [];
		_MotPool = RHS_AFRF_MotPool + [];
		_ACHPool =RHS_AFRF_ACHPool + [];
		_CHPool = RHS_AFRF_CHPool + [];
		_uavPool = RHS_AFRF_uavPool + [];
		_stPool = RHS_AFRF_stPool + [];
		_shipPool = RHS_AFRF_shipPool + [];
		_diverPool = RHS_AFRF_diverPool + [];
		_crewPool = RHS_AFRF_crewPool + [];
		_heliCrew = RHS_AFRF_heliCrew + [];
		_boxPool = RHS_AFRF_boxPool + [];
	};
	// INDEPENDENT SYNDIKAT FACTION
	case 4:
	{
		_InfPool = RHS_PMC_D_InfPool + [];
		_ArmPool = RHS_PMC_D_ArmPool + [];
		_MotPool = RHS_PMC_D_MotPool + [];
		_ACHPool =RHS_PMC_D_ACHPool + [];
		_CHPool = RHS_PMC_D_CHPool + [];
		_uavPool = RHS_PMC_D_uavPool + [];
		_stPool = RHS_PMC_D_stPool + [];
		_shipPool = RHS_PMC_D_shipPool + [];
		_diverPool = RHS_PMC_D_diverPool + [];
		_crewPool = RHS_PMC_D_crewPool + [];
		_heliCrew = RHS_PMC_D_heliCrew + [];
		_boxPool = RHS_PMC_D_boxPool + [];
	};
	// EAST CSAT URBAN UNITS
	case 5:
	{
		_InfPool = UK3CB_BAF_MTP_InfPool + [];
		_ArmPool = UK3CB_BAF_MTP_ArmPool + [];
		_MotPool = UK3CB_BAF_MTP_MotPool + [];
		_ACHPool =UK3CB_BAF_MTP_ACHPool + [];
		_CHPool = UK3CB_BAF_MTP_CHPool + [];
		_uavPool = UK3CB_BAF_MTP_uavPool + [];
		_stPool = UK3CB_BAF_MTP_stPool + [];
		_shipPool = UK3CB_BAF_MTP_shipPool + [];
		_diverPool = UK3CB_BAF_MTP_diverPool + [];
		_crewPool = UK3CB_BAF_MTP_crewPool + [];
		_heliCrew = UK3CB_BAF_MTP_heliCrew + [];
		_boxPool = UK3CB_BAF_MTP_boxPool + [];	
	};

	// EAST CSAT SPECOPS UNITS
	case 6:
	{
		_InfPool = RHS_USARMY_D_InfPool + [];
		_ArmPool = RHS_USARMY_D_ArmPool + [];
		_MotPool = RHS_USARMY_D_MotPool + [];
		_ACHPool =RHS_USARMY_D_ACHPool + [];
		_CHPool = RHS_USARMY_D_CHPool + [];
		_uavPool = RHS_USARMY_D_uavPool + [];
		_stPool = RHS_USARMY_D_stPool + [];
		_shipPool = RHS_USARMY_D_shipPool + [];
		_diverPool = RHS_USARMY_D_diverPool + [];
		_crewPool = RHS_USARMY_D_crewPool + [];
		_heliCrew = RHS_USARMY_D_heliCrew + [];
		_boxPool = RHS_USARMY_D_boxPool + [];	
	};

	// EAST TANOA CSAT FACTION
	case 7:
	{
		_InfPool = RHS_USARMY_SF_InfPool + [];
		_ArmPool = RHS_USARMY_SF_ArmPool + [];
		_MotPool = RHS_USARMY_SF_MotPool + [];
		_ACHPool =RHS_USARMY_SF_ACHPool + [];
		_CHPool = RHS_USARMY_SF_CHPool + [];
		_uavPool = RHS_USARMY_SF_uavPool + [];
		_stPool = RHS_USARMY_SF_stPool + [];
		_shipPool = RHS_USARMY_SF_shipPool + [];
		_diverPool = RHS_USARMY_SF_diverPool + [];
		_crewPool = RHS_USARMY_SF_crewPool + [];
		_heliCrew = RHS_USARMY_SF_heliCrew + [];
		_boxPool = RHS_USARMY_SF_boxPool + [];	
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
