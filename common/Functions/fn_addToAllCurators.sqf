/*
author: stanhope, AW community member.
description: Adds given param as an editable object to all curators
*/

if (!isServer) exitWith {
    _this remoteExec ["RES_fnc_addToAllCurators", 2];
};

params ["_toAdd"];
    
{_x addCuratorEditableObjects [_toAdd, true];} forEach allCurators;