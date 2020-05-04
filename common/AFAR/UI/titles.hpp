class LRRadio1 {
idd=-1;
movingEnable=1;
enableSimulation=1;
controlsBackground[]={};
objects[]={LRR3D};
enableDisplay=1;
duration=99999;
fadein=0; fadeout=0;
name="LRRadio1";

class LRR3D {
idc=2320;
type=82;
model="\A3\ui_f\objects\radio.p3d";
scale=(0.215*0.655*(SafeZoneW Min SafeZoneH));
direction[]={-.5,10,1};
up[]={0,1,0};
inBack=0;
x=0.3*safezoneW+safezoneX;	y=1.1*safezoneH+safezoneY;
z=0.22;
xBack=0.4*safezoneW+safezoneX;	yBack=0.5*safezoneH+safezoneY;
zBack=0.22;
enableZoom=0;
zoomDuration=1;
};};