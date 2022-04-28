-- ExportXP is a lightweight FlyWithLua script for X-Plane 11 that 
-- exports main flight model characteristics out over a file 
-- to be used by other programs
-- Author: Steven Weinstein (AviationSFO)
-- Tested X-Plane and FWL versions: 11.55r2, 2.7.32

local data = {}

-- this function retrieves the current aircraft's data and stores it in a table
-- from X-Plane's API for use elsewhere
function getData(data)
    -- get the data from the flight model
    dataref("lat", "sim/flightmodel/position/latitude")
    dataref("lon", "sim/flightmodel/position/longitude")
    dataref("alt", "sim/flightmodel/position/elevation")
    dataref("hdg", "sim/flightmodel/position/true_psi")
    dataref("gs", "sim/flightmodel/position/groundspeed")
    dataref("vs", "sim/flightmodel/position/vh_ind_fpm")
    dataref("pitch", "sim/flightmodel/position/true_theta")
    dataref("roll", "sim/flightmodel/position/phi")
    -- Applying to data array
    data.lat = lat
    data.lon = lon
    data.alt = alt
    data.hdg = hdg
    data.gs = gs
    data.vs = vs
    data.pitch = pitch
    data.roll = roll
    return data
end

-- this function exports data to output file
function exportData(data)
    -- export the data to a file
    -- clearing file
    local file = io.open("ExportXP.txt", "w")
    file:write("")
    file:close()
    -- adding data
    file = io.open("ExportXP.txt", "a")
    file:write(data.lat, ",\n")
    file:write(data.lon, ",\n")
    file:write(data.alt, ",\n")
    file:write(data.hdg, ",\n")
    file:write(data.gs, ",\n")
    file:write(data.vs, ",\n")
    file:write(data.pitch, ",\n")
    file:write(data.roll, ",\n")
    file:close()
end

function main()
    data = {}
    data = getData(data)
    exportData(data)
end

doEveryDraw("main()")
