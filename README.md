# Export XP
<p align="center"> 
    <img src="https://img.shields.io/badge/ExportXP-beta-yellow"/>
    <br>
    <img src="https://img.shields.io/badge/X--Plane-11.50%2B-blue"/> <img src="https://img.shields.io/badge/X--Plane-12_EA%2B-blue"/> <img src="https://img.shields.io/badge/FlyWithLUA-2.7%2B-blue" /> <br>
</p>

## What is Export XP?

Export XP is a plugin for [FlyWithLua](https://github.com/X-Friese/FlyWithLua) that exports data taken from the [X-Plane 11 and 12 (EA)](https://x-plane.com/) API and sends it to a log file for other programs to read. The difference between Export XP and other exporting plugins is that Export XP does not require network access as it writes to files on your disk. Unfortunately, this means that data from Export XP can not be used on a different system without writing your own script to export the data over network. The plugin is written in Lua for X-Plane's built in API. 


Ready to install? Go to [the download section](#installation) and follow the instructions.

## How to use Export XP

Export XP exports its data when run to a log file in your X-Plane root directory called `ExportXP.txt`. You can write another program to retrieve the data from this file for however you like.

## Enabling the script

As of v0.2, by default ExportXP is disabled in FlyWithLua macro settings. To enable it, go to the plugins menu at the top of the screen, FlyWithLua, FlyWithLua Macros, and click ExportXP so that it has a white circle next to it.

### Format of the log file

```
-!- ACF -!- (aircraft ICAO) (tailnum)
-!- POSITION/FLIGHT MODEL DATA -!-
longitude,
latitude,
altitude (in meters),
heading (true),
groundspeed (meters/second),
vertical speed (fpm),
pitch (degrees),
bank (degrees (openGL)),
-!- ENGINE DATA -!-
engine 1 N1 (percent),
engine 2 N1 (percent),
engine 3 N1 (percent),
engine 4 N1 (percent),
engine 5 N1 (percent),
engine 6 N1 (percent),
engine 7 N1 (percent),
engine 8 N1 (percent),
-!- WEIGHT DATA -!-
fuel weight (kgs),
payload weight (kgs),
-!- MECHANICAL DATA -!-
landing gear 1 position (percent),
landing gear 2 position (percent),
landing gear 3 position (percent),
landing gear 4 position (percent),
landing gear 5 position (percent),
flaps 1 position (degrees),
flaps 2 position (degrees),
spoiler left deployment (degrees),
spoiler right deployment (degrees),
elevator left 1 position (degrees),
elevator left 2 position (degrees),
elevator right 1 position (degrees),
elevator right 2 position (degrees),
rudder 1 position (degrees),
rudder 2 position (degrees),
aileron 1 left position (degrees),
aileron 2 left position (degrees),
aileron 1 right position (degrees),
aileron 2 right position (degrees),
parkbrake position (percent),
-!- MILITARY SPECIFIC DATA -!-
tailhook position (percent),
canopy position (percent),
wing 1 sweep (degrees),
wing 2 sweep (degrees),
-!- TIME DATA -!-
time (seconds since midnight),
date (days since January 1),
```
* Extra notes
  * If alternate dataref source is on, then mechanichal data will all be percents instead of degrees.
  * To enable alternate datarefs, you need to reload all scripts in FlyWithLua after toggling the setting.



# Installation

## Requirements

- [X-Plane 11.50 and later or 12.00b1 Early Access and later](https://x-plane.com)
- [FlyWithLua NG](https://github.com/X-Friese/FlyWithLua)
  - Or [NG+](https://forums.x-plane.org/index.php?/files/file/82888-flywithlua-ng-next-generation-plus-edition-for-x-plane-12-win-lin-mac/) for X-Plane 12

## Download

### GitHub:

1. Download and install the pre-requisites listed in the [requirments section](#requirements) above.
2. Go to the [GitHub repository](https://github.com/AviationSFO/ExportXP) and click on releases.
3. Click on the latest release.
4. Click on the `ExportXP.lua` download button.
5. Drop the lua script into your FlyWithLua/Scripts folder.

### X-Plane.org:
Coming soon!

# Compatible Mods
* Coming soon
