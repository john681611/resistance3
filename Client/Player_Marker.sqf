_marker = createMarker [ format["%1",getPlayerUID player], position player ];
_marker setMarkerColor "ColorBLUFOR";
_marker setMarkerType  "mil_triangle";
_marker setMarkerText profileName;


call {while {true} do
        {
          if ((vehicle player) != player) then {
            if (isNil (format ["%1%2",(vehicle player),"_marker"]) then {
              (vehicle player) remoteExecCall ["vehicleMarker", 2, false];
            };
          } else {
            _marker setMarkerText profileName;
          };
          if((lifeState player) == "INCAPACITATED") then {
            _marker setMarkerColor "ColorRed";
          } else {
            _marker setMarkerColor "ColorBLUFOR";
          };
          _marker setMarkerPos getPos player;
          _marker setMarkerDir getDir player;
        sleep 2;
      };
    };
