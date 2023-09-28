if (!isServer) exitWith {};
private ["_cargoPool", "_emptySeats", "_vehicle", "_debug", "_grp", "_grpSize"];
_vehicle=(_this select 0);
_grpSize=(_this select 1);
_grp=(_this select 2);
_faction=(_this select 3);
_cargoType=(_this select 4);
_debug=false;

_cargoPool=[_faction, _cargoType] call eos_fnc_getunitpool;
_side=side (leader _grp);

// FILL EMPTY SEATS
_emptySeats=_vehicle emptyPositions "cargo";
if (_debug) then {
	hint format ["%1", _emptySeats];
};

// get min max group
_grpMin=_grpSize select 0;
_grpMax=_grpSize select 1;
_d=_grpMax-_grpMin;
_r=floor(random _d);
_grpSize=_r+_grpMin;

// if vehicle HAS SEATS
if (_emptySeats > 0) then {
	// LIMIT SEATS to FILL to group size
	if (_grpSize > _emptySeats) then {
		_grpSize = _emptySeats
	};
	if (_debug) then {
		hint format ["Seats Filled : %1", _grpSize];
	};

	for "_x" from 1 to _grpSize do {
		_selectedUnit= selectRandomWeighted _cargoPool;
		_unit= _grp createUnit [ _selectedUnit, GETPOS _vehicle, [], 0, "CARGO"];
		[_unit] join _grp;
	};

	{
		_x moveInCargo _vehicle
	}forEach units _grp;
};