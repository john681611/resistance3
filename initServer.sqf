["Initialize"] call BIS_fnc_dynamicGroups;
addMissionEventHandler ["HandleDisconnect",{deleteMarker format["%1",(_this select 2)]; deletevehicle (_this select 0)}];
ztowninit = 0;
CompZone = 0;
takenTowns = [];
publicVariable "CompZone";
Ztown = 0;
publicVariable "Ztown";
if ((isnil {profilenamespace getvariable "Resist_LR_Number"}) OR (("NEWGAME" call BIS_fnc_getParamValue) == 1)) then {
  KeyNumber = RANDOM(1000);
} else {
  KeyNumber = profilenamespace getvariable "Resist_LR_Number";
};
publicVariable "KeyNumber";
getContent = compile preprocessFileLineNumbers 'Server\persistance\content\getContent.sqf';
setContent = compile preprocessFileLineNumbers 'Server\persistance\content\setContent.sqf';
getSaveGame = compile preprocessFileLineNumbers 'Server\persistance\game\get_game.sqf';
setSaveGame = compile preprocessFileLineNumbers 'Server\persistance\game\set_game.sqf';
[] execVM "Server\persistance\game\keep_game.sqf";
[]	execVM "Server\boxs\BoxInit.sqf";
[] execVM "Server\z_townmgr.sqf";
[]	execVM "Server\MHQ_Marker.sqf";
waitUntil {ztowninit==1};
[]	execVM "Server\eos\OpenMe.sqf";
[]	execVM "cleanup.sqf";

 //Fog limiter
 while {true} do
 {
	if(fog > 0.5) then {
		120 setFog 0;
	};
	sleep 1800;
 };
