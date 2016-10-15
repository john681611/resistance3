waitUntil { isServer || !isNull player };
tf_no_auto_long_range_radio = true;
TF_give_personal_radio_to_regular_soldier = true;
enable_lea_addon = false;
#ifndef execNow
#define execNow call compile preprocessfilelinenumbers
#endif
execVM "gvs\gvs_init.sqf";

[]execVM "R3F_LOG\init.sqf";
enableSaving [false,false];
execNow "=BTC=_revive\=BTC=_revive_init.sqf";

ztowninit = 0;
z_debug = false;
execNow "core\init.sqf";
// Compile scripts
getLoadout = compile preprocessFileLineNumbers 'support\scripts\get_loadout.sqf';
setLoadout = compile preprocessFileLineNumbers 'support\scripts\set_loadout.sqf';

[] execVM "support\scripts\keep_loadout.sqf";




if (!isNull player) then { execNow "initClient.sqf"; };

diag_log format["Initialisation Completed", time];
[Supplies_0, "Sup_base1"] execVM "R3F_LOG\USER_FUNCT\do_not_lose_it.sqf";
[Supplies_1, "Sup_base2"] execVM "R3F_LOG\USER_FUNCT\do_not_lose_it.sqf";