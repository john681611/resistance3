/*
	Created by =BTC= Giallustio
	version 0.3
	Visit us at: 
	http://www.blacktemplars.altervista.org/
	06/03/2012
*/
//Def
BTC_tk_blackscreen_punishment = 2;
BTC_tk_last_warning = 6;

BTC_fnc_tk_PVEH =
{
	//0 - first aid - create // [0,east,pos]
	//1 - first aid - delete
	_array = _this select 1;
	_name  = _array select 0;
	_punisher = _array select 1;
	hint format ["%1 has committed TK and has been punished by %2",_name,_punisher];
	if (name player == _name) then {_spawn = [] spawn BTC_Teamkill;};
};
BTC_EH_killed =
{
	_body = _this select 0;
	_killer = _this select 1;
	_veh_body = vehicle _body;
	_veh_killer = vehicle _killer;
	_name = name _killer;
	if (_name != name _body && BTC_vip find (name _killer) == -1) then
	{
		if (side _killer == BTC_side && _veh_body != _veh_killer) then
		{
			//BTC_tk_PVEH = [_name];publicVariable "BTC_tk_PVEH";player sidechat format ["%1 has committed TK",_name];
			_killer spawn 
			{
				hint format ["%1 TK you! You can decide to punish him by action menu", name _this];
				WaitUntil {Alive player};
				_action = player addAction [("<t color=""#ED2744"">") + ("Punish " + name _this) + "</t>","core\modules\=BTC=_TK_punishment\=BTC=_punish_action.sqf",[name _this], 8, true, true, "", "true"];
				_timeout = time + 60;
				WaitUntil {sleep 1; (_timeout < time)};
				player removeAction _action;
			};
		};
	};
};
BTC_Teamkill =
{
	player addrating 9999;
	BTC_teamkiller = BTC_teamkiller + 1;
	_uid = getPlayerUID player;
	BTC_logic setVariable [_uid,BTC_teamkiller,true];
	switch (true) do
	{
		case (BTC_teamkiller <= BTC_tk_blackscreen_punishment) : 
		{
			titleText ["Hey, don't Teamkill. It's not cool.","BLACK FADED"];
			sleep 3;
			titleText ["Hey, don't Teamkill. It's not cool.","PLAIN"];
		};
		case (BTC_teamkiller > BTC_tk_blackscreen_punishment && BTC_teamkiller <= BTC_tk_last_warning) : 
		{
			private ["_n","_array_tk","_msg"];
			_msg = "";
			disableUserInput true;
			if (BTC_teamkiller == BTC_tk_last_warning) then
			{
				_msg = "Last Warning, DO NOT TEAMKILL!";
			} else {_msg = "You've been punished for Teamkilling. Don't do it again";};
			player setPos [0,0,0];
			_n = 0;
			while {_n < 60} do
			{
				titleText [_msg,"BLACK FADED"];
				_n = _n + 1;
				sleep 1;
			};
			disableUserInput false;
			player setDamage 1;
		};
		case (BTC_teamkiller > BTC_tk_last_warning) : 
		{

			disableUserInput true;
			titleText ["You have been convicted of excessive TeamKilling!\nYou have been exiled.","BLACK FADED"];
			player setPos [13460,11973];
			[player] joinSilent grpNull;
			[player] joinSilent _targetGroup;
			_dummyGroupEast = createGroup east;
			_newUnit = _dummyGroupEast createUnit ["O_Soldier_F",position player, [], 0, "FORM"];
			[_newUnit] joinSilent _targetGroup;//_targetGroup could be 'group player' for example
			deleteGroup _dummyGroupEast;// if you no longer need the dummy group
			while {true} do
			{
				titleText ["You have been convicted of excessive TeamKilling!\nYou have been exiled.","PLAIN"];
				removeAllWeapons player;
				removeAllItems player;
				removeBackpack player;
				sleep 3;
			};
			disableUserInput false;
		};
	};
};
if (isServer) then
{
	BTC_tk_PVEH = [];publicVariable "BTC_tk_PVEH";
};
if (!isDedicated) then
{
	[] spawn
	{
		private ["_uid","_array_tk"];
		waitUntil {!isNull player};
		waitUntil {player == player};
		player addEventHandler ["Killed", BTC_EH_killed];
		"BTC_tk_PVEH" addPublicVariableEventHandler BTC_fnc_tk_PVEH;
		player addrating 9999;
		BTC_side = side player;
		BTC_vip = [];
		_uid = getPlayerUID player;
		if (isNil {BTC_logic getVariable _uid}) then
		{
			BTC_logic setVariable [_uid,0,true];
			BTC_teamkiller = 0;
		}
		else
		{
			BTC_teamkiller = BTC_logic getVariable _uid;
			if (BTC_teamkiller > BTC_tk_last_warning) then {_tk = [] spawn BTC_Teamkill;}
		};
	};
};