---------------------------------
--- Child Lock, Made by FAXES ---
---------------------------------
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local ped = PlayerPedId()
        local veh = GetVehiclePedIsUsing(ped)
        --local veh GetVehiclePedIsIn(ped, false)
        if IsPedInVehicle(ped, veh, false) then
            --if GetVehiclePedIsIn(ped, false) then
            local vehModel = GetEntityModel(veh)
            if table.contains(Settings.vehicles, vehModel) then
                if Settings.Debug then 
                    print("Vehicle model is in the allowed list")
                end
                if Settings.Debug then 
                            print("class passed")
                    end
			if GetPedInVehicleSeat(veh, -1) ~= ped and GetPedInVehicleSeat(veh, 0) ~= ped then
			                if Settings.Debug then 		
                            print("ped is not in drivers seat")
			                end
                            if IsVehicleSeatFree(veh, -1) then
			                if Settings.Debug then 		
			                print("drivers seat is free")

							end
                            DisableControlAction(0, 75, true) -- exit veh
                            if IsDisabledControlJustPressed(0, 75) then
                                TriggerEvent("chatMessage", "^1^*Vehicle child lock is active.")
                            end
                        end
                    end
                end
        end
	end
end)

function table.contains(table, value)
    for _, v in ipairs(table) do
        if v == value then
            return true
        end
    end
    return false
end
