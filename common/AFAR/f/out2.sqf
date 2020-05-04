if(!r_dn_ && !r_up_)exitWith{};
private _RTO=r_RTOBP findIf{backpack r_p isKindOf _x}>=0;
switch(_this)do{
case 1:{_p=(allPlayers select{side _x==playerSide})-[r_p];if(count _p>0)then{_p apply{r_p remoteExecCall["r_out",_x]}}};
case 2:{_p=(allPlayers select{leader group _x==_x&&side _x==playerSide})-[r_p];if(count _p>0)then{_p apply{r_p remoteExecCall["r_out",_x]}}};
case 3:{_p=(units group r_p select{isPlayer _x})-[r_p];if(count _p>0)then{_p apply{r_p remoteExecCall["r_out",_x]}}};
case 4:{_p=(crew(objectParent r_p)select{isPlayer _x})-[r_p];if(count _p>0)then{_p apply{"out1"remoteExecCall["playSound",_x]}}};
case(ch6+5):{_p=[];((allPlayers select{playerSide==side _x})-[r_p])apply{if(_RTO || assignedVehicleRole _x in[["driver"],["Turret",[0]],["Turret",[0,0]]]&&objectParent _x isKindOf"Air" && !(objectParent _x isKindOf"ParachuteBase"))then{_p pushBack _x};};if(count _p>0)then{_p apply{r_p remoteExecCall["r_out",_x]}}};
case(ch7+5):{_p=[];((allPlayers select{playerSide==side _x})-[r_p])apply{if(_RTO || assignedVehicleRole _x in[["driver"],["Turret",[0]],["Turret",[0,0]]]&&objectParent _x isKindOf"Air" && !(objectParent _x isKindOf"ParachuteBase"))then{_p pushBack _x};if(count _p>0)then{_p apply{r_p remoteExecCall["r_out",_x]}}}};
case(ch8+5):{_p=[];((allPlayers select{playerSide==side _x})-[r_p])apply{if(_RTO || assignedVehicleRole _x in[["driver"],["Turret",[0]],["Turret",[0,0]]]&&objectParent _x isKindOf"Air" && !(objectParent _x isKindOf"ParachuteBase"))then{_p pushBack _x};if(count _p>0)then{_p apply{r_p remoteExecCall["r_out",_x]}}}};
}