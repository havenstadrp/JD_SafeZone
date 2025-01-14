Config = {}

Config.TopLeftInfoBox = true
Config.ShowBorder = false
Config.BorderHight = 5

Config.MaxVehicleSpeed = 10.00  -- set to false to disable.
Config.MaxSpeedBypass = { -- Vehicles classes added in this bypass will still be able to go faster than the max speed set above.
    --0, -- Compacts  
    --1, -- Sedans  
    --2, -- SUVs  
    --3, -- Coupes  
    --4, -- Muscle  
    --5, -- Sports Classics  
    --6, -- Sports  
    --7, -- Super  
    --8, -- Motorcycles  
    --9, -- Off-road  
    --10, -- Industrial  
    --11, -- Utility  
    --12, -- Vans  
    --13, -- Cycles  
    --14, -- Boats  
    15, -- Helicopters  
    16, -- Planes  
    --17, -- Service  
    --18, -- Emergency  
    --19, -- Military  
    --20, -- Commercial  
    --21, -- Trains
}

Config.WeaponBypass = {
    --GetHashKey("WEAPON_PISTOL"),
    GetHashKey("WEAPON_PISTOL"),
}
    

Config.pNotify = false
Config.pNotifyEnterMessage = "You have entered a safezone"
Config.pNotifyEnterType = "info"
Config.pNotifyExitMessage = "You have left a safezone"
Config.pNotifyExitType = "info"

Config.Zones = {
    {
        {1818.45, 2611.60, 45.67}, -- Prison
        {1809.37, 2611.65, 45.67},
        {1809.40, 2620.69, 45.67},
        {1817.80, 2642.32, 45.67},
        {1834.40, 2688.87, 45.67},
        {1829.39, 2703.25, 45.67},
        {1776.49, 2746.40, 45.67},
        {1761.95, 2751.73, 45.67},
        {1662.50, 2748.09, 45.67},
        {1648.50, 2740.81, 45.67},
        {1585.35, 2679.40, 45.67},
        {1576.11, 2666.74, 45.67},
        {1548.48, 2591.62, 45.67},
        {1547.82, 2576.09, 45.67},
        {1551.37, 2483.35, 45.67},
        {1559.03, 2469.66, 45.67},
        {1652.85, 2410.46, 45.67},
        {1668.09, 2408.40, 45.67}, 
        {1748.59, 2420.63, 45.67},
        {1762.12, 2427.29, 45.67},
        {1808.14, 2474.48, 45.67},
        {1812.84, 2488.88, 45.67},
        {1805.69, 2535.65, 45.67},
        {1807.59, 2568.37, 45.67},
        {1808.22, 2592.08, 45.67},
        {1818.65, 2592.08, 45.67}
    },
    {
        {290.44, -1418.76, 29.84}, -- Central Los Santos Medical Center
        {348.55, -1467.64, 29.35},
        {343.89, -1476.06, 29.30},
        {332.99, -1482.34, 29.89},
        {331.13, -1483.14, 29.94},
        {329.34, -1483.67, 29.97},
        {327.59, -1483.95, 29.99},
        {325.58, -1483.90, 29.98},
        {323.64, -1483.58, 29.98},
        {321.85, -1483.05, 29.97},
        {320.20, -1482.15, 29.97},
        {318.52, -1480.99, 29.97},
        {315.52, -1478.50, 29.97},
        {327.89, -1463.82, 29.97},
        {312.78, -1451.30, 29.97},
        {306.35, -1458.94, 29.97},
        {284.12, -1440.19, 29.97},
        {284.85, -1439.43, 29.97},
        {277.96, -1433.61, 29.97}
    }
}


-- Version checker for when i update :)
Config.versionCheck = "1.0.8"
