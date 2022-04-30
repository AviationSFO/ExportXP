# Export XP

## What is Export XP?

Export XP is a plugin for [FlyWithLua](https://github.com/X-Friese/FlyWithLua) that exports data taken from the [X-Plane 11](https://x-plane.com/) API and sends it to a log file for other programs to read. The difference between Export XP and other exporting plugins is that Export XP does not require network access as it writes to files on your disk. Unfortunately, this means that data from Export XP can not be used on a different system without writing your own script to export the data over network. The plugin is written in Lua X-Plane 11 built in API.

## How to use Export XP

Export XP exports its data when run to a log file in your FlyWithLua scripts directory called `ExportXP.txt`. You can write another program to retrieve the data from this file for however you like.

## Enabling the script

As of v0.2, by default ExportXP is disabled in FlyWithLua macro settings. To enable it, go to the plugins menu at the top of the screen, FlyWithLua, FlyWithLua Macros, and click ExportXP so that it has a white circle next to it.

### Format of the log file

```
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
"-!- FUEL DATA -!-
fuel weight (kgs),
```

# Installation

## Requirements

- X-Plane 11.50 or later
- [FlyWithLua NG](https://github.com/X-Friese/FlyWithLua)

## Download

### GitHub:

1. Download and install the pre-requisites listed in the requirments section above.
2. Go to the [GitHub repository](https://github.com/AviationSFO/ExportXP) and click on releases.
3. Click on the latest release.
4. Click on the `source code zip` download button.
5. Extract the contents of the zip file to your X-Plane root directory.
