// This script is so simple even a caveman could do it (where did the Geico caveman go anyway?)

//Weapons & Ammo Box
_KinchBox_Weapons = Weapons_box;
clearMagazineCargoGlobal _KinchBox_Weapons;
clearWeaponCargoGlobal  _KinchBox_Weapons;
clearItemCargoGlobal _KinchBox_Weapons;
clearBackpackCargoGlobal _KinchBox_Weapons;

_KinchBox_Weapons addWeaponCargoGlobal ["arifle_TRG20_F", 5];
_KinchBox_Weapons addWeaponCargoGlobal ["SMG_02_F", 5];
_KinchBox_Weapons addWeaponCargoGlobal ["arifle_Mk20_GL_F", 4];
_KinchBox_Weapons addWeaponCargoGlobal ["launch_RPG32_F",5]; 
_KinchBox_Weapons addWeaponCargoGlobal ["srifle_EBR_F", 3];

_KinchBox_Ammo = Ammo_box;
clearMagazineCargoGlobal _KinchBox_Ammo;
clearWeaponCargoGlobal  _KinchBox_Ammo;
clearItemCargoGlobal _KinchBox_Ammo;
clearBackpackCargoGlobal _KinchBox_Ammo;

_KinchBox_Ammo addMagazineCargoGlobal ["30Rnd_556x45_Stanag", 50];
_KinchBox_Ammo addMagazineCargoGlobal ["20Rnd_762x51_Mag", 20];
_KinchBox_Ammo addMagazineCargoGlobal ["30Rnd_9x21_Mag", 30];
_KinchBox_Ammo addMagazineCargoGlobal ["1Rnd_HE_Grenade_shell", 20];
_KinchBox_Ammo addMagazineCargoGlobal ["RPG32_F", 15];
_KinchBox_Ammo addMagazineCargoGlobal ["HandGrenade", 20];
_KinchBox_Ammo addMagazineCargoGlobal ["APERSMine_Range_Mag", 10];

_KinchBox_Equipment = Attach_box;
clearMagazineCargoGlobal _KinchBox_Equipment;
clearWeaponCargoGlobal  _KinchBox_Equipment;
clearItemCargoGlobal _KinchBox_Equipment;
clearBackpackCargoGlobal _KinchBox_Equipment;

_KinchBox_Equipment addItemCargoGlobal ["muzzle_snds_L", 5];
_KinchBox_Equipment addItemCargoGlobal ["muzzle_snds_m", 5];
_KinchBox_Equipment addItemCargoGlobal ["optic_ACO_grn", 5];
_KinchBox_Equipment addItemCargoGlobal ["acc_pointer_IR", 5];
_KinchBox_Equipment addItemCargoGlobal ["optic_Holosight", 5];
_KinchBox_Equipment addItemCargoGlobal ["optic_Hamr", 5];
_KinchBox_Equipment addItemCargoGlobal ["acc_flashlight", 15];
_KinchBox_Equipment addMagazineCargoGlobal ["1Rnd_Smoke_Grenade_shell", 10];
_KinchBox_Equipment addMagazineCargoGlobal ["UGL_FlareWhite_F", 10];

// Miscellaneous Box
_KinchBox_Misc = Misc_box;
clearMagazineCargoGlobal _KinchBox_Misc;
clearWeaponCargoGlobal  _KinchBox_Misc;
clearItemCargoGlobal _KinchBox_Misc;
clearBackpackCargoGlobal _KinchBox_Misc;

_KinchBox_Misc addItemCargoGlobal ["H_Beret_blk_POLICE", 8];
_KinchBox_Misc addItemCargoGlobal ["H_Booniehat_indp", 8];
_KinchBox_Misc addItemCargoGlobal ["H_Cap_blk", 8];
_KinchBox_Misc addItemCargoGlobal ["H_MilCap_dgtl", 8];
_KinchBox_Misc addItemCargoGlobal ["ItemGPS", 5];
_KinchBox_Misc addItemCargoGlobal ["B_UavTerminal", 5];
_KinchBox_Misc addItemCargoGlobal ["ToolKit", 5];
_KinchBox_Misc addItemCargoGlobal ["Medikit", 5];
_KinchBox_Misc addItemCargoGlobal ["FirstAidKit", 100];

// Wetsuit Box
_KinchBox_Wesuit = Wetsuit_box;
clearMagazineCargoGlobal _KinchBox_Wesuit;
clearWeaponCargoGlobal  _KinchBox_Wesuit;
clearItemCargoGlobal _KinchBox_Wesuit;
clearBackpackCargoGlobal _KinchBox_Wesuit;

_KinchBox_Wesuit addItemCargoGlobal ["U_B_Wetsuit", 10];


//Hotel Base boxes
_KinchBox_Weapons = Weapons_box2;
clearMagazineCargoGlobal _KinchBox_Weapons;
clearWeaponCargoGlobal  _KinchBox_Weapons;
clearItemCargoGlobal _KinchBox_Weapons;
clearBackpackCargoGlobal _KinchBox_Weapons;

_KinchBox_Weapons addWeaponCargoGlobal ["arifle_TRG20_F", 5];
_KinchBox_Weapons addWeaponCargoGlobal ["SMG_02_F", 5];
_KinchBox_Weapons addWeaponCargoGlobal ["arifle_Mk20_GL_F", 4];
_KinchBox_Weapons addWeaponCargoGlobal ["launch_RPG32_F", 5];
_KinchBox_Weapons addWeaponCargoGlobal ["srifle_EBR_F", 3];

_KinchBox_Ammo = Ammo_box2;
clearMagazineCargoGlobal _KinchBox_Ammo;
clearWeaponCargoGlobal  _KinchBox_Ammo;
clearItemCargoGlobal _KinchBox_Ammo;
clearBackpackCargoGlobal _KinchBox_Ammo;

_KinchBox_Ammo addMagazineCargoGlobal ["30Rnd_556x45_Stanag", 50];
_KinchBox_Ammo addMagazineCargoGlobal ["20Rnd_762x51_Mag", 20];
_KinchBox_Ammo addMagazineCargoGlobal ["30Rnd_9x21_Mag", 30];
_KinchBox_Ammo addMagazineCargoGlobal ["1Rnd_HE_Grenade_shell", 20];
_KinchBox_Ammo addMagazineCargoGlobal ["RPG32_F", 15];
_KinchBox_Ammo addMagazineCargoGlobal ["HandGrenade", 20];
_KinchBox_Ammo addMagazineCargoGlobal ["APERSMine_Range_Mag", 10];

_KinchBox_Equipment = Attach_box2;
clearMagazineCargoGlobal _KinchBox_Equipment;
clearWeaponCargoGlobal  _KinchBox_Equipment;
clearItemCargoGlobal _KinchBox_Equipment;
clearBackpackCargoGlobal _KinchBox_Equipment;

_KinchBox_Equipment addItemCargoGlobal ["muzzle_snds_L", 5];
_KinchBox_Equipment addItemCargoGlobal ["muzzle_snds_m", 5];
_KinchBox_Equipment addItemCargoGlobal ["optic_ACO_grn", 5];
_KinchBox_Equipment addItemCargoGlobal ["acc_pointer_IR", 5];
_KinchBox_Equipment addItemCargoGlobal ["optic_Holosight", 5];
_KinchBox_Equipment addItemCargoGlobal ["optic_Hamr", 5];
_KinchBox_Equipment addItemCargoGlobal ["acc_flashlight", 15];
_KinchBox_Equipment addMagazineCargoGlobal ["1Rnd_Smoke_Grenade_shell", 10];
_KinchBox_Equipment addMagazineCargoGlobal ["UGL_FlareWhite_F", 10];

// Miscellaneous Box
_KinchBox_Misc = Misc_box2;
clearMagazineCargoGlobal _KinchBox_Misc;
clearWeaponCargoGlobal  _KinchBox_Misc;
clearItemCargoGlobal _KinchBox_Misc;
clearBackpackCargoGlobal _KinchBox_Misc;

_KinchBox_Misc addItemCargoGlobal ["H_Beret_blk_POLICE", 8];
_KinchBox_Misc addItemCargoGlobal ["H_Booniehat_indp", 8];
_KinchBox_Misc addItemCargoGlobal ["H_Cap_blk", 8];
_KinchBox_Misc addItemCargoGlobal ["H_MilCap_dgtl", 8];
_KinchBox_Misc addItemCargoGlobal ["ItemGPS", 5];
_KinchBox_Misc addItemCargoGlobal ["B_UavTerminal", 5];
_KinchBox_Misc addItemCargoGlobal ["ToolKit", 5];
_KinchBox_Misc addItemCargoGlobal ["Medikit", 5];
_KinchBox_Misc addItemCargoGlobal ["FirstAidKit", 100];

// Wetsuit Box
_KinchBox_Wesuit = Wetsuit_box2;
clearMagazineCargoGlobal _KinchBox_Wesuit;
clearWeaponCargoGlobal  _KinchBox_Wesuit;
clearItemCargoGlobal _KinchBox_Wesuit;
clearBackpackCargoGlobal _KinchBox_Wesuit;

_KinchBox_Wesuit addItemCargoGlobal ["U_B_Wetsuit", 10];



