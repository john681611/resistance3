takenTowns  = (_this select 0);
{
  _veh = createVehicle [(_x select 0), (_x select 1), [], 25, "NONE"];
  _veh setDir (_x select 2);
  _veh setDamage (_x select 3);
  _veh setFuel (_x select 4);
  [_veh,(_x select 5)] call setContent;
  _veh setVariable ["ResistVeh", true, false];
} foreach (_this select 1);

_index  = 0;
{
  _mhq = (_x select 1);
  _mhq setpos (((_this select 2) select _index) select 0);
  _mhq setdir (((_this select 2) select _index) select 1);
  [_mhq,(((_this select 2) select _index) select 2)] call setContent;
  _index = _index + 1;
} forEach MHQs;

_index  = 0;
{
  [(_x select 0),((_this select 3) select _index)] call setContent;
  _index = _index + 1;
} forEach MasterBoxes;
