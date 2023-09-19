params ["_box", "_cargoWeaponData", "_cargoMagazineData", "_cargoItemData", "_cargoBackpackData"];
    
clearMagazineCargoGlobal _box;
clearWeaponCargoGlobal  _box;
clearItemCargoGlobal _box;
clearBackpackCargoGlobal _box;
{
    _box addWeaponCargoGlobal _x;
} forEach  _cargoWeaponData;
{
    _box addMagazineCargoGlobal _x;
} forEach  _cargoMagazineData;
{
    _box addItemCargoGlobal _x;
} forEach  _cargoItemData;
{
    _box addBackpackCargoGlobal _x;
} forEach  _cargoBackpackData;