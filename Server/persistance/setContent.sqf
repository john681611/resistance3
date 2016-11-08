_box = _this;
diag_log _box;
_weapons =  weaponsItemsCargo _box;
_mags = magazinesAmmo  _box;
_containers = everyContainer  _box;
_containersAndContent = [];
{
  _containersAndContent append [[(_x select 0),((_x select 1) call setContent)]];
} foreach _containers;
_items =[];
{
  if(!(_x in _containers)) then {
  _items append [_x];
  };
}foreach (itemCargo _box);



_return = [_weapons,_mags,_items,_containersAndContent];
_return
