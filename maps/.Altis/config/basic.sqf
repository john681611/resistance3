//server
blacklistLocations = ["];
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
saveName = "Altis";//ENTER CUSTOM SERVER NAME HERE
MHQs =[[FLG, C1,"MHQ"],[FLG2,C2,"MHQ2"]]; //[base flag ,vehicle , marker, name]
Bases =[['respawn_west', Main_Zone, "Main Base"], ['respawn_west_Hotel',Hotel_Zone, 'Hotel Base']]; //[marker, trigger, name]
MasterBoxes = [[mb, mz], [mb2,mz2]];//[box,zone]
/////////////////////////////////////
publicVariable "MHQs";
publicVariable "Bases";
publicVariable "MasterBoxes";
publicVariable "saveName";