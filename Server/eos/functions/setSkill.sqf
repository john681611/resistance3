_grp=(_this select 0);
{
	_unit =  _x;
	if (EOS_DAMAGE_MULTIPLIER != 1) then {_unit removeAllEventHandlers "HandleDamage";_unit addEventHandler ["HandleDamage",{_damage = (_this select 2)*EOS_DAMAGE_MULTIPLIER;_damage}];};
	if (EOS_KILLCOUNTER) then {_unit addEventHandler ["killed", "null=[] execVM ""eos\functions\EOS_KillCounter.sqf"""]};
	// ADD CUSTOM SCRIPTS TO UNIT HERE
} forEach (units _grp);
_grp enableDynamicSimulation true;
