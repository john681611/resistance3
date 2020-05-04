params["_u"];
_n=name _u;
_r_f2=r_f;
_f=r_f select{_n in _x};_f apply{deleteVehicle(_x#1)}; 
{if(_n in _x)then{playSound"out1";r_f deleteAt _forEachIndex}}forEach _r_f2