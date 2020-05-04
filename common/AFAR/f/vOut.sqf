if((r_p call r_RC)&&{(!isNull objectParent r_p)})then{
_p=(crew(objectParent r_p)select{isPlayer _x})-[r_p];
if(count _p>0)then{4 enableChannel r_vCH;_p apply{"out1"remoteExecCall["playSound",_x]}};playSound"out1";"r_LRR"cutFadeOut 0}else{setCurrentChannel 5;4 enableChannel[false,false]};
private _eh=["KeyDown","if(!r_dn_ && _this#1 in(actionKeys'pushToTalk'+actionKeys'pushToTalkDirect'+actionKeys'pushToTalkGroup'+actionKeys'pushToTalkVehicle'+actionKeys'pushToTalkSide'+actionKeys'pushToTalkCommand'))then{call r_dn}"];
kpDn=(findDisplay 46)displayAddEventHandler _eh;kpDnZ=(findDisplay 312)displayAddEventHandler _eh