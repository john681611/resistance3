private ["_box","_weapons","_mags","_containers","_containersAndContent","_items","_weapon","_data"];
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

TAG_fnc_baseWeapon = {
	_weapon = _this;
	_baseCfg = (configFile >> "cfgWeapons");
	_cfg = _baseCfg >> _weapon;

	while {isClass (_cfg >> "LinkedItems") } do {
		_parent = configName (inheritsFrom (_cfg));
		_cfg = _baseCfg >> _parent;
	};

	configName _cfg
};
//weapons
{

  _weapon = (_x select 0) call TAG_fnc_baseWeapon;
  _box addWeaponCargoGlobal [_weapon,1];
  _box additemcargoGlobal [(_x select 1),1];
  _box additemcargoGlobal [(_x select 2),1];
  _box additemcargoGlobal [(_x select 3),1];
  if(count (_x select 4) > 0) then {
    _box addMagazineAmmoCargo [((_x select 4) select 0),1,((_x select 4) select 1)];
   };
  _box additemcargoGlobal [(_x select 5),1];
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
  if((_x select 0) isKindOf "Bag_Base") then {
    _box addBackpackCargoGlobal  [(_x select 0),1];
  } else {
    _box additemcargoGlobal [(_x select 0),1];
  }
} foreach _containersAndContent;
{
  [(_x select 1),((_containersAndContent select _foreachindex) select 1)] call setContent;
} foreach (everyContainer _box)
