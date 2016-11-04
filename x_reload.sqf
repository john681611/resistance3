_object = (_this select 0);
_trigger = (_this select 1);

_type = typeOf _object;
_pos = getpos _object;
x_reload_time_factor = 20.00;
if(isNil {_trigger getVariable "inUse"}) then {_trigger setVariable ["inUse", false, true];};
if(_pos distance (getpos _object) >1 && (_trigger getVariable "inUse")) exitWith {};
	_trigger setVariable ["inUse", true, true];
while {fuel _object < 0.99} do {
	_object vehicleChat "Refueling...";
	for "_k" from 0 to x_reload_time_factor do {
		sleep 1;
		if(_pos distance (getpos _object) >1) exitWith {_object vehicleChat "Work Canclled";};
		_object vehicleChat format["Refueling..%1%2",(_k*5),'%'];
	};
		if(_pos distance (getpos _object) >1) exitWith {};
	_object setFuel 1;
	sleep 0.01;
};

_object vehicleChat "Repairing...";
for "_i" from 0 to x_reload_time_factor do {
sleep 1;
if(_pos distance (getpos _object) >1) exitWith {_object vehicleChat "Work Canclled";};
_object vehicleChat format["Repairing..%1%2",(_i*5),'%'];
};
if(_pos distance (getpos _object) >1) exitWith {};
_object setDamage 0;
_object vehicleChat format ["%1 is ready...", _type];

if (true) exitWith {	_trigger setVariable ["inUse", false, true];};
