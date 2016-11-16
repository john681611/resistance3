
getbox = {
  //create box
  _box = createVehicle ["Box_NATO_Equip_F",[0,0,0], [], 0, "NONE"];
  _data = ((profilenamespace getvariable "Resist_Box") select 2);
  [_box,_data] call setContent;
  profilenamespace setvariable ["Resist_Box",[false,_box,[[],[],[],[]]], false];
  _box addaction ["Return Box", {_this spawn setbox;},[],1.5,false,false,"","((ATM1 distance _target )< 5) OR ((ATM2 distance _target )< 6) ",5];
  _box setDir (getdir player);
  _box setpos (player modelToWorld [0,1.5,1]);
  [_box] call R3F_LOG_FNCT_objet_deplacer;
  hint "Store Box Deployed";
};

setbox = {
  _box = (profilenamespace getvariable "Resist_Box" select 1);

  if((typeName _box) == "STRING") exitWith {
    hint "Box is no longer linked with your store";
    (_this select 0) removeAction (_this select 2);
  };

  if(_box != (_this select 0)) exitWith {
    hint "Box is no longer linked with your store";
    (_this select 0) removeAction (_this select 2);
  };
  //get box cargo
  _content = _box call getContent;
  profilenamespace setvariable ["Resist_Box",[true,"none",_content], false];
  //delete box
  deleteVehicle _box;
  hint "Store Box Stored";
};


if !((isnil {profilenamespace getvariable "Resist_Box"}) OR (isnil {profilenamespace getvariable "Resist_LR_Number"})) then {
  if(profilenamespace getvariable "Resist_LR_Number" != KeyNumber) then {
    profilenamespace setvariable ["Resist_Box",[true,"none",[[],[],[],[]]], false];
    profilenamespace setvariable ["Resist_LR_Number",KeyNumber, false];
	};
} else {
  profilenamespace setvariable ["Resist_Box",[true,"none",[[],[],[],[]]], false];
  profilenamespace setvariable ["Resist_LR_Number",KeyNumber, false];
};
if(((profilenamespace getvariable "Resist_Box") select 0))then{
  [] spawn getbox;
}else{
 hint "No store found! return your box or create a new store";
};
