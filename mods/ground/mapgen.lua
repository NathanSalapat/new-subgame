minetest.register_alias('mapgen_stone', 'ground:stone')
minetest.register_alias('mapgen_dirt', 'ground:dirt')
minetest.register_alias('mapgen_dirt_with_grass', 'ground:dirt_with_grass')
minetest.register_alias('mapgen_sand', 'ground:sand')
minetest.register_alias('mapgen_water_source', 'ground:water_source')
minetest.register_alias('mapgen_river_water_source', 'ground:water_source')
minetest.register_alias('mapgen_lava_source', 'default:lava_source')
minetest.register_alias('mapgen_gravel', 'ground:gravel')
minetest.register_alias('mapgen_desert_stone', 'ground:desert_stone')
minetest.register_alias('mapgen_desert_sand', 'ground:desert_sand')
minetest.register_alias('mapgen_dirt_with_snow', 'ground:dirt_with_snow')
minetest.register_alias('mapgen_snowblock', 'ground:snowblock')
minetest.register_alias('mapgen_snow', 'ground:snow')
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
		y_min = 6, --lowest point possible for biome to exist.
		y_max = 15, --highest point possible for biome to exist.
		heat_point = 50,
		humidity_point = 35,
	})

minetest.register_biome({
      name = "grassland_dunes",
      --node_dust = "",
      node_top = "ground:dirt_with_grass",
      depth_top = 1,
      node_filler = "ground:dirt_with_grass",
      depth_filler = 2,
      --node_stone = "",
      --node_water_top = "",
      --depth_water_top = ,
      --node_water = "",
      --node_river_water = "",
      node_riverbed = "ground:sand",
      depth_riverbed = 2,
      y_min = 20,
      y_max = 5,
      heat_point = 50,
      humidity_point = 45,
})

minetest.register_biome({
      name = "desert",
      --node_dust = "",
      node_top = "ground:desert_sand",
      depth_top = 1,
      node_filler = "ground:desert_sand",
      depth_filler = 1,
      node_stone = "ground:desert_stone",
      --node_water_top = "",
      --depth_water_top = ,
      --node_water = "",
      --node_river_water = "",
      node_riverbed = "ground:sand",
      depth_riverbed = 2,
      y_min = 30,
      y_max = -10,
      heat_point = 92,
      humidity_point = 16,
})

minetest.register_biome({
   name = 'snowy_tundra',
   node_top = 'ground:dirt_with_snow',
   depth_top = 1,
   node_filler = 'ground:dirt',
   depth_filler = 4,
   node_stone = 'ground:stone',
   node_riverbed = 'ground:sand',
   depth_riverbed = 1,
   y_min = 12,
   y_max = 20,
   heat_point = 10,
   humidity_point = 47,
})

minetest.register_biome({
   name = 'beach',
   node_top = 'ground:sand',
   depth_top = 4,
   node_filler = 'ground:gravel',
   depth_filler = 10,
   node_riverbed = 'ground:dirt',
   depth_riverbed = 2,
   vertical_blend = 3,
   y_min = -5,
   y_max = 5,
   heat_point = 65,
   humidity_point = 70,
})

minetest.register_biome({
   name = 'stone',
   node_top = 'ground:stone',
   depth_top = 1,
   node_filler = 'ground:stone',
   depth_filler = 4,
   node_stone = 'ground:stone',
   node_riverbed = 'ground:stone',
   depth_riverbed = 1,
   y_min = 20,
   y_max = 80,
   heat_point = 10,
   humidity_point = 47,
})
