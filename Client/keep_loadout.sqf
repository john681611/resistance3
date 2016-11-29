//Launcher Array
systemChat "Loading Gear";
sleep 10;
_data = profilenamespace getvariable "Resist_loadout";
if ((typeName (_data select 1)) == "ARRAY") then {
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
					profilenamespace setvariable ["Resist_loadout",[KeyNumber,loadout]];
	    	};
	    };
    sleep 60;
    };
};
