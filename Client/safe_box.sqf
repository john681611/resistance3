
getbox = {
  //create box
  _box = createVehicle ["Box_NATO_Equip_F",[0,0,0], [], 0, "NONE"];
  _data = (((profilenamespace getvariable (format["Resist_Box%1",savename])) select 1)select 2);
  [_box,_data] call setContent;
  profilenamespace setvariable ["Resist_Box",[KeyNumber,[false,_box,[[],[],[],[]]]]];
  _box addaction ["Return Box", {_this spawn setbox;},[],1.5,false,false,"","((ATM1 distance _target )< 5) OR ((ATM2 distance _target )< 6) ",5];
  _box setDir (getdir player);
  _box setpos (player modelToWorld [0,1.5,1]);
  [_box] call R3F_LOG_FNCT_objet_deplacer;
  hint "Store Box Deployed";
};

setbox = {
  _box = (((profilenamespace getvariable (format["Resist_Box%1",savename])) select 1)select 1);

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
  profilenamespace setvariable [format["Resist_Box%1",savename],[KeyNumber,[true,"none",_content]]];
  //Save Players Kit to stop duplication
  loadout = [player,["ammo"]] call getLoadout;
  profilenamespace setvariable [format["Resist_loadout%1",savename],[KeyNumber,loadout]];
  systemChat "Gear Saved";
  //delete box
  deleteVehicle _box;
  hint "Store Box Stored";
};

tryGetBox = {
  if((((profilenamespace getvariable (format["Resist_Box%1",savename])) select 1)select 0))then{
    [] spawn getbox;
  }else{
   hint "No store found! return your box or create a new store";
  };
};

resetBox = {
   _result = ["Are you sure? <br/> <t color='#ff0000'>Any Saved Gear will be lost</t>", "Confirm", true, true] call BIS_fnc_guiMessage;
   if(_result) then {
     profilenamespace setvariable [(format["Resist_Box%1",savename]),[KeyNumber,[true,"none",[[],[],[],[]]]]];
     hint 'Box Reset'
   };
};
