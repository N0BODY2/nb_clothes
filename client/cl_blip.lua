Citizen.CreateThread(function()
	for k,v in pairs(Config.ObleceniShops) do
        if v.blips.active then 
            for i = 1, #v.coords, 1 do
                local blip = AddBlipForCoord(v.coords[i])

                SetBlipSprite (blip, v.blips.sprite)
                SetBlipColour (blip, v.blips.color)
                SetBlipAsShortRange(blip, true)

                BeginTextCommandSetBlipName('STRING')
                AddTextComponentSubstringPlayerName(v.blips.name)
                EndTextCommandSetBlipName(blip)
            end
        end
	end
end)
