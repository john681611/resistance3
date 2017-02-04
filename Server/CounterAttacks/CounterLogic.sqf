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
	_return = [_marker,_distance];
	_return
};

CounterAttack = {
	private ["_marker","_zones","_attackerHealth"];
	_result = (getMarkerPos (_this select 0)) call NearestMarker;
	_marker = _result select 0;
	if(_marker == "")exitWith {};
	_attackerHealth = [(_this select 1),_marker,1000,(((_result select 1)*8.9408)+60)] call simulateZone;//TODO: Figure out better zone trigger distance 
	if(_attackerHealth > 0) then {
		[_marker,_attackerHealth] spawn CounterAttack;
	};
};
