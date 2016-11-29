if (!isServer) exitWith {};
if !((isnil {profilenamespace getvariable "Resist_SaveGame"}) AND (isnil {profilenamespace getvariable "Resist_LR_Number"})) then {
if(profilenamespace getvariable "Resist_LR_Number" == KeyNumber) then {
	diag_log "Loading Game";
	profilenamespace getvariable "Resist_SaveGame" call setSaveGame;
	};
};
waitUntil {ztowninit==1};
sleep 6;
[] spawn {
    while{true} do {
//saving done here
			_game = call getSaveGame;
			profilenamespace setvariable ["Resist_SaveGame",_game];
			profilenamespace setvariable ["Resist_LR_Number",KeyNumber];
	    sleep 6;
    };
};
