"respawn_west" setMarkerPos (getmarkerpos((_this select 0)+"_RSP"));
"respawn_vehicle_west" setMarkerPos [getmarkerpos "respawn_west" select 0,(getmarkerpos "respawn_west" select 1)-15,0];

FLG setPos [getmarkerpos "respawn_west" select 0,(getmarkerpos "respawn_west" select 1)-4,0];

B_All setpos (getmarkerpos "respawn_west");
B_All setPos [getPos B_All select 0, getPos B_All select 1,0];

COVER attachto [B_All,[0,0,0]];
detach COVER;
COVER setPos [getPos COVER select 0, getPos COVER select 1,0];

TENT1 attachto [B_All,[-8,-1,0]];
detach TENT1;
TENT1 setdir 180;
TENT1 setPos [getPos TENT1 select 0, getPos TENT1 select 1,0];

TENT2 attachto [B_All,[-8,-5,0]];
detach TENT2;
TENT2 setdir 90;
TENT2 setPos [getPos TENT2 select 0, getPos TENT2 select 1,0];

lB attachto [B_All,[8,-3,0]];
detach lB;
lB setdir 180;
lB setPos [getPos lB select 0, getPos lB select 1,0];

lB_1 attachto [B_All,[8,-1.5,0]];
detach lB_1;
lB_1 setdir 180;
lB_1 setPos [getPos lB_1 select 0, getPos lB_1 select 1,0];

lB_2 attachto [B_All,[8,0,0]];
detach lB_2;
lB_2 setdir 180;
lB_2 setPos [getPos lB_2 select 0, getPos lB_2 select 1,0];

lB_3 attachto [B_All,[8,1.5,0]];
detach lB_3;
lB_3 setdir 180;
lB_3 setPos [getPos lB_3 select 0, getPos lB_3 select 1,0];


Fire1 attachto [B_All,[6,-4,0]];
detach Fire1;
Fire1 setPos [getPos Fire1 select 0, getPos Fire1 select 1,0];

Fire2 attachto [B_All,[6,-2,0]];
detach Fire2;
Fire2 setdir -45;
Fire2 setPos [getPos Fire2 select 0, getPos Fire2 select 1,0];

Build_1 attachto [B_All,[1,5,0]];
detach Build_1;
Build_1 setPos [getPos Build_1 select 0, getPos Build_1 select 1,0];

GT setPos (getPos B_All);
GT2 setPos (getPos Fire1);

C1 setPos [(getmarkerpos "respawn_vehicle_west" select 0)+3,getmarkerpos "respawn_vehicle_west" select 1,0];
C2 setPos [(getmarkerpos "respawn_vehicle_west" select 0)-3,getmarkerpos "respawn_vehicle_west" select 1,0];
B_ALL2 setPos [(getpos Build_1 select 0)-2.8,(getpos Build_1 select 1)+1.5,0];

//create camp triggers

{
if (_x != (_this select 0)) then {
_trg = createTrigger ["EmptyDetector", getmarkerpos format ["%1_RSP",_x]];
_trg setTriggerArea [1000, 1000, 0, false];
_trg setTriggerActivation ["WEST", "PRESENT", false];
_trg setTriggerStatements ["this", format["['%1_RSP'] execVM 'Server\CreateCamp.sqf'; ",_x],""];
};
} foreach (_this select 1);

