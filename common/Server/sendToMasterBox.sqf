params ["_masterBox", "_masterZone"];
{
	if(!(isnil {_x getvariable "ResistVeh"})) then {
		[_masterBox,(_x call getContent), false] call setContent;
		if(_x isKindOf "ReammoBox_F" OR _x isKindOf "ReammoBox") then {
			deleteVehicle _x 
		} else {
			clearMagazineCargoGlobal _x;
			clearWeaponCargoGlobal  _x;
			clearItemCargoGlobal _x;
			clearBackpackCargoGlobal _x;
		};
	};
} forEach list _masterZone;



private _promoNames = [];
private _magLimit = 100;
private _masterContent = _masterBox call getContent; 
private _mags = (_masterContent select 1); 
private _magsAgg = createHashMap; 
{ 
  _magsAgg set [(_x select 0), 1 + (_magsAgg getOrDefault [(_x select 0), 0] )];  
} forEach _mags; 
private _magsFinal = []; 
{ 
 if(_y >= _magLimit) then { 
 	_magsFinal pushBack _x; 
	_masterBox addMagazineCargoGlobal [_x, -1 * _y]; 
	_promoNames pushBack (gettext (configfile >> "CfgMagazines" >> _x >> "displayName"));
 }; 
} forEach _magsAgg; 
[_masterBox, _magsFinal, true] call BIS_fnc_addVirtualMagazineCargo; 


hint format ["Arsernal Promotions: %1", _promoNames];
