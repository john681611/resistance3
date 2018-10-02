if (!isServer) exitWith {};
_blacklist = [6405.69,12365.6,0];
_towns=[];
 {
_text =  getText (configfile >> "CfgWorlds" >> "WL_Rosche" >> "Names">> (configName _x) >> "type");
_pos = getArray (configfile >> "CfgWorlds" >> "WL_Rosche" >> "Names">> (configName _x) >> "position");
if(!(_pos in _blacklist)) then {
  _towns = _towns + [[_text,_pos]];
}else{
  diag_log "Location Blacklisted";
  diag_log _pos;
};

 } forEach ("getText (_x >> 'type') != 'NameMarine' AND getText (_x >> 'type') != 'CityCenter'" configClasses (configfile >> "CfgWorlds" >> "WL_Rosche" >> "Names"));


ztownt = [];
ztowns = [];
ztownm = [];
ztownl = [];
ztownc = [];
ztownTA = [];
ztowna = [];
ztownAll = [];
//Extra areas
_towns = _towns;
{
    _pos = (_x select 1);

    if(!(_pos isFlatEmpty  [-1, -1, -1, -1, 2, false] isEqualTo [])) then {
          _pos = [_pos] call BIS_fnc_findSafePos;
        };


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
        case "Airport":{
          ztowna = ztowna + [_m];
        };
    		default {
    		};
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
        _m setMarkerSize [100,100];
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
      case "Airport":{
        _m setMarkerSize [300,300];
      };
      default {
      _m setMarkerSize [400,400];
      };
    };


    _m setMarkerShape "ELLIPSE";
    _m setMarkerBrush "Solid";
    _m setMarkerAlpha 0.5;

} forEach _towns;


ztownAll = ztownTA + ztownc + ztownl + ztownm + ztowns + ztownt + ztowna;
ztowninit = 1;
