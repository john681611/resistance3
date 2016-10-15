if (!isNull player) then {
    GRPMNU_groupActions = player addAction["<t color='#EB7FAF'>Groups Menu</t>", "support\modules\groupsMenu\groupActions.sqf", nil,-200, false, false, "", "_target == vehicle _this || _target == _this"];
    player addEventHandler ["Respawn", {
        GRPMNU_groupActions = player addAction["<t color='#EB7FAF'>Groups Menu</t>", "support\modules\groupsMenu\groupActions.sqf", nil,-200, false, false, "", "_target == vehicle _this || _target == _this"];
    }];
};