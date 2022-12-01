Citizen.CreateThread(function()
	while true do
		SetVehicleModelIsSuppressed(GetHashKey("blimp"), true)
		SetVehicleModelIsSuppressed(GetHashKey("blimp2"), true)
		SetVehicleModelIsSuppressed(GetHashKey("frogger"), true)
		SetVehicleModelIsSuppressed(GetHashKey("maverick"), true)
		SetVehicleModelIsSuppressed(GetHashKey("buzzard"), true)
		SetVehicleModelIsSuppressed(GetHashKey("duster"), true)
		-- added two new vehicles as disabled dispatch is not working
		SetVehicleModelIsSuppressed(GetHashKey("firetruk"), true)
		SetVehicleModelIsSuppressed(GetHashKey("ambulance"), true)
		SetVehicleModelIsSuppressed(GetHashKey("dinghy2"), true)
	Citizen.Wait(0)
	end
end)	