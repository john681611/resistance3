_save = [[],[],[]];

getVehicleData = {
_vehicle =  [
  (typeOf _this),
  (getpos _this),
  (getdir _this),
  (getDammage _this),
  (Fuel _this),
  (_this call getContent)
  ];
  _vehicle
};

saveSurroundings = {
  {
    if(!(isnil {_x getvariable "ResistVeh"})) then {
      (_save select 1) append [(_x call getVehicleData)];
    };
  } forEach list _this;
};

getMHQZone = {
  _overlap = _this call tooCloseMHQ;
  if(!_overlap) then {
  (missionNamespace getVariable  format["%1_zone",(_this select 2)]) call saveSurroundings;
  };
};


{
  if (getMarkerColor _x == "colorGreen") then {
    (_save select 0) append [(getMarkerPos _x)];
  };
} forEach ztownAll;

{
  (_x select 1) call saveSurroundings;
} forEach Bases;

{
  _mhq = (_x select 1);
    (_save select 2) append [[(getpos _mhq),(getdir _mhq), (_mhq call getContent)]];
    _x call getMHQZone;
} forEach MHQs;

_save
