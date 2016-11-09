private ["_box","_weapons","_mags","_containers","_containersAndContent","_content","_items"];
_box = _this;
diag_log _box;
_weapons =  weaponsItemsCargo _box;
_mags = magazinesAmmo  _box;
_containers = everyContainer  _box;
diag_log format ["Every Container: %1",_containers];
_containersAndContent = [];
{
  diag_log "Set Nesting Down";
  _content = (_x select 1)  call setContent;
  diag_log "Set Coming up";
  _containersAndContent append [[(typeof (_x select 1)),_content]];
} foreach _containers;
_items =[];
{
  if(!(_x in _containers)) then {
  _items append [_x];
  };
}foreach (itemCargo _box);



_return = [_weapons,_mags,_items,_containersAndContent];
_return
