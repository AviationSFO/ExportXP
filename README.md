# Export XP
<p align="center"> 
    <br>
    <img src="https://img.shields.io/badge/X--Plane-11.50%2B-blue"/> <img src="https://img.shields.io/badge/FlyWithLUA-2.7%2B-blue" /> <br>
</p>

## What is Export XP?

Export XP is a plugin for [FlyWithLua](https://github.com/X-Friese/FlyWithLua) that exports data taken from the [X-Plane 11](https://x-plane.com/) API and sends it to a log file for other programs to read. The difference between Export XP and other exporting plugins is that Export XP does not require network access as it writes to files on your disk. Unfortunately, this means that data from Export XP can not be used on a different system without writing your own script to export the data over network. The plugin is written in Lua X-Plane 11 built in API.

## How to use Export XP

Export XP exports its data when run to a log file in your X-Plane root directory called `ExportXP.txt`. You can write another program to retrieve the data from this file for however you like.

## Enabling the script

As of v0.2, by default ExportXP is disabled in FlyWithLua macro settings. To enable it, go to the plugins menu at the top of the screen, FlyWithLua, FlyWithLua Macros, and click ExportXP so that it has a white circle next to it.

### Format of the log file

```
(aircraft ICAO) (tailnum)
-!- POSITION/FLIGHT MODEL DATA -!-
longitude,
latitude,
altitude (in meters),
heading (true),
groundspeed (meters/second),
vertical speed (fpm),
pitch (degrees),
bank (degrees),
-!- ENGINE DATA -!-
engine 1 N1 (percent),
engine 2 N1 (percent),
engine 3 N2 (percent),
engine 4 N2 (percent),
-!- WEIGHT DATA -!-
fuel weight (kgs),
payload weight (kgs),
-!- MECHANICAL DATA -!-
landing gear position (percent),
flaps 1 position (degrees),
flaps 2 position (degrees),
spoiler deployment (degrees),
elevator 1 position (degrees),
elevator 2 position (degrees),
rudder 1 position (degrees),
rudder 2 position (degrees),
aileron 1 position (degrees),
aileron 2 position (degrees),
```
~Extra note: If alternate dataref source is on, then mechanichal data will all be percents instead of degrees.~ (Currently disabled)

# Installation

## Requirements

- X-Plane 11.50 or later
- [FlyWithLua NG](https://github.com/X-Friese/FlyWithLua)

## Download

### GitHub:

1. Download and install the pre-requisites listed in the requirments section above.
2. Go to the [GitHub repository](https://github.com/AviationSFO/ExportXP) and click on releases.
3. Click on the latest release.
4. Click on the `ExportXP.lua` download button.
5. Drop the lua script into your FlyWithLua/Scripts folder.
