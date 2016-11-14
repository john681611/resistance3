
private ["_box","_weapons","_mags","_containers","_containersAndContent","_content","_items"];
_box = _this;
_weapons =  weaponsItemsCargo _box;
_mags = magazinesAmmoCargo _box;
_containers = everyContainer  _box;
_containersAndContent = [];
{
  _content = (_x select 1)  call getContent;
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
