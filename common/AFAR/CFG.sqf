/*	VERSION: 0.94b
	AUTHOR: Phronk
	CONTRIBUTIONS:
		1. DirtySanchez reorganized AFAR and improved security
		2. Metalman10 [EXP] optimized initialization of functions

	TESTERS:
		1. BadBenson
		2. Chaser
		3. Genesis92x
		4. Kargi8499
		5. Limey
		6. MorpheousMike
		7. Moser
		8. PRYMSUSPEC
		9. TASK FORCE RONIN

*///CONFIGURATIONS:
//CHANNEL PERMISSIONS		~		[TEXT,VOIP]	~ 						!!!Use all lower-case letters!!!
r_sideCH=false;//Enable Side Channel										>> Default: false
r_sCH=[true,true];//Side Channel ~ Chat/Voice  						>> Default: [true,true]
r_cCH=[true,true];//Command Channel ~ Chat/Voice  				>> Default: [true,true]
r_grCH=[false,true];//Group Channel ~ Chat/Voice					>> Default: [false,true]
r_vCH=[true,true];//Vehicle Channel ~ Chat/Voice					>> Default: [true,true]
r_dCH=[false,true];//Direct Channel ~ Chat/Voice						>> Default: [false,true]
r_mCH=[false,true];//Air Channel ~ Chat/Voice  						>> Default: [false,true]
r_mCHName="Air channel";//Name of the custom channel		>> Default: "Air Channel"
r_mCHShort="(Air)";//Shown by player name in Air channel	>> Default: "(Air)"
r_RTOBP=[];//Add to list of backpacks RTO checks for				>> Default: []

r_alertOn=true;//Talking alerts nearby enemies						>> Default: true
r_chOn=false;//Toggle channel switching keybinds					>> Default: true

//DEFAULT COSMETICS
r_3DR=true;//3D radio pop-up when talking								>> Default: true
r_Anim=true;//Animation when talking										>> Default: true
r_chat=true;//Hides chat UI if false												>> Default: true