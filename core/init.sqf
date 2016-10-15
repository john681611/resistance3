[]execVM "core\scripts\init_obj.sqf";

[]execVM "core\scripts\grenadeStop.sqf";

_igiload = execVM "core\scripts\IgiLoadInit.sqf";

Kinch_TowerCheck = compile preprocessfilelinenumbers "core\scripts\tower_check.sqf";
Kinch_CityCheck = compile preprocessfilelinenumbers "core\scripts\city_check.sqf";
Kinch_AirfieldCheck = compile preprocessfilelinenumbers "core\scripts\airfield_check.sqf";
Kinch_BaseSpawn = compile preprocessfilelinenumbers "core\scripts\base_spawn.sqf";

Kinch_objTrack = compile preprocessfilelinenumbers "core\scripts\obj_tracker.sqf";

call compile preprocessFile "core\modules\=BTC=_TK_punishment\=BTC=_tk_init.sqf";
call compile preprocessFile "core\scripts\mobile_repair_init.sqf";