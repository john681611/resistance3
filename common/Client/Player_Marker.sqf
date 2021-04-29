_marker = createMarker [ format["%1",getPlayerUID player], position player ];
_marker setMarkerColor "ColorBLUFOR";
_marker setMarkerType  "mil_triangle";
_marker setMarkerText profileName;
addMissionEventHandler ["HandleDisconnect",{deleteMarker format["%1",(_this select 2)]; deletevehicle (_this select 0)}];
call {while {true} do
        {
          if ((vehicle player) != player) then {
            if ((getMarkerColor (format ["%1_marker",(vehicle player)])) =="") then {
              (vehicle player) remoteExec ["vehicleMarker", 2, false];
            };
            _marker setMarkerText "";
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
        sleep 0.5;
      };
    };
