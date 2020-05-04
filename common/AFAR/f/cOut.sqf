if(leader group r_p!=r_p)exitWith{call r_out2;setCurrentChannel 5;2 enableChannel[false,false];titleText["You are not the group leader","PLAIN DOWN"];titleFadeOut 5};
private _p=(allPlayers select{leader group _x==_x&&side _x==playerSide})-[r_p];
if(count _p>0)then{
if(lifeState r_p!="INCAPACITATED")then{2 enableChannel r_cCH;_p apply{r_p remoteExecCall["r_out",_x]}}else{setCurrentChannel 5;2 enableChannel[false,false];_p apply{r_p remoteExecCall["r_out",_x]}}};
playSound"out1";"r_LRR"cutFadeOut 0;
private _eh=["KeyDown","if(!r_dn_ && _this#1 in(actionKeys'pushToTalk'+actionKeys'pushToTalkDirect'+actionKeys'pushToTalkGroup'+actionKeys'pushToTalkVehicle'+actionKeys'pushToTalkSide'+actionKeys'pushToTalkCommand'))then{call r_dn}"];
kpDn=(findDisplay 46)displayAddEventHandler _eh;kpDnZ=(findDisplay 312)displayAddEventHandler _eh