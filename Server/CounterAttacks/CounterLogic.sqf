NearestMarker = {
	private ["_start","_distance","_marker","_tempDis"];
	_start = _this;
	_distance = 0;
	_marker = "";
	_tempDis =0;
	{
		if(markerColor _x == "colorGreen") then {
			if(_distance == 0 ||  _marker == "") then {
				_distance = _start distance (getMarkerPos _x);
				_marker = _x;
			} else {
				_tempDis = _start distance (getMarkerPos _x);
				if(_tempDis < _distance) then {
					_distance = _tempDis;
					_marker = _x;
				};
			};
		};
	} foreach ztownAll;
	_marker
};

CounterAttack = {
	private ["_marker","_zones","_attackerHealth"];
	_marker = (getMarkerPos (_this select 0)) call NearestMarker;
	if(_marker == "")exitWith {_attackerHealth = 0;};
	_marker setMarkerColor "ColorOrange";
	_attackerHealth = (_this select 1);
	_attackerHealth = [_attackerHealth,_marker,1000,10] call simulateZone;//TODO: Figure out better zone trigger and travel times
	diag_log _attackerHealth;
	if(_attackerHealth > 0) then {
		[_marker,_attackerHealth] spawn CounterAttack;
	};
};
