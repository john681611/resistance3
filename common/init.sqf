waitUntil {time > 2;};
[]execVM "TFAR.sqf";
[]execVM "R3F_LOG\init.sqf";
waitUntil {!isNull player && !isnil "KeyNumber" };
[] execVM "outlw_magRepack\MagRepack_init_sv.sqf";


{
	{ 
		[_x, 
		["B_AssaultPack_blk","B_AssaultPack_cbr","B_AssaultPack_rgr","B_AssaultPack_khk","B_AssaultPack_mcamo","B_AssaultPack_sgg","B_AssaultPack_tna_F","B_FieldPack_blk","B_FieldPack_cbr","B_FieldPack_khk","B_FieldPack_oli","B_Kitbag_cbr","B_Kitbag_rgr","B_Kitbag_mcamo","B_Kitbag_sgg","B_Kitbag_tan","B_Messenger_Black_F","B_Messenger_Gray_F","B_TacticalPack_blk","B_TacticalPack_rgr"]
		, true] call BIS_fnc_addVirtualBackpackCargo;
		[_x, 
		["Binocular","MineDetector","acc_flashlight","bipod_01_F_khk","FirstAidKit","ItemCompass","ItemGPS","Medikit","ToolKit","G_Aviator","G_Balaclava_blk","G_Balaclava_combat","G_Balaclava_lowprofile","G_Balaclava_oli","G_Bandanna_aviator","G_Bandanna_beast","G_Bandanna_blk","H_Bandanna_gry","H_Bandanna_blu","H_Bandanna_cbr","H_Bandanna_khk_hs","G_Bandanna_khk","H_Bandanna_khk","H_Bandanna_mcamo","G_Bandanna_oli","H_Bandanna_sgg","H_Bandanna_sand","G_Bandanna_shades","G_Bandanna_sport","H_Bandanna_surfer","H_Bandanna_surfer_blk","H_Bandanna_surfer_grn","G_Bandanna_tan","H_Bandanna_camo","H_Watchcap_blk","H_Watchcap_cbr","H_Watchcap_camo","H_Watchcap_khk","H_Beret_blk","H_Beret_gen_F","H_Beret_02","H_Beret_Colonel","H_Booniehat_khk_hs","H_Booniehat_khk","H_Booniehat_mcamo","H_Booniehat_oli","H_Booniehat_tan","H_Booniehat_tna_F","H_Booniehat_dgtl","H_Cap_grn_BI","H_Cap_blk","H_Cap_blu","H_Cap_blk_CMMG","H_Cap_grn","H_Cap_blk_ION","H_Cap_oli","H_Cap_oli_hs","H_Cap_police","H_Cap_press","H_Cap_red","H_Cap_surfer","H_Cap_tan","H_Cap_khaki_specops_UK","H_Cap_usblack","H_Cap_tan_specops_US","H_Cap_blk_Raven","H_Cap_brn_SPECOPS","G_Combat","G_Combat_Goggles_tna_F","H_Hat_blue","H_Hat_brown","H_Hat_camo","H_Hat_checker","H_Hat_grey","H_Hat_tan","G_Lady_Blue","G_Lowprofile","H_Cap_marshal","H_MilCap_blue","H_MilCap_gen_F","H_MilCap_gry","H_MilCap_mcamo","H_MilCap_tna_F","H_Cap_headphones","G_Shades_Black","G_Shades_Blue","G_Shades_Green","G_Shades_Red","H_Shemag_olive","H_Shemag_olive_hs","H_ShemagOpen_tan","H_ShemagOpen_khk","G_Spectacles","G_Sport_Red","G_Sport_Blackyellow","G_Sport_BlackWhite","G_Sport_Checkered","G_Sport_Blackred","G_Sport_Greenblack","G_Squares_Tinted","G_Squares","H_StrawHat","H_StrawHat_dark","G_Tactical_Clear","G_Tactical_Black","G_Spectacles_Tinted","U_BG_Guerrilla_6_1","U_BG_Guerilla1_1","U_BG_Guerilla1_2_F","U_BG_Guerilla2_2","U_BG_Guerilla2_1","U_BG_Guerilla2_3","U_BG_Guerilla3_1","U_BG_leader","U_C_HunterBody_grn","U_B_survival_uniform","U_I_G_Story_Protagonist_F","V_Pocketed_black_F","V_Pocketed_coyote_F","V_Pocketed_olive_F","V_Rangemaster_belt","V_BandollierB_blk","V_BandollierB_cbr","V_BandollierB_ghex_F","V_BandollierB_rgr","V_BandollierB_khk","V_BandollierB_oli","V_TacChestrig_cbr_F","V_TacChestrig_grn_F","V_TacChestrig_oli_F","V_TacVest_blk","V_TacVest_brn","V_TacVest_camo","V_TacVest_khk","V_TacVest_oli","V_I_G_resistanceLeader_F"]
		, true] call BIS_fnc_addVirtualItemCargo;
		[_x, 
		["200Rnd_65x39_cased_Box","30Rnd_556x45_Stanag","HandGrenade","MiniGrenade","1Rnd_HE_Grenade_shell","Chemlight_blue","SmokeShell","SmokeShellGreen","DemoCharge_Remote_Mag","30Rnd_545x39_Mag_Green_F","30Rnd_762x39_Mag_Green_F","RPG7_F"]
		, true] call BIS_fnc_getVirtualMagazineCargo;
		[_x, 
		["arifle_TRG20_F","arifle_TRG21_F","arifle_TRG21_GL_F","LMG_Mk200_F","arifle_AKM_F","arifle_AKS_F","launch_RPG7_F"]
		, true] call BIS_fnc_addVirtualWeaponCargo;

		if(isClass(configFile>>"cfgPatches">>"ace_common")) then {
			[_x, 
			["ACE_fieldDressing","ACE_packingBandage","ACE_elasticBandage","ACE_tourniquet","ACE_splint","ACE_morphine","ACE_adenosine","ACE_epinephrine","ACE_plasmaIV","ACE_plasmaIV_500","ACE_plasmaIV_250","ACE_salineIV","ACE_salineIV_500","ACE_salineIV_250","ACE_bloodIV","ACE_bloodIV_500","ACE_bloodIV_250","ACE_quikclot","ACE_personalAidKit","ACE_surgicalKit","ACE_bodyBag","ACE_EarPlugs"],
			 true] call BIS_fnc_addVirtualItemCargo;
		};
		if(isClass(configFile >> "CfgPatches" >> "tfar_core")) then {
			[_x, 
			["TFAR_anprc152","TFAR_rf7800str","TFAR_microdagr"],
			 true] call BIS_fnc_addVirtualItemCargo;
			 [_x, 
			 ["TFAR_rt1523g","TFAR_rt1523g_big","TFAR_rt1523g_sage","TFAR_rt1523g_green","TFAR_rt1523g_black","TFAR_rt1523g_fabric","TFAR_rt1523g_bwmod","TFAR_rt1523g_big_bwmod","TFAR_rt1523g_big_bwmod_tropen","TFAR_rt1523g_big_rhs","TFAR_rt1523g_rhs"]
			, true] call BIS_fnc_addVirtualBackpackCargo;
		};
	} forEach nearestObjects [getMarkerPos (_x select 0), ["VirtualReammoBox_F"], 200];
} forEach Bases;