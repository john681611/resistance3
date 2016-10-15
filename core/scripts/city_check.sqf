_city1mkr = ["city_1"];
_city2mkr = ["city_2"];
_city3mkr = ["city_3"];

_cityMarker = _this select 0;

if (isServer) then {
	
		if (_cityMarker in _city1mkr)then
			{PAPABEAR SideChat "We have captured Kavala.";
			["Taskcity1","succeeded"] call SHK_Taskmaster_upd;
			};

		if (_cityMarker in _city2mkr)then
			{PAPABEAR SideChat "We have captured Athira.";
			["Taskcity2","succeeded"] call SHK_Taskmaster_upd;
			};

		if (_cityMarker in _city3mkr) then
			{PAPABEAR SideChat "We have captured Pyrgos.";
			["Taskcity3","succeeded"] call SHK_Taskmaster_upd;
			};
		
	};