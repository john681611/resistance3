_Object = _this select 0;
_Player = _this select 1;
_uid = getPlayerUID player;
_AllowedUid = [
	"76561197997287214",	//Rhys
	"76561198055408846",	//Corpsman
	"76561198034419493",	//Mike64
	"76561197995337740",	//Hawkeye
	"76561198039452704",	//Predator
	"76561198060257022",	//Breast
	"76561198012294761",	//Whitephos
	"76561198072061000",	//Ninjakid
	"76561198089423855",	//Mearcat
	"76561198030858787",	//House
	"76561198028393412",	//Deadeye
	"76561198089179762",	//Winterkaye
	"_SP_PLAYER_"	//SinglePlayer
];
ServerCleaned = 0;
ServerClean = 0;
publicVariable "ServerClean";

if (_uid in _AllowedUid) then {
	hintsilent "Authorised!";
	_result = ["Are you sure? <br/> <t color='#ff0000'>This will delete eveything left on the ground.</t>", "Confirm", true, true] call BIS_fnc_guiMessage;

	if(_result) then {
		[[], "cleanServer", false, false, false] call BIS_fnc_MP;
	};
} else {
	hintsilent "Not Authorised!";
;}
