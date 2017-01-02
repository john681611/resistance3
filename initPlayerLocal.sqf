waitUntil {!isNull player && !isnil "KeyNumber"};
waitUntil {isTouchingGround player};
//Local save's
//is nil?
_saveTestsPass  = false;
//missing?
if (!(isnil {profilenamespace getvariable "Resist_loadout"}) AND !(isnil {profilenamespace getvariable "Resist_Box"}) ) then {
//Array?
  if(((typeName (profilenamespace getvariable "Resist_loadout")) == "ARRAY") AND ((typeName (profilenamespace getvariable "Resist_Box")) == "ARRAY")) then {
//Number?
    if(((typeName ((profilenamespace getvariable "Resist_loadout") select 0)) == "SCALAR") AND ((typeName ((profilenamespace getvariable "Resist_Box") select 0)) == "SCALAR")) then {
//Key?
      if((((profilenamespace getvariable "Resist_loadout") select 0) == KeyNumber) AND (((profilenamespace getvariable "Resist_loadout") select 0) == KeyNumber)) then {
        _saveTestsPass = true;
      };
    };
  };
};

if (!_saveTestsPass) then {
  diag_log 'Resetting player Data';
  profilenamespace setvariable ["Resist_loadout",[KeyNumber,"new"]];
  profilenamespace setvariable ["Resist_Box",[KeyNumber,[true,"none",[[],[],[],[]]]]];
};

C1 addAction ["<img size='2' image='Server\Images\Teleport.paa' />Teleport","Client\teleport.sqf",nil,1.5,true,true,"","alive C1"];
C2 addAction ["<img size='2' image='Server\Images\Teleport.paa' />Teleport","Client\teleport.sqf",nil,1.5,true,true,"","alive C2"];

player createDiarySubject ["TeamSpeak & TFAR","TeamSpeak & TFAR"];
player createDiaryRecord ["TeamSpeak & TFAR", ["TeamSpeak & TFAR","We highly Reccomend using Teamspeak and the TFAR mod <br/>
TS server: ts3.iron-fists.eu OR 81.19.212.66 <br/>
Channle: Arma 3 Liberation Server/BLUFOR <br/>
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
[] execVM "Client\keep_loadout.sqf";
player addEventHandler ["Respawn", {
  loadout = [player,["ammo"]] call getLoadout;
  profilenamespace setvariable ["Resist_loadout",[KeyNumber,loadout]];
  systemChat "Gear Saved";
  }];
[] execVM "Server\Info Boards\WelcomeMessage.sqf";
