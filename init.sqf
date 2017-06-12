waitUntil {time > 2;};
[]execVM "TFAR.sqf";
[]execVM "R3F_LOG\init.sqf";
waitUntil {!isNull player && !isnil "KeyNumber" };
[] execVM "outlw_magRepack\MagRepack_init_sv.sqf";
