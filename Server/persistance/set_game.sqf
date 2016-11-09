takenTowns  = (_this select 0);
diag_log "Loading Vehicles";
{
  _veh = createVehicle [(_x select 0), (_x select 1), [], 0, "NONE"];
  _veh setDir (_x select 2);
  _veh setDamage (_x select 3);
  _veh setFuel (_x select 4);
  [_veh,(_x select 5)] call getContent;
  _veh setVariable ["ResistVeh", true, false];
} foreach (_this select 1);
