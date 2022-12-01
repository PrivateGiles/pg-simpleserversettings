Citizen.CreateThread(function()
	while true do
		SetAudioFlag("PoliceScannerDisabled", true)
		SetAudioFlag("DisableFlightMusic", true)
	Citizen.Wait(0)
	end
end)	