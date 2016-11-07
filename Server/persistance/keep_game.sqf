//Launcher Array
diag_log format ["!_!_!_!_!_!_Local Number: %1  ServerNumber: %2  SaveGame: %3", KeyNumber,(profilenamespace getvariable "Resist_LR_Number"),(profilenamespace getvariable "Resist_SaveGame")];
if !((isnil {profilenamespace getvariable "Resist_SaveGame"}) AND (isnil {profilenamespace getvariable "Resist_LR_Number"})) then {
if(profilenamespace getvariable "Resist_LR_Number" == KeyNumber) then {
	diag_log "Loading Game";
	profilenamespace getvariable "Resist_SaveGame" call setSaveGame;
	};
};

waitUntil {ztowninit==1};
[] spawn {
    while{true} do {
//saving done here
			_game = call getSaveGame;
			profilenamespace setvariable ["Resist_SaveGame",_game];
			profilenamespace setvariable ["Resist_LR_Number",KeyNumber];
			diag_log format ["$_$_$_$_Game saved ID: %1 Save: %2 ",KeyNumber, _game];
	    sleep 600;
    };
};
