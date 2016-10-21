_marker = createMarker [ format["%1",getPlayerUID player], position player ];
_marker setMarkerColor "ColorBLUFOR";
_marker setMarkerType  "hd_dot";
_marker setMarkerText profileName;

call {while {true} do
        {
          if((lifeState player) == "INCAPACITATED") then {
            _marker setMarkerColor "ColorRed";
          } else {
            _marker setMarkerColor "ColorBLUFOR";
          };
     _marker setMarkerPos getPos player;
        sleep 2;
        }
    };
