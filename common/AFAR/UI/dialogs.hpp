class AFAR_UI {
idd=6966696;
movingEnable=0;
enableSimulation=1;
controlsBackground[]={}; 
objects[]={LRRadio};
class LRRadio {
idc=90909;
type=82;
model="\A3\ui_f\objects\radio.p3d";
scale=(0.235*0.675*(SafeZoneW Min SafeZoneH));
direction[]={0,10,1};
up[]={0,1,0};
inBack=0;
x=0.4*safezoneW+safezoneX;
y=0.58*safezoneH+safezoneY;
z=0.22;
xBack=0.4*safezoneW+safezoneX;
yBack=0.5*safezoneH+safezoneY;
zBack=0.22;
enableZoom=0;
zoomDuration=1;};
class controls {
class afar_txt: AFAR_txt {
idc=80085;
moving=0;
colorText[]={0,0,0,1};
text="";
x=0.33*safezoneW+safezoneX;
y=0.38*safezoneH+safezoneY;
w=0.13*safezoneW;
h=0.026*safezoneH;};
class afar_but2: AFAR_Button {
idc=60606;
moving=0;
x=0.34*safezoneW+safezoneX;
y=0.78*safezoneH+safezoneY;
w=0.015*safezoneW;
h=0.026*safezoneH;
tooltip="Previous Channel";
action="call PrevCH;";};
class afar_but3: AFAR_Button {
idc=60906;
moving=0;
x=0.371*safezoneW+safezoneX;
y=0.78*safezoneH+safezoneY;
w=0.015*safezoneW;
h=0.026*safezoneH;
tooltip="Next Channel";
action="call NextCH;";};
class afar_but4: AFAR_Button {
idc=60696;
moving=0;
x=0.34*safezoneW+safezoneX;
y=0.744*safezoneH+safezoneY;
w=0.015*safezoneW;
h=0.026*safezoneH;
tooltip="Options";
action="call r_Opt;";};
class afar_close: AFAR_Button {
idc=797979;
moving=0;
x=0.403*safezoneW+safezoneX;
y=0.744*safezoneH+safezoneY;
w=0.015*safezoneW;
h=0.026*safezoneH;
tooltip="Put radio away";
action="closeDialog 90909;";};};};