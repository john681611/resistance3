//server
blacklistLocations = [""];
Hostiles = [
	[EAST,0],.3,
	[EAST,1],.2,
	[EAST,2],.3,
	[EAST,3],.3,
	[INDEPENDENT,4],.4,
	[INDEPENDENT,5],.3,
	[INDEPENDENT,6],.3,
	[INDEPENDENT,7],.1
];
//Both
saveName = "AltisBootCamp";//ENTER CUSTOM SERVER NAME HERE
MHQs =[[FLG, C1,"MHQ"],[FLG2,C2,"MHQ2"]]; //[base flag ,vehicle , marker, name]
Bases =[['respawn_west', Main_Zone, "Main Base"], ['respawn_west_Hotel',Hotel_Zone, 'Hotel Base']]; //[marker, trigger, name]
MasterBoxes = [[mb, mz], [mb2,mz2]];//[box,zone]
/////////////////////////////////////
publicVariable "MHQs";
publicVariable "Bases";
publicVariable "MasterBoxes";
publicVariable "saveName";