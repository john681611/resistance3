_position=(_this select 0);
_side=(_this select 1);
_faction=(_this select 2);
_type=(_this select 3);
_special = if (count _this > 4) then {_this select 4} else {"CAN_COLLIDE"};

_vehicleType=[_faction,_type] call eos_fnc_getunitpool;
	_grp = createGroup _side;
	_cargoData = [];
	if(typeName (_vehicleType select 0) == "ARRAY") then {
		_cargoData = (_vehicleType select 0) select 1;
		_vehicleType = [(_vehicleType select 0) select 0];
	};

	_vehPositions=[(_vehicleType select 0)] call BIS_fnc_vehicleRoles;
	_vehicle = createVehicle [(_vehicleType select 0), _position, [], 0, _special];
	_vehicle setVariable ["ResistVeh", true, false];
	_vehicle setVehicleLock "UNLOCKED";
	[[_vehicle]] remoteExec ["RES_fnc_addToAllCurators", 2];
_vehCrew=[];
	
	if((count _cargoData) > 0) then {	
		clearMagazineCargoGlobal _vehicle;
		clearWeaponCargoGlobal  _vehicle;
		clearItemCargoGlobal _vehicle;
		clearBackpackCargoGlobal _vehicle;
		{
			_vehicle addItemCargoGlobal _x;
		} forEach  _cargoData;
	};
		{
	_currentPosition=_x;
	if (_currentPosition select 0 == "driver")then {
			_unit = _grp createUnit [(_vehicleType select 1), _position, [], 0, "CAN_COLLIDE"];
			[_unit] join _grp;
			_unit assignAsDriver _vehicle;
			_unit moveInDriver _vehicle;
			_unit triggerDynamicSimulation false;
			_unit enableDynamicSimulation true;
			_vehCrew set [count _vehCrew,_unit];
			};

	if (_currentPosition select 0 == "turret" and (_vehicle emptyPositions "Gunner" > 0 or  _vehicle emptyPositions "Commander" > 0 or _vehicle emptyPositions "Turret" > 0))then {
			_unit = _grp createUnit [(_vehicleType select 1), _position, [], 0, "CAN_COLLIDE"];
			[_unit] join _grp;
			_unit assignAsGunner _vehicle;
			_unit MoveInTurret [_vehicle,_currentPosition select 1];
			_unit triggerDynamicSimulation false;
			_unit enableDynamicSimulation true;
			_vehCrew set [count _vehCrew,_unit];
			};

		}foreach _vehPositions;

_return=[_vehicle,_vehCrew,_grp];

_return
