_tower1mkr = ["tower_1"];
_tower2mkr = ["tower_2"];
_tower3mkr = ["tower_3"];

_towerMarker = _this select 0;
_caseEnder = 0;

if (isServer) then {

		if (_towerMarker in _tower1mkr) then
			{"ACavoid" setMarkerPos getMarkerPos "tower_1";
			"ACavoid" setMarkerSize [5000, 5000];
			PAPABEAR SideChat "We've captured a radio tower near Kavala. They're going to have a harder time radioing for reinforcements.";
			["sectasktower1","succeeded"] call SHK_Taskmaster_upd;
			};
			
		if (_towerMarker in _tower2mkr) then
			{"ACavoid_1" setMarkerPos getMarkerPos "city_2";
			"ACavoid_1" setMarkerSize [5000, 5000];
			PAPABEAR SideChat "We've captured a radio tower near Athira. They're going to have a harder time radioing for reinforcements.";
			["sectasktower2","succeeded"] call SHK_Taskmaster_upd;
			};

		if (_towerMarker in _tower3mkr) then
			{"ACavoid_2" setMarkerPos getMarkerPos "tower_3";
			"ACavoid_2" setMarkerSize [5000, 5000];
			PAPABEAR SideChat "We've captured a radio tower near Pyrgos. They're going to have a harder time radioing for reinforcements.";
			["sectasktower3","succeeded"] call SHK_Taskmaster_upd;
			};
		
	};