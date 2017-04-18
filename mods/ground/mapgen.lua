minetest.register_alias('mapgen_stone', 'ground:stone')
minetest.register_alias('mapgen_dirt', 'ground:dirt')
minetest.register_alias('mapgen_dirt_with_grass', 'ground:dirt_with_grass')
minetest.register_alias('mapgen_sand', 'ground:sand')
minetest.register_alias('mapgen_water_source', 'ground:water_source')
minetest.register_alias('mapgen_river_water_source', 'ground:water_source')
minetest.register_alias('mapgen_lava_source', 'default:lava_source')
minetest.register_alias('mapgen_gravel', 'default:gravel')
minetest.register_alias('mapgen_desert_stone', 'default:desert_stone')
minetest.register_alias('mapgen_desert_sand', 'default:desert_sand')
minetest.register_alias('mapgen_dirt_with_snow', 'default:dirt_with_snow')
minetest.register_alias('mapgen_snowblock', 'default:snowblock')
minetest.register_alias('mapgen_snow', 'default:snow')
minetest.register_alias('mapgen_ice', 'default:ice')
minetest.register_alias('mapgen_sandstone', 'default:sandstone')

-- Flora

minetest.register_alias('mapgen_tree', 'default:tree')
minetest.register_alias('mapgen_leaves', 'default:leaves')
minetest.register_alias('mapgen_apple', 'default:apple')
minetest.register_alias('mapgen_jungletree', 'default:jungletree')
minetest.register_alias('mapgen_jungleleaves', 'default:jungleleaves')
minetest.register_alias('mapgen_junglegrass', 'default:junglegrass')
minetest.register_alias('mapgen_pine_tree', 'default:pine_tree')
minetest.register_alias('mapgen_pine_needles', 'default:pine_needles')

-- Dungeons

minetest.register_alias('mapgen_cobble', 'ground:cobble')
minetest.register_alias('mapgen_stair_cobble', 'stairs:stair_cobble')
minetest.register_alias('mapgen_mossycobble', 'default:mossycobble')
minetest.register_alias('mapgen_sandstonebrick', 'default:sandstonebrick')
minetest.register_alias('mapgen_stair_sandstonebrick', 'stairs:stair_sandstonebrick')

minetest.register_biome({
		name = 'grassland',
		--node_dust = '',
		node_top = 'ground:dirt_with_grass',
		depth_top = 1,
		node_filler = 'ground:dirt',
		depth_filler = 6,
		--node_stone = '',
		--node_water_top = '',
		--depth_water_top = ,
		--node_water = '',
		--node_river_water = '',
		node_riverbed = 'ground:sand',
		depth_riverbed = 2,
		y_min = 6,
		y_max = 15,
		heat_point = 50,
		humidity_point = 35,
	})
