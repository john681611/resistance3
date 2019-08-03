//server
blacklistLocations = ["Tuvanaka"];
Hostiles = [
	[INDEPENDENT,2],.6,
	[INDEPENDENT,4],.4,
	[INDEPENDENT,1],.5,
	[INDEPENDENT,3],.5,
	[INDEPENDENT,8],.1,
	[INDEPENDENT,9],.2,
	[EAST,0],.3,
	[EAST,5],.3,
	[EAST,7],.3,
	[EAST,6],.1
];
//Both
saveName = "RocshRHS";//ENTER CUSTOM SERVER NAME HERE
MHQs =[[FLG, C1,"MHQ"]]; //[base flag ,vehicle , marker, name]
Bases =[['respawn_west', Main_Zone, "Main Base"]]; //[marker, trigger, name]
/////////////////////////////////////
publicVariable "MHQs";
publicVariable "Bases";
publicVariable "saveName";