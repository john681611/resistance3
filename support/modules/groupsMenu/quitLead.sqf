private ["_newLead","_caller","_curGroup"];
_caller = _this select 1;

_caller removeAction GRPMNU_exitGroup;
_caller removeAction GRPMNU_joinGroup;
_caller removeAction GRPMNU_leaveGroup;
_caller removeAction GRPMNU_makeLead;
_caller removeAction GRPMNU_quitLead;

_curGroup = [];
_curGroup = units group _caller;
_newLead = _caller;
while {_newLead == _caller} do {
    _newLead = _curGroup select (floor(random(count _curGroup)));
    sleep 1;
};
group _caller selectLeader _newLead;
hint format ['No Longer Leading\nGroup %1', group _caller];
GRPMNU_groupActions = _caller addAction["<t color='#EB7FAF'>Groups Menu</t>", "support\modules\groupsMenu\GroupActions.sqf", nil, -200, false, false, "", "_target == vehicle _this || _target == _this"];

if true exitWith {};