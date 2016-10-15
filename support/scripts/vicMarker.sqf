/*  ///////////////////////////////////// VicMarker v1 ////////////////////////////////////////
 ////////// Created by Fight9
 ///////// See below for marker and color class names
 //////// Usage: Use the following code in a vehicles INIT
 Exec with all default Parameters:
 null = [this, "Quad Victor 1", false, true, "b_support", "ColorWest", "b_maint", "ColorBlack", "hd_warning", "ColorRed"] execVM "vicMarker.sqf";
 
 Exec with the only required parameter:
 null = [this] execVM "vicMarker.sqf";
 
 Exec Array Parameters Explained:
 null = [this, "Display Name", Display Hints (true/false), display destroyed marker (true/false), "mobile marker type", "mobile marker color", "disabled marker type", "disabled marker color", "Destroyed marker type", "destroyed marker color"] execVM "vicMarker.sqf"; */
 
 /*Available Icons:
hd_objective, hd_flag, hd_arrow, hd_ambush, hd_destroy, hd_start, hd_end, hd_pickup, hd_join, hd_warning, hd_unknown, hd_dot, b_unknown, o_unknown, n_unknown, b_inf, o_inf, n_inf, b_motor_inf, o_motor_inf, n_motor_inf, b_mech_inf, o_mech_inf, n_mech_inf, b_armor, o_armor, n_armor, b_recon, o_recon, n_recon, b_air, o_air, n_air, b_plane, o_plane, n_plane, b_uav, o_uav, n_uav, b_naval, o_naval, n_naval, b_med, o_med, n_med, b_art, o_art, n_art, b_mortar, o_mortar, n_mortar, b_hq, o_hq, n_hq, b_support, o_support, n_support, b_maint, o_maint, n_maint, b_service, o_service, n_service, b_installation, o_installation, n_installation, u_installation, c_unknown, c_car, c_ship, c_air, c_plane, group_0, group_1, group_2, group_3, group_4, group_5, group_6, group_7, group_8, group_9, group_10, group_11, respawn_unknown, respawn_inf, respawn_motor, respawn_armor, respawn_air, respawn_plane, respawn_naval, flag_NATO, flag_CSAT, flag_AAF, flag_Altis, flag_AltisColonial, flag_FIA, flag_EU, flag_UN, flag_Belgium, flag_Canada, flag_Catalonia, flag_Croatia, flag_CzechRepublic, flag_Denmark, flag_France, flag_Georgia, flag_Germany, flag_Greece, flag_Hungary, flag_Iceland, flag_Italy, flag_Luxembourg, flag_Netherlands, flag_Norway, flag_Poland, flag_Portugal, flag_Slovakia, flag_Slovenia, flag_Spain, flag_UK, flag_USA
//////
Notes: group_1 through group_11 are Fire Team, Squad, Section, Platoon, Company, Battalion, Regiment, Brigade, Division, Corps, Army, and Army Group. Listed respectively. 
///////////////////////////////////////////////// */

/*Available Colors:
default, ColorBlack, ColorGrey, ColorRed, ColorBrown, ColorOrange, ColorYellow, ColorKhaki, ColorGreen, ColorBlue, ColorPink, ColorWhite, ColorBLUFOR, ColorOPFOR, ColorIndependent, ColorCivilian, ColorUnknown, Color1_FD_F, Color2_FD_F, Color3_FD_F, Color4_FD_F
//////
Notes: Color1_FD_F through Color4_FD_F are Firing Drill colors Red, Green, Orange, and Blue. Listed respectively.
//////////////////////////////////////////////// */
if (!isServer) exitWith {};
private ["_vehicle","_marker","_text"];
// Define variables
 	_vehicle = _this select 0; // Vehicle/Object
	_text = if (count _this > 1) then {_this select 1} else {format ["%1",_vehicle];}; // marker Text
	_displayHints = if (count _this > 2) then {_this select 2} else {false}; // Display Hints?
	_displayDestroyed = if (count _this > 3) then {_this select 3} else {true}; // Show Destroyed marker?	
	_markerType = if (count _this > 4) then {_this select 4} else {"b_support"}; // Mobile Marker type
	_markerColor = if (count _this > 5) then {_this select 5} else {"ColorWEST"}; // Mobile color
	_disabledMarker = if (count _this > 6) then {_this select 6} else {"b_maint"}; // Disabled Marker type
	_disabledColor = if (count _this > 7) then {_this select 7} else {"ColorBlack"}; // Disabled marker color
	_destroyedType = if (count _this > 8) then {_this select 8} else {"hd_destroy"}; // destrotyed marker type
	_destroyedColor = if (count _this > 9) then {_this select 9} else {"ColorRed"}; // destroyed color
	_marker = format ["%1",_vehicle]; // format vehicle name for marker name
	_hintFixed = FALSE; // set to false until after vehicle becomes disabled
	_hintDisabled = _displayHints; // Will hints be displayed, true or false?

// Create initial marker
	_markerstr = createMarker [_marker, position _vehicle]; // Create new Marker
	_markerstr setMarkerShape "ICON"; // Set Shape
// Loop marker placement	
while {(alive _vehicle)} do { // If victor is alive, loop script
	_marker setMarkerPos getPos _vehicle; // Set Marker Position to Object/Vehicle
//	hint format ["Marker %1 attached to vehicle %2", _marker, _vehicle]; //Debugging, continuous hint while alive
// Now determine if the vehicle can move		
		if (!canMove _vehicle) then { // if the vehicle cant move then
			_marker setMarkerType _disabledMarker; // set marker type
			_marker setMarkerColor _disabledColor; // Set color
			_marker setMarkerText format ["%1 Disabled",_text]; // Set Text
				if (_hintDisabled) then { // Display disabled hint?
					hint format ["%1 Has Been Disabled",_text]; // Hint vehicle disabled
					_hintDisabled = false; // set hinting to false to stop it from repeating
					_hintFixed = _displayHints; }; // set fixed hinting to variable
		} else  { // change marker back when fixed
			_marker setMarkerType _markerType; // Set Type
			_marker setMarkerColor _markerColor; // Set Color
			_marker setMarkerText format ["%1 Mobile",_text]; // Set Text
				if (_hintFixed) then { // Display disabled hint?
					hint format ["%1 Has Been Repaired",_text]; // Hint vehicle disabled
					_hintDisabled = _displayHints; // set disabled hinting back to variable
					_hintFixed = false; // set hinting to false to stop it from repeating
				}; // Close if hintFixed
		}; // close else
	sleep 3; // Timer for Marker/Loop Refresh 
	}; // close while
// Handle destroyed marker
if (_displayDestroyed) then { // Is the destroyed marker being displayed?
	_marker setMarkerType _destroyedType; // If so, set type
	_marker setMarkerColor _destroyedColor; // Set color
	_marker setMarkerText format ["%1 Destroyed",_text]; } else { // Set Text
	deleteMarker _marker; };// Delete marker if not displayed

if (_displayHints) then { // Display destruction hint?
	Hint format ["%1 Has Been Destroyed",_text];}; // Hint the destruction