Config = {}
Config.Locale = 'en'

-- Old = Trigger
-- New = Legacy
Config.ESXtype = 'Old' 

Config.align = 'top-left'

Languages = {
    ['cs'] = {
        ['access_clothing'] = "~g~[E]~w~ Access Clothing Shop",
        ['access_wardrobe'] = "~g~[E]~w~ Access War Drobe",
        ['access_barber'] = '~g~[E]~w~ Access Barber Shop',

		['valid_this_purchase'] = 'Dokončit nákup?',
		['yes'] = 'Ano',
		['no'] = 'Ne',
		['not_enough_money'] = '~r~Nemáte dostatek financí',
		['you_paid'] = 'Zaplatil jsi ',
		['save_in_dressing'] = 'Chcete si tento outfit uložit?',
		['name_outfit'] = 'Pojmenujte svůj outfit',
		['saved_outfit'] = 'Outfit byl uložen!',
		['wardrobe'] = 'Šatník',
		['delete_savedfits'] = 'Odstranit uložený outfit',
		['shop_clothes'] = 'Zakoupit oblečení',
		['main_menu'] = 'Vítejte ! Jak vám mohu pomoci?'
    },
    ['en'] = {
        ['access_clothing'] = "~g~[E]~w~ Access Clothing Shop",
        ['access_wardrobe'] = "~g~[E]~w~ Access War Drobe",
        ['access_barber'] = '~g~[E]~w~ Access Barber Shop',
		['valid_this_purchase'] = 'Validate this purchase?',
		['yes'] = 'yes',
		['no'] = 'no',
		['not_enough_money'] = '~r~You do not have enough money',
		['you_paid'] = 'You paid ',
		['save_in_dressing'] = 'do you want to save the outfit?',
		['name_outfit'] = 'name your outfit',
		['saved_outfit'] = 'the outfit has been saved!',
		['wardrobe'] = 'WarDrobe',
		['delete_savedfits'] = 'Delete Saved Outfits',
		['shop_clothes'] = 'Buy Clothes',
		['main_menu'] = 'Welcome ! how can i help you today?'
    }  
}
Config.ObleceniShops = {
	BasicObchody = {
		type = 'Clothing',
		price = 250,
		blips = {
			active = true,
			sprite = 73,
			color = 47,
			name = 'Clothing Shop'
		},
		marker = {
			active = true,
			heightedit = 0,
			size = vector3(1.5 , 1.5 , 1.0),
			color = {r = 102, g = 102, b = 204},
			type = 1
		},
		text = {
			active = true,
			scale = 0.5,
			heightedit = 0,
			label = Languages[Config.Locale]['access_clothing']
		},
		coords = {
			vector3(72.3, -1399.1, 28.4),
			vector3(-703.8, -152.3, 36.4),
			vector3(-167.9, -299.0, 38.7),
			vector3(428.7, -800.1, 28.5),
			vector3(-829.4, -1073.7, 10.3),
			vector3(-1447.8, -242.5, 48.8),
			vector3(11.6, 6514.2, 30.9),
			vector3(123.6, -219.4, 53.6),
			vector3(1696.3, 4829.3, 41.1),
			vector3(618.1, 2759.6, 41.1),
			vector3(1190.6, 2713.4, 37.2),
			vector3(-1193.4, -772.3, 16.3),
			vector3(-3172.5, 1048.1, 19.9),
			vector3(-1108.4, 2708.9, 18.1)
		},
		skinmenuoptions = {
			'tshirt_1', 'tshirt_2',
			'torso_1', 'torso_2',
			'decals_1', 'decals_2',
			'arms',
			'pants_1', 'pants_2',
			'shoes_1', 'shoes_2',
			'bags_1', 'bags_2',
			'chain_1', 'chain_2',
			'helmet_1', 'helmet_2',
			'glasses_1', 'glasses_2'
		}
	},
	Satniky = {
		type = 'Clothing',
		price = 250,
		blips = {
			active = false,
			sprite = 73,
			color = 47,
			name = 'WarDrobe'
		},
		marker = {
			active = true,
			heightedit = 0,
			size = vector3(1.5 , 1.5 , 1.0),
			color = {r = 102, g = 102, b = 204},
			type = 1
		},
		text = {
			active = true,
			scale = 0.5,
			heightedit = 0,
			label = Languages[Config.Locale]['access_wardrobe']
		},
		coords = {
		},
		skinmenuoptions = {
			'tshirt_1', 'tshirt_2',
			'torso_1', 'torso_2',
			'decals_1', 'decals_2',
			'arms',
			'pants_1', 'pants_2',
			'shoes_1', 'shoes_2',
			'bags_1', 'bags_2',
			'chain_1', 'chain_2',
			'helmet_1', 'helmet_2',
			'glasses_1', 'glasses_2'
		}
	},
	BarberShop = {
		type = 'Barber',
		price = 250,
		blips = {
			active = false,
			sprite = 73,
			color = 47,
			name = 'BarberShop'
		},
		marker = {
			active = true,
			heightedit = 0,
			size = vector3(1.5 , 1.5 , 1.0),
			color = {r = 102, g = 102, b = 204},
			type = 1
		},
		text = {
			active = true,
			scale = 0.5,
			heightedit = 0,
			label = Languages[Config.Locale]['access_barber']
		},
		coords = {
			vector3(-814.3, -183.8, 36.6),
			vector3(136.8, -1708.4, 28.3),
			vector3(-1282.6, -1116.8, 6.0),
			vector3(1931.5, 3729.7, 31.8),
			vector3(1212.8, -472.9, 65.2),
			vector3(-32.9, -152.3, 56.1),
			vector3(-278.1, 6228.5, 30.7)
		},
		skinmenuoptions = {
			'beard_1','beard_2',
			'beard_3','beard_4',
			'hair_1','hair_2',
			'hair_color_1','hair_color_2',
			'eyebrows_1','eyebrows_2',
			'eyebrows_3','eyebrows_4',
			'makeup_1','makeup_2',
			'makeup_3','makeup_4',
			'lipstick_1','lipstick_2',
			'lipstick_3','lipstick_4',
			'ears_1','ears_2',
		}
	}
}