minetest.register_node('metals:stone_with_iron', {
	description = 'Stone with Iron',
	tiles = {'ground_stone.png^metals_iron_ore.png'},
	groups = {cracky=3, stone=1},
	drop = 'metals:iron_lump',
--	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node('metals:stone_with_iron2', {
	description = 'Stone with Iron',
	tiles = {'ground_stone.png^metals_iron_ore2.png'},
	groups = {cracky=3, stone=1},
   drop = {
		items = {
			{
			items = {'metals:iron_lump 3'},
			rarity = 6,
         },
         {
			items = {'metals:iron_lump 2'},
         },
		},
	},
--	sounds = default.node_sound_stone_defaults(),
})
