if (!isServer) exitWith {};
_loc = _this select 0;
_num = Random 100;
_used = [];
_box = ["Box_NATO_Wps_F",
"Box_NATO_WpsLaunch_F",
"Box_NATO_WpsSpecial_F",
"B_supplyCrate_F",
"Box_NATO_Support_F",
"C_supplyCrate_F"];

_car = ["B_MRAP_01_F",
"B_MRAP_01_gmg_F",
"B_MRAP_01_hmg_F",
"B_Truck_01_transport_F",
"B_Truck_01_covered_F"];

_arm = ["B_APC_Wheeled_01_cannon_F",
"B_APC_Tracked_01_AA_F",
"B_APC_Tracked_01_rcws_F",
"B_APC_Tracked_01_CRV_F"];

_air = ["B_Heli_Light_01_F",
"B_Heli_Light_01_armed_F",
"B_Heli_Transport_01_F",
"B_Heli_Transport_01_camo_F"];
if (_num >= 90) then { _used =_air};
if (_num >= 75 AND _num < 90 ) then { _used =_arm};
if (_num >= 40 AND _num < 75 ) then { _used =_car};
if (_num < 40) then { _used =_box};

_made = (_used select floor random count _used) createVehicle (position _loc);
_marker = createMarker [format["%1%2",_made,_used], position _loc ];
_marker setMarkerColor "ColorWEST";
_marker setMarkerType "mil_unknown";


