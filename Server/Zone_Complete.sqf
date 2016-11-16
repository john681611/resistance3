if (isServer) then {
_found = false;
    {
        if (getMarkerColor _x == "colorRed") then {_found = true;};
    } forEach ztownAll;
    if (!_found) then {
      profilenamespace setvariable ["Resist_LR_Number",-1, false];
      [["Win",true,5],"BIS_fnc_endMission"] call BIS_fnc_MP;
    };
};
