waitUntil{!isNull(findDisplay 46)};
r_f=[];
missionNamespace setVariable["r_p",player];setCurrentChannel 5;
[]spawn{waitUntil{r_p==player};call r_allOn};

//Toggle radio channels when radio dropped/picked up
r_p addEventHandler["Put",{if(_this#2=="ItemRadio"||(r_RTOBP findIf{backpack r_p isKindOf _x}>=0))then{if(r_p call r_RC)exitWith{};call r_allOff}}];
r_p addEventHandler["Take",{if(_this#2=="ItemRadio"||(r_RTOBP findIf{backpack r_p isKindOf _x}>=0))then{if(alive r_p)then{call r_allOn}}}];

//EHs to call In & Out functions on KeyPress/Release
(findDisplay 46)displayAddEventHandler["KeyDown",{_block=false;if((_this#1)in(actionKeys"VoiceOverNet"))then{_block=true;titleText["Replace your 'VoiceOverNet' key with 'PushToTalk' instead!","PLAIN"];call r_out2;setCurrentChannel 5};_block}];
if(!r_chOn)then{(findDisplay 46)displayAddEventHandler["KeyDown",{call r_noCHS}]};
r_dn_=false;r_up_=false;
private _eh=["KeyDown","if(!r_dn_ && _this#1 in(actionKeys'pushToTalk'+actionKeys'pushToTalkDirect'+actionKeys'pushToTalkGroup'+actionKeys'pushToTalkVehicle'+actionKeys'pushToTalkSide'+actionKeys'pushToTalkCommand'))then{call r_dn}"];
kpDn=(findDisplay 46)displayAddEventHandler _eh;kpDnZ=(findDisplay 312)displayAddEventHandler _eh;
kpUp=(findDisplay 46)displayAddEventHandler["KeyUp",""];

kpZ=(findDisplay 46)displayAddEventHandler["KeyDown","if(!r_dn_ && _this#1 in actionKeys'curatorInterface')then{[(isNull(findDisplay 312))]spawn r_z}"];

//Talking + reloading bug workaround
(findDisplay 46)displayAddEventHandler["KeyDown","if(_this#1 in(actionKeys'reloadMagazine'))then{if(!r_Anim)exitWith{};if(isNull objectParent r_p && alive r_p && currentWeapon r_p!='')then{r_Anim=false;[]spawn{sleep 5;r_Anim=true}}}"];

(findDisplay 46)displayAddEventHandler["KeyDown","if(inputAction'Diary'>0)then{call r_useRadio}"];

player addEventHandler["GetInMan",{4 enableChannel r_vCH;(_this#0)call r_RTO}];
player addEventHandler["GetOutMan",{4 enableChannel[false,false];(_this#0)call r_RTO;setCurrentChannel 3}];

player addEventHandler["Killed",{call r_allOff;_r_f2=r_f;_r_f2 apply{deleteVehicle(_x#1)};{r_f deleteAt _forEachIndex}forEach _r_f2;call r_out2;
_ap=allPlayers select{side _x==playerSide};{r_p remoteExecCall["r_out",_x]}forEach _ap;
if("Spectator"in getMissionConfigValue"respawnTemplates")then{_ch9=(ch9+5);ch9 radioChannelAdd[player];_ch9 enableChannel[true,true];setCurrentChannel _ch9};"r_LRR"cutFadeOut 0}];

player addEventHandler["Respawn",{if(alive player&& !isNull player)then{if("Spectator"in getMissionConfigValue"respawnTemplates")then{ch9 radioChannelRemove[player]};missionNamespace setVariable["r_p",player];"r_LRR"cutFadeOut 0;
call r_allOn;setCurrentChannel 5;r_dn_=false;call r_ehAdd}}];

if(actionKeys"diary"isEqualTo[])then{systemChat"Please set a Diary keybind, via the Common controls!"};
if(actionKeys"PushToTalk"isEqualTo[])then{systemChat"Please set a PushToTalk keybind, via the Multiplayer controls!"};
if(!(actionKeys"VoiceOverNet"isEqualTo[]))then{systemChat"Please unbind your VoiceOverNet keybind via Multiplayer controls! (Use PushToTalk instead)"};

systemChat"[AFAR: Initialized]";setCurrentChannel 5;