//server
private _hasWS = isClass(configFile>>"cfgPatches">>"vehicles_F_lxWS");
blacklistLocations = [""];
Hostiles = [
	[INDEPENDENT,1],.2, // NATO
	[INDEPENDENT,2],.2, // AAF
	[INDEPENDENT,3],.2, // NATO P
	[INDEPENDENT,4],.2, // SYNDIKAT
	[INDEPENDENT,8],.1, // NATO SF & CTRG
	[INDEPENDENT,9],.2, // LDF
	[EAST,0],.2, //CSAT
	[EAST,5],.2, //CSAT Urban
	[EAST,6],.1, //CSAT SF
	[EAST,7],.2 //CSAT TANOA
];

if(_hasWS) then {
  Hostiles = Hostiles + [
  [INDEPENDENT,10],.3, // ION (WS)
  [INDEPENDENT,13],.5, // UNA (WS)
  [INDEPENDENT,14],.5, // NATO D (WS)
  [EAST,11],.3, // SFIA (WS)
  [EAST,12],.5 // TURA (WS)
  ];
};
//Both
saveName = "SefrouRamal";//ENTER CUSTOM SERVER NAME HERE
MHQs =[[FLG, C1,"MHQ"],[FLG2,C2,"MHQ2"]];
Bases =[['respawn_west', Main_Zone, "South Camp"],['respawn_west_camp', Hotel_Zone,'North Camp']]; //[marker, trigger, name]
MasterBoxes = [[mb, mz], [mb2,mz2]];//[box,zone]
MasterBoxArsernalContent = [
	[
    "arifle_TRG20_F",
    "arifle_TRG21_F",
    "arifle_TRG21_GL_F",
    "LMG_Mk200_F",
    "arifle_AKM_F",
    "arifle_AKS_F",
    "launch_RPG7_F"
  ],
  [
    "200Rnd_65x39_cased_Box",
    "30Rnd_556x45_Stanag",
    "HandGrenade",
    "MiniGrenade",
    "1Rnd_HE_Grenade_shell",
    "Chemlight_blue",
    "SmokeShell",
    "SmokeShellGreen",
    "DemoCharge_Remote_Mag",
    "30Rnd_545x39_Mag_Green_F",
    "30Rnd_762x39_Mag_Green_F",
    "RPG7_F"
  ],
  [
      "Binocular",
    "MineDetector",
    "acc_flashlight",
    "bipod_01_F_khk",
    "FirstAidKit",
    "ItemCompass",
    "ItemGPS",
    "Medikit",
    "ToolKit",
    "G_Aviator",
    "G_Balaclava_blk",
    "G_Balaclava_combat",
    "G_Balaclava_lowprofile",
    "G_Balaclava_oli",
    "G_Bandanna_aviator",
    "G_Bandanna_beast",
    "G_Bandanna_blk",
    "H_Bandanna_gry",
    "H_Bandanna_blu",
    "H_Bandanna_cbr",
    "H_Bandanna_khk_hs",
    "G_Bandanna_khk",
    "H_Bandanna_khk",
    "H_Bandanna_mcamo",
    "G_Bandanna_oli",
    "H_Bandanna_sgg",
    "H_Bandanna_sand",
    "G_Bandanna_shades",
    "G_Bandanna_sport",
    "H_Bandanna_surfer",
    "H_Bandanna_surfer_blk",
    "H_Bandanna_surfer_grn",
    "G_Bandanna_tan",
    "H_Bandanna_camo",
    "H_Watchcap_blk",
    "H_Watchcap_cbr",
    "H_Watchcap_camo",
    "H_Watchcap_khk",
    "H_Beret_blk",
    "H_Beret_gen_F",
    "H_Beret_02",
    "H_Beret_Colonel",
    "H_Booniehat_khk_hs",
    "H_Booniehat_khk",
    "H_Booniehat_mcamo",
    "H_Booniehat_oli",
    "H_Booniehat_tan",
    "H_Booniehat_tna_F",
    "H_Booniehat_dgtl",
    "H_Cap_grn_BI",
    "H_Cap_blk",
    "H_Cap_blu",
    "H_Cap_blk_CMMG",
    "H_Cap_grn",
    "H_Cap_blk_ION",
    "H_Cap_oli",
    "H_Cap_oli_hs",
    "H_Cap_police",
    "H_Cap_press",
    "H_Cap_red",
    "H_Cap_surfer",
    "H_Cap_tan",
    "H_Cap_khaki_specops_UK",
    "H_Cap_usblack",
    "H_Cap_tan_specops_US",
    "H_Cap_blk_Raven",
    "H_Cap_brn_SPECOPS",
    "G_Combat",
    "G_Combat_Goggles_tna_F",
    "H_Hat_blue",
    "H_Hat_brown",
    "H_Hat_camo",
    "H_Hat_checker",
    "H_Hat_grey",
    "H_Hat_tan",
    "G_Lady_Blue",
    "G_Lowprofile",
    "H_Cap_marshal",
    "H_MilCap_blue",
    "H_MilCap_gen_F",
    "H_MilCap_gry",
    "H_MilCap_mcamo",
    "H_MilCap_tna_F",
    "H_Cap_headphones",
    "G_Shades_Black",
    "G_Shades_Blue",
    "G_Shades_Green",
    "G_Shades_Red",
    "H_Shemag_olive",
    "H_Shemag_olive_hs",
    "H_ShemagOpen_tan",
    "H_ShemagOpen_khk",
    "G_Spectacles",
    "G_Sport_Red",
    "G_Sport_Blackyellow",
    "G_Sport_BlackWhite",
    "G_Sport_Checkered",
    "G_Sport_Blackred",
    "G_Sport_Greenblack",
    "G_Squares_Tinted",
    "G_Squares",
    "H_StrawHat",
    "H_StrawHat_dark",
    "G_Tactical_Clear",
    "G_Tactical_Black",
    "G_Spectacles_Tinted",
    "U_BG_Guerrilla_6_1",
    "U_BG_Guerilla1_1",
    "U_BG_Guerilla1_2_F",
    "U_BG_Guerilla2_2",
    "U_BG_Guerilla2_1",
    "U_BG_Guerilla2_3",
    "U_BG_Guerilla3_1",
    "U_BG_leader",
    "U_C_HunterBody_grn",
    "U_B_survival_uniform",
    "U_I_G_Story_Protagonist_F",
    "V_Pocketed_black_F",
    "V_Pocketed_coyote_F",
    "V_Pocketed_olive_F",
    "V_Rangemaster_belt",
    "V_BandollierB_blk",
    "V_BandollierB_cbr",
    "V_BandollierB_ghex_F",
    "V_BandollierB_rgr",
    "V_BandollierB_khk",
    "V_BandollierB_oli",
    "V_TacChestrig_cbr_F",
    "V_TacChestrig_grn_F",
    "V_TacChestrig_oli_F",
    "V_TacVest_blk",
    "V_TacVest_brn",
    "V_TacVest_camo",
    "V_TacVest_khk",
    "V_TacVest_oli",
    "V_I_G_resistanceLeader_F"
  ],
  [
    "B_AssaultPack_blk",
    "B_AssaultPack_cbr",
    "B_AssaultPack_rgr",
    "B_AssaultPack_khk",
    "B_AssaultPack_mcamo",
    "B_AssaultPack_sgg",
    "B_AssaultPack_tna_F",
    "B_FieldPack_blk",
    "B_FieldPack_cbr",
    "B_FieldPack_khk",
    "B_FieldPack_oli",
    "B_Kitbag_cbr",
    "B_Kitbag_rgr",
    "B_Kitbag_mcamo",
    "B_Kitbag_sgg",
    "B_Kitbag_tan",
    "B_Messenger_Black_F",
    "B_Messenger_Gray_F",
    "B_TacticalPack_blk",
    "B_TacticalPack_rgr"
  ]
];
/////////////////////////////////////
publicVariable "MHQs";
publicVariable "Bases";
publicVariable "MasterBoxes";
publicVariable "saveName";
publicVariable "MasterBoxArsernalContent";