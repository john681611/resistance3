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

C1 execVM 'Client\teleport_action.sqf';

player createDiarySubject ["TeamSpeak & TFAR","TeamSpeak & TFAR"];
player createDiaryRecord ["TeamSpeak & TFAR", ["TeamSpeak & TFAR","We highly Reccomend using Teamspeak and the TFAR mod <br/>
TS server: ts3.iron-fists.eu OR 81.19.212.66 <br/>
Channle: Arma 3 Resistance Server/BLUFOR <br/>
<br/>
TFAR Frequencies
Short range: <br/>
Alpha/Normal: 100 <br/>
Bravo Squad: 200 <br/>
Charlie Squad 300 (not used by INF atm) <br/>
Emergency: 66 <br/>
<br/>
Long range: <br/>
Ground Vehicles: 40 <br/>
Aircaft: 50 <br/>
Emergency: 66 <br/>
"]];
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
