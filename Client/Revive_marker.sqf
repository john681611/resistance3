///////////////////////////////////////////////////////////////////////////////////////////////////
// BOHEMIA REVIVE ICON MARKER MOD
// MADE BY MOERDERHOSCHI
// 08.2016
///////////////////////////////////////////////////////////////////////////////////////////////////
0 = [] spawn
{
    if (isDedicated) exitWith {};
    waitUntil {sleep 1; !(isNull player)};
    waitUntil {sleep 1; player == player};

    ///////////////////////////////////////////////////////////////////////////////////////////////////
    // DIARYRECORD
    ///////////////////////////////////////////////////////////////////////////////////////////////////
    _diary =
    {
        if (isNull player) exitWith {false};
        if(!(player diarySubjectExists "mdhBRIM")) then
        {
            player createDiarySubject ["mdhBRIM","BRIM Mod"];
            player createDiaryRecord
            [
                "mdhBRIM",
                [
                    "Bohemia Revive Icon Marker",
                    (
                        '<br/>Bohemia Revive Icon Marker is a mod, created by Moerderhoschi for Arma III, to add an icon and Mapmarker to unconscious players. '
                      + 'If you have any question you can contact me at the official Bohemia Interactive Forum: forums.bistudio.com<br/>'
                      + '<br/>'
                      + '<img image="a3\ui_f\data\revive\medikit_ca.paa"/>'
                      + '<br/>'
                      + '<br/>'
                      + 'Credits and Thanks:<br/>'
                      + 'Xeno - sharing his code and knowledge to realize this addon<br/>'
                      + 'Armed-Assault.de Crew - For many great ArmA moments in many years<br/>'
                      + 'BIS - For ArmA3<br/>'
                    )
                ]
            ]
        };
        true
    };

    ///////////////////////////////////////////////////////
    // addMissionEventHandler
    ///////////////////////////////////////////////////////
    addMissionEventHandler
    [
        "Draw3D",
        {
            {
                _mdhBRIMalreadySet = (_x getVariable ["mdhBRIMset",false]);
                _side = (_x getVariable ["mdhBRIMside",east]);
                if ( _mdhBRIMalreadySet && {alive _x} && {side player getFriend _side > 0.5} && {(lifeState _x) == "INCAPACITATED"} ) then
                {
                    _dist = player distance _x;
                    if (_dist < 200) then
                    {
                        _pos = getPosATLVisual _x;
                        _pos set [2, (_pos select 2) + 1 + (_dist * 0.05)];
                        drawIcon3D ["a3\ui_f\data\revive\medikit_ca.paa", [1,0,0,1 - (_dist / 200)], _pos, 1, 1, 0, "(Uncon) " + name _x, 1, 0.032 - (_dist / 9000), "RobotoCondensed"];
                    }
                }
            } forEach allPlayers;
        }
    ];

    ///////////////////////////////////////////////////////
    // loop
    ///////////////////////////////////////////////////////
    sleep 1;

    _markers = [];
    while {true} do
    {
        // diary stuff
        0 = _diary spawn
        {
            waitUntil {!(isNull player)};
            waitUntil {player==player};
            0 = [] call _this;
        };

        {deleteMarkerLocal _x} forEach _markers;
        {
            _mdhBRIMalreadySet = (_x getVariable ["mdhBRIMset",false]);
            if (!_mdhBRIMalreadySet) then
            {
                if ( _x != player && {alive _x} && {!((lifeState _x) == "INCAPACITATED")} ) then
                {
                    _x setVariable ["mdhBRIMset",true];
                    _x setVariable ["mdhBRIMside",(side _x)];
                };
            }
            else
            {
                _side = (_x getVariable ["mdhBRIMside",east]);
                if (side player getFriend _side > 0.5 && {alive _x} && {(lifeState _x) == "INCAPACITATED"}) then
                {
                    _marker = createMarkerLocal ["mdhBRIMmarker_" + format["%1",_forEachIndex], position _x];
                    _markers pushBack _marker;
                    _marker setMarkerShapeLocal "ICON";
                    _marker setMarkerTypeLocal "hd_dot";
                    _marker setMarkerTextLocal ("(Uncon) " + name _x);
                    _marker setMarkerColorLocal "ColorBLUE";
                };
            };
        } forEach allPlayers;

        sleep (5 + random 1);
    };
};
