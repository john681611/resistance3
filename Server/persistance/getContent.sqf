_box = (_this select 0);
_data = (_this select 1);
clearMagazineCargoGlobal _box;
clearWeaponCargoGlobal  _box;
clearItemCargoGlobal _box;
clearBackpackCargoGlobal _box;
_weapons =  (_data select 0);
_mags = (_data select 1);
_items = (_data select 2);
_backpacks = (_data select 3);
//weapons
{
_box addweaponcargoGlobal [_x,1];
} foreach _weapons;
//mags
{
_box addmagazinecargoGlobal [_x,1];
} foreach _mags;
//items
{
  _box additemcargoGlobal [_x,1];
} foreach _items;
//backpacks
{
  _box addBackpackCargoGlobal [_x,1];
} foreach _backpacks;
