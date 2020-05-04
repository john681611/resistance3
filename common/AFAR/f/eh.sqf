[]spawn{sleep 0.005;waitUntil{!isNull(findDisplay 46)};
r_dn_=false;
(findDisplay 46)displayRemoveEventHandler["KeyDown",kpDn];(findDisplay 46)displayRemoveEventHandler["KeyUp",kpUp];
kpDn=(findDisplay 46)displayAddEventHandler["KeyDown","if(!r_dn_ && _this#1 in(actionKeys'pushToTalk'+actionKeys'pushToTalkDirect'+actionKeys'pushToTalkGroup'+actionKeys'pushToTalkVehicle'+actionKeys'pushToTalkSide'+actionKeys'pushToTalkCommand'))then{call r_dn}"]
}