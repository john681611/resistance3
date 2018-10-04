//config
//Both
saveName = "Rocsh";//ENTER CUSTOM SERVER NAME HERE
MHQs =[[FLG, C1,"MHQ"]]; //[base flag ,vehicle , marker, name]
Bases =[['respawn_west', Main_Zone, "Main Base"]]; //[marker, trigger, name]
/////////////////////////////////////
ztowninit = 0;
Ztown = 0;
CompZone = 0;
takenTowns = [];
publicVariable "saveName";
publicVariable "Ztown";
publicVariable "CompZone";
publicVariable "MHQs";
publicVariable "Bases";

["Initialize"] call BIS_fnc_dynamicGroups;
addMissionEventHandler ["HandleDisconnect",{deleteMarker format["%1",(_this select 2)]; deletevehicle (_this select 0)}];
if ((isnil {profilenamespace getvariable (format["Resist_SaveGame%1",savename])}) OR (("NEWGAME" call BIS_fnc_getParamValue) == 1)) then {
  KeyNumber = RANDOM(1000);
  profilenamespace setvariable [(format["Resist_SaveGame%1",savename]),[KeyNumber,"new"]];
} else {
  _data = profilenamespace getvariable (format["Resist_SaveGame%1",savename]);
  KeyNumber = (_data select 0);
};
publicVariable "KeyNumber";
getContent = compile preprocessFileLineNumbers 'Server\persistance\content\getContent.sqf';
setContent = compile preprocessFileLineNumbers 'Server\persistance\content\setContent.sqf';
getSaveGame = compile preprocessFileLineNumbers 'Server\persistance\game\get_game.sqf';
setSaveGame = compile preprocessFileLineNumbers 'Server\persistance\game\set_game.sqf';
[] execVM "Server\persistance\game\keep_game.sqf";
[] execVM "Server\z_townmgr.sqf";
[] execVM "Server\MHQ_Marker.sqf";
[] execVM "Server\VehicleMarker.sqf";
waitUntil {ztowninit==1};
[]	execVM "Server\eos\OpenMe.sqf";
[]	execVM "Server\cleanupAuto.sqf";

 //Fog limiter
 while {true} do
 {
	if(fog > 0.5) then {
		120 setFog 0;
	};
	sleep 1800;
 };
