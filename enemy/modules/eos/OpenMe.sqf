EOS_Spawn = compile preprocessfilelinenumbers "enemy\modules\eos\core\eos_launch.sqf";Bastion_Spawn=compile preprocessfilelinenumbers "enemy\modules\eos\core\b_launch.sqf";null=[] execVM "enemy\modules\eos\core\spawn_fnc.sqf"; Kinch_lootReward = compile preprocessfilelinenumbers "support\scripts\LootReward.sqf"; Kinch_BastionReward = compile preprocessfilelinenumbers "support\scripts\BastionReward.sqf"; onplayerConnected {[] execVM "enemy\modules\eos\Functions\EOS_Markers.sqf";};
/* EOS 1.98 by BangaBob 
GROUP SIZES
 0 = 1
 1 = 2,4
 2 = 4,8
 3 = 8,12
 4 = 12,16
 5 = 16,20

EXAMPLE CALL - EOS
 null = [["MARKERNAME","MARKERNAME2"],[2,1,70],[0,1],[1,2,30],[2,60],[2],[1,0,10],[1,0,250,WEST]] call EOS_Spawn;
 null=[["M1","M2","M3"],[HOUSE GROUPS,SIZE OF GROUPS,PROBABILITY],[PATROL GROUPS,SIZE OF GROUPS,PROBABILITY],[LIGHT VEHICLES,SIZE OF CARGO,PROBABILITY],[ARMOURED VEHICLES,PROBABILITY], [STATIC VEHICLES,PROBABILITY],[HELICOPTERS,SIZE OF HELICOPTER CARGO,PROBABILITY],[FACTION,MARKERTYPE,DISTANCE,SIDE,HEIGHTLIMIT,DEBUG]] call EOS_Spawn;

EXAMPLE CALL - BASTION
 null = [["BAS_zone_1"],[3,1],[2,1],[2],[0,0],[0,0,EAST,false,false],[10,2,120,FALSE,FALSE]] call Bastion_Spawn;
 null=[["M1","M2","M3"],[PATROL GROUPS,SIZE OF GROUPS],[LIGHT VEHICLES,SIZE OF CARGO],[ARMOURED VEHICLES],[HELICOPTERS,SIZE OF HELICOPTER CARGO],[FACTION,MARKERTYPE,SIDE,HEIGHTLIMIT,DEBUG],[INITIAL PAUSE, NUMBER OF WAVES, DELAY BETWEEN WAVES, INTEGRATE EOS, SHOW HINTS]] call Bastion_Spawn;
*/
VictoryColor="colorGreen";	// Colour of marker after completion
hostileColor="colorRed";	// Default colour when enemies active
bastionColor="colorOrange";	// Colour for bastion marker
EOS_DAMAGE_MULTIPLIER=1;	// 1 is default
EOS_KILLCOUNTER=false;		// Counts killed units

null = [["tower_1","tower_2","tower_3"],[2,2],[4,2],[3,1],[1],[2],[1,0],[0,0,500,EAST,FALSE]] call EOS_Spawn;

//Bases
null = [["base_1_4","base_1_5","base_1_6","base_1_7"],[4,3],[6,3],[3,1],[4],[4],[3,1],[0,0,500,EAST,FALSE]] call EOS_Spawn;
null = [["base_1_1","base_1_2","base_1_3"],[4,3],[6,3],[3,1],[4],[4],[3,1],[2,0,500,INDEPENDENT,FALSE]] call EOS_Spawn;

//Airfields
null = [["airfield_1_1","airfield_1_3","airfield_1_4"],[3,2],[5,2],[3,1,90],[1,90],[4],[1,0],[0,0,500,EAST,FALSE]] call EOS_Spawn;
null = [["airfield_1_2","airfield_1_5","airfield_1_6"],[3,2],[5,2],[3,1,90],[1,90],[4],[1,0],[2,0,500,INDEPENDENT,FALSE]] call EOS_Spawn;

//Cities
null = [["city_1","city_3"],[5,3],[10,2],[4,1],[4],[6],[3,1],[5,0,600,EAST,FALSE]] call EOS_Spawn;
null = [["city_2"],[5,3],[10,2],[4,1],[4],[6],[3,1],[2,0,600,INDEPENDENT,FALSE]] call EOS_Spawn;

// Zorrobyte's procedural markers

waitUntil {ztowninit==1};
{[[_x],[2,0],[1,1],[1,0,50],[0],[1],[0,0],[2,0,400,INDEPENDENT,FALSE]] call EOS_Spawn} forEach ztownloc;
{[[_x],[3,2],[4,1],[2,1],[0],[2],[1,1,20],[2,0,400,INDEPENDENT,FALSE]] call EOS_Spawn} forEach ztowns;
{[[_x],[4,3],[8,2],[4,1],[1],[3],[1,1,40],[0,0,400,EAST,FALSE]] call EOS_Spawn} forEach ztownm;