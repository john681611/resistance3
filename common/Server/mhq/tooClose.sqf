
_tooClose = false;
_unit = (_this select 1);
{
	if ((_x select 1)  != _unit && (_x select 1)  distance _unit <= 200) then {
		if(_forEachIndex < (MHQs find _this)) then {
			_tooClose = true;
		}
	};
} forEach MHQs;

{
	if ((_x select 1)  distance _unit <= 350) then {
		_tooClose = true;
	};
} forEach Bases;

_tooClose;
