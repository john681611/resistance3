if (!isServer) exitWith {};

_towns=[];
 {
_text =  getText (configfile >> "CfgWorlds" >> "Altis" >> "Names">> (configName _x) >> "type");
_pos = getArray (configfile >> "CfgWorlds" >> "Altis" >> "Names">> (configName _x) >> "position");
_towns = _towns + [[_text,_pos]];

 } forEach ("getText (_x >> 'type') != 'NameMarine' AND getText (_x >> 'type') != 'CityCenter'" configClasses (configfile >> "CfgWorlds" >> "Altis" >> "Names"));


ztownt = [];
ztowns = [];
ztownm = [];
ztownl = [];
ztownc = [];
ztownAll = [];

{
    _pos = (_x select 1);
	
	
	
    _m = createMarker [format ["%1", _pos],_pos];
	switch((_x select 0)) do
	{
		case "Hill":
		{
			_m setMarkerSize [50,50];
			ztownt = ztownt + [_m];
		};
	
		case "NameLocal":
		{
			_m setMarkerSize [150,150];
			ztowns = ztowns + [_m];
		};
		case "NameVillage":
		{
			_m setMarkerSize [250,250];
			ztownm = ztownm + [_m];
		};
		case "NameCity":
		{
			_m setMarkerSize [300,300];
			ztownl = ztownl + [_m];
		};
		
		case "NameCityCapital":
		{
			_m setMarkerSize [400,400];
			ztownc = ztownc + [_m];
		};
		
		default {
		_m setMarkerSize [400,400];
		}
	};
	
	
    _m setMarkerShape "ELLIPSE";
    
    _m setMarkerBrush "Solid";
    _m setMarkerAlpha 0.5;
    _m setMarkerColor "ColorYellow";
} forEach _towns;


ztownAll = ztownc + ztownl + ztownm + ztowns + ztownt + ["BLU","BLU_1","BLU_2","BLU_3","BLU_4","BLU_5","BLU_6","BLU_7","BLU_8"];
ztowninit = 1;