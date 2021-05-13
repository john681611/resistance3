//server
blacklistLocations = [""];
Hostiles = [
	[INDEPENDENT,1],.6,
	[INDEPENDENT,3],.6,
	[EAST,0],.4,
	[EAST,2],.4
];
//Both
saveName = "Nam";//ENTER CUSTOM SERVER NAME HERE
MHQs =[[FLG, C1,"MHQ"], [FLG2, C2,"MHQ2"]];
Bases =[['respawn_west', Main_Zone, "Village"], ['respawn_west_cove', Cove_Zone, "Cove"]]; //[marker, trigger, name]
MasterBoxes = [[mb, mz]];//[box,zone]
/////////////////////////////////////
publicVariable "MHQs";
publicVariable "Bases";
publicVariable "MasterBoxes";
publicVariable "saveName";