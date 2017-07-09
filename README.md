# Resistance 3
![](http://i.imgur.com/Nqf157M.png)

## What is it?
A persistent Capture the island Pub sever mission for Arma 3

## Why would I like it
Like being a armed hobo like in those survival games? Do you also like team play and fighting a whole island of well armed troops?
Then this may be for your chance to go from poorly armed resistance group to a disturbingly well armed load of hobos taking back Malden from the CSAT and AAF.

## What you need?
Just arma 3
Though if you want there is support for Task force Arrowhead Radio (TFAR)

## Server Admin stuff
This mission as current is persistant mission so its best to set the server up to run persistantly:
See [BIS WIki](https://community.bistudio.com/wiki/server.cfg) for info.

Once all zones are taken the mission ends the next time you start the mission you will have a clean mission.

### Force New game
A new game can be forced in the mission start by setting the new game parameter
I reccomend doing this after a major update where the saving format may have changed.

### How the game is saved
The game has one main server save saved to the server profile. This contains:
* Master Game ID
* Completed Locations
* Vehicle / Box Saves
  * Content.

There are two player local saves. Their storage box and their loadout.

### Potential issues
At the moment the server saves using a generic name not unique to the server. This means players will loose their data if they play on a different server. A fix for this is planned.

## Where Can I find more information
The boards by the plag in mission will give you some critical information.
Otherwise the main form is here [Wiki](https://github.com/john681611/co_36_resistance3.Altis/wiki)
