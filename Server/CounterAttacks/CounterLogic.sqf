//Finds the nearest marker
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

//Base counter attack loop
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

//Main starting process Call this to start.
counterProcess = {
	private ["_pos","_marker","_force","_result","_zones","_zone"];
	_zones = [];
 {
	    if(markerColor _x == "colorRed") then {
				_result = (getMarkerPos _x) call NearestMarker;
				if ((_result select 1) < 2000) then {
					_zones pushBack _x;
				};
			};
	} forEach ztownAll;

	_zone =  (selectRandom _zones);
	_pos = [(getMarkerPos _zone), (((getMarkerSize _zone)select 0)+100), 900, 25, 0, 20, 0] call BIS_fnc_findSafePos;
	_pos = [_pos select 0, _pos select 1,0];
	[_pos, 100] call spawnBase;
	_marker  =  createMarker [format["%1BS",_pos], _pos];
	_marker setMarkerSize [150,150];
	_marker setMarkerColor "ColorYellow";
	_marker setMarkerShape "ELLIPSE";
	_marker setMarkerBrush "Solid";
	_marker setMarkerAlpha 0.5;
	[[_marker],[2,1],[2,1],[1,0,50],[0],[2],[0,0],[2],[6,0,400,EAST,FALSE]] call EOS_Spawn;//Generic for now
	[_marker,((floor random [1,3,9])*100)] spawn CounterAttack;
};
