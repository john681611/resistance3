bon_recruit_barracks = _this select 0;

if (ParamsArray select 2 == 0) exitWith {hint "Recruiting has been disabled!";};

createDialog "RecruitUnitsDialog";