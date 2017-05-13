_unit = _this select 0;
if([_unit,"FIRE"] checkVisibility [getPosASL _unit,AGLToASL (_unit modelToWorld [0,0,10])] == 0) then {
  _markerstr = createMarker [format["%1",getPosASL _unit],getPosASL _unit];
  _markerstr setMarkerShape "ICON";
  _markerstr setMarkerType "hd_dot"
};

while{[_unit,"FIRE"] checkVisibility [getPosASL _unit,AGLToASL (_unit modelToWorld [0,0,10])] == 0} do {
  _unit setpos (_unit modelToWorld [0,0,2]);
};
