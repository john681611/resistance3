// [] execVM "core\scripts\hc_tele.sqf";
["Initialize"] call BIS_fnc_dynamicGroups; 
#ifndef execNow
#define execNow call compile preprocessfilelinenumbers
#endif
PAPABEAR=[West,"HQ"];

if(isServer) then {skiptime (paramsArray select 1);};
execNow "support\init.sqf";
execNow "enemy\init.sqf";
Number = RANDOM(1000);
publicVariable "Number";
[] execVM "support\scripts\mobile_marker.sqf";
nul =  execVM "support\scripts\Backpack_box.sqf"; 
nul = [clothes_box_1] execVM "support\scripts\G_crate.sqf";
nul = [clothes_box] execVM "support\scripts\G_crate.sqf";
_null = [] execVM "cleanup.sqf";

MobileRespawn1 = [west,"mhq_crate1"] call BIS_fnc_addRespawnPosition;
MobileRespawn2 = [west,"mhq_crate2"] call BIS_fnc_addRespawnPosition;
_PerBox = [pb,pb_1,pb_2,pb_3,pb_4,pb_5,pb_6,pb_7,pb_8,pb_9,pb_10,pb_11,pb_12,pb_13,pb_14,pb_15,pb_16,pb_17];
{
clearMagazineCargoGlobal _x;
clearWeaponCargoGlobal  _x;
clearItemCargoGlobal _x;
clearBackpackCargoGlobal _x;
} foreach _PerBox;
