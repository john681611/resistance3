if(r_p call r_RC)then{
private _p=(allPlayers select{playerSide==side _x})-[player];
if(count _p>0)then{
if(lifeState r_p!="INCAPACITATED")then{1 enableChannel r_sCH;
if(r_alertOn)then{r_p call r_alert};
1 enableChannel r_sCH;playSound"in0";_p apply{r_p remoteExec["r_fuzz2",_x]}
}else{playSound"in2";setCurrentChannel 5;_p apply{r_p remoteExecCall["r_out",_x]}};call r_anm;
if(r_3DR)then{call r_3DLR}
}else{playSound"in2"}}else{call r_allOff;setCurrentChannel 5};
private _eh=["KeyUp","if(!r_up_ && _this#1 in actionKeys'pushToTalk'+actionKeys'pushToTalkSide')then{call r_up}"];kpUp=(findDisplay 46)displayAddEventHandler _eh;kpUpZ=(findDisplay 312)displayAddEventHandler _eh