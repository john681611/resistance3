takenTowns  = (_this select 0);
{
  _veh = createVehicle [(_x select 0), (_x select 1), [], 0, "NONE"];
  _veh setDir (_x select 2);
  _veh setDamage (_x select 3);
  _veh setFuel (_x select 4);
  [_veh,(_x select 5)] call setContent;
  _veh setVariable ["ResistVeh", true, false];
} foreach (_this select 1);

C1 setpos (((_this select 2) select 0) select 0);
C1 setdir (((_this select 2) select 0) select 1);
