while {true} do
{
	30 setOvercast 0; 
	30 setRain 0; 
	30 setFog 0;
	setHumidity 0.5;
	forceWeatherChange;
	sleep 360;
};