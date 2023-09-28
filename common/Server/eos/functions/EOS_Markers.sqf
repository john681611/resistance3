_eosMarkers=server getvariable "EOSmarkers";

{
	_x setMarkerAlpha (markerAlpha _x);
	_x setMarkerColor (getMarkerColor _x);
}forEach _eosMarkers;