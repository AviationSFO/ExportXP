-- ExportXP is a lightweight FlyWithLua script for X-Plane 11 that 
-- exports main flight model characteristics out over a file 
-- to be used by other programs
-- Author: Steven Weinstein (AviationSFO)
-- Tested X-Plane and FWL versions: 11.55r2, 2.7.32

data = {}

-- Adding toggle macro
active = false
-- altdr = false
add_macro("Toggle ExportXP", "active = true", "active = false", "deactivate")
-- add_macro("ExportXP - Alternate Dataref Source", "altdr = true", "altdr = false", "deactivate")

-- this function retrieves the current aircraft's data and stores it in a table
-- from X-Plane's API for later export
function getData()
    -- get the data from the flight model
    dataref("acf_type", "sim/aircraft/view/acf_ICAO")
    dataref("acf_name", "sim/aircraft/view/acf_tailnum")

    dataref("lat", "sim/flightmodel/position/latitude", "readonly")
    dataref("lon", "sim/flightmodel/position/longitude", "readonly")
    dataref("alt", "sim/flightmodel/position/elevation", "readonly")
    dataref("hdg", "sim/flightmodel/position/true_psi", "readonly")
    dataref("gs", "sim/flightmodel/position/groundspeed", "readonly")
    dataref("vs", "sim/flightmodel/position/vh_ind_fpm", "readonly")
    dataref("pitch", "sim/flightmodel/position/true_theta", "readonly")
    dataref("roll", "sim/flightmodel/position/phi", "readonly")

    dataref("eng1_rpm", "sim/flightmodel/engine/ENGN_N1_", 0, "readonly")
    dataref("eng2_rpm", "sim/flightmodel/engine/ENGN_N1_", 1, "readonly")

    dataref("fuel_wgt", "sim/flightmodel/weight/m_fuel_total", "readonly")
    dataref("payload_wgt", "sim/flightmodel/weight/m_fixed", "readonly")
    
    dataref("gear1", "sim/flightmodel/movingparts/gear1def", "readonly")
    if (altdr ~= true) then
        dataref("flap1_pos", "sim/flightmodel/controls/fla1_def", 0, "readonly")
        dataref("flap2_pos", "sim/flightmodel/controls/fla2_def", 0, "readonly")
        dataref("spoiler", "sim/flightmodel/controls/splr_def", "readonly")
        dataref("elv1", "sim/flightmodel/controls/elv1_def", 0, "readonly")
        dataref("elv2", "sim/flightmodel/controls/elv2_def", 0, "readonly")
        dataref("rudd1", "sim/flightmodel/controls/rudd_def", 0, "readonly")
        dataref("rudd2", "sim/flightmodel/controls/rudd2_def", 0, "readonly")
        dataref("ail1", "sim/flightmodel/controls/lail1def", "readonly")
        dataref("ail2", "sim/flightmodel/controls/rail1def", "readonly")
    end


    -- Applying to data array
    data.lat = lat
    data.lon = lon
    data.alt = alt
    data.hdg = hdg
    data.gs = gs
    data.vs = vs
    data.pitch = pitch
    data.roll = roll
    data.eng1_rpm = eng1_rpm
    data.eng2_rpm = eng2_rpm
    data.fuel_wgt = fuel_wgt
    data.payload_wgt = payload_wgt
    data.gear1 = gear1
    data.flap1_pos = flap1_pos
    data.flap2_pos = flap2_pos
    data.spoiler = spoiler
    data.elv1 = elv1
    data.elv2 = elv2
    data.rudd1 = rudd1
    data.rudd2 = rudd2
    data.ail1 = ail1
    data.ail2 = ail2

    data.acf_type = acf_type
    data.acf_name = acf_name
end

-- this function exports data to output file
function exportData()
    -- export the data to a file
    -- clearing file
    local file = io.open("ExportXP.txt", "w")
    file:write("")
    file:close()
    -- adding data
    file = io.open("ExportXP.txt", "a")
    file:write(data.acf_type .. " " .. data.acf_name .. "\n")
    file:write("-!- POSITION/FLIGHT MODEL DATA -!-\n")
    file:write(data.lat, ",\n")
    file:write(data.lon, ",\n")
    file:write(data.alt, ",\n")
    file:write(data.hdg, ",\n")
    file:write(data.gs, ",\n")
    file:write(data.vs, ",\n")
    file:write(data.pitch, ",\n")
    file:write(data.roll, ",\n")
    file:write("-!- ENGINE DATA -!-\n")
    file:write(data.eng1_rpm, ",\n")
    file:write(data.eng2_rpm, ",\n")
    file:write("-!- WEIGHT DATA -!-\n")
    file:write(data.fuel_wgt, ",\n")
    file:write(data.payload_wgt, ",\n")
    file:write("-!- MECHANICAL DATA -!-\n")
    file:write(data.gear1, ",\n")
    file:write(data.flap1_pos, ",\n")
    file:write(data.flap2_pos, ",\n")
    file:write(data.spoiler, ",\n")
    file:write(data.elv1, ",\n")
    file:write(data.elv2, ",\n")
    file:write(data.rudd1, ",\n")
    file:write(data.rudd2, ",\n")
    file:write(data.ail1, ",\n")
    file:write(data.ail2, ",\n")
    file:close()
end

function main()
    if(active) then
        data = {}
        getData()
        exportData()
    end
end

do_every_draw("main()")
