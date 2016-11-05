
_save = [];
_found = false;
    {
        if (getMarkerColor _x == "colorGreen") then {
					_save append (getMarkerPos _x);
				};
    } forEach ztownAll;
_save
