-- ExportXP is a lightweight FlyWithLua script for X-Plane 11 and 12 (EA) that 
-- exports main flight model characteristics out over a file 
-- to be used by other programs
-- Author: Steven Weinstein (AviationSFO)
-- Tested X-Plane and FWL versions: 11.55r2, 2.7.32; 12.00b3 2.8.00;

-- Setting up variables and settings
local data = {}
local altdr = false
local prefs_file = io.open(SCRIPT_DIRECTORY .. "ExportXP_prefs.txt", "w+")
local prefs = prefs_file:read("*a")
altdr = prefs

-- Adding toggle macro
active = false


add_macro("Toggle ExportXP", "active = true; logMsg('ExportXP Active')", "active = false", "deactivate")

-- this function retrieves the current aircraft's data and stores it in a table
-- from X-Plane's API for later export
function getData()
    -- get the data from the flight model
    -- position and orientation
    dataref("alt", "sim/flightmodel/position/elevation", "readonly")
    dataref("hdg", "sim/flightmodel/position/true_psi", "readonly")
    dataref("gs", "sim/flightmodel/position/groundspeed", "readonly")
    dataref("vs", "sim/flightmodel/position/vh_ind_fpm", "readonly")
    dataref("pitch", "sim/flightmodel/position/true_theta", "readonly")
    dataref("roll", "sim/flightmodel/position/phi", "readonly")

    -- engines
    dataref("eng1_rpm", "sim/flightmodel/engine/ENGN_N1_", 0, "readonly")
    dataref("eng2_rpm", "sim/flightmodel/engine/ENGN_N1_", 1, "readonly")
    dataref("eng3_rpm", "sim/flightmodel/engine/ENGN_N1_", 2, "readonly")
    dataref("eng4_rpm", "sim/flightmodel/engine/ENGN_N1_", 3, "readonly")
    dataref("eng5_rpm", "sim/flightmodel/engine/ENGN_N1_", 4, "readonly")
    dataref("eng6_rpm", "sim/flightmodel/engine/ENGN_N1_", 5, "readonly")
    dataref("eng7_rpm", "sim/flightmodel/engine/ENGN_N1_", 6, "readonly")
    dataref("eng8_rpm", "sim/flightmodel/engine/ENGN_N1_", 7, "readonly")

    -- payloads
    dataref("fuel_wgt", "sim/flightmodel/weight/m_fuel_total", "readonly")
    dataref("payload_wgt", "sim/flightmodel/weight/m_fixed", "readonly")
    
    -- landing gear
    dataref("gear1", "sim/flightmodel/movingparts/gear1def", "readonly")


    -- flight controls
    dataref("flap1_pos", "sim/flightmodel/controls/fla1_def", 0, "readonly")
    dataref("flap2_pos", "sim/flightmodel/controls/fla2_def", 0, "readonly")
    dataref("spoilerL", "sim/flightmodel/controls/lsplr_def", "readonly")
    dataref("spoilerR", "sim/flightmodel/controls/rsplr_def", "readonly")
    dataref("elv1_1", "sim/flightmodel/controls/hstab1_elv1def", "readonly")
    dataref("elv1_2", "sim/flightmodel/controls/hstab1_elv2def", "readonly")
    dataref("elv2_1", "sim/flightmodel/controls/hstab2_elv1def", "readonly")
    dataref("elv2_2", "sim/flightmodel/controls/hstab2_elv2def", "readonly")
    dataref("rudd1", "sim/flightmodel/controls/ldrudd_def", "readonly")
    dataref("rudd2", "sim/flightmodel/controls/rdruddef", "readonly")
    dataref("ail1l", "sim/flightmodel/controls/lail1def", "readonly")
    dataref("ail2l", "sim/flightmodel/controls/lail2def", "readonly")
    dataref("ail1r", "sim/flightmodel/controls/rail1def", "readonly")
    dataref("ail2r", "sim/flightmodel/controls/rail2def", "readonly")
    dataref("parkbrake", "sim/flightmodel/controls/parkbrake", "readonly")

    -- military aircraft specific
    dataref("tailhook", "sim/flightmodel/controls/tailhook_ratio", "readonly")
    dataref("canopy", "sim/flightmodel/controls/canopy_ratio", "readonly")



    -- Applying to data array
    data.lat = LATITUDE
    data.lon = LONGITUDE
    data.alt = alt
    data.hdg = hdg
    data.gs = gs
    data.vs = vs
    data.pitch = pitch
    data.roll = roll
    data.eng1_rpm = eng1_rpm
    data.eng2_rpm = eng2_rpm
    data.eng3_rpm = eng3_rpm
    data.eng4_rpm = eng4_rpm
    data.eng5_rpm = eng5_rpm
    data.eng6_rpm = eng6_rpm
    data.eng7_rpm = eng7_rpm
    data.eng8_rpm = eng8_rpm
    data.fuel_wgt = fuel_wgt
    data.payload_wgt = payload_wgt
    data.gear1 = gear1
    data.flap1_pos = flap1_pos
    data.flap2_pos = flap2_pos
    data.spoilerL = spoilerL
    data.spoilerR = spoilerR
    data.elv1 = elv1
    data.elv2 = elv2
    data.rudd1 = rudd1
    data.rudd2 = rudd2
    data.ail1 = ail1
    data.ail2 = ail2
    data.parkbrake = parkbrake

    data.acf_type = PLANE_ICAO
    data.acf_name = PLANE_TAILNUMBER
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
    file:write("-!- ACF -!- " .. data.acf_type .. " " .. data.acf_name .. "\n")
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
    file:write(data.eng3_rpm, ",\n")
    file:write(data.eng4_rpm, ",\n")
    file:write(data.eng5_rpm, ",\n")
    file:write(data.eng6_rpm, ",\n")
    file:write(data.eng7_rpm, ",\n")
    file:write(data.eng8_rpm, ",\n")
    file:write("-!- WEIGHT DATA -!-\n")
    file:write(data.fuel_wgt, ",\n")
    file:write(data.payload_wgt, ",\n")
    file:write("-!- MECHANICAL DATA -!-\n")
    file:write(data.gear1, ",\n")
    file:write(data.flap1_pos, ",\n")
    file:write(data.flap2_pos, ",\n")
    file:write(data.spoilerL, ",\n")
    file:write(data.spoilerR, ",\n")
    file:write(data.elv1, ",\n")
    file:write(data.elv2, ",\n")
    file:write(data.rudd1, ",\n")
    file:write(data.rudd2, ",\n")
    file:write(data.ail1, ",\n")
    file:write(data.ail2, ",\n")
    file:write(data.parkbrake, ",\n")
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
