["InitializePlayer", [player]] call BIS_fnc_dynamicGroups;  
[] execVM "Client\Player_Marker.sqf";
[] execVM "Client\Tags\tags.sqf";
cutText ["","BLACK OUT",0];
sleep 4;
player setPos [getmarkerpos "respawn_west" select 0,(getmarkerpos "respawn_west" select 1)-5,0];
cutText ["","BLACK IN"];
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
C1 addAction ["Teleport","Client\teleport.sqf",nil,1.5,true,true,"","alive C1"];
C2 addAction ["Teleport","Client\teleport.sqf",nil,1.5,true,true,"","alive C2"];
