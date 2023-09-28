if (!isServer) exitWith {};
// SINGLE INFANTRY group
private ["_grp", "_unit", "_pool", "_pos", "_faction"];

_pos=(_this select 0);
_grpSize=(_this select 1);
_faction=(_this select 2);
_side=(_this select 3);

_grpMin=_grpSize select 0;
_grpMax=_grpSize select 1;
_d=_grpMax-_grpMin;
_r=floor(random _d);
_grpSize=_r+_grpMin;

if (surfaceIsWater _pos) then {
	_pool=[_faction, 1] call eos_fnc_getunitpool;
} else {
	_pool=[_faction, 0] call eos_fnc_getunitpool;
};

_grp=createGroup _side;
for "_x" from 1 to _grpSize do {
	_unitType= selectRandomWeighted _pool;
	_unit = _grp createUnit [_unitType, _pos, [], 6, "FORM"];
	[_unit] join _grp;
	if (_this select 4) then {
		[_unit] call eos_fnc_rockFix
	};
};

_grp