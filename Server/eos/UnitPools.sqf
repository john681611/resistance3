private ["_tempArray","_InfPool","_MotPool","_ACHPool","_CHPool","_uavPool","_stPool","_shipPool","_diverPool","_crewPool","_heliCrew","_ArmPool","_boxPool"];
_faction=(_this select 0);
_type=(_this select 1);
_tempArray=[];

switch (_faction) do {
	// EAST CSAT FACTION
	case 0 :{
		_InfPool=	["O_Soldier_F",.7,"O_Soldier_GL_F",.4,"O_Soldier_LAT_F",.4,"O_medic_F",.5,"O_Soldier_AR_F",.4,"O_Soldier_TL_F",.3,"O_soldier_M_F",.2,"O_Soldier_AA_F",.2,
		"O_Soldier_AT_F",.3,"O_Soldier_A_F",.2,"O_Soldier_SL_F",.2,"O_soldier_exp_F",.3,"O_engineer_F",.3,"O_HeavyGunner_F",.2,"O_Sharpshooter_F",.2,"O_officer_F",.1,"O_sniper_F",.1,"O_spotter_F",.1,"O_soldier_mine_F",.1];
		_ArmPool=	["O_APC_Wheeled_02_rcws_F",.8,"O_APC_Tracked_02_cannon_F",.4,"O_APC_Tracked_02_AA_F",.2,"O_MBT_02_cannon_F",.3,"O_MBT_02_arty_F",.3];
		_MotPool=	["O_Truck_03_covered_F",.3,"O_Truck_03_transport_F",.3,"O_Truck_03_medical_F",.3,"O_MRAP_02_F",.5,"O_MRAP_02_hmg_F",.6,"O_MRAP_02_gmg_F",.4];
		_ACHPool=	["O_Heli_Attack_02_black_F",.5,"O_Heli_Attack_02_F",.5,"O_Plane_CAS_02_F",.5,"O_Plane_Fighter_02_F",.3];
		_CHPool=	["O_Heli_Light_02_unarmed_F",.7,"O_Heli_Transport_04_bench_F",.5,"O_Heli_Light_02_F",.3];
		_uavPool=	["O_UAV_01_F",.7,"O_UAV_02_CAS_F",.3,"O_UGV_01_rcws_F",.4,"O_UAV_06_F",.3];
		_stPool=	["O_HMG_01_high_F",.7,"O_GMG_01_F",.4,"O_Mortar_01_F",.4];
		_shipPool=	["O_Boat_Transport_01_F",.6,"O_Boat_Armed_01_hmg_F",.4];
		_diverPool=	["O_diver_exp_F",.3,"O_diver_F",.7,"O_diver_TL_F",.3];
		_crewPool=	["O_crew_F",.5];
		_heliCrew=	["O_helicrew_F",.5,"O_helipilot_F",.5];
		_boxPool = ["Box_East_Ammo_F",.7,"Box_East_Support_F",.2,"Box_East_WpsSpecial_F",.3,"O_supplyCrate_F",.2,"Box_East_WpsLaunch_F",.6,"Box_East_Wps_F",.5,"Box_CSAT_Equip_F",.2,
		"Box_NATO_Ammo_F",.3,"Box_NATO_Wps_F",.2,"Box_NATO_WpsSpecial_F",.1,"Box_NATO_WpsLaunch_F",.2,"Box_NATO_Support_F",.1,"C_supplyCrate_F",.1,"B_supplyCrate_F",.1];
	};
	// WEST NATO FACTION
	case 1 :{
		_InfPool=	["B_sniper_F",.5,"B_Soldier_A_F",.5,"B_Soldier_AA_F",.5,"B_Soldier_AAA_F",.5,"B_Soldier_AAR_F",.5,"B_Soldier_AAT_F",.5,"B_Soldier_AR_F",.5,"B_Soldier_AT_F",.5,"B_soldier_exp_F",.5,"B_Soldier_F",.5,"B_engineer_F",.5,"B_medic_F",.5,"B_recon_exp_F",.5,"B_recon_F",.5,"B_recon_JTAC_F",.5,"B_recon_LAT_F",.5,"B_recon_M_F",.5,"B_recon_medic_F",.5,"B_recon_TL_F",.5];
		_ArmPool=	["B_MBT_01_arty_F",.5,"B_MBT_01_cannon_F",.5,"B_MBT_01_mlrs_F",.5,"B_APC_Tracked_01_AA_F",.5,"B_APC_Tracked_01_CRV_F",.5,"B_APC_Tracked_01_rcws_F",.5,"B_APC_Wheeled_01_cannon_F",.5,"B_MBT_02_cannon_F",.5];
		_MotPool=	["B_Truck_01_covered_F",.5,"B_Truck_01_transport_F",.5,"B_MRAP_01_F",.5,"B_MRAP_01_gmg_F",.5,"B_MRAP_01_hmg_F",.5,"B_Truck_01_medical_F",.5];
		_ACHPool=	["B_Heli_Attack_01_F",.5,"B_Heli_Light_01_armed_F",.5];
		_CHPool=	["B_Heli_Light_01_F",.5,"B_Heli_Transport_01_camo_F",.5,"B_Heli_Transport_01_F",.5];
		_uavPool=	["B_UAV_01_F",.5,"B_UAV_01_CAS_F",.5,"B_UGV_01_rcws_F",.5];
		_stPool=	["B_Mortar_01_F",.5,"B_static_AT_F",.5,"B_static_AA_F",.5];
		_shipPool=	["B_Boat_Armed_01_minigun_F",.5,"B_Boat_Transport_01_F",.5];
		_diverPool=	["B_diver_exp_F",.5,"B_diver_F",.5,"B_diver_TL_F",.5];
		_crewPool=	["B_crew_F",.5];
		_heliCrew=	["B_helicrew_F",.5,"B_helipilot_F",.5];
		_boxPool = [];
	};
	// INDEPENDENT AAF FACTION
	case 2 :{
		_InfPool=	["I_Soldier_F",.7,"I_Soldier_GL_F",.4,"I_Soldier_AR_F",.4,"I_medic_F",.5,"I_Soldier_LAT_F",.4,"I_Soldier_TL_F",.3,"I_Soldier_AT_F",.3,"I_Soldier_AA_F",.2,"I_Soldier_SL_F",.2,"I_Soldier_M_F",.2,
		"I_Soldier_repair_F",.3,"I_Soldier_exp_F",.3,"I_officer_F",.1,"I_Spotter_F",.1,"I_Sniper_F",.1,"I_soldier_mine_F",.1];
		_ArmPool=	["I_APC_Wheeled_03_cannon_F",.7,"I_APC_tracked_03_cannon_F",.3,"I_MBT_03_cannon_F",.3];
		_MotPool=	["I_Truck_02_covered_F",.3,"I_Truck_02_transport_F",.3,"I_Truck_02_medical_F",.3,"I_Truck_02_ammo_F",.2,"I_Truck_02_fuel_F",.2,
		"I_Truck_02_box_F",.1,"I_MRAP_03_F",.3,"I_MRAP_03_gmg_F",.4,"I_MRAP_03_hmg_F",.6];
		_ACHPool=	["I_Heli_light_03_F",.7,"I_Plane_Fighter_04_Cluster_F",.3,"I_Plane_Fighter_03_CAS_F",.5];
		_CHPool=	["I_Heli_light_03_unarmed_F",.7,"I_Heli_Transport_02_F",.3];
		_uavPool=	["I_UAV_01_F",.7,"I_UAV_02_CAS_F",.3,"I_UGV_01_rcws_F",.5];
		_stPool=	["I_HMG_01_high_F",.7,"I_GMG_01_high_F",.3,"I_Mortar_01_F",.3];
		_shipPool=	["I_Boat_Transport_01_F",.7,"I_G_Boat_Transport_01_F",.3,"I_Boat_Armed_01_minigun_F",.2];
		_diverPool=	["I_diver_exp_F",.3,"I_diver_F",.7,"I_diver_TL_F",.3];
		_crewPool=	["I_crew_F",.5];
		_heliCrew=	["I_helicrew_F",.5,"I_helipilot_F",.5];
		_boxPool = ["Box_IND_Ammo_F",.7,"Box_IND_Support_F",.2,"Box_IND_WpsSpecial_F",.3,"I_supplyCrate_F",.2,"Box_IND_Wps_F",.5,"Box_AAF_Equip_F",.2,
		"Box_NATO_Wps_F",.2,"Box_NATO_WpsSpecial_F",.1,"Box_NATO_WpsLaunch_F",.2,
		"Box_NATO_Support_F",.1,"C_supplyCrate_F",.1,"B_supplyCrate_F",.1];
	};
	// CIVILIAN
	case 3 : {
		_InfPool=	["C_man_1",.5,"C_man_1_1_F",.5,"C_man_1_2_F",.5,"C_man_1_3_F",.5,"C_man_hunter_1_F",.5,"C_man_p_beggar_F",.5,"C_man_p_beggar_F_afro",.5,"C_man_p_fugitive_F",.5,"C_man_p_shorts_1_F",.5,"C_man_pilot_F",.5,"C_man_polo_1_F",.5,"C_man_polo_2_F",.5,"C_man_polo_3_F",.5,"C_man_polo_4_F",.5,"C_man_polo_5_F",.5,"C_man_polo_6_F",.5,"C_man_shorts_1_F",.5,"C_man_shorts_2_F",.5,"C_man_shorts_3_F",.5,"C_man_shorts_4_F",.5,"C_man_w_worker_F",.5];
		_ArmPool=	["C_Hatchback_01_F",.5,"C_Hatchback_01_sport_F",.5,"C_Quadbike_01_F",.5,"C_SUV_01_F",.5,"C_Van_01_transport_F",.5,"C_Van_01_box_F",.5];
		_MotPool=	["C_Hatchback_01_F",.5,"C_Hatchback_01_sport_F",.5,"C_Quadbike_01_F",.5,"C_SUV_01_F",.5,"C_Van_01_transport_F",.5,"C_Van_01_box_F",.5];
		_ACHPool=	[];
		_CHPool=	[];
		_uavPool=	[];
		_stPool=	[];
		_shipPool=	["C_Boat_Civil_01_F",.5,"C_Boat_Civil_01_rescue_F",.5,"C_Boat_Civil_04_F",.5,"C_Rubberboat",.5];
		_diverPool=	[];
		_crewPool=	["C_man_1",.5];
		_heliCrew=	["C_man_1",.5,"C_man_1",.5];
	};
	// INDEPENDENT SYNDIKAT FACTION
	case 4 : {
		_InfPool=	["I_C_Soldier_Para_8_F",.5,"I_C_Soldier_Bandit_1_F",.5,"I_C_Soldier_Bandit_7_F",.5,"I_C_Soldier_Bandit_3_F",.5,"I_C_Soldier_Para_4_F",.5,"I_C_Soldier_Bandit_8_F",.5,"I_C_Soldier_Para_1_F",.5,"I_C_Soldier_Para_6_F",.5,"I_C_Soldier_Para_5_F",.5,"I_C_Soldier_Bandit_2_F",.5,"I_C_Soldier_Bandit_4_F",.5,"I_C_Helipilot_F",.5,"I_C_Soldier_Para_3_F",.5];
		_ArmPool=	["I_G_Offroad_01_armed_F",0.5];
		_MotPool=	["I_G_Offroad_01_repair_F",.3,"I_C_Offroad_02_unarmed_F",.5,"I_C_Van_01_transport_F",.5,"I_C_Van_02_vehicle_F",.5,"I_C_Van_02_transport_F",.5];
		_ACHPool=	["I_C_Heli_Light_01_civil_F",.5,"I_C_Plane_Civil_01_F",.3];
		_CHPool=	["I_C_Heli_Light_01_civil_F",.5];
		_uavPool=	[];
		_stPool=	["B_G_Mortar_01_F",.5];
		_shipPool=	["I_C_Boat_Transport_02_F",.5,"I_C_Boat_Transport_01_F",.5];
		_diverPool=	["I_C_Soldier_Bandit_7_F",.5];
		_crewPool=	["I_C_Soldier_Para_7_F",.5];
		_heliCrew=	["I_C_Helipilot_F",.5,"I_C_Pilot_F",.5];
		_boxPool = ["Box_Syndicate_Ammo_F",.4,"Box_Syndicate_Wps_F",.3,"Box_Syndicate_WpsLaunch_F",.5,"Box_GEN_Equip_F",.3];
	};
	// EAST CSAT URBAN UNITS
	case 5 : {
		_InfPool=	["O_soldierU_F",.7,"O_SoldierU_GL_F",.4,"O_soldierU_LAT_F",.4,"O_soldierU_AR_F",.4,"O_soldierU_medic_F",.5,"O_soldierU_TL_F",.3,"O_soldierU_AT_F",.3,"O_soldierU_AA_F",.3,
		"O_SoldierU_SL_F",.2,"O_soldierU_M_F",.2,"O_Urban_HeavyGunner_F",.2,"O_Urban_Sharpshooter_F",.2];
		_ArmPool=	["O_APC_Wheeled_02_rcws_F",.8,"O_APC_Tracked_02_cannon_F",.3,"O_APC_Tracked_02_AA_F",.2,"O_MBT_02_cannon_F",.3,"O_MBT_02_arty_F",.3];
		_MotPool=	["O_Truck_03_covered_F",.3,"O_Truck_03_transport_F",.3,"O_Truck_03_medical_F",.2,"O_Truck_03_ammo_F",.2,"O_Truck_03_fuel_F",.2,"O_Truck_03_box_F",.1,"O_MRAP_02_F",.3,
		"O_MRAP_02_hmg_F",.6,"O_MRAP_02_gmg_F",.3];
		_ACHPool=	["O_Heli_Attack_02_black_F",.5,"O_Heli_Attack_02_F",.5,"O_Plane_CAS_02_F",.3];
		_CHPool=	["O_Heli_Light_02_F",.4,"O_Heli_Light_02_unarmed_F",.6];
		_uavPool=	["O_UAV_01_F",.7,"O_UAV_02_CAS_F",.3,"O_UGV_01_rcws_F",.5];
		_stPool=	["O_Mortar_01_F",.3,"O_HMG_01_high_F",.7,"O_GMG_01_high_F",.3];
		_shipPool=	["O_Boat_Armed_01_hmg_F",.3,"O_Boat_Transport_01_F",.7];
		_diverPool=	["O_diver_exp_F",.3,"O_diver_F",.7,"O_diver_TL_F",.3];
		_crewPool=	["O_crew_F",.5];
		_heliCrew=	["O_helicrew_F",.5,"O_helipilot_F",.5];
		_boxPool = ["Box_East_Ammo_F",.7,"Box_East_Support_F",.2,"Box_East_WpsSpecial_F",35,"O_supplyCrate_F",.2,"Box_East_WpsLaunch_F",.6,"Box_East_Wps_F",.5,"Box_CSAT_Equip_F",.2,
		"Box_T_NATO_Wps_F",.2,"Box_T_NATO_WpsSpecial_F",.1,"Box_NATO_Equip_F",.1,"C_T_supplyCrate_F",.1,"Box_NATO_Uniforms_F",.1];
	};

	// EAST CSAT SPECOPS UNITS
	case 6 :{
		_InfPool=	["O_recon_F",.5,"O_recon_LAT_F",.3,"O_recon_M_F",.2,"O_recon_medic_F",.5,"O_recon_TL_F",.3,"O_recon_JTAC_F",.2,"O_recon_exp_F",.3,"O_Pathfinder_F",.1,"O_V_Soldier_Exp_hex_F",.2,
		"O_V_Soldier_hex_F",.2,"O_V_Soldier_JTAC_hex_F",.1,"O_V_Soldier_LAT_hex_F",.2,"O_V_Soldier_M_hex_F",.1,"O_V_Soldier_Medic_hex_F",.2,"O_V_Soldier_TL_hex_F",.1,"O_V_Soldier_Viper_hex_F",.2];
		_ArmPool=	["O_APC_Wheeled_02_rcws_F",.7,"O_APC_Tracked_02_cannon_F",.3,"O_APC_Tracked_02_AA_F",.1,"O_MBT_02_cannon_F",.3];
		_MotPool=	["O_Truck_03_covered_F",.2,"O_Truck_03_transport_F",.2,"O_LSV_02_armed_F",.5,"O_LSV_02_unarmed_F",.5,"O_Truck_03_medical_F",.2,"O_Truck_03_ammo_F",.2,"O_Truck_03_fuel_F",.2,"O_Truck_03_box_F",.2];
		_ACHPool=	["O_Heli_Attack_02_black_F",.5,"O_Heli_Attack_02_F",.5,"O_Plane_CAS_02_F",.3];
		_CHPool=	["O_Heli_Light_02_F",.5,"O_Heli_Light_02_unarmed_F",.5];
		_uavPool=	["O_UAV_01_F",.7,"O_UAV_02_CAS_F",.3,"O_UGV_01_rcws_F",.3];
		_stPool=	["O_Mortar_01_F",.3,"O_HMG_01_high_F",.7,"O_GMG_01_high_F",.3];
		_shipPool=	["O_Boat_Armed_01_hmg_F",.5,"O_Boat_Transport_01_F",.5];
		_diverPool=	["O_diver_exp_F",.3,"O_diver_F",.7,"O_diver_TL_F",.3];
		_crewPool=	["O_crew_F",.5];
		_heliCrew=	["O_helicrew_F",.5,"O_helipilot_F",.5];
		_boxPool = ["Box_NATO_Ammo_F",.5,"Box_NATO_Wps_F",.3,"Box_T_NATO_Wps_F",.3,"Box_NATO_WpsSpecial_F",.2,"Box_T_NATO_WpsSpecial_F",.2,"Box_NATO_WpsLaunch_F",.5,"Box_NATO_Equip_F",.1,
		"Box_NATO_Support_F",.1,"C_supplyCrate_F",.1,"C_T_supplyCrate_F",.1,"B_supplyCrate_F",.1,"Box_NATO_Uniforms_F",.1];
	};

	// EAST TANOA CSAT FACTION
	case 7 :{
		_InfPool=	["O_T_Soldier_F",.7,"O_T_Soldier_GL_F",.4,"O_T_Soldier_LAT_F",.4,"O_T_medic_F",.5,"O_T_Soldier_AR_F",.4,"O_T_Soldier_TL_F",.3,"O_T_soldier_M_F",.2,"O_T_Soldier_AA_F",.3,
		"O_T_Soldier_AT_F",.3,"O_T_Soldier_A_F",.2,"O_T_Soldier_SL_F",.2,"O_T_soldier_exp_F",.3,"O_T_engineer_F",.3,"O_T_officer_F",.1,"O_T_sniper_F",.1,"O_T_spotter_F",.1,"O_T_soldier_mine_F",.1];
		_ArmPool=	["O_T_APC_Wheeled_02_rcws_ghex_F",.7,"O_T_APC_Tracked_02_cannon_ghex_F",.3,"O_T_APC_Tracked_02_AA_ghex_F",.1,"O_T_MBT_02_cannon_ghex_F",.2,"O_T_MBT_02_arty_ghex_F",.2];
		_MotPool=	["O_T_Truck_03_covered_ghex_F",.3,"O_T_Truck_03_transport_ghex_F",.3,"O_T_Truck_03_medical_ghex_F",.3,"O_T_Truck_03_ammo_ghex_F",.3,
		"O_T_Truck_03_fuel_ghex_F",.3,"O_T_Truck_03_repair_ghex_F",.3,"O_T_LSV_02_unarmed_F",.5,"O_T_LSV_02_armed_F",.7,"O_T_MRAP_02_ghex_F",.5,"O_T_MRAP_02_hmg_ghex_F",.6,"O_T_MRAP_02_gmg_ghex_F",.4];
		_ACHPool=	["O_T_VTOL_02_vehicle_F",.5];
		_CHPool=	["O_T_VTOL_02_infantry_F",.5];
		_uavPool=	["O_T_UAV_04_CAS_F",.5,"O_T_UGV_01_rcws_F",.5];
		_stPool=	["O_HMG_01_high_F",.7,"O_GMG_01_F",.3,"O_Mortar_01_F",.3];
		_shipPool=	["O_Boat_Transport_01_F",.7,"O_Boat_Armed_01_hmg_F",.3];
		_diverPool=	["O_T_diver_exp_F",.3,"O_T_diver_F",.7,"O_T_diver_TL_F",.3];
		_crewPool=	["O_T_crew_F",.5];
		_heliCrew=	["O_T_helicrew_F",.5,"O_T_helipilot_F",.5];
		_boxPool = ["Box_T_East_Ammo_F",.7,"Box_T_East_WpsSpecial_F",.3,"Box_T_East_Wps_F",.5,"Box_East_Support_F",.2,"O_supplyCrate_F",2,"Box_East_WpsLaunch_F",.6,"Box_CSAT_Equip_F",.2,
		"Box_T_NATO_Wps_F",.2,"Box_T_NATO_WpsSpecial_F",.1,"Box_NATO_Equip_F",.1,"C_T_supplyCrate_F",.1,"Box_NATO_Uniforms_F",.1];
	};

	//TESTING
	case 8 :{
		_InfPool=	["o_soldier_unarmed_f",.5];
		_ArmPool=	["I_Truck_02_box_F",.5];
		_MotPool=	["I_Truck_02_box_F",.5];
		_ACHPool=	["I_Truck_02_box_F",.5];
		_CHPool=	["I_Truck_02_box_F",.5];
		_uavPool=	["I_Truck_02_box_F",.5];
		_stPool=	[];
		_shipPool=	["I_Truck_02_box_F",.5];
		_diverPool=	["o_soldier_unarmed_f",.5];
		_crewPool=	["O_crew_F",.5];
		_heliCrew=	["O_helicrew_F",.5,"O_helipilot_F",.5];
	};
};

////////////////////////////////////////////////////////////////////////////////////////
switch (_type) do {

	case 0 :{
		_tempArray = _InfPool;
	};

	case 1 :{
		_tempArray=_diverPool;
	};

	// CREATE ARMOUR & CREW
	case 2 :{
		_tempArray = [_ArmPool,_crewPool] call eos_fnc_setCrewedUnit;
	};

	// CREATE ATTACK CHOPPER & CREW
	case 3 :{
		_tempArray = [_ACHPool,_heliCrew] call eos_fnc_setCrewedUnit;
	};

	// CREATE TRANSPORT CHOPPER & CREW
	case 4 :{
		_tempArray = [_CHPool,_heliCrew] call eos_fnc_setCrewedUnit;
	};

	// CREATE STATIC & CREW
	case 5 :{
		_tempArray = [_stPool,_crewPool] call eos_fnc_setCrewedUnit;
	};
	case 6 :{
		_tempArray= selectRandomWeighted _uavPool;
	};

	// CREATE TRANSPORT & CREW
	case 7 :{
		_tempArray = [_MotPool,_crewPool] call eos_fnc_setCrewedUnit;
	};

	// CREATE BOAT & DIVER CREW
	case 8 :{
		_tempArray = [_shipPool,_diverPool] call eos_fnc_setCrewedUnit;
	};

	// CREATE CARGO
	case 9 :{
		_temparray = _InfPool;
	};

	// CREATE DIVER CARGO
	case 10 :{
		_temparray = _diverPool;
	};

	case 11 :{
		_tempUnit= selectRandomWeighted _boxPool;
		_temparray set [count _temparray,_tempUnit];
	};
};
_tempArray
