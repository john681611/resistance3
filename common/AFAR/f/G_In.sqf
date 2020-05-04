if(r_p call r_RC)then{
private _p=(units group r_p select{isPlayer _x})-[r_p];
if(r_3DR)then{call r_3DLR};
if(count _p>0)then{
if(lifeState r_p!="INCAPACITATED")then{{(_x#0)enableChannel(_x#1)}forEach[[3,r_grCH],[5,r_dCH]];
if(r_alertOn)then{r_p call r_alert};_p apply{r_p remoteExec["r_fuzz",_x]};playSound"in1"}else{playSound"in2";setCurrentChannel 5;3 enableChannel[false,false]};
}else{playSound"in2"};call r_anm};
private _eh=["KeyUp","if(!r_up_ && _this#1 in(actionKeys'pushToTalk'+actionKeys'pushToTalkGroup'))then{call r_up}"];
kpUp=(findDIsplay 46)displayAddEventHandler _eh;kpUpZ=(findDisplay 312)displayAddEventHandler _eh