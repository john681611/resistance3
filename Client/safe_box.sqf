
getbox = {
  //create box
  _box = createVehicle ["Box_NATO_Equip_F",[0,0,0], [], 0, "NONE"];

  clearMagazineCargoGlobal _box;
  clearWeaponCargoGlobal  _box;
  clearItemCargoGlobal _box;
  clearBackpackCargoGlobal _box;
  _data =  profilenamespace getvariable "Resist_Box";
  _weapons =  (_data select 2) select 0;
  _mags = (_data select 2) select 1;
  _items = (_data select 2) select 2;
  _backpacks = (_data select 2) select 3;
  //weapons
  {
  _box addweaponcargoGlobal [_x select 0,1];
  } foreach _weapons;
  //mags
  {
  _box addmagazinecargoGlobal [_x select 0,1];
  } foreach _mags;
  //items
  {
    _box additemcargoGlobal [_x select 0,1];
  } foreach _items;
  //backpacks
  {
    _box addBackpackCargoGlobal [_x select 0,1];
  } foreach _backpacks;

  profilenamespace setvariable ["Resist_Box",[false,_box,[[],[],[],[]]]];
  _box addaction ["Return Box", {_this spawn setbox;},[],1.5,false,false,"","((ATM1 distance _target )< 5) OR ((ATM2 distance _target )< 6) ",5];
  _box setDir (getdir player);
  _box setpos (player modelToWorld [0,1.5,1]);
  [_box] call R3F_LOG_FNCT_objet_deplacer;
  hint "Store Box Deployed";
};

setbox = {
  _box = (profilenamespace getvariable "Resist_Box" select 1);
  diag_log format ["%1 ? %2",_box, (_this select 0)];

  if((typeName _box) == "STRING") exitWith {
    hint "Box is no longer linked with your store";
    (_this select 0) removeAction (_this select 2);
  };

  if(_box != (_this select 0)) exitWith {
    hint "Box is no longer linked with your store";
    (_this select 0) removeAction (_this select 2);
  };
  //get box cargo
  _weapons = weaponCargo _box;
  _mags = magazineCargo _box;
  _items = itemCargo _box;
  _backpacks = backpackCargo _box;
  //delete box
  deleteVehicle _box;
  profilenamespace setvariable ["Resist_Box",[true,"none",[[_weapons],[_mags],[_items],[_backpacks]]]];
  hint "Store Box Sotred";
};


if !((isnil {profilenamespace getvariable "Resist_Box"}) OR (isnil {profilenamespace getvariable "Resist_LR_Number"})) then {
  if(profilenamespace getvariable "Resist_LR_Number" != KeyNumber) then {
    profilenamespace setvariable ["Resist_Box",[true,"none",[[],[],[],[]]]];
    profilenamespace setvariable ["Resist_LR_Number",KeyNumber];
	};
} else {
  profilenamespace setvariable ["Resist_Box",[true,"none",[[],[],[],[]]]];
  profilenamespace setvariable ["Resist_LR_Number",KeyNumber];
};
if(((profilenamespace getvariable "Resist_Box") select 0))then{
  [] spawn getbox;
}else{
 hint "No store found! return your box or create a new store";
};
