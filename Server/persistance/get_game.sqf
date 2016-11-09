getVehicleData = {
_vehicle =  [
  (typeOf _this),
  (getpos _this),
  (getdir _this),
  (getDammage _this),
  (Fuel _this),
  (_this call setContent)
  ];
  diag_log "Saving Vehicle";
  diag_log _vehicle;
  _vehicle
};

_save = [[],[]];
    {
        if (getMarkerColor _x == "colorGreen") then {
					(_save select 0) append [(getMarkerPos _x)];
				};
    } forEach ztownAll;

    {
      if(!(isnil {_x getvariable "ResistVeh"})) then {
        (_save select 1) append [(_x call getVehicleData)];
      };
    } forEach list Main_Zone;

    {
      if(!(isnil {_x getvariable "ResistVeh"})) then {
        (_save select 1) append [(_x call getVehicleData)];
      };
    } forEach list Hotel_Zone;
_save
