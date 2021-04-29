//    VAS EARPLUGS v2.0   //
//scripts\VAS\Earplugs.sqf//
//      MykeyRM [AW]      //
////////////////////////////

sleep 10;

private _PlugsTakenHint  = "<t color='#ff9d00' size='1.3' shadow='1' shadowColor='#000000' align='center'>*** Earplugs received ***  </t>";   //Item taken hint.
private _howtoHint = "<t  size='1' shadow='1' shadowColor='#000000' align='center'>   [Pause/Break] key to Insert and Remove </t>";          //Instructions hint.
  
 //hint parseText (_PlugsTakenHint + _howtoHint);
[parseText format ["<br />%1<br />%2", _PlugsTakenHint, _howtoHint], true, nil, 10, 1, 0.3] spawn BIS_fnc_textTiles;

toggle_earplugs = {
    if (isNil "PlugsIN") then {PlugsIN = 2};
        switch (PlugsIN) do {
            case 1: {
                PlugsIN = 2;
                2 fadeSound 1;
                [parseText format ["<br/><t size='1.6' font='PuristaBold' align='center'>*** earplugs removed *** </t>"], true, [10,5], 2, 0.5, 0.3] spawn BIS_fnc_textTiles;
            };
            case 2: {
                PlugsIN = 1;
                2 fadeSound 0.2;
                [parseText format ["<br/><t size='1.6' font='PuristaBold' align='center'>*** earplugs fitted *** </t>"], true, [10,5], 2, 0.5, 0.3] spawn BIS_fnc_textTiles;
            };
        };
};



(findDisplay 46) displayAddEventHandler ["KeyDown", {
    if (_this select 1 == 197) then { //pause break key
        call toggle_earplugs;
    };
}];