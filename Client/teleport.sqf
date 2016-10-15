

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
	[getMarkerPos "respawn_west_MHQ",to_Base,"Truck MHQ","To Truck MHQ","","",1,[getMarkerPos "respawn_west_MHQ"]],
	[getMarkerPos "respawn_west_MHQ2",to_Base,"Offroad MHQ","To Offroad MHQ","","",1,[getMarkerPos "respawn_west_MHQ2"]]
 ];
 
_RSPPos = [west] call BIS_fnc_getRespawnMarkers;
{
if (_x != "respawn_west" AND  _x != "respawn_vehicle_west" AND _x !="respawn_west_MHQ" AND _x !="respawn_west_MHQ2") then {
_pos = getMarkerPos _x;
_Temp =  [[_pos,to_Base,"Camp","To Camp","","",1,[_pos]]];
_missionsData  = _missionsData + _Temp;
};

} foreach _RSPPos;



 disableserialization;

 _parentDisplay = [] call bis_fnc_displayMission;
 _mapCenter     = getmarkerpos "respawn_west_MHQ";
 _ORBAT         = [];
 _markers   = [];
 _images    = [];
 _overcast  = overcast;
 _isNight   = !((dayTime > 6) && (dayTime < 20));
 _scale     = 1;
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
 