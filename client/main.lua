Citizen.CreateThread(function()
  while true do
    Citizen.Wait(250);
    
    local playerPed = PlayerPedId();
    local playerVehicle = GetVehiclePedIsIn(playerPed, false);

    if GetPedInVehicleSeat(playerVehicle, -1) ~= playerPed and Config.PassengersDisabled or playerVehicle ~= 0 then
      goto continue;
    end

    local vehicleSpeed = {
      mph = GetEntitySpeed(playerVehicle) * 2.236936,
      kmh = GetEntitySpeed(playerVehicle) * 3.6
    }
    
    if not vehicleSpeed[Config.SpeedUnit] then
      return print('Invalid configuration for SpeedUnit. Please use "kmh" or "mph"');
    end

    if vehicleSpeed[Config.SpeedUnit] > Config.MaxSpeed then
      SetPlayerCanDoDriveBy(PlayerId(), false);
    else
      SetPlayerCanDoDriveBy(PlayerId(), true);
    end
    
    ::continue::
  end
end);