// Anytime a city is captured, check to see if the others have been captured

if (isServer) then {
_city1Cleared = [["Taskcity1","succeeded"] call SHK_Taskmaster_hasState];
	switch (_city1Cleared) do {
		case (true):
			{PAPABEAR SideChat "Kavala is under our control.";}
		case (false):
			{PAPABEAR SideChat "We still need to capture Kavala";}
sleep 2;
_city2Cleared = [["Taskcity2","succeeded"] call SHK_Taskmaster_hasState];
	switch (_city2Cleared) do {
		case (true):
			{PAPABEAR SideChat "Athira is under our control.";}
		case (false):
			{PAPABEAR SideChat "We still need to capture Athira";}
sleep 2;
_city3Cleared = [["Taskcity3","succeeded"] call SHK_Taskmaster_hasState];
	switch (_city3Cleared) do {
		case (true):
			{PAPABEAR SideChat "Pyrgos is under our control.";}
		case (false):
			{PAPABEAR SideChat "We still need to capture Pyrgos";}
sleep 2;
_airfield1Cleared = [["Taskairfield1","succeeded"] call SHK_Taskmaster_hasState];
	switch (_airfield1Cleared) do {
		case (true):
			{PAPABEAR SideChat "We control Molos Airfield.";}
		case (false):
			{PAPABEAR SideChat "We still need to capture Molos Airfield.";}
sleep 2;
_airfield2Cleared = [["Taskairfield2","succeeded"] call SHK_Taskmaster_hasState];
	switch (_airfield2Cleared) do {
		case (true):
			{PAPABEAR SideChat "We control Almyra Airfield.";}
		case (false):
			{PAPABEAR SideChat "We still need to capture the Almyra Airfield.";}
sleep 2;
_airfield3Cleared = [["Taskairfield3","succeeded"] call SHK_Taskmaster_hasState];
	switch (_airfield3Cleared) do {
		case (true):
			{PAPABEAR SideChat "We control Airbase Airfield.";}
		case (false):
			{PAPABEAR SideChat "We still need to capture the Airbase Airfield.";}
sleep 2;
_airfield4Cleared = [["Taskairfield4","succeeded"] call SHK_Taskmaster_hasState];
	switch (_airfield4Cleared) do {
		case (true):
			{PAPABEAR SideChat "We control Southeast Airfield.";}
		case (false):
			{PAPABEAR SideChat "We still need to capture the Southeast Airfield.";}
sleep 2;
_airfield5Cleared = [["Taskairfield5","succeeded"] call SHK_Taskmaster_hasState];
	switch (_airfield5Cleared) do {
		case (true):
			{PAPABEAR SideChat "We control AAC Airfield.";}
		case (false):
			{PAPABEAR SideChat "We still need to capture the AAC Airfield.";}
sleep 2;
_airfield6Cleared = [["Taskairfield6","succeeded"] call SHK_Taskmaster_hasState];
	switch (_airfield6Cleared) do {
		case (true):
			{PAPABEAR SideChat "We control Northwest Airfield.";}
		case (false):
			{PAPABEAR SideChat "We still need to capture the Northwest Airfield.";}
sleep 2;
_finalObj = if (_city1Cleared == true && _city2Cleared == true && _city3Cleared == true && _airfield1Cleared == true && _airfield2Cleared == true && _airfield3Cleared == true && _airfield4Cleared == true && _airfield5Cleared == true && _airfield6Cleared == true)
then {call Kinch_finalMission} else {PAPABEAR SideChat "Capture the remaining objectives.";};