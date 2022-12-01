ESX              = nil
local PlayerData = {}
local HasAlreadyGotMessage = false
local isInMarker = false


Locations = {
	vector3(447.73, -975.63, 25.7),	 --MissionRow behind station
}



Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer   
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
end)





Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local ped = GetPlayerPed(-1)
		local coords = GetEntityCoords(ped)

		for k,v in ipairs(Locations) do
			
			-- get player location
			local distance = #(coords.xy - v.xy)
			if distance < 8.0  then
				DrawMarker(36, v.x, v.y, v.z , 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 2.0, 2.0, 2.0, 0, 255, 255, 50, false, false, 2, true, nil, nil, false)
				
				-- if you are closer than 2, you are considered in the marker	

				if distance < 2.0 then
					isInMarker = true
				elseif distance > 3.0 then
					HasAlreadyGotMessage = false
					isInMarker = false
				end
			end
			
				
			if isInMarker and not HasAlreadyGotMessage then
				yourJob = ESX.PlayerData.job.name
				
				-- check to see if your job is police, sheriff or highway patrol
				if yourJob == "police" or yourJob == "ambulance" then

					-- check to make sure player is in a vehicle
					if not IsPedInAnyVehicle(ped) then	
						TriggerEvent('chat:addMessage', 'You are not in a vehicle.')
						HasAlreadyGotMessage = true
						Citizen.Wait(5000)
					else
						local vehicle = GetVehiclePedIsIn(ped, false)
						-- Fix Engine Damage
						SetVehicleEngineHealth(vehicle, 1000.0) 
						TriggerEvent('chat:addMessage', 'We repaired the engine damage.')
						Citizen.Wait(500)			

						-- Repair vehicle body damage
						SetVehicleFixed(vehicle)
						SetVehicleDeformationFixed(vehicle)
						TriggerEvent('chat:addMessage', 'We fixed all the dents.')
						Citizen.Wait(500)

						-- Top off with a tank of gas
						SetVehicleFuelLevel(vehicle, 100.0)
						TriggerEvent('chat:addMessage', 'Your vehicle has been refueled.')
						Citizen.Wait(500)

						-- Make sure those tires are in tip-top shape
						SetVehicleWheelHealth(vehicle, 1.0, 100.00)
						SetVehicleWheelHealth(vehicle, 2.0, 100.00)
						SetVehicleWheelHealth(vehicle, 3.0, 100.00)
						SetVehicleWheelHealth(vehicle, 4.0, 100.00)
						TriggerEvent('chat:addMessage', 'Checking those tires, you are good to go.')
						Citizen.Wait(500)	
					
						-- Wash the vehicle
						SetVehicleDirtLevel(vehicle, 0.1)
						TriggerEvent('chat:addMessage', 'Your vehicle has been washed. Try to keep it clean.')
						HasAlreadyGotMessage = true
						Citizen.Wait(5000)
					end
				else
					TriggerEvent('chat:addMessage', 'You have no business here.')
					HasAlreadyGotMessage = true
					Citizen.Wait(500)
				end
			end
		end	
	end

end)
