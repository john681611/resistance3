if (!isServer) exitWith {};

_towns = nearestLocations [getArray(configFile >> "CfgWorlds" >> worldName >> "centerPosition"), ["NameVillage"], 25000];
ztowns = [];
{
    _pos = position _x;
    _m = createMarker [format ["%1", (text _x)],_pos];
	ztowns = ztowns + [_m];
    _m setMarkerShape "ELLIPSE";
    _m setMarkerSize [200,200];
    _m setMarkerBrush "Solid";
    _m setMarkerAlpha 0.5;
    _m setMarkerColor "ColorYellow";
} forEach _towns;

_towns = nearestLocations [getArray(configFile >> "CfgWorlds" >> worldName >> "centerPosition"), ["NameCity"], 25000];
ztownm = [];
ztownloc = [];
{
    _pos = position _x;
    _m = createMarker [format ["%1", (text _x)],_pos];
	ztownm = ztownm + [_m];
    _m setMarkerShape "ELLIPSE";
    _m setMarkerSize [300,300];
    _m setMarkerBrush "Solid";
    _m setMarkerAlpha 0.5;
    _m setMarkerColor "ColorRed";
	
	_p = [_pos,[500,1000],random 360,0,[1,1000]] call SHK_pos;
    _m1 = createMarker [format ["checkpoint_%1",random 100000],_p];
	ztownloc = ztownloc + [_m1];
    _m1 setMarkerShape "ELLIPSE";
    _m1 setMarkerSize [100,100];
    _m1 setMarkerBrush "Solid";
    _m1 setMarkerAlpha 0;
    _m1 setMarkerColor "ColorBlue";
	
} forEach _towns;

ztowninit = 1;