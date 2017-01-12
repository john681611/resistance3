if (!isServer) exitWith {};
	_data = profilenamespace getvariable "Resist_SaveGame";
if((typeName (_data select 1)) == "ARRAY") then {
	(_data select 1) call setSaveGame;
	diag_log "Loaded Game";
};
waitUntil {ztowninit==1};
[] spawn {
	_sleepTime = 60;
	sleep _sleepTime;
    while{true} do {
			_game = call getSaveGame;
			profilenamespace setvariable ["Resist_SaveGame",[KeyNumber,_game]];
	    sleep _sleepTime;
    };
};
