//Launcher Array

_data = profilenamespace getvariable (format["Resist_loadout%1",savename]);
if ((typeName (_data select 1)) == "ARRAY") then {
	systemChat "Loading Gear";
	[player,(_data select 1),["ammo"]] call setLoadout;
	systemChat "Gear Loaded";
};

sleep 10;
[] spawn {
_launch = ["launch_NLAW_F","launch_RPG32_F","launch_B_Titan_F","launch_I_Titan_F","launch_O_Titan_F","launch_B_Titan_short_F","launch_I_Titan_short_F","launch_O_Titan_short_F"];
    while{true} do {
    _weaponClass = currentWeapon player;
	    if(!(_weaponClass in _launch)) then {
	      if(alive player) then {
	        loadout = [player,["ammo"]] call getLoadout;
					profilenamespace setvariable [format["Resist_loadout%1",savename],[KeyNumber,loadout]];
	    	};
	    };
    sleep 60;
    };
};
