_save = [[], [], [], [], []];

getVehicleData = {
	_vehicle = [
		(typeOf _this),
		(getPos _this),
		(getDir _this),
		(getDammage _this),
		(fuel _this),
		(_this call getContent)
	];
	_vehicle
};

saveSurroundings = {
	{
		if(!(isNil {
			_x getvariable "ResistVeh"
		})) then {
			(_save select 1) append [(_x call getVehicleData)];
		};
	} forEach list _this;
};

getMHQZone = {
	_overlap = _this call tooCloseMHQ;
	if (!_overlap) then {
		(missionNamespace getVariable format["%1_zone", (_this select 2)]) call saveSurroundings;
	};
};

{
	if (getMarkerColor _x == "colorGreen") then {
		(_save select 0) append [(getMarkerPos _x)];
	};
} forEach ztownAll;

{
	(_x select 1) call saveSurroundings;
} forEach Bases;

{
	_mhq = (_x select 1);
	(_save select 2) append [[(getPos _mhq), (getDir _mhq), (_mhq call getContent)]];
	_x call getMHQZone;
} forEach MHQs;

{
	(_save select 3) append [((_x select 0) call getContent)];
	(_save select 4) append [
		[
			(_x select 0) call BIS_fnc_getVirtualWeaponCargo,
			(_x select 0) call BIS_fnc_getVirtualMagazineCargo,
			(_x select 0) call BIS_fnc_getVirtualItemCargo,
			(_x select 0) call BIS_fnc_getVirtualBackpackCargo
		]
	];
} forEach MasterBoxes;

_save