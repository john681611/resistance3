_box = (_this select 0);
_data = (_this select 1);
clearMagazineCargoGlobal _box;
clearWeaponCargoGlobal  _box;
clearItemCargoGlobal _box;
clearBackpackCargoGlobal _box;
_weapons =  (_data select 0);
_mags = (_data select 1);
_items = (_data select 2);
_containersAndContent = (_data select 3);
//weapons
{
  _weapon = _box addWeapon  [(_x select 0),1];
  _box addWeaponItem [_weapon,(_x select 1)];
  _box addWeaponItem [_weapon,(_x select 2)];
  _box addWeaponItem [_weapon,(_x select 3)];
  _box addWeaponItem [_weapon,[((_x select 4) select 0),((_x select 4) select 1),((_x select 4) select 2)]];
  _box addWeaponItem [_weapon,(_x select 5)];
} foreach _weapons;
//mags
{
  _box addMagazineAmmoCargo [(_x select 0),1,(_x select 1)];
} foreach _mags;
//items
{
  _box additemcargoGlobal [_x,1];
} foreach _items;
//backpacks
{
 _box additemcargoGlobal [(_x select 0),1];
} foreach _containersAndContent;
{
  [_x,((_containersAndContent select _foreachindex) select 1)] call getContent;
} foreach (everyContainer _box)
