simulateZone = {
  _team1 = _this select 0; //persentage health Team 1 is aggressor
  _mkr = _this select 1;//marker
  _team2 = ((getMarkerSize (_this select 1) select 0));// Defence size is based on zone size
  _dist = _this select 2;//Zone distance
  _travel = _this select 3; //Travel time from one zone to another
  _pos = getMarkerPos _mkr;
  sleep _travel;
	_mkr setMarkerColor "ColorOrange";
  _infoMarker = createMarker [format ["BT%1", _pos],_pos];
  _infoMarker setMarkerType "mil_warning";
  _infoMarker setMarkerColor "ColorBlack";
  while {_team1 > 0 && _team2 > 0} do { //TODO ADD && (player distance (getMarkerPos _mkr)) > _dist
    _infoMarker setMarkerText format["%1 : %2",floor _team1,floor _team2];
    ["TaskCREATED",["",format["Battle Update: %1 : %2",floor _team1,floor _team2]]] remoteExec ["BIS_fnc_showNotification", 0];
  _dmg = random [0,5,10];
  _chance  = random 1;
  if(_chance >= 0.9) then {
    _team1 = _team1 -_dmg;
    _team2 = _team2 - _dmg;
  } else {
    _ratio = 0;
    _border = 0;
    if(_team1 < _team2) then {
      _ratio = _team1/_team2;
    } else {
      _ratio = _team2/_team1;
    };
    _border = _ratio * 0.45;
    if(_team1 > _team2) then {
      if(_chance > _border) then {
        _team2 = _team2 - _dmg;
      } else {
        _team1 = _team1 - _dmg;
      };
    } else {
      if(_chance > _border) then {
        _team1 = _team1 - _dmg;
      } else {
        _team2 = _team2 - _dmg;
      };
    };
  };
    sleep 120;
  };
  if(_team2 <= 0) then {
    _mkr setMarkerColor "colorRed";
  };
  if(_team1 <= 0 ) then {
    _mkr setMarkerColor "colorGreen";

  };
waitUntil { getmarkercolor _marker == "colorRed" || getmarkercolor _marker == "colorGreen"};
deleteMarker _infoMarker;
if(getmarkercolor _marker == "colorRed")then {
  ["TaskFailed",["",format["Battle Lost: %1 Opfor Remaining",floor _team1]]] remoteExec ["BIS_fnc_showNotification", 0];
}else {
  ["TaskSucceeded",["","Battle Won"]] remoteExec ["BIS_fnc_showNotification", 0];
};
  _return = _team1;
  _return
};
