["Initialize"] call BIS_fnc_dynamicGroups;
addMissionEventHandler ["HandleDisconnect",{deleteMarker format["%1",(_this select 2)]; deletevehicle (_this select 0)}];
ztowninit = 0;
CompZone = 0;
publicVariable "CompZone";
Ztown = 0;
publicVariable "Ztown";
Number = 0;
Number = RANDOM(1000);
publicVariable "Number";

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
