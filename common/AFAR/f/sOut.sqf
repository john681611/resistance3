_p=(allPlayers select{playerSide==side _x})-[r_p];
if(count _p>0)then{
if(lifeState r_p!="INCAPACITATED")then{1 enableChannel r_sCH;_p apply{r_p remoteExec["r_out",_x]}}else{1 enableChannel[false,false];setCurrentChannel 5}};
playSound"out1";"r_LRR"cutFadeOut 0;
private _eh=["KeyDown","if(!r_dn_ && _this#1 in(actionKeys'pushToTalk'+actionKeys'pushToTalkDirect'+actionKeys'pushToTalkGroup'+actionKeys'pushToTalkVehicle'+actionKeys'pushToTalkSide'+actionKeys'pushToTalkCommand'))then{call r_dn}"];
kpDn=(findDisplay 46)displayAddEventHandler _eh;kpDnZ=(findDisplay 312)displayAddEventHandler _eh