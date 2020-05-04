private _seat=[["driver"],["Turret",[0]],["Turret",[0,0]]];private _p=[];
((allPlayers select{playerSide==side _x})-[r_p])apply{private _y=_x;if((r_RTOBP findIf{backpack _y isKindOf _x}>=0)||{(assignedVehicleRole _x in _seat && objectParent _x isKindOf"Air" && !(objectParent _x isKindOf"ParachuteBase"))})then{_p pushBack _x}};
if(count _p>0)then{
if(lifeState r_p!="INCAPACITATED")then{
switch(playerSide)do{
case WEST:{(ch6+5)enableChannel r_mCH};
case EAST:{(ch7+5)enableChannel r_mCH};
case INDEPENDENT:{(ch8+5)enableChannel r_mCH}};
_p apply{r_p remoteExec["r_out",_x]}}else{call r_out2;{(_x#0)enableChannel[false,false];(_x#1)radioChannelRemove[r_p]}forEach[[(ch6+5),ch6],[(ch7+5),ch7],[(ch8+5),ch8]];setCurrentChannel 5;_p apply{r_p remoteExecCall["r_out",_x]}}};
playSound"out1";"r_LRR"cutFadeOut 0;
private _eh=["KeyDown","if(!r_dn_ && _this#1 in(actionKeys'pushToTalk'+actionKeys'pushToTalkDirect'+actionKeys'pushToTalkGroup'+actionKeys'pushToTalkVehicle'+actionKeys'pushToTalkSide'+actionKeys'pushToTalkCommand'))then{call r_dn}"];
kpDn=(findDisplay 46)displayAddEventHandler _eh;kpDnZ=(findDisplay 312)displayAddEventHandler _eh