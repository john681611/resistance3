tf_no_auto_long_range_radio = true;
tf_give_personal_radio_to_regular_soldier = true;
enable_lea_addon = false;
[]execVM "R3F_LOG\init.sqf";
enableSaving [false,false];

[[
    ],[
	  ["Mission INFO","<font size='16'>Objective:<font size='12'> Clear the local zones marked in red of hostile forces until all are complete.
		<br/><br/>
		<font size='16'>Zones:<font size='12'> Zones marked in red are areas populated by hostile forces once a zone turns dark red it’s activated. When you have cleared the town out it will go green.
		<br/><br/>
		<font size='16'>Loot:<font size='12'> Anything you can recover from hostiles is loot. Nothing is given on completion of a zone so be careful does that helo or tank need to die or can you repair it and use it? Hostile zones have supply boxes scattered around so keep an eye out.
		<br/><br/>
		<font size='16'>Teleporting:<font size='12'> you can teleport to any repsawn from the Flag. It’s HIGHLY RECCOMENDED to use this before a vehicle.
		<br/><br/>
		<font size='16'>Medical system BI:<font size='12'> Same as endgame press space to revive and anyone with a Medkit get a revive speed boost.
		<br/><br/>
		<font size='16'>Group Management BI:<font size='12'> Same as endgame.
		<br/><br/>
		<font size='16'>Repair / Rearm:<font size='12'> We don’t have the supplies to have a full repair and rearm location. Engineers can do a basic fix but you are going to have to acquire various support trucks to keep you vehicles running and armed. Remember fuel stations on the map will refill you tank for free.
		<br/><br/>
		<font size='16'>Gear:<font size='12'> The boxes at the home base are all your starting supplies and will not be replenished. Gear can be acquired from vehicles, boxes and dead hostiles. It’s recommended you bring it back to base to make sure you always have supplies.
		<br/><br/>
		<font size='16'>Gear Saving:<font size='12'> your gear saves every time you close your inventory,die and on teleport it will be loaded on respawn. If you join re-join a mission your previous gear should be loaded.
		<br/><br/>
		<font size='16'>Respawns:<font size='12'> The MHQ (Truck in respawn menu) is the primary respawn in the mission though secondary respawns can be built using tents or sleeping bags found in the boxes. These secondary respawns are not unlimited to make sure they are used wisely.
		<br/><br/>
		<font size='16'>Vehicle respawns:<font size='12'> Only the MHQ and armed off-road respawn when killed. They do not respawn when left damaged on the map.
"],
      ["Developers notes","<font size='16'>Created by INF_Mike64
							<br/>
							www.iron-fists.eu
							<br/>
							<br>
							Scripts used:<font size='12'>
							<br/>
							EOS: http://forums.bistudio.com/showthread.php?153100-Enemy-occupation-system-%28eos%29
							<br/>
							TAW_vd:  http://www.armaholic.com/page.php?id=19751
							<br/>
							SHK-pos: http://www.armaholic.com/page.php?id=22316
							<br/>
							R3F_Log: http://www.armaholic.com/page.php?id=26159
							<br/>
							shk_taskmaster: http://www.armaholic.com/page.php?id=21970"],
	  ["Teamspeak Info","TS: 81.19.212.66<br/>Visit us at www.iron-fists.eu"]
    ]] execvm "shk_taskmaster.sqf";
waitUntil {!isNull player && !isnil "Number" };
getLoadout = compile preprocessFileLineNumbers 'Client\get_loadout.sqf';
setLoadout = compile preprocessFileLineNumbers 'Client\set_loadout.sqf';
[] execVM "Client\keep_loadout.sqf";
[] execVM "VehicleAugmentation.sqf";
[] execVM "outlw_magRepack\MagRepack_init_sv.sqf";
