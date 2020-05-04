if((r_p call r_RC)&&{(!isNull objectParent r_p)})then{
_p=(crew(objectParent r_p)select{isPlayer _x});
if(count _p>1)then{4 enableChannel r_vCH;_p apply{"in1"remoteExecCall["playSound",_x]}}else{playSound"in2"}}else{{_x enableChannel[false,false]}count r_CH;setCurrentChannel 5};
private _eh=["KeyUp","if(!r_up_ && _this#1 in(actionKeys'pushToTalk'+actionKeys'pushToTalkVehicle'))then{call r_up}"];
kpUp=(findDisplay 46)displayAddEventHandler _eh;kpUpZ=(findDisplay 312)displayAddEventHandler _eh