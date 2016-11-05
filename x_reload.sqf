_object = (_this select 0);
_trigger = (_this select 1);

_type = typeOf _object;
_pos = getpos _object;
x_reload_time_factor = 20.00;
if(isNil {_trigger getVariable "inUse"}) then {_trigger setVariable ["inUse", false, true];};
if(_pos distance (getpos _object) >1 && (_trigger getVariable "inUse")) exitWith {};
	_trigger setVariable ["inUse", true, true];
while {fuel _object < 0.99} do {
	[_object,"Refueling..."] remoteExec ["vehicleChat", 0];
	for "_k" from 0 to x_reload_time_factor do {
		sleep 1;
		if(_pos distance (getpos _object) >1) exitWith {[_object,"Work Canclled"] remoteExec ["vehicleChat", 0]; };
		[_object,format["Refueling..%1%2",(_k*5),'%']] remoteExec ["vehicleChat", 0];
	};
		if(_pos distance (getpos _object) >1) exitWith {};
	_object setFuel 1;
	sleep 0.01;
};

[_object,"Repairing..."] remoteExec ["vehicleChat", 0];
for "_i" from 0 to x_reload_time_factor do {
sleep 1;
if(_pos distance (getpos _object) >1) exitWith {[_object, "Work Canclled"] remoteExec ["vehicleChat", 0];};
[_object, format["Repairing..%1%2",(_i*5),'%']] remoteExec ["vehicleChat", 0]
};
if(_pos distance (getpos _object) >1) exitWith {};
_object setDamage 0;
[_object,format ["%1 is ready...", _type]] remoteExec ["vehicleChat", 0];

if (true) exitWith {	_trigger setVariable ["inUse", false, true];};
