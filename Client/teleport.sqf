_caller = _this select 0;

_pairing = [[FLG,C1]];

_selected = {
  _idx = _x find _caller;
  if(_idx != -1) exitWith {
    if(_idx == 1) then {
      _x select 0
    } else {
      _x select 1
    };
  };
} forEach _pairing;

to_Base =
 {
private ["_Location"];
 _Location = _this select 0;
    _unit = player;
    _unit setpos (_Location findEmptyPosition [5,80]);
    _unit setDamage 0;
    _unit setFatigue 0;
    _unit allowDamage false;
    sleep 5;
    _unit allowDamage true;
 };


 _missionsData  = [
  [getMarkerPos "respawn_west",to_Base,"Main Base","To the main base","","",1,[getMarkerPos "respawn_west"]],
	[getMarkerPos "MHQ",to_Base,"Offroad MHQ","To Offroad MHQ","","",1,[getMarkerPos "MHQ"]]
 ];


 disableserialization;

 _parentDisplay = [] call bis_fnc_displayMission;
 _mapCenter     = getpos _selected;
 _ORBAT         = [];
 _markers   = [];
 _images    = [];
 _overcast  = overcast;
 _isNight   = !((dayTime > 6) && (dayTime < 20));
 _scale     = 0;
 _simul     = true;

      [
    findDisplay 46,
    _mapCenter,
    _missionsData,
    _ORBAT,
    _markers,
    _images,
    _overcast,
    _isNight,
    _scale,
    _simul
 ] call Bis_fnc_strategicMapOpen;
