/*if (isNil (format ["%1%2",(vehicle player),"_marker"]) then {
  (vehicle player) remoteExecCall ["vehicleMarker", 2, false];
};*/

vehicleMarker = {
  _vehicle =  _this;
  _marker createmarker [format ["%1%2",_vehicle,"_marker"], (getpos _vehicle)];
  while {true} do {
    _marker setmarkerpos (getpos _vehicle);
    _marker setmarkerdir (getdir _vehicle);
    _noPlayers =  true;
    {
      if (_x in _vehicle) exitwith}{
        _noPlayers = false;
      }
    } foreach allplayers;
    if(_noPlayers) exitwith {}; //no players bail!

  };
  deleteMarker _marker;
};
