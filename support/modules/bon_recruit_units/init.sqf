//by Bon_Inf*


BON_RECRUIT_PATH = "support\modules\bon_recruit_units\";

bon_max_units_allowed = ParamsArray select 3;


bon_recruit_queue = [];

if(isServer) then{
	"bon_recruit_newunit" addPublicVariableEventHandler {
		_newunit = _this select 1;
		[_newunit] execFSM (BON_RECRUIT_PATH+"unit_lifecycle.fsm");
	};
};
if(isDedicated) exitWith{};


// Client stuff...