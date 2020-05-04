if(r_p call r_RC)then{
params["_u"];
_n=name _u;
_f="Land_HelipadEmpty_F"createVehicleLocal[0,0,0];r_f pushBack[_n,_f];
playSound"in1";
_s=sunOrMoon;_w=overcast;_r=rain;_inc="INCAPACITATED";
switch(true)do{
case(_w==0):{while{!isNull _f&&alive _u&&lifeState _u!=_inc}do{if(_s==1)then{_f say2D"r_f0"};_f say2D"fuz0";sleep 5}};
case(_w>0&&{_w<20}):{while{!isNull _f&&alive _u&&lifeState _u!=_inc}do{if(_s==1)then{_f say2D"r_f0"};_r call r_snd;_f say2D"fuz1";sleep 5}};
case(_w>=20&&{_w<30}):{while{!isNull _f&&alive _u&&lifeState _u!=_inc}do{if(_s==1)then{_f say2D"r_f1"};_r call r_snd;_f say2D"fuz2";sleep 5}};
case(_w>=30&&{_w<40}):{while{!isNull _f&&alive _u&&lifeState _u!=_inc}do{if(_s==1)then{_f say2D"r_f2"};_r call r_snd;_f say2D"fuz3";sleep 5}};
case(_w>=40&&{_w<50}):{while{!isNull _f&&alive _u&&lifeState _u!=_inc}do{if(_s==1)then{_f say2D"r_f3"};_r call r_snd;_f say2D"fuz4";sleep 5}};
case(_w>=50&&{_w<60}):{while{!isNull _f&&alive _u&&lifeState _u!=_inc}do{if(_s==1)then{_f say2D"r_f4"};_r call r_snd;_f say2D"fuz5";sleep 5}};
case(_w>=60&&{_w<70}):{while{!isNull _f&&alive _u&&lifeState _u!=_inc}do{if(_s==1)then{_f say2D"r_f5"};_r call r_snd;_f say2D"fuz6";sleep 5}};
case(_w>=70&&{_w<80}):{while{!isNull _f&&alive _u&&lifeState _u!=_inc}do{if(_s==1)then{_f say2D"r_f6"};_r call r_snd;_f say2D"fuz7";sleep 5}};
case(_w>=80&&{_w<90}):{while{!isNull _f&&alive _u&&lifeState _u!=_inc}do{if(_s==1)then{_f say2D"r_f7"};_r call r_snd;_f say2D"fuz8";sleep 5}};
case(_w>=90&&{_w<100}):{while{!isNull _f&&alive _u&&lifeState _u!=_inc}do{if(_s==1)then{_f say2D"r_f8"};_r call r_snd;_f say2D"fuz9";sleep 5}};
case(_w==100):{while{!isNull _f&&alive _u&&lifeState _u!=_inc}do{if(_s==1)then{_f say2D"r_f9"};_r call r_snd;_f say2D"fuz9";sleep 5}}
}};