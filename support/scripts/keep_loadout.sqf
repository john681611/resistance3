//Launcher Array
sleep 30;
if !((isnil {profilenamespace getvariable "Resist_LR_loadout"}) AND (isnil {profilenamespace getvariable "Resist_LR_Number"})) then {
if(profilenamespace getvariable "Resist_LR_Number" == Number) then {
	systemChat "Loading Gear";
	[player,profilenamespace getvariable "Resist_LR_loadout"] spawn setLoadout;
	};
};

sleep 10;
[] spawn {
_launch = ["launch_NLAW_F","launch_RPG32_F","launch_B_Titan_F","launch_I_Titan_F","launch_O_Titan_F","launch_B_Titan_short_F","launch_I_Titan_short_F","launch_O_Titan_short_F"];
    while{true} do {
    _weaponClass = currentWeapon player;
        if(!(_weaponClass in _launch)) then {
            if(alive player) then {
			systemChat "Saving Gear";
                loadout = [player] call getLoadout;
				profilenamespace setvariable ["Resist_LR_loadout",loadout];
				profilenamespace setvariable ["Resist_LR_Number",Number];
            };
            };
    sleep 60;  
    };
};

// Load saved loadout on respawn
player addEventHandler ["Respawn", {
        [player,loadout] spawn setLoadout;
    }
];  