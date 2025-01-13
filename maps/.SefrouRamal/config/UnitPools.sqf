private
[
	"_tempArray", "_InfPool", "_MotPool", "_ACHPool", "_CHPool", "_uavPool", "_stPool", "_shipPool", "_diverPool", "_crewPool", "_heliCrew", "_ArmPool", "_boxPool"
];
_faction = (_this select 0);
_type = (_this select 1);
_tempArray = [];
#include "..\Server\eos\UnitPools\aaf.sqf";
#include "..\Server\eos\UnitPools\csat_p.sqf";
#include "..\Server\eos\UnitPools\csat_sf.sqf";
#include "..\Server\eos\UnitPools\csat_u.sqf";
#include "..\Server\eos\UnitPools\csat.sqf";
#include "..\Server\eos\UnitPools\ldf.sqf";
#include "..\Server\eos\UnitPools\nato_p.sqf";
#include "..\Server\eos\UnitPools\nato_sf.sqf";
#include "..\Server\eos\UnitPools\nato.sqf";
#include "..\Server\eos\UnitPools\synd.sqf";
#include "..\Server\eos\UnitPools\WS_ION.sqf";
#include "..\Server\eos\UnitPools\WS_SFIA.sqf";
#include "..\Server\eos\UnitPools\WS_TURA.sqf";
#include "..\Server\eos\UnitPools\WS_UNA.sqf";
if(isClass(configFile>>"cfgPatches">>"RF_Vehicles")) then {
	#include "..\Server\eos\UnitPools\RF_WS.sqf";
};
switch (_faction)
	do {
	// EAST CSAT FACTION
	case 0:
	{
		_InfPool = csat_InfPool + [];
		_ArmPool = csat_ArmPool + [];
		_MotPool = csat_MotPool + [];
		_ACHPool =csat_ACHPool + [];
		_CHPool = csat_CHPool + [];
		_uavPool = csat_uavPool + [];
		_stPool = csat_stPool + [];
		_shipPool = csat_shipPool + [];
		_diverPool = csat_diverPool + [];
		_crewPool = csat_crewPool + [];
		_heliCrew = csat_heliCrew + [];
		_boxPool = csat_boxPool + [];
	};
	// WEST NATO FACTION
	case 1:
	{
		_InfPool = nato_InfPool + [];
		_ArmPool = nato_ArmPool + [];
		_MotPool = nato_MotPool + [];
		_ACHPool =nato_ACHPool + [];
		_CHPool = nato_CHPool + [];
		_uavPool = nato_uavPool + [];
		_stPool = nato_stPool + [];
		_shipPool = nato_shipPool + [];
		_diverPool = nato_diverPool + [];
		_crewPool = nato_crewPool + [];
		_heliCrew = nato_heliCrew + [];
		_boxPool = nato_boxPool + [];
	};
	// INDEPENDENT AAF FACTION
	case 2:
	{
		_InfPool = aaf_InfPool + [];
		_ArmPool = aaf_ArmPool + [];
		_MotPool = aaf_MotPool + [];
		_ACHPool =aaf_ACHPool + [];
		_CHPool = aaf_CHPool + [];
		_uavPool = aaf_uavPool + [];
		_stPool = aaf_stPool + [];
		_shipPool = aaf_shipPool + [];
		_diverPool = aaf_diverPool + [];
		_crewPool = aaf_crewPool + [];
		_heliCrew = aaf_heliCrew + [];
		_boxPool = aaf_boxPool + [];
	};
	// NATO PACIFIC
	case 3:
	{
		_InfPool = nato_p_InfPool + [];
		_ArmPool = nato_p_ArmPool + [];
		_MotPool = nato_p_MotPool + [];
		_ACHPool =nato_p_ACHPool + [];
		_CHPool = nato_p_CHPool + [];
		_uavPool = nato_p_uavPool + [];
		_stPool = nato_p_stPool + [];
		_shipPool = nato_p_shipPool + [];
		_diverPool = nato_p_diverPool + [];
		_crewPool = nato_p_crewPool + [];
		_heliCrew = nato_p_heliCrew + [];
		_boxPool = nato_p_boxPool + [];
	};
	// INDEPENDENT SYNDIKAT FACTION
	case 4:
	{
		_InfPool = synd_InfPool + [];
		_ArmPool = synd_ArmPool + [];
		_MotPool = synd_MotPool + [];
		_ACHPool =synd_ACHPool + [];
		_CHPool = synd_CHPool + [];
		_uavPool = synd_uavPool + [];
		_stPool = synd_stPool + [];
		_shipPool = synd_shipPool + [];
		_diverPool = synd_diverPool + [];
		_crewPool = synd_crewPool + [];
		_heliCrew = synd_heliCrew + [];
		_boxPool = synd_boxPool + [];
	};
	// EAST CSAT URBAN UNITS
	case 5:
	{
		_InfPool = csat_u_InfPool + [];
		_ArmPool = csat_u_ArmPool + [];
		_MotPool = csat_u_MotPool + [];
		_ACHPool =csat_u_ACHPool + [];
		_CHPool = csat_u_CHPool + [];
		_uavPool = csat_u_uavPool + [];
		_stPool = csat_u_stPool + [];
		_shipPool = csat_u_shipPool + [];
		_diverPool = csat_u_diverPool + [];
		_crewPool = csat_u_crewPool + [];
		_heliCrew = csat_u_heliCrew + [];
		_boxPool = csat_u_boxPool + [];	
	};

	// EAST CSAT SPECOPS UNITS
	case 6:
	{
		_InfPool = csat_sf_InfPool + [];
		_ArmPool = csat_sf_ArmPool + [];
		_MotPool = csat_sf_MotPool + [];
		_ACHPool =csat_sf_ACHPool + [];
		_CHPool = csat_sf_CHPool + [];
		_uavPool = csat_sf_uavPool + [];
		_stPool = csat_sf_stPool + [];
		_shipPool = csat_sf_shipPool + [];
		_diverPool = csat_sf_diverPool + [];
		_crewPool = csat_sf_crewPool + [];
		_heliCrew = csat_sf_heliCrew + [];
		_boxPool = csat_sf_boxPool + [];	
	};

	// EAST TANOA CSAT FACTION
	case 7:
	{
		_InfPool = csat_p_InfPool + [];
		_ArmPool = csat_p_ArmPool + [];
		_MotPool = csat_p_MotPool + [];
		_ACHPool =csat_p_ACHPool + [];
		_CHPool = csat_p_CHPool + [];
		_uavPool = csat_p_uavPool + [];
		_stPool = csat_p_stPool + [];
		_shipPool = csat_p_shipPool + [];
		_diverPool = csat_p_diverPool + [];
		_crewPool = csat_p_crewPool + [];
		_heliCrew = csat_p_heliCrew + [];
		_boxPool = csat_p_boxPool + [];	
	};

	//CTRG & NATO SF & NATO Woodland
	case 8:
	{
		_InfPool = nato_sf_InfPool + [];
		_ArmPool = nato_sf_ArmPool + [];
		_MotPool = nato_sf_MotPool + [];
		_ACHPool =nato_sf_ACHPool + [];
		_CHPool = nato_sf_CHPool + [];
		_uavPool = nato_sf_uavPool + [];
		_stPool = nato_sf_stPool + [];
		_shipPool = nato_sf_shipPool + [];
		_diverPool = nato_sf_diverPool + [];
		_crewPool = nato_sf_crewPool + [];
		_heliCrew = nato_sf_heliCrew + [];
		_boxPool = nato_sf_boxPool + [];	
	};

	//LDF
	case 9:
	{
		_InfPool = ldf_InfPool + [];
		_ArmPool = ldf_ArmPool + [];
		_MotPool = ldf_MotPool + [];
		_ACHPool =ldf_ACHPool + [];
		_CHPool = ldf_CHPool + [];
		_uavPool = ldf_uavPool + [];
		_stPool = ldf_stPool + [];
		_shipPool = ldf_shipPool + [];
		_diverPool = ldf_diverPool + [];
		_crewPool = ldf_crewPool + [];
		_heliCrew = ldf_heliCrew + [];
		_boxPool = ldf_boxPool + [];
	};

	//ION
	case 10:
	{
		_InfPool = wsION_InfPool + [];
		_ArmPool = wsION_ArmPool + [];
		_MotPool = wsION_MotPool + [];
		_ACHPool =wsION_ACHPool + [];
		_CHPool = wsION_CHPool + [];
		_uavPool = wsION_uavPool + [];
		_stPool = wsION_stPool + [];
		_shipPool = wsION_shipPool + [];
		_diverPool = wsION_diverPool + [];
		_crewPool = wsION_crewPool + [];
		_heliCrew = wsION_heliCrew + [];
		_boxPool = wsION_boxPool + [];
	};

	//SFIA
	case 11:
	{
		_InfPool = wsSFIA_InfPool + [];
		_ArmPool = wsSFIA_ArmPool + [];
		_MotPool = wsSFIA_MotPool + [];
		_ACHPool =wsSFIA_ACHPool + [];
		_CHPool = wsSFIA_CHPool + [];
		_uavPool = wsSFIA_uavPool + [];
		_stPool = wsSFIA_stPool + [];
		_shipPool = wsSFIA_shipPool + [];
		_diverPool = wsSFIA_diverPool + [];
		_crewPool = wsSFIA_crewPool + [];
		_heliCrew = wsSFIA_heliCrew + [];
		_boxPool = wsSFIA_boxPool + [];
	};

	//Tura
	case 12:
	{
		_InfPool = wsTura_InfPool + [];
		_ArmPool = wsTura_ArmPool + [];
		_MotPool = wsTura_MotPool + [];
		_ACHPool =wsTura_ACHPool + [];
		_CHPool = wsTura_CHPool + [];
		_uavPool = wsTura_uavPool + [];
		_stPool = wsTura_stPool + [];
		_shipPool = wsTura_shipPool + [];
		_diverPool = wsTura_diverPool + [];
		_crewPool = wsTura_crewPool + [];
		_heliCrew = wsTura_heliCrew + [];
		_boxPool = wsTura_boxPool + [];
	};

	//UNA
	case 13:
	{
		_InfPool = wsUNA_InfPool + [];
		_ArmPool = wsUNA_ArmPool + [];
		_MotPool = wsUNA_MotPool + [];
		_ACHPool =wsUNA_ACHPool + [];
		_CHPool = wsUNA_CHPool + [];
		_uavPool = wsUNA_uavPool + [];
		_stPool = wsUNA_stPool + [];
		_shipPool = wsUNA_shipPool + [];
		_diverPool = wsUNA_diverPool + [];
		_crewPool = wsUNA_crewPool + [];
		_heliCrew = wsUNA_heliCrew + [];
		_boxPool = wsUNA_boxPool + [];
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
		if(count _boxPool > 0) then {
			_tempUnit = selectRandomWeighted _boxPool;
			_temparray set[count _temparray, _tempUnit];
		};
	};
};
_tempArray
