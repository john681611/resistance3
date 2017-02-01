if (!isServer) exitWith {};
	_data = profilenamespace getvariable format["Resist_SaveGame%1",savename];
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
			profilenamespace setvariable [format["Resist_SaveGame%1",savename],[KeyNumber,_game]];
			saveProfileNamespace;
	    sleep _sleepTime;
    };
};
