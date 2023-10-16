params ["_masterBox", "_masterZone"];
{
	if(!(isNil {
		_x getvariable "ResistVeh"
	})) then {
		[_masterBox, (_x call getContent), false] call setContent;
		if (_x isKindOf "ReammoBox_F" OR _x isKindOf "ReammoBox") then {
			deleteVehicle _x
		} else {
			clearMagazineCargoGlobal _x;
			clearWeaponCargoGlobal _x;
			clearItemCargoGlobal _x;
			clearBackpackCargoGlobal _x;
		};
	};
} forEach list _masterZone;

private _promoNames = [];
private _magLimit = 100;
private _weaponLimit = 75;
private _itemLimit = 50;
private _clothingLimit = 10;
private _masterContent = _masterBox call getContent;

private _weapons = (_masterContent select 0);
private _weaponsAgg = createHashMap;
{
	private _weaponClass = (_x select 0);
	_weaponsAgg set [_weaponClass, 1 + (_weaponsAgg getOrDefault [_weaponClass, 0])];
} forEach _weapons;
private _weaponsFinal = [];
{
	if (_y >= _weaponLimit) then {
		_weaponsFinal pushBack _x;
		_masterBox addWeaponCargoGlobal [_x, -1 * _y];
		_promoNames pushBack (gettext (configfile >> "CfgWeapons" >> _x >> "displayName"));
	};
} forEach _weaponsAgg;
[_masterBox, _weaponsFinal, true] call BIS_fnc_addVirtualWeaponCargo;

private _mags = (_masterContent select 1);
private _magsAgg = createHashMap;
{
	_magsAgg set [(_x select 0), 1 + (_magsAgg getOrDefault [(_x select 0), 0])];
} forEach _mags;
private _magsFinal = [];
{
	if (_y >= _magLimit) then {
		_magsFinal pushBack _x;
		_masterBox addMagazineCargoGlobal [_x, -1 * _y];
		_promoNames pushBack (gettext (configfile >> "CfgMagazines" >> _x >> "displayName"));
	};
} forEach _magsAgg;
[_masterBox, _magsFinal, true] call BIS_fnc_addVirtualMagazineCargo;

private _items = (_masterContent select 2);
private _itemsAgg = createHashMap;
{
	_itemsAgg set [_x, 1 + (_itemsAgg getOrDefault [_x, 0])];
} forEach _items;
private _itemsFinal = [];
{
	private _limit = _itemLimit;
	if (_x isKindOf ["Uniform_Base", configFile >> "CfgWeapons"] || _x isKindOf ["Vest_Camo_Base", configFile >> "CfgWeapons"] || _x isKindOf ["VestItem", configFile >> "CfgWeapons"]) then {
		_limit = _clothingLimit;
	};
	if (_y >= _limit) then {
		_itemsFinal pushBack _x;
		_masterBox addItemCargoGlobal [_x, -1 * _y];
		_promoNames pushBack (gettext (configfile >> "CfgWeapons" >> _x >> "displayName"));
	};
} forEach _itemsAgg;
[_masterBox, _itemsFinal, true] call BIS_fnc_addVirtualItemCargo;

private _backpacks = (_masterContent select 3);
private _backpacksAgg = createHashMap;
{
	_backpacksAgg set[(_x select 0), 1 + (_backpacksAgg getOrDefault [(_x select 0), 0])];
} forEach _backpacks;
private _backpacksFinal = [];
{
	if (_y >= _clothingLimit) then {
		_backpacksFinal pushBack _x;
		_promoNames pushBack (gettext (configfile >> "CfgVehicles" >> _x >> "displayName"));
	};
} forEach _backpacksAgg;
[_masterBox, _itemsFinal, true] call BIS_fnc_addVirtualBackpackCargo;


private _arsernalExistingWeapons = _masterBox call BIS_fnc_getVirtualWeaponCargo;
{
	if(_x in _arsernalExistingWeapons) then {
		_masterBox addWeaponCargoGlobal [_x, -1 * _y];
	};
} forEach _weaponsAgg;

private _arsernalExistingMagazines = _masterBox call BIS_fnc_getVirtualMagazineCargo;
{
	if(_x in _arsernalExistingMagazines) then {
		_masterBox addMagazineCargoGlobal [_x, -1 * _y];
	};
} forEach _magsAgg;

private _arsernalExistingItems = _masterBox call BIS_fnc_getVirtualItemCargo;
{
	if(_x in _arsernalExistingItems) then {
		_masterBox addItemCargoGlobal [_x, -1 * _y];
	};
} forEach _itemsAgg;

private _arsernalExistingBackpacks = _masterBox call BIS_fnc_getVirtualBackpackCargo;
{
	if(_x in _arsernalExistingBackpacks) then {
		_masterBox addBackpackCargoGlobal [_x, -1 * _y];
	};
} forEach _backpacksAgg;

hint format ["Arsernal Promotions: %1", _promoNames];