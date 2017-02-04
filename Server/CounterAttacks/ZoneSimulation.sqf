simulateZone = {
  _team1 = _this select 0; //persentage health Team 1 is aggressor
  _team2 = 100;//Team 2 is defender
  _mkr = _this select 1;//marker
  _dist = _this select 2;//Zone distance
  _travel = _this select 3; //Travel time from one zone to another

sleep _travel;
  while {_team1 > 0 && _team2 > 0} do { //TODO ADD && (player distance (getMarkerPos _mkr)) > _dist
    ["TaskCREATED",["",format["Battle Update %1% : %2%",floor _team1,floor _team2]]] remoteExec ["BIS_fnc_showNotification", 0];
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
    sleep 300;
  };
  if(_team2 <= 0) then {
    _mkr setMarkerColor "colorRed";
    ["TaskFailed",["",format["Battle Lost %1% Opfor Remaining",floor _team1]]] remoteExec ["BIS_fnc_showNotification", 0];
  };
  if(_team1 <= 0 ) then {
    _mkr setMarkerColor "colorGreen";
    ["TaskSucceeded",["","Battle Won"]] remoteExec ["BIS_fnc_showNotification", 0];
  };
waitUntil { getmarkercolor _marker == "colorRed" || getmarkercolor _marker == "colorGreen"};
  _return = _team1;
  _return
};
