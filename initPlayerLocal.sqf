waitUntil {!isNull player && !isnil "KeyNumber"};
//Loadouts
if (isnil {profilenamespace getvariable "Resist_loadout"}) then {
  profilenamespace setvariable ["Resist_loadout",[KeyNumber,"new"]];
} else {
  if((typeName ((profilenamespace getvariable "Resist_loadout") select 0)) == "SCALAR") then {
    if(((profilenamespace getvariable "Resist_loadout") select 0) != KeyNumber) then {
      profilenamespace setvariable ["Resist_loadout",[KeyNumber,"new"]];
    };
  } else {
    profilenamespace setvariable ["Resist_loadout",[KeyNumber,"new"]];
  };
};
//Box
if (isnil {profilenamespace getvariable "Resist_Box"}) then {
  profilenamespace setvariable ["Resist_Box",[KeyNumber,[true,"none",[[],[],[],[]]]]];
} else {
  if((typeName ((profilenamespace getvariable "Resist_Box") select 0)) == "SCALAR") then {
    if(((profilenamespace getvariable "Resist_Box") select 0) != KeyNumber) then {
      profilenamespace setvariable ["Resist_Box",[KeyNumber,[true,"none",[[],[],[],[]]]]];
    };
  }else{
    profilenamespace setvariable ["Resist_Box",[KeyNumber,[true,"none",[[],[],[],[]]]]];
  };

};

"Welcome to resistance" hintC [
"Supplies are low use them wisely.",
"Your mission is to clear out the surrounding towns and scavenge arms and equipment for the resistance.",
"All you have is what you start with only the starter vehicles respawn when destroyed.",
"Teleport is available at the flag.",
"Check the 'Mission INFO' for more information.",
"",
"Please follow the server rules:",
"1: No WEAPON or UNIFORM mods, please make sure to use standard equipment.",
"2: No Teamkilling",
"3: We advise you to join our Teamspeak as communication is the key to successfully completing the missions. (ts3: 81.19.212.66)",
"Failing to abide by the above will result in your immediate removal from the server.",
"Website: www.iron-fists.eu",
"PLAY FAIR AND WITH HONOUR",
"TASK FORCE RADIOS ARE USED ON THIS SERVER BUT NOT NEEDED"];
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
