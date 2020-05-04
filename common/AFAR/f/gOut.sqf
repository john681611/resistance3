_p=(units group r_p select{isPlayer _x})-[r_p];
if(count _p>0)then{
if(lifeState r_p!="INCAPACITATED")then{{(_x#0)enableChannel(_x#1)}forEach[[3,r_grCH],[5,r_dCH]];_p apply{r_p remoteExecCall["r_out",_x]}}else{
3 enableChannel[false,false];setCurrentChannel 5}};
"r_LRR"cutFadeOut 0;playSound"out1";
private _eh=["KeyDown","if(!r_dn_ && _this#1 in(actionKeys'pushToTalk'+actionKeys'pushToTalkDirect'+actionKeys'pushToTalkGroup'+actionKeys'pushToTalkVehicle'+actionKeys'pushToTalkSide'+actionKeys'pushToTalkCommand'))then{call r_dn}"];
kpDn=(findDisplay 46)displayAddEventHandler _eh;kpDnZ=(findDisplay 312)displayAddEventHandler _eh