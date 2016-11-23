["TF_no_auto_long_range_radio", true, true,"mission"] call CBA_settings_fnc_set;
["TF_give_personal_radio_to_regular_soldier", true, true,"mission"] call CBA_settings_fnc_set;
[]execVM "R3F_LOG\init.sqf";
waitUntil {!isNull player && !isnil "KeyNumber" };
//[] execVM "VehicleAugmentation.sqf";
[] execVM "outlw_magRepack\MagRepack_init_sv.sqf";
