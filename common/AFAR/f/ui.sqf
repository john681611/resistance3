if(alive r_p&&r_p call r_RC)then{
if(isNull objectParent r_p&&(!(animationState r_p in["ainvpercmstpsraswrfldnon","amovpknlmstpsraswrfldnon","ainvppnemstpsraswrfldnon"])))then{r_p playAction"Gear"};
if(isNull(findDisplay 6966696))then{
createDialog"AFAR_UI";ctrlEnable[90909,false];
(findDisplay 6966696 displayCtrl 80085)ctrlSetText(format["CH: %1",
switch(currentChannel)do{
case 1:{"SIDE"};
case 2:{"COMMAND"};
case 3:{"GROUP"};
case 4:{"VEHICLE"};
case 5:{"NONE"};
case(ch6+5):{"SUPPORT"};
case(ch7+5):{"SUPPORT"};
case(ch8+5):{"SUPPORT"};
case(ch9+5):{"SPECTATOR"}}]);
titleText["<t size='2' shadow='2'>Press 'Esc' key to put away radio</t>","PLAIN",-1,true,true];titleFadeOut 5}else{closeDialog 90909}}