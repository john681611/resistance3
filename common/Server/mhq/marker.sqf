

call {while {true} do
        {
            {
                _pos =  getPos (_x select 1);
                _zoneMarker = format["%1_zone_marker",(_x select 2)];
                format["respawn_west_%1",(_x select 2)] setMarkerPos _pos;
                _zoneMarker setMarkerPos _pos;
                (missionNamespace getVariable  format["%1_zone",(_x select 2)]) setPos _pos;
                _overlap = _x call tooCloseMHQ;
                if(_overlap) then {
                    _zoneMarker setMarkerAlpha 0;
                } else {
                    _zoneMarker setMarkerAlpha 1;
                };
                sleep 1; 
            } forEach MHQs
        }
    };
