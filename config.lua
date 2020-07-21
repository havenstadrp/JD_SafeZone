Config = {}

Config.Notifications = true			-- set this to true if you want notifications
Config.pNotify = false				-- Set this to true if you want to use pNotify
Config.Border = true				-- Set this to true if you want a SafeZone Border
Config.MapMarker = true				-- Set this to true if you want a marker on the Map
Config.TranspatentPlayers = true	-- Set this to true if you want Players/Vehicles to become transparent in the safezone
Config.AntiZoneCamp = false			-- Set this to true will add 10 meters extra to the zone when you exit. (this will not effect entering the zone only exiting)

Config.JD_logs = true				-- Set this to true if you're using JD_logs ( https://github.com/JokeDevil/JD_logs )
Config.JD_logs_Color = "5633648"	-- The color for the embed
Config.JD_logs_Channel = "safezone"	-- The channel for the logs

Config.Zone = { 					-- These are the SafeZones
	["Sandy PD"] = {x=1835.73,y=3676.72,z=39.89,radius = 50.0},

	["Mission Row"] = {x=446.8,y=-993.06,z=29.26,radius = 40.0},
	["Medical Center"] = {x=311.62,y=-1443.69,z=29.8,radius = 50.0},
}

-- This are the notifications
Config.Entered = "You have Entered a SafeZone"
Config.Left = "You have Left a SafeZone"
Config.Shoot = "You can NOT do that here"
Config.WeaponWheel = "You can NOT use weapons here"


-- Version checker for when i update :)
Config.versionCheck = "1.0.1"
