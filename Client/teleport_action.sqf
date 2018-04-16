_act = _this addAction ["Teleport","Client\teleport.sqf", nil, 1.5, true, true, '', "alive _target && speed _target < 3", 10];
_this setUserActionText [_act,"Teleport","<img size='2' image='Server\Images\Teleport.paa'/>"];
