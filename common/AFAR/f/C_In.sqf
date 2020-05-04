if(r_p call r_RC)then{
if(leader group r_p!=r_p)exitWith{2 enableChannel[false,false];setCurrentChannel 5;titleText["You are not the group leader","PLAIN DOWN"];titleFadeOut 5};
private _p=(allPlayers select{leader group _x==_x&&side _x==playerSide})-[r_p];
if(count _p>0)then{
if(lifeState r_p!="INCAPACITATED")then{2 enableChannel r_cCH;
if(r_alertOn)then{r_p call r_alert};_p apply{r_p remoteExec["r_fuzz2",_x]};playSound"in0"}else{playSound"in2";2 call r_out2;setCurrentChannel 5}}else{playSound"in2"};
call r_anm;if(r_3DR)then{call r_3DLR}};
private _eh=["KeyUp","if(!r_up_ && _this#1 in(actionKeys'pushToTalk'+actionKeys'pushToTalkCommand'))then{call r_up}"];
kpUp=(findDisplay 46)displayAddEventHandler _eh;kpUpZ=(findDisplay 312)displayAddEventHandler _eh