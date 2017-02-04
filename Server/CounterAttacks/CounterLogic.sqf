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
	_attackerHealth = [(_this select 1),_marker,1000,(((_result select 1)/8.33333)+60)] call simulateZone;//TODO: Figure out better zone trigger distance
	if(_attackerHealth > 0 && getmarkercolor _marker == "colorRed") then {
		[_marker,_attackerHealth] spawn CounterAttack;
	};
};

counterProcess = {
	private ["_pos","_marker","_force"];
	//Find Position!?!?!?!?
	_pos = (getpos player); //FOR NOW
	[_pos, 100] call spawnBase;
	_marker  =  createMarker [format["%1BS",_pos], _pos];
	_marker setMarkerSize [150,150];
	_marker setMarkerColor "ColorYellow";
	_marker setMarkerShape "ELLIPSE";
	_marker setMarkerBrush "Solid";
	_marker setMarkerAlpha 0.5;
	[[_marker],[2,1],[2,1],[1,0,50],[0],[2],[0,0],[2],[6,0,400,EAST,FALSE]] call EOS_Spawn;//Generic for now
	[_marker,((floor random 10)*100)] spawn CounterAttack;
};
