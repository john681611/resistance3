if(r_p call r_RC)then{
params["_u"];
_n=name _u;
_f="Land_HelipadEmpty_F"createVehicleLocal[0,0,0];r_f pushBack[_n,_f];
playSound"in0";
_s=sunOrMoon;_w=overcast;_r=rain;_inc="INCAPACITATED";
switch(true)do{
case(_w>=0&&_w<25):{while{!isNull _f&&alive _u&&lifeState _u!=_inc}do{if(_s==1)then{_f say2D"r_f0"};_r call r_snd;_f say2D"fuz1";sleep 5}};
case(_w>=25&&_w<45):{while{!isNull _f&&alive _u&&lifeState _u!=_inc}do{if(_s==1)then{_f say2D"r_f1"};_r call r_snd;_f say2D"fuz2";sleep 5}};
case(_w>=45&&_w<65):{while{!isNull _f&&alive _u&&lifeState _u!=_inc}do{if(_s==1)then{_f say2D"r_f2"};_r call r_snd;_f say2D"fuz3";sleep 5}};
case(_w>=65&&_w<85):{while{!isNull _f&&alive _u&&lifeState _u!=_inc}do{if(_s==1)then{_f say2D"r_f3"};_r call r_snd;_f say2D"fuz4";sleep 5}};
case(_w>=85&&_w<100):{while{!isNull _f&&alive _u&&lifeState _u!=_inc}do{if(_s==1)then{_f say2D"r_f4"};_r call r_snd;_f say2D"fuz5";sleep 5}};
case(_w==100):{while{!isNull _f&&alive _u&&lifeState _u!=_inc}do{if(_s==1)then{_f say2D"r_f5"};_r call r_snd;_f say2D"fuz6";sleep 5}}}};