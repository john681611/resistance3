EOS_Spawn = compile preprocessfilelinenumbers "Server\eos\core\eos_launch.sqf";
null=[] execVM "Server\eos\core\spawn_fnc.sqf";
onplayerConnected {[] execVM "Server\eos\Functions\EOS_Markers.sqf";};
/* EOS 1.98 by BangaBob
GROUP SIZES
 0 = 1
 1 = 2,4
 2 = 4,8
 3 = 8,12
 4 = 12,16
 5 = 16,20

EXAMPLE CALL - EOS
 null = [["MARKERNAME","MARKERNAME2"],[2,1,70],[0,1],[1,2,30],[2,60],[2],[1,0,10,,1],[1,0,250,WEST]] call EOS_Spawn;
 null=[["M1","M2","M3"],[HOUSE GROUPS,SIZE OF GROUPS,PROBABILITY],[PATROL GROUPS,SIZE OF GROUPS,PROBABILITY],[LIGHT VEHICLES,SIZE OF CARGO,PROBABILITY],[ARMOURED VEHICLES,PROBABILITY], [STATIC VEHICLES,PROBABILITY],[HELICOPTERS,SIZE OF HELICOPTER CARGO,PROBABILITY],[BOX VEHICLES,PROBABILITY],[FACTION,MARKERTYPE,DISTANCE,SIDE,HEIGHTLIMIT,DEBUG]] call EOS_Spawn;

EXAMPLE CALL - BASTION
 null = [["BAS_zone_1"],[3,1],[2,1],[2],[0,0],[0,0,EAST,false,false],[10,2,120,TRUE,TRUE]] call Bastion_Spawn;
 null=[["M1","M2","M3"],[PATROL GROUPS,SIZE OF GROUPS],[LIGHT VEHICLES,SIZE OF CARGO],[ARMOURED VEHICLES],[HELICOPTERS,SIZE OF HELICOPTER CARGO],[FACTION,MARKERTYPE,SIDE,HEIGHTLIMIT,DEBUG],[INITIAL PAUSE, NUMBER OF WAVES, DELAY BETWEEN WAVES, INTEGRATE EOS, SHOW HINTS]] call Bastion_Spawn;
*/
VictoryColor="colorGreen";	// Colour of marker after completion
hostileColor="colorRed";	// Default colour when enemies active
bastionColor="colorOrange";	// Colour for bastion marker
EOS_DAMAGE_MULTIPLIER=1.25;	// 1 is default
EOS_KILLCOUNTER=false;		// Counts killed units

waitUntil {ztowninit==1};
{
_sel = selectrandomweighted Hostiles;
//null=[["M1"],[HOUSE GROUPS,SIZE OF GROUPS,PROBABILITY],[PATROL GROUPS,SIZE OF GROUPS,PROBABILITY],[LIGHT VEHICLES,SIZE OF CARGO,PROBABILITY],[ARMOURED VEHICLES,PROBABILITY], [STATIC VEHICLES,PROBABILITY],[HELICOPTERS,SIZE OF HELICOPTER CARGO,PROBABILITY],[FACTION,MARKERTYPE,DISTANCE,SIDE,HEIGHTLIMIT,DEBUG]] call EOS_Spawn;
[[_x],[2,1],[2,1],[1,3,50],[0],[0],[0,0],[1],[(_sel select 1),0,400,(_sel select 0),TRUE]] call EOS_Spawn;
} forEach ztownt;

{
_sel = selectrandomweighted Hostiles;
[[_x],[3,2],[3,1],[2,3,75],[0,0],[0],[1,1,40],[2],[(_sel select 1),0,500,(_sel select 0),TRUE]] call EOS_Spawn;
} forEach ztowns;

{
_sel = selectrandomweighted Hostiles;
[[_x],[5,2],[4,2],[4,3],[1],[2],[2,1,60],[4],[(_sel select 1),0,600,(_sel select 0),TRUE]] call EOS_Spawn;
} forEach ztownm;

{
_sel = selectrandomweighted Hostiles;
[[_x],[8,3],[8,2],[6,3],[2],[3],[3,1,80],[8],[(_sel select 1),0,800,(_sel select 0),TRUE]] call EOS_Spawn;
} forEach ztownl;

{
_sel = selectrandomweighted Hostiles;
[[_x],[8,3],[8,2],[6,3],[2],[3],[4,2,100],[8],[(_sel select 1),0,600,(_sel select 0),TRUE]] call EOS_Spawn;
} forEach ztowna;

{
_sel = selectrandomweighted Hostiles;
[[_x],[10,3],[6,3],[8,3],[4],[4],[5,3,100],[16],[(_sel select 1),0,800,(_sel select 0),TRUE]] call EOS_Spawn;
} forEach ztownc;
