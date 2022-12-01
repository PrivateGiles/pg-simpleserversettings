--[[

Groups by number:

1  = DT_PoliceAutomobile = 1,
2  = DT_PoliceHelicopter = 2,
3  = DT_FireDepartment = 3,
4  = DT_SwatAutomobile = 4,
5  = DT_AmbulanceDepartment = 5,
6  = DT_PoliceRiders = 6,
7  = DT_PoliceVehicleRequest = 7,
8  = DT_PoliceRoadBlock = 8,
9  = DT_PoliceAutomobileWaitPulledOver = 9,
10 = DT_PoliceAutomobileWaitCruising = 10,
11 = DT_Gangs = 11,
12 = DT_SwatHelicopter = 12,
13 = DT_PoliceBoat = 13,
14 = DT_ArmyVehicle = 14,
15 = DT_BikerBackup = 15

]]

Citizen.CreateThread(function()
	while true do
		Wait(0)
		for i = 1, 15 do
			EnableDispatchService(i, false)
		end
	end
end)