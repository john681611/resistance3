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
ztownTA = [];
ztownAll = [];

{
    _pos = (_x select 1);



    _m = createMarker [format ["%1", _pos],_pos];
    if(!((getMarkerPos _m) in takenTowns)) then {
    	switch((_x select 0)) do
    	{
    		case "Hill":
    		{
    			ztownt = ztownt + [_m];
    		};

    		case "NameLocal":
    		{
    			ztowns = ztowns + [_m];
    		};
    		case "NameVillage":
    		{
    			ztownm = ztownm + [_m];
    		};
    		case "NameCity":
    		{
    			ztownl = ztownl + [_m];
    		};

    		case "NameCityCapital":
    		{
    			ztownc = ztownc + [_m];
    		};
    		default {
    		}
    	};
      _m setMarkerColor "ColorYellow";
    } else {
      _m setMarkerColor "ColorGreen";
      ztownTA = ztownTA + [_m];
    };

    switch((_x select 0)) do
    {
      case "Hill":
      {
        _m setMarkerSize [50,50];
      };

      case "NameLocal":
      {
        _m setMarkerSize [150,150];
      };
      case "NameVillage":
      {
        _m setMarkerSize [250,250];
      };
      case "NameCity":
      {
        _m setMarkerSize [300,300];
      };

      case "NameCityCapital":
      {
        _m setMarkerSize [400,400];
      };
      default {
      _m setMarkerSize [400,400];
      }
    };


    _m setMarkerShape "ELLIPSE";
    _m setMarkerBrush "Solid";
    _m setMarkerAlpha 0.5;

} forEach _towns;


ztownAll = ztownTA + ztownc + ztownl + ztownm + ztowns + ztownt + ["BLU","BLU_1","BLU_2","BLU_3","BLU_4","BLU_5","BLU_6","BLU_7"];
ztowninit = 1;
