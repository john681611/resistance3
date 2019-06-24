_mrk=(_this select 0);
_radveh	=(_this select 1);
_newpos = [getMarkerPos _mrk,0,getMarkerSize _mrk select 0,_radveh,1,0.5,0] call BIS_fnc_findSafePos;	
_newpos
