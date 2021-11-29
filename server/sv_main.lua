if Config.ESXtype == 'Old' then
	ESX = nil

	TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
elseif Config.ESXtype == 'New' then
    ESX = exports['es_extended']:getSharedObject()
end

RegisterNetEvent('nb_clotheshop:server:saveOutfit')
AddEventHandler('nb_clotheshop:server:saveOutfit', function(label, skin)
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_datastore:getDataStore', 'property', xPlayer.identifier, function(store)
		local dressing = store.get('dressing')

		if dressing == nil then
			dressing = {}
		end

		table.insert(dressing, {
			label = label,
			skin  = skin
		})

		store.set('dressing', dressing)
		store.save()
	end)
end)

ESX.RegisterServerCallback('nb_clotheshop:server:buying', function(source, cb,price)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.getMoney() >= price then
		xPlayer.removeMoney(price)
		xPlayer.showNotification(Languages[Config.Locale]['you_paid'] .. price)
		cb(true)
	else
		cb(false)
	end
end)

ESX.RegisterServerCallback('nb_clotheshop:server:checkPropertyDataStore', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local foundStore = false

	TriggerEvent('esx_datastore:getDataStore', 'property', xPlayer.identifier, function(store)
		foundStore = true
	end)

	cb(foundStore)
end)

ESX.RegisterServerCallback('nb_clotheshop:server:getPlayerDressing', function(source, cb)
	local xPlayer  = ESX.GetPlayerFromId(source)
  
	TriggerEvent('esx_datastore:getDataStore', 'property', xPlayer.identifier, function(store)
	  local count    = store.count('dressing')
	  local labels   = {}
  
	  for i=1, count, 1 do
		local entry = store.get('dressing', i)
		table.insert(labels, entry.label)
	  end
  
	  cb(labels)
	end)
end)

ESX.RegisterServerCallback('nb_clotheshop:server:getPlayerOutfit', function(source, cb, num)
	local xPlayer  = ESX.GetPlayerFromId(source)
  
	TriggerEvent('esx_datastore:getDataStore', 'property', xPlayer.identifier, function(store)
	  local outfit = store.get('dressing', num)
	  cb(outfit.skin)
	end)
end)

RegisterNetEvent('nb_clotheshop:server:deleteoutfit')
AddEventHandler('nb_clotheshop:server:deleteoutfit', function(label)
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_datastore:getDataStore', 'property', xPlayer.identifier, function(store)
		local dressing = store.get('dressing') or {}

		table.remove(dressing, label)
		store.set('dressing', dressing)
    end)
end)
