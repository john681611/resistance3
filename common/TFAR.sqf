if ((isClass (configFile >> "CfgPatches" >> "task_force_radio")) AND (("TFAR" call BIS_fnc_getParamValue) == 1)) then {
	//TFAR:
	//functions: https://github.com/michail-nikolaev/task-force-arma-3-radio/wiki/API:-Variables
	compile preprocessFileLineNumbers "\task_force_radio\functions\common.sqf";
	[false] call TFAR_fnc_generateSwSettings;

	//Channel and Password
	tf_radio_channel_name = "Resistance";
	tf_radio_channel_password = "12345";

	//Settings
	["TF_no_auto_long_range_radio", true, true, "mission"] call CBA_settings_fnc_set;
	["TF_give_personal_radio_to_regular_soldier", true, true, "mission"] call CBA_settings_fnc_set;
	["TF_give_microdagr_to_soldier", false, true, "mission"] call CBA_settings_fnc_set;
	["TF_same_sw_frequencies_for_side", true, true, "mission"] call CBA_settings_fnc_set;
	["TF_same_lr_frequencies_for_side", true, true, "mission"] call CBA_settings_fnc_set;

	//Radios
	TF_defaultWestPersonalRadio = "tf_anprc152";
	TF_defaultEastPersonalRadio = "tf_fadak";
	TF_defaultGuerPersonalRadio = "tf_anprc148jem";

	TF_defaultWestRiflemanRadio = "tf_anprc154";
	TF_defaultEastRiflemanRadio = "tf_pnr1000a";
	TF_defaultGuerRiflemanRadio = "tf_anprc154";

	//Radio Freqencies
	_settingsSwWest = false call TFAR_fnc_generateSwSettings;
	_settingsSwEast = false call TFAR_fnc_generateSwSettings;
	_settingsSwGuer = false call TFAR_fnc_generateSwSettings;

	_settingsLrWest = false call TFAR_fnc_generateLrSettings;
	_settingsLrEast = false call TFAR_fnc_generateLrSettings;
	_settingsLrGuer = false call TFAR_fnc_generateLrSettings;

	_settingsSwWest set [2, ["100","200","300","44","45","46","47","48"]];
	_settingsLrWest set [2, ["30","40","50","54","55","56","57","58","59"]];
	_settingsSwWest set [4, "_bluefor"];
	_settingsLrWest set [4, "_bluefor"];
	tf_freq_west = _settingsSwWest;
	tf_freq_west_lr = _settingsLrWest;

	_settingsSwEast set [2, ["41","42","43","44","45","46","47","48"]];
	_settingsLrEast set [2, ["51","52","53","54","55","56","57","58","59"]];

	_settingsSwGuer set [2, ["61","62","63","64","65","66","67","68"]];
	_settingsLrGuer set [2, ["71","72","73","74","75","76","77","78","79"]];

	_settingsSwEast set [4, "_opfor"];
	_settingsLrEast set [4, "_opfor"];
	tf_freq_east = _settingsSwEast;
	tf_freq_east_lr = _settingsLrEast;

	call {
		if ([independent,west] call BIS_fnc_sideIsFriendly) exitWith {
			_settingsSWGuer set [4, "_bluefor"];
			_settingsLrGuer set [4, "_bluefor"];
		};
		if ([independent,east] call BIS_fnc_sideIsFriendly) exitWith {
			_settingsSWGuer set [4, "_opfor"];
			_settingsLrGuer set [4, "_opfor"];
		};
		_settingsSWGuer set [4, "_indfor"];
		_settingsLrGuer set [4, "_indfor"];
	};

	tf_freq_guer = _settingsSwGuer;
	tf_freq_guer_lr = _settingsLrGuer;


	if (isDedicated) then {
		{publicVariable _x} count ["tf_freq_west","tf_freq_west_lr","tf_freq_east","tf_freq_east_lr","tf_freq_guer","tf_freq_guer_lr"];
	};

};
