_team1 = _this select 0; //persentage health
_team2 = _this select 1;
_mkr = _this select 3;
_dist = _this select 4;

while (_team1 > 0 && _team2 > 0 && (player distance _mkr) > _dist) do {
_dmg = random [0,5,10];
_chance  = random 1;
if(_chance >= 0.9) then {
  _team1 -= _dmg;
  _team2 -= _dmg;
} else {
  if(_team1 < _team2) then {
    _ratio = _team1/_team2;
  }else {
    _ratio = _team2/_team1;
  };
  _border = _ratio * 0.45;
  if(_team1 > _team2) then{
    if(_chance > _border) then {
      _team2 -= _dmg;
    } else {
      _team1 -= _dmg;
    };
  } else {
    if(_chance > _border) then {
      _team1 -= _dmg;
    } else {
      _team2 -= _dmg;
    };
  };
};
  sleep 300;
};

_return = [_team1,_team2];
_return
