-- Thanks to @nobody
Citizen.CreateThread(function()
	while true do
    	-- These natives has to be called every frame.
    	SetVehicleDensityMultiplierThisFrame(0.06)
		SetPedDensityMultiplierThisFrame(0.06)
		SetRandomVehicleDensityMultiplierThisFrame(0.06)
		SetParkedVehicleDensityMultiplierThisFrame(0.06)
		SetScenarioPedDensityMultiplierThisFrame(0.06, 0.06)
		
		local playerPed = GetPlayerPed(-1)
		local pos = GetEntityCoords(playerPed) 
		RemoveVehiclesFromGeneratorsInArea(pos['x'] - 500.0, pos['y'] - 500.0, pos['z'] - 500.0, pos['x'] + 500.0, pos['y'] + 500.0, pos['z'] + 500.0);
		
		-- These natives do not have to be called everyframe.
		SetGarbageTrucks(0)
		SetRandomBoats(0)
    	
		Citizen.Wait(1)
	end
end)