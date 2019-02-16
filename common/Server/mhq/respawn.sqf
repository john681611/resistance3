
(MHQs select (_this select 1)) set [1, (_this select 0)];
 publicVariable  "MHQs";
[[(_this select 0),["<img size='2' image='Server\Images\Teleport.paa' />Teleport","Client\teleport.sqf",nil,1.5,true,true,"","alive _target && speed _target < 3",10]],"addAction"] call BIS_fnc_MP;