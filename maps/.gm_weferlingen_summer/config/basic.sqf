//server
blacklistLocations = [""];
Hostiles = [
	[INDEPENDENT,4],.4,
	[INDEPENDENT,5],.2,
	[INDEPENDENT,6],.2,
	[INDEPENDENT,7],.1,
	[INDEPENDENT,8],.5,
	[INDEPENDENT,9],.3,
	[INDEPENDENT,10],.2,
	[INDEPENDENT,11],.3,
	[EAST,0],.4,
	[EAST,1],.3,
	[EAST,2],.4,
	[EAST,3],.1
];
//Both
saveName = "GM";//ENTER CUSTOM SERVER NAME HERE
MHQs =[[FLG, C1,"MHQ"],[FLG2,C2,"MHQ2"]];
Bases =[['respawn_west', Main_Zone, "West Base"],['respawn_west_camp', Hotel_Zone,'East Base']]; //[marker, trigger, name]
MasterBoxes = [[mb, mz], [mb2,mz2]];//[box,zone]
/////////////////////////////////////
publicVariable "MHQs";
publicVariable "Bases";
publicVariable "MasterBoxes";
publicVariable "saveName";