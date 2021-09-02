addMissionEventHandler ["PreloadFinished", {preloadFinished = true;}];
waitUntil {!isNull player && !isnil "KeyNumber" && !isnil "saveName" && isTouchingGround player && !isNil "preloadFinished"};
//Local save's
//is nil?
_saveTestsPass  = false;
//missing?
if (!(isnil {profilenamespace getvariable (format["Resist_loadout%1",savename])}) AND !(isnil {profilenamespace getvariable (format["Resist_Box%1",savename])})) then {
  _Rbox = profilenamespace getvariable (format["Resist_loadout%1",savename]);
  _RLoad =  profilenamespace getvariable (format["Resist_Box%1",savename]);
//Array?
  if((typeName _RLoad == "ARRAY") AND (typeName _Rbox == "ARRAY")) then {
//Number?
    if((typeName (_RLoad select 0) == "SCALAR") AND (typeName  (_Rbox select 0) == "SCALAR")) then {
//Key?
      if((_RLoad select 0 == KeyNumber) AND ( _Rbox select 0 == KeyNumber)) then {
        _saveTestsPass = true;
      };
    };
  };
};

if (!_saveTestsPass) then {
  diag_log 'Resetting player Data';
  profilenamespace setvariable [(format["Resist_loadout%1",savename]),[KeyNumber,"new"]];
  profilenamespace setvariable [(format["Resist_Box%1",savename]),[KeyNumber,[true,"none",[[],[],[],[]]]]];
};

{
  (_x select 1) execVM 'Client\teleport_action.sqf';
} forEach MHQs;

{
  [
    (_x select 0),
    "Fill with Captured Boxes",
    "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_loaddevice_ca.paa",
    "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_loaddevice_ca.paa",
    "true",
    "true",
    {},
    {},
    {(_this select 3) remoteExecCall ["sendToMasterBox", 2]; },
    {},
    _x,
    6,
    nil,
    false, 
    false
  ] call BIS_fnc_holdActionAdd;
} forEach MasterBoxes;

player createDiaryRecord ["Diary", ["Welcome to resistance",
"Your mission is to clear out the surrounding towns and scavenge arms and equipment for the resistance.<br/>
All you have is what you start with only the starter vehicles respawn when destroyed. Secure vehicles and equipment by bringing it back to a base.<br/>
Teleport is available at the Turdis (portaloo).<br/>
Addon Free Radio is running as well as mag repacking on CTRL + R<br/>
Boxes in the white circle can be transerred to the 'MasterBox'(netted box) vehicle content can to<br/>
The game saves your gear though extra personal Gear can be stored at the storage Terminals (looks like ATM's at base)<br/>
Tansport boxes to base by vehicle (Teleporting with Boxes allowed when player count low).<br/>
For performance Dynamic simulation is on ranging from 1.5k to 3k, damage is done but it will not take affect untill activation.<br/>
<br/>
Please follow the server rules:<br/>
1: No Teamkilling<br/>
2: Respect Each other<br/>
Failing to abide by the above will result in your immediate removal from the server.<br/>
Website: www.iron-fists.co.uk TS: ts3.iron-fists.co.uk<br/>
PLAY FAIR AND WITH HONOUR"]];
player createDiaryRecord ["Diary", ["About Resistance",
"Resistance is a co-op mission about teamwork. Instead of being given everything in the toybox you have a limited amount of resources with which to complete your mission.<br/>
Your goal is to capture your island back.<br/>
Each AO has ammo/weapon/gear supplies stored within the buildings, the bigger the zone the more to find.<br/>
When zones clear be carefull as there may be stragglers out to get you.<br/>
Your rewards are what you salvage so knock vehicles out and repair where possible.<br/>
There are a few old BLUFOR bases marked in red hashing you may be able to find some NATO equipment there, but they are mined.<br/>
To keep vehicles, boxs and other loot store it within the borders of your bases (blue bordered areas). Boxes Stored in vehicles will not be saved so make sure to remove them.<br/>
Warning: Content of vehicles and boxs provided at the bases will be lost on server restart<br/>
Have fun playing! --Mike64"]];

player createDiaryRecord ["Diary", ["Mission Credits",
"The author of this mission would like to thank the following people for their contributions to Resistance:<br/>
Giallustio - Logistics<br/>
BangaBob - Enemy Occupation System (EOS)<br/>
Shuko - Taskmaster Script & SHK Pos<br/>
phronk - Addon-Free ArmA Radio<br/>
lsd - ZEC used for bases<br/>
IRON-FISTS - Testing and ideas<br/>
This server, for running the mission<br/>
You, for playing!"
]];

player createDiarySubject ["teamspeak", "Teamspeak"];
player createDiaryRecord ["teamspeak", ["TS3", "
<br/> You can download Teamspeak here:<br/>
<br/> http://www.teamspeak.com/?page=downloads
<br/>
"]];
player createDiaryRecord ["teamspeak", ["IRON FISTS", "
<br/> Teamspeak IP-address for the INF server:
<br/> ts3.iron-fists.co.uk
<br/>
<br/> Visitors and guests welcome!
"]];

player createDiarySubject ["Settings & Keybinds", "Settings & Keybinds"];
player createDiaryRecord ["Settings & Keybinds", ["Settings & Keybinds", "
<br/>Click <execute expression = '[] spawn CHVD_fnc_openDialog;'>View Distance Settings.</execute>
<br/>Click <execute expression = '[] call outlw_MR_createDialog;'>Mag Repack</execute> (Ctrl+R)
<br/>Click <execute expression = '[] call toggle_earplugs;'>Toggle Earplugs</execute> (Pause/Break)
"]];

[] execVM "Client\earplugs.sqf";
["InitializePlayer", [player]] call BIS_fnc_dynamicGroups;
[] execVM "Client\Player_Marker.sqf";
[] execVM "Client\Revive_marker.sqf";
[] execVM "Client\Tags\tags.sqf";
getContent = compile preprocessFileLineNumbers 'Server\persistance\content\getContent.sqf';
setContent = compile preprocessFileLineNumbers 'Server\persistance\content\setContent.sqf';
getLoadout = compile preprocessFileLineNumbers 'Client\get_loadout.sqf';
setLoadout = compile preprocessFileLineNumbers 'Client\set_loadout.sqf';
[] execVM 'Client\safe_box.sqf';
player addEventHandler ["Respawn", {
  loadout = [player,["ammo"]] call getLoadout;
  profilenamespace setvariable [(format["Resist_loadout%1",savename]),[KeyNumber,loadout]];
  systemChat "Gear Saved";
  }];
[] execVM "Server\Info Boards\WelcomeMessage.sqf";
[] execVM "Client\keep_loadout.sqf";

[missionNamespace, "arsenalOpened", {
		disableSerialization;
		params ["_display"];
		_display displayAddEventHandler ["keydown", "_this select 3"];
		{(_display displayCtrl _x) ctrlShow false} forEach [44151, 44150, 44146, 44147, 44148, 44149, 44346];
	}] call BIS_fnc_addScriptedEventHandler;


if(isClass(configFile>>"cfgPatches">>"ace_common")) then {
  player setVariable["BIS_revive_disableRevive",true];
};

[[player]] remoteExec ["RES_fnc_addToAllCurators", 2];