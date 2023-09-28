private ["_tempArray", "_tempUnit", "_crew"];
_tempArray=[];
_tempUnit= selectRandomWeighted (_this select 0);
_temparray set [count _temparray, _tempUnit];
_crew= selectRandomWeighted (_this select 1);
_temparray set [count _temparray, _crew];
_temparray