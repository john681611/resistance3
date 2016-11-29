waitUntil {time > 2;};
["tf_give_personal_radio_to_regular_soldier", true, true] call CBA_settings_fnc_set;
["tf_no_auto_long_range_radio", true, true] call CBA_settings_fnc_set;
["tf_give_microdagr_to_soldier", false, true] call CBA_settings_fnc_set;
[]execVM "R3F_LOG\init.sqf";
waitUntil {!isNull player && !isnil "KeyNumber" };
//[] execVM "VehicleAugmentation.sqf";
[] execVM "outlw_magRepack\MagRepack_init_sv.sqf";
