params ["_box", "_data"];

[_box, _data select 0, true] call BIS_fnc_addVirtualWeaponCargo;
[_box, _data select 1, true] call BIS_fnc_addVirtualMagazineCargo;
[_box, _data select 2, true] call BIS_fnc_addVirtualItemCargo;
[_box, _data select 3, true] call BIS_fnc_addVirtualBackpackCargo;
