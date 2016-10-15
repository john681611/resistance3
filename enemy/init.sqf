nul = [3] execvm "enemy\modules\tpwcas\tpwcas_script_init.sqf";
[] execVM "enemy\scripts\z_townmgr.sqf";
waitUntil {ztowninit==1};
[] execVM "enemy\modules\eos\OpenMe.sqf";