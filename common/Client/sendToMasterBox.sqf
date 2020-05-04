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
