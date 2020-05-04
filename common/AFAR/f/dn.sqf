private _ch=currentChannel;if(_ch in[0,1,(ch9+5)])then{if(admin owner player>0)then{setCurrentChannel 5};
if(!r_sideCH)exitWith{{_x enableChannel[false,false]}forEach[0,1];r_dn_=false}};

if((alive r_p)&&(isAbleToBreathe r_p)&&(!(isObjectHidden player)))then{
switch(_ch)do{
case 1:{1 enableChannel r_sCH};
case 2:{2 enableChannel r_cCH};
case 3:{3 enableChannel r_grCH};
case 4:{4 enableChannel r_vCH}; 
case 5:{5 enableChannel r_dCH};
case(ch6+5):{(ch6+5)enableChannel r_mCH};
case(ch7+5):{(ch7+5)enableChannel r_mCH};
case(ch8+5):{(ch8+5)enableChannel r_mCH};
case(ch9+5):{(ch9+5)enableChannel[false,false]}
}}else{
if(!(isAbleToBreathe r_p))then{5 enableChannel[false,false];{_x enableChannel[false,false]}count r_CH;if(_ch in r_CH)then{playSound"in2"};titleText["I need a rebreather to talk underwater","PLAIN DOWN"];titleFadeOut 6};
if(_ch==(ch9+5))then{_ch enableChannel[true,true]}else{_ch enableChannel[false,false]}};

//TODO: Reset KeyDown/KeyUp EH on respawn
{(_x#0)displayRemoveEventHandler["KeyDown",_x#1]}forEach[[findDisplay 46,kpDn],[findDisplay 312,kpDnZ]];
r_dn_=true;r_up_=false;
switch true do{
case(_this#1 in actionKeys"pushToTalkSide"):{call S_In};
case(_this#1 in actionKeys"pushToTalkCommand"):{call C_In};
case(_this#1 in actionKeys"pushToTalkGroup"):{call G_In};
case(_this#1 in actionKeys"pushToTalkVehicle"):{call V_In};
case(_this#1 in actionKeys"pushToTalkDirect"):{call D_In};
default{
switch(_ch)do{
case 1:{call S_In};
case 2:{call C_In};
case 3:{call G_In};
case 4:{call V_In};
case 5:{call D_In};
case(ch6+5):{call M_In};
case(ch7+5):{call M_In};
case(ch8+5):{call M_In};
case(ch9+5):{r_dn_=false}}}};