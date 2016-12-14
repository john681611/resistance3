_marker = createMarker [ format["%1",getPlayerUID player], position player ];
_marker setMarkerColor "ColorBLUFOR";
_marker setMarkerType  "mil_triangle";
_marker setMarkerText profileName;
_eyeMarker createMarker [ format["%1_eye",getPlayerUID player], position player ];
_eyeMarker setMarkerColor "ColorBLUFOR";
_eyeMarker setMarkerType  "mil_triangle";
_eyeMarker setMarkerText profileName;
_eyeMarker setMarkerAlpha 0.5;

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
          _vdir = player eyeDirection player; 
          _adir= (_vdir select 0) atan2 (_vdir select 1);
          _eyeMarker setMarkerPos getPos player;
          _eyeMarker setMarkerDir _adir;
        sleep 2;
      };
    };
