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
_save = [[],[],[]];
    {
        if (getMarkerColor _x == "colorGreen") then {
					(_save select 0) append [(getMarkerPos _x)];
				};
    } forEach ztownAll;

    {
      {
        if(!(isnil {_x getvariable "ResistVeh"})) then {
          (_save select 1) append [(_x call getVehicleData)];
        };
      } forEach list (_x select 1);
    } forEach Bases;
   
    {
      _mhq = (_x select 1);
        (_save select 2) append [[(getpos _mhq),(getdir _mhq)]];
    } forEach MHQs;

_save
