_grp=(_this select 0);
_grp enableDynamicSimulation true;
{
	_unit = _x;
	if (EOS_DAMAGE_MULTIPLIER != 1 and !isClass(configFile>>"cfgPatches">>"ace_common")) then {
		_unit removeAllEventHandlers "HandleDamage";
		_unit addEventHandler ["HandleDamage", {
			_damage = (_this select 2)*EOS_DAMAGE_MULTIPLIER;
			_damage
		}];
	};
	if (EOS_KILLCOUNTER) then {
		_unit addEventHandler ["killed", "null=[] execVM ""eos\functions\EOS_KillCounter.sqf"""]
	};
	// ADD CUSTOM SCRIPTS to UNIT HERE
	// performance crap
	_unit triggerDynamicSimulation false;
	if ((_this select 1) == "AIRskill") then {
		_x setSkill ["spotDistance", .9];
		_x setSkill ["courage", .9];
	}
} forEach (units _grp);

[units _grp] remoteExec ["RES_fnc_addToAllCurators", 2];