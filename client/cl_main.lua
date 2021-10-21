if Config.ESXtype == 'Old' then
	ESX = nil
	Citizen.CreateThread(function()
		while ESX == nil do
			TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
			Citizen.Wait(0)
		end
	end)
end

local wasinshop 

function OpenShopMenu(type,price,obleceni)
	ESX.UI.Menu.CloseAll()
	local clothesinshop = obleceni
	local cena = price
	if type == 'Clothing' then	  
		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'shop_main', {
			title    = Languages[Config.Locale]['main_menu'],
			align    = Config.align,
			elements = {
				{label = Languages[Config.Locale]['shop_clothes'],  value = 'shopping'},
				{label = Languages[Config.Locale]['wardrobe'], value = 'wardrobe'},
				{label = Languages[Config.Locale]['delete_savedfits'], value = 'delete_saved'}
			},
		}, function(data, menu)
			local action = data.current.value 
			if action == 'shopping' then 
				TriggerEvent('esx_skin:openRestrictedMenu', function(data, menu)
					menu.close()
			
					ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'shop_confirm', {
						title = Languages[Config.Locale]['valid_this_purchase'],
						align = Config.align,
						elements = {
							{label = Languages[Config.Locale]['yes'].. ' <span style="color:green;">' .. cena .. '$</span>', value = 'yes'},
							{label = Languages[Config.Locale]['no'],  value = 'no'}
					}}, function(data, menu)
						menu.close()
			
						if data.current.value == 'yes' then
							ESX.TriggerServerCallback('nb_clotheshop:server:buying', function(bought)
								if bought then
									wasinshop = false
									TriggerEvent('skinchanger:getSkin', function(skin)
										TriggerServerEvent('esx_skin:save', skin)
									end)
						
									ESX.TriggerServerCallback('nb_clotheshop:server:checkPropertyDataStore', function(foundStore)
										if foundStore then
											ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'save_dressing', {
												title = Languages[Config.Locale]['save_in_dressing'],
												align = Config.align,
												elements = {
													{label = Languages[Config.Locale]['yes'], value = 'yes'},
													{label = Languages[Config.Locale]['no'],  value = 'no'}
											}}, function(data2, menu2)
												menu2.close()
			
												if data2.current.value == 'yes' then
													ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'outfit_name', {
														title = Languages[Config.Locale]['name_outfit']
													}, function(data3, menu3)
														menu3.close()
			
														TriggerEvent('skinchanger:getSkin', function(skin)
															TriggerServerEvent('nb_clotheshop:server:saveOutfit', data3.value, skin)
															ESX.ShowNotification(Languages[Config.Locale]['saved_outfit'])
														end)
													end, function(data3, menu3)
														menu3.close()
													end)
												end
											end)
										end
									end)
			
								else
									resetskin()
									ESX.ShowNotification(Languages[Config.Locale]['not_enough_money'])
								end
							end,cena)
						elseif data.current.value == 'no' then
							resetskin()
						end
					end, function(data, menu)
						menu.close()
					end)
			
				end, function(data, menu)
					menu.close()
				end, clothesinshop)
			elseif action == 'wardrobe' then
				ESX.TriggerServerCallback('nb_clotheshop:server:getPlayerDressing', function(dressing)
					local elements = {}
			  
					for i=1, #dressing, 1 do
					  table.insert(elements, {label = dressing[i], value = i})
					end
			  
					ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'player_dressing', {
						title    = Languages[Config.Locale]['wardrobe'],
						align    = Config.align,
						elements = elements,
					  }, function(data, menu)
			  
						TriggerEvent('skinchanger:getSkin', function(skin)
			  
						  ESX.TriggerServerCallback('nb_clotheshop:server:getPlayerOutfit', function(clothes)
							TriggerEvent('skinchanger:loadClothes', skin, clothes)
							TriggerEvent('esx_skin:setLastSkin', skin)
			  
							TriggerEvent('skinchanger:getSkin', function(skin)
							  TriggerServerEvent('esx_skin:save', skin)
							end)
							wasinshop = false
							ESX.ShowNotification(Languages[Config.Locale]['loaded_outfit'])
						  end, data.current.value)
						end)
					  end, function(data, menu)
						menu.close()
					  end)
				  end)
			elseif action == 'delete_saved' then 
				ESX.TriggerServerCallback('nb_clotheshop:server:getPlayerDressing', function(dressing)
					local elements = {}
		
					for i=1, #dressing, 1 do
						table.insert(elements, {label = dressing[i], value = i})
					end
					
					ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'supprime_cloth', {
					  title    = Languages[Config.Locale]['delete_savedfits'],
					  align    = Config.align,
					  elements = elements,
					}, function(data, menu)
						menu.close()
						TriggerServerEvent('nb_clotheshop:server:deleteOutfit', data.current.value)	
					end, function(data, menu)
					  menu.close()
					end)
				end)
			end
		end, function(data, menu)
			menu.close()
		end)
	elseif type == 'Barber' then 
		TriggerEvent('esx_skin:openRestrictedMenu', function(data, menu)
			menu.close()
	
			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'shop_confirm', {
				title = Languages[Config.Locale]['valid_this_purchase'],
				align = Config.align,
				elements = {
					{label = Languages[Config.Locale]['yes'].. ' <span style="color:green;">' .. cena .. '$</span>', value = 'yes'},
					{label = Languages[Config.Locale]['no'],  value = 'no'}
			}}, function(data, menu)
				menu.close()
	
				if data.current.value == 'yes' then
					ESX.TriggerServerCallback('nb_clotheshop:server:buying', function(hasEnoughMoney)
						if hasEnoughMoney then
							TriggerEvent('skinchanger:getSkin', function(skin)
								TriggerServerEvent('esx_skin:save', skin)
							end)
	
							TriggerServerEvent('esx_barbershop:pay')
							wasinshop = false
						else
							ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
								TriggerEvent('skinchanger:loadSkin', skin) 
							end)
	
							ESX.ShowNotification(Languages[Config.Locale]['not_enough_money'])
						end
					end,cena)
				elseif data.current.value == 'no' then
                                    resetskin()
				end
			end, function(data, menu)
				menu.close()
			end)
		end, function(data, menu)
			menu.close()
		end, clothesinshop)
	end
end

Citizen.CreateThread(function()
	while true do 
		Citizen.Wait(0)
		local sleep = true
		local ped = PlayerPedId()
		local coords = GetEntityCoords(ped)
		for k,v in pairs(Config.ObleceniShops) do 
			for i = 1, #v.coords, 1 do
				local distance = #(coords - v.coords[i])
				if distance < 10 then
					sleep = false
					if v.marker.active then 
						local editedcoords = vector3(v.coords[i].x,v.coords[i].y,v.coords[i].z-v.marker.heightedit)
						DrawMarker(v.marker.type, v.coords[i], 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, v.marker.size, v.marker.color.r, v.marker.color.g, v.marker.color.b, 100, false, true, 2, false, nil, nil, false)
					end
					if distance < 5 then 
						if v.text.active then
							local editedcoords = vector3(v.coords[i].x,v.coords[i].y,v.coords[i].z-v.marker.heightedit)
							ESX.Game.Utils.DrawText3D(editedcoords, v.text.label, v.text.scale)
						end
						if distance < 3 then 
							if v.ShowHelp then 
								ESX.ShowHelpNotification(v.text.label)
							end
							if IsControlJustPressed(0, 38) then 
								OpenShopMenu(v.type, v.price, v.skinmenuoptions)
								wasinshop = true
							end
						end
					end
				elseif wasinshop and distance < 12 then 
					wasinshop = false
					resetskin()
				end
			end
		end
		if sleep then 
			Citizen.Wait(1500)
		end
	end
end)
