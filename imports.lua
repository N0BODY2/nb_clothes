if Config.ESXtype == 'New' then
    ESX = exports['es_extended']:getSharedObject()

    if not IsDuplicityVersion() then 
        AddEventHandler('esx:setPlayerData', function(key, val, last)
            if GetInvokingResource() == 'es_extended' then
                ESX.PlayerData[key] = val
                if OnPlayerData ~= nil then OnPlayerData(key, val, last) end
            end
        end)
    end
end