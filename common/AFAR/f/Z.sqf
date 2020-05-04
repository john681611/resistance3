if(_this#0)then{
[]spawn{waitUntil{!isNull(findDisplay 312)};
{(_x#0)displayRemoveEventHandler["KeyDown",_x#1]}forEach[[findDisplay 46,kpDn],[findDisplay 312,kpDnZ]];
kpDnZ=(findDisplay 312)displayAddEventHandler["KeyDown","if(!r_dn_ && _this#1 in(actionKeys'pushToTalk'+actionKeys'pushToTalkDirect'+actionKeys'pushToTalkGroup'+actionKeys'pushToTalkVehicle'+actionKeys'pushToTalkSide'+actionKeys'pushToTalkCommand'))then{(findDisplay 312)displayRemoveEventHandler['KeyDown',kpDnZ];call r_dn}"];
kpZ=(findDisplay 312)displayAddEventHandler["KeyDown","if(!r_dn_ && _this#1 in actionKeys'curatorInterface')then{(findDisplay 312)displayRemoveEventHandler['KeyDown',kpZ];[]spawn r_z}"];
//hint"Zeus EH Added";
kpDn=(findDisplay 46)displayAddEventHandler["KeyDown","if(!r_dn_ && _this#1 in(actionKeys'pushToTalk'+actionKeys'pushToTalkDirect'+actionKeys'pushToTalkGroup'+actionKeys'pushToTalkVehicle'+actionKeys'pushToTalkSide'+actionKeys'pushToTalkCommand'))then{(findDisplay 46)displayRemoveEventHandler['KeyDown',kpDnZ];call r_dn}"];
kpZ=(findDisplay 46)displayAddEventHandler["KeyDown","if(!r_dn_ && _this#1 in actionKeys'curatorInterface')then{(findDisplay 46)displayRemoveEventHandler['KeyDown',kpZ];[]spawn r_z}"]}
}else{
[]spawn{waitUntil{!isNull(findDisplay 46)};
{(_x#0)displayRemoveEventHandler["KeyDown",_x#1]}forEach[[findDisplay 46,kpDn],[findDisplay 312,kpDnZ]];
kpDn=(findDisplay 46)displayAddEventHandler["KeyDown","if(!r_dn_ && _this#1 in(actionKeys'pushToTalk'+actionKeys'pushToTalkDirect'+actionKeys'pushToTalkGroup'+actionKeys'pushToTalkVehicle'+actionKeys'pushToTalkSide'+actionKeys'pushToTalkCommand'))then{(findDisplay 46)displayRemoveEventHandler['KeyDown',kpDnZ];call r_dn}"];
kpZ=(findDisplay 46)displayAddEventHandler["KeyDown","if(!r_dn_ && _this#1 in actionKeys'curatorInterface')then{(findDisplay 46)displayRemoveEventHandler['KeyDown',kpZ];[]spawn r_z}"]}}