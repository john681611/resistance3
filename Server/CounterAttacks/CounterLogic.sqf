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
	private ["_marker","_zones"];
	_marker = _this call NearestMarker;
	_marker setMarkerColor "ColorOrange";
	//TODO: RUN SIMULATION
	//waitUntil { getmarkercolor _marker == "colorRed" || getmarkercolor _marker == "colorGreen"};
	//Temp
	sleep 10;
	_marker setMarkerColor "colorRed";
	//Temp
	_zones = true;
	while {_zones} do {
		sleep 1;
		_marker = (getMarkerPos _marker) call NearestMarker;
		if(_marker == "")exitWith {_zones = true;};
		_marker setMarkerColor "ColorOrange";
		//TODO: RUN SIMULATION
		//waitUntil { getmarkercolor _marker == "colorRed" || getmarkercolor _marker == "colorGreen"};
		//Temp
		sleep 10;
		_marker setMarkerColor "colorRed";
		//Temp
	};
};
