private _seat=((assignedVehicleRole r_p in[["driver"],["Turret",[0]],["Turret",[0,0]]])&&{(objectParent r_p isKindOf"Air"&&!(objectParent r_p isKindOf"ParachuteBase"))});
_ch6=(ch6+5);_ch7=(ch7+5);_ch8=(ch8+5);_CH=currentChannel;
private _RTO=r_RTOBP findIf{backpack r_p isKindOf _x}>=0;
switch(true)do{
case(_CH==1):{switch(true)do{
		case(true in r_mCH&&_RTO):{
		switch(playerSide)do{
			case WEST:{if(channelEnabled _ch6 isEqualTo[false,false])then{ch6 radioChannelAdd[r_p]};_ch6 enableChannel r_mCH;setCurrentChannel _ch6};
			case EAST:{if(channelEnabled _ch7 isEqualTo[false,false])then{ch7 radioChannelAdd[r_p]};_ch7 enableChannel r_mCH;setCurrentChannel _ch7};
			case INDEPENDENT:{if(channelEnabled _ch8 isEqualTo[false,false])then{ch8 radioChannelAdd[r_p]};_ch8 enableChannel r_mCH;setCurrentChannel _ch8}}};
		case(true in r_mCH&&_seat):{
			switch(playerSide)do{
			case WEST:{if(channelEnabled _ch6 isEqualTo[false,false])then{ch6 radioChannelAdd[r_p]};_ch6 enableChannel r_mCH;setCurrentChannel _ch6};
			case EAST:{if(channelEnabled _ch7 isEqualTo[false,false])then{ch7 radioChannelAdd[r_p]};_ch7 enableChannel r_mCH;setCurrentChannel _ch7};
			case INDEPENDENT:{if(channelEnabled _ch8 isEqualTo[false,false])then{ch8 radioChannelAdd[r_p]};_ch8 enableChannel r_mCH;setCurrentChannel _ch8}}};
		case(true in r_vCH&&!isNull objectParent r_p):{4 enableChannel r_vCH;setCurrentChannel 4};
		case(true in r_grCH):{3 enableChannel r_grCH;setCurrentChannel 3};
		case(true in r_cCH&&leader group r_p==r_p):{2 enableChannel r_cCH;setCurrentChannel 2};
		default{setCurrentChannel 3}}};

case(_CH==2):{switch(true)do{
		case(true in r_sCH&&r_sideCH):{1 enableChannel r_sCH;setCurrentChannel 1};
		case(true in r_mCH&&_RTO):{
		switch(playerSide)do{
			case WEST:{if(channelEnabled _ch6 isEqualTo[false,false])then{ch6 radioChannelAdd[r_p]};_ch6 enableChannel r_mCH;setCurrentChannel _ch6};
			case EAST:{if(channelEnabled _ch7 isEqualTo[false,false])then{ch7 radioChannelAdd[r_p]};_ch7 enableChannel r_mCH;setCurrentChannel _ch7};
			case INDEPENDENT:{if(channelEnabled _ch8 isEqualTo[false,false])then{ch8 radioChannelAdd[r_p]};_ch8 enableChannel r_mCH;setCurrentChannel _ch8}}};
		case(true in r_mCH&&_seat):{
			switch(playerSide)do{
			case WEST:{if(channelEnabled _ch6 isEqualTo[false,false])then{ch6 radioChannelAdd[r_p]};_ch6 enableChannel r_mCH;setCurrentChannel _ch6};
			case EAST:{if(channelEnabled _ch7 isEqualTo[false,false])then{ch7 radioChannelAdd[r_p]};_ch7 enableChannel r_mCH;setCurrentChannel _ch7};
			case INDEPENDENT:{if(channelEnabled _ch8 isEqualTo[false,false])then{ch8 radioChannelAdd[r_p]};_ch8 enableChannel r_mCH;setCurrentChannel _ch8}}};
		case(true in r_vCH&&!isNull objectParent r_p):{4 enableChannel r_vCH;setCurrentChannel 4};
		case(true in r_grCH):{3 enableChannel r_grCH;setCurrentChannel 3};
		default{setCurrentChannel 3}}};

case(_CH==3):{switch(true)do{
		case(true in r_cCH&&leader group r_p==r_p):{2 enableChannel r_cCH;setCurrentChannel 2};
		case(true in r_sCH&&r_sideCH):{1 enableChannel r_sCH;setCurrentChannel 1};
		case(true in r_mCH&&_RTO):{
			switch(playerSide)do{
			case WEST:{if(channelEnabled _ch6 isEqualTo[false,false])then{ch6 radioChannelAdd[r_p]};_ch6 enableChannel r_mCH;setCurrentChannel _ch6};
			case EAST:{if(channelEnabled _ch7 isEqualTo[false,false])then{ch7 radioChannelAdd[r_p]};_ch7 enableChannel r_mCH;setCurrentChannel _ch7};
			case INDEPENDENT:{if(channelEnabled _ch8 isEqualTo[false,false])then{ch8 radioChannelAdd[r_p]};_ch8 enableChannel r_mCH;setCurrentChannel _ch8}}};
		case(true in r_mCH&&_seat):{
			switch(playerSide)do{
			case WEST:{if(channelEnabled _ch6 isEqualTo[false,false])then{ch6 radioChannelAdd[r_p]};_ch6 enableChannel r_mCH;setCurrentChannel _ch6};
			case EAST:{if(channelEnabled _ch7 isEqualTo[false,false])then{ch7 radioChannelAdd[r_p]};_ch7 enableChannel r_mCH;setCurrentChannel _ch7};
			case INDEPENDENT:{if(channelEnabled _ch8 isEqualTo[false,false])then{ch8 radioChannelAdd[r_p]};_ch8 enableChannel r_mCH;setCurrentChannel _ch8}}};
		case(true in r_vCH&&!isNull objectParent r_p):{4 enableChannel r_vCH;setCurrentChannel 4};
		default{setCurrentChannel 3}}};

case(_CH==4):{switch(true)do{
		case(true in r_grCH):{3 enableChannel r_grCH;setCurrentChannel 3};
		case(true in r_cCH&&leader group r_p==r_p):{2 enableChannel r_cCH;setCurrentChannel 2};
		case(true in r_sCH&&r_sideCH):{1 enableChannel r_sCH;setCurrentChannel 1};
		case(true in r_mCH&&_RTO):{
			switch(playerSide)do{
			case WEST:{if(channelEnabled _ch6 isEqualTo[false,false])then{ch6 radioChannelAdd[r_p]};_ch6 enableChannel r_mCH;setCurrentChannel _ch6};
			case EAST:{if(channelEnabled _ch7 isEqualTo[false,false])then{ch7 radioChannelAdd[r_p]};_ch7 enableChannel r_mCH;setCurrentChannel _ch7};
			case INDEPENDENT:{if(channelEnabled _ch8 isEqualTo[false,false])then{ch8 radioChannelAdd[r_p]};_ch8 enableChannel r_mCH;setCurrentChannel _ch8}}};
		case(true in r_mCH&&_seat):{
			switch(playerSide)do{
			case WEST:{if(channelEnabled _ch6 isEqualTo[false,false])then{ch6 radioChannelAdd[r_p]};_ch6 enableChannel r_mCH;setCurrentChannel _ch6};
			case EAST:{if(channelEnabled _ch7 isEqualTo[false,false])then{ch7 radioChannelAdd[r_p]};_ch7 enableChannel r_mCH;setCurrentChannel _ch7};
			case INDEPENDENT:{if(channelEnabled _ch8 isEqualTo[false,false])then{ch8 radioChannelAdd[r_p]};_ch8 enableChannel r_mCH;setCurrentChannel _ch8}}};
		default{setCurrentChannel 3}}};

case(_CH==5):{setCurrentChannel 3};

case(_CH in[_ch6,_ch7,_ch8]):{switch(true)do{
	case(true in r_vCH&&!isNull objectParent r_p):{4 enableChannel r_vCH;setCurrentChannel 4};
	case(true in r_grCH):{3 enableChannel r_grCH;setCurrentChannel 3};
	case(true in r_cCH&&leader group r_p==r_p):{2 enableChannel r_cCH;setCurrentChannel 2};
	case(true in r_sCH&&r_sideCH):{1 enableChannel r_sCH;setCurrentChannel 1};
	default{setCurrentChannel 3}}}
};
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