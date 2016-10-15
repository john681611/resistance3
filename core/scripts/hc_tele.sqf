waitUntil {!isNull HC};

_pos = getmarkerpos "solitude";

[] spawn {
  while {not isnull HC} do {HC setpos getmarkerpos "solitude"; sleep 5;};
};