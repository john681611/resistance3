//Control
#define CT_STATIC		0					0x00
#define CT_BUTTON		1
#define CT_OBJECT_CONTAINER		82
//Style
#define ST_SINGLE		0					0x00

class AFAR_Button {
access=0;
type=CT_BUTTON;
text="";
colorText[]={1,1,1,.9};
colorDisabled[]={0,0,0,0};
colorBackground[]={0,0,0,0};
colorBackgroundDisabled[]={0,0,0};
colorBackgroundActive[]={0,0,0,0};
colorFocused[]={0,0,0,0};
colorShadow[]={0,0,0,0};
colorBorder[]={0,0,0,0};
soundEnter[]={"",0,1};
soundPush[]={"",0,1};
soundClick[]={"\A3\Sounds_F\weapons\Other\sfx1.wss",.3,.8};
soundEscape[]={"",0.09,1};
style=2;
x=0;
y=0;
w=0.055589;
h=0.039216;
shadow=0;
font="PuristaLight";
sizeEx=0.03921;
offsetX=0.003;
offsetY=0.003;
offsetPressedX=0.002;
offsetPressedY=0.002;
borderSize=0;};

class AFAR_txt {
access=0;
type=CT_STATIC;
idc=80085;
style=ST_SINGLE;
w=0.09*safezoneW;
h=0.05*safezoneH;
font="LucidaConsoleB";
sizeEx=0.04;
colorBackground[]={0,0,0,0};
colorText[]={1,1,1,1};
text="";
fixedWidth=0;
shadow=0;};