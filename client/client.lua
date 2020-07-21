local Zones = {SafeZone = false}

function collision(_source)
	for _, players in ipairs(GetActivePlayers()) do
		if(Vdist(GetEntityCoords(GetPlayerPed(players)),Zones.x,Zones.y,Zones.z) <= Zones.radius) then
			SetEntityNoCollisionEntity(GetPlayerPed(players),_source,true)
		end
		if IsPedInAnyVehicle(players, false) then
			veh = GetVehiclePedIsUsing(players)
			SetEntityNoCollisionEntity(veh, _source, true)
		end
	end
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local _source = GetPlayerPed(-1)
		local x,y,z = table.unpack(GetEntityCoords(_source, true))

		if(Zones.SafeZone == false) then
			for i,v in pairs(Config.Zone) do
				if(Vdist(x,y,z,v.x,v.y,v.z) <= v.radius) then
					Zones.SafeZone = true
					Zones.x,Zones.y,Zones.z,Zones.radius = v.x,v.y,v.z,v.radius
					inZone = false
				end
			end
		end
		if Zones.SafeZone then
			NetworkSetFriendlyFireOption(false)
			DisableControlAction(2, 37, true)
			DisablePlayerFiring(_source,true)
			DisableControlAction(0, 106, true)SetCurrentPedWeapon(_source,GetHashKey("WEAPON_UNARMED"),true)
			if Config.TranspatentPlayers then
				SetEntityAlpha(PlayerPedId(), 170, false)
			end
			if not inZone then
				if IsPedInAnyVehicle(PlayerPedId(), false) then
					veh = GetVehiclePedIsUsing(PlayerPedId())
					SetEntityInvincible(veh, true)
				end
				SetPlayerInvincible(PlayerId(), true)
				SetPedCanRagdoll(GetPlayerPed(-1), false)
				ClearPedBloodDamage(GetPlayerPed(-1))
				ResetPedVisibleDamage(GetPlayerPed(-1))
				ClearPedLastWeaponDamage(GetPlayerPed(-1))
				if Config.JD_logs then
					exports.JD_logs:discord(GetPlayerName(PlayerId())..' `Entered` a SafeZone', PlayerId(), 0, Config.JD_logs_Color, Config.JD_logs_Channel)
				end
				if Config.Notifications then
					if not Config.pNotify then
						Notify(Config.Entered)
					else
						TriggerEvent("pNotify:SendNotification",{
							text = Config.Entered,
							type = "success",
							timeout = (3000),
							layout = "centerLeft",
							queue = "global"
						})
					end
				end
				SetEntityInvincible(GetPlayerPed(PlayerId()), false)
				inZone = true
			end

			collision(source)
			if Config.AntiZoneCamp then
			_Zone = Zones.radius + 10
			else
			_Zone = Zones.radius
			end
			if(Vdist(x,y,z,Zones.x,Zones.y,Zones.z) > _Zone) then
				Zones.SafeZone = false
				Zones.x,Zones.y,Zones.z,Zones.radius = nil,nil,nil,nil
				NetworkSetFriendlyFireOption(true)
				DisableControlAction(2, 37, false)
				DisablePlayerFiring(_source,false)
				DisableControlAction(0, 106, false)
				SetPlayerInvincible(_source,false)
				SetEntityAlpha(PlayerPedId(), 255, false)
				if IsPedInAnyVehicle(PlayerPedId(), false) then

				end
				if inZone then
					if IsPedInAnyVehicle(PlayerPedId(), false) then
						veh = GetVehiclePedIsUsing(PlayerPedId())
						SetEntityAlpha(veh, 255, false)
						SetEntityCanBeDamaged(veh, true)
					end
					if Config.JD_logs then
						exports.JD_logs:discord(GetPlayerName(PlayerId())..' `Left` a SafeZone', PlayerId(), 0, Config.JD_logs_Color, Config.JD_logs_Channel)
					end
					if Config.Notifications then
						if not Config.pNotify then
						Notify(Config.Left)
					else
						TriggerEvent("pNotify:SendNotification",{
							text = Config.Left,
							type = "error",
							timeout = (3000),
							layout = "centerLeft",
							queue = "global"
						})
					end
					end
					inZone = false
				end
			end
			if IsDisabledControlJustPressed(2, 37) then
				SetCurrentPedWeapon(source,GetHashKey("WEAPON_UNARMED"),true)
				if Config.JD_logs then
					exports.JD_logs:discord(GetPlayerName(PlayerId())..' Tried to `grab a weapon` in a SafeZone', GetPlayerServerId(PlayerId()), 0, Config.JD_logs_Color, Config.JD_logs_Channel)
				end
				if Config.Notifications then
					if not Config.pNotify then
						Notify(Config.WeaponWheel)
					else
						TriggerEvent("pNotify:SendNotification",{
							text = Config.WeaponWheel,
							type = "error",
							timeout = (3000),
							layout = "centerLeft",
							queue = "global"
						})
					end
				end
			end
			if IsDisabledControlJustPressed(0, 106) and inZone then
				SetCurrentPedWeapon(source,GetHashKey("WEAPON_UNARMED"),true)
				if Config.JD_logs then
					exports.JD_logs:discord(GetPlayerName(PlayerId())..' Tried to `shoot a weapon` in a SafeZone', PlayerId(), 0, Config.JD_logs_Color, Config.JD_logs_Channel)
				end
				if Config.Notifications then
					if not Config.pNotify then
						Notify(Config.Shoot)
					else
						TriggerEvent("pNotify:SendNotification",{
							text = Config.Shoot,
							type = "error",
							timeout = (3000),
							layout = "centerLeft",
							queue = "global"
						})
					end
				end
			end
		end
	end
end)

Citizen.CreateThread(function()
	if Config.MapMarker then
		for i,v in pairs(Config.Zone) do
			local blip = AddBlipForRadius(v.x, v.y, v.z , v.radius)
			SetBlipHighDetail(blip, true)
			SetBlipColour(blip, 2)
			SetBlipAlpha (blip, 128)
			SetBlipAsShortRange(blip, true)
		end
	end
end)

Citizen.CreateThread(function()
	if Config.Border then
		while true do
			Citizen.Wait(0)
			for i,v in pairs(Config.Zone) do
				DrawMarker(1, v.x, v.y, v.z - 8, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.radius * 1.98, v.radius * 1.98, 10.0, 0, 255, 0, 100, false, true, 2, false, false, false, false)
			end
		end
	end
end)



function Notify(text)
	SetNotificationTextEntry("STRING")
	AddTextComponentSubstringPlayerName('~b~SafeZone:\n~w~' ..text)
	DrawNotification(true, true)
end
