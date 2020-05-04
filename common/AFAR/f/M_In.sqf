private _seat=[["driver"],["Turret",[0]],["Turret",[0,0]]];private _p=[];
if((r_RTOBP findIf{backpack r_p isKindOf _x}>=0)||{(assignedVehicleRole r_p in _seat && objectParent r_p isKindOf"Air" && !(objectParent r_p isKindOf"ParachuteBase"))})then{
((allPlayers select{playerSide==side _x})-[r_p])apply{private _y=_x;if((r_RTOBP findIf{backpack _y isKindOf _x}>=0)||{(assignedVehicleRole _x in _seat && objectParent _x isKindOf"Air" && !(objectParent _x isKindOf"ParachuteBase"))})then{_p pushBack _x}};
if(lifeState r_p!="INCAPACITATED")then{
if(count _p>0)then{
switch(playerSide)do{
case WEST:{(ch6+5)enableChannel r_mCH};
case EAST:{(ch7+5)enableChannel r_mCH};
case INDEPENDENT:{(ch8+5)enableChannel r_mCH}};playSound"in0";_p apply{r_p remoteExec["r_fuzz2",_x]};if(r_alertOn)then{r_p call r_alert}}else{playSound"in2"};call r_anm;
if(r_3DR)then{call r_3DLR}}else{
{(_x#0)enableChannel[false,false];(_x#1)radioChannelRemove[r_p]}forEach[[(ch6+5),ch6],[(ch7+5),ch7],[(ch8+5),ch8]];setCurrentChannel 5;playSound"in2"}
}else{{(_x#0)enableChannel[false,false];(_x#1)radioChannelRemove[r_p]}forEach[[(ch6+5),ch6],[(ch7+5),ch7],[(ch8+5),ch8]];setCurrentChannel 5};
private _eh=["KeyUp","if(!r_up_ && _this#1 in actionKeys'pushToTalk')then{call r_up}"];
kpUp=(findDisplay 46)displayAddEventHandler _eh;kpUpZ=(findDisplay 312)displayAddEventHandler _eh