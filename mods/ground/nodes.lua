minetest.register_node('ground:stone', {
	description = 'Stone',
	tiles = {'ground_stone.png'},
	groups = {cracky=3, stone=1, level=2},
	drop = 'ground:cobble',
})

minetest.register_node('ground:cobble', {
	description = 'Cobblestone',
	tiles = {'ground_cobble.png'},
	groups = {cracky=3, stone=1, level=1},
})

minetest.register_node('ground:gravel', {
	description = 'Gravel',
	tiles = {'ground_gravel.png'},
	groups = {crumbly=3, falling_node=1},
})


minetest.register_node('ground:dirt', {
	description = 'Dirt',
	tiles = {'ground_dirt.png'},
	groups = {crumbly=3},
})

minetest.register_node('ground:dirt_with_grass', {
	description = 'Dirt with Grass',
	tiles = {'ground_grass.png', 'ground_dirt.png',
		{name = 'ground_dirt.png^ground_grass_overlay.png',
			tileable_vertical = false}},
	groups = {crumbly=3, soil=1, spreading_dirt_type=1},
	drop = 'ground:dirt',
})

minetest.register_node('ground:dirt_with_snow', {
	description = 'Dirt with Snow',
	tiles = {'ground_snow.png', 'ground_dirt.png',
		{name = 'ground_dirt.png^ground_snow_overlay.png',
			tileable_vertical = false}},
	groups = {crumbly=3, soil=1, spreading_dirt_type=1},
	drop = 'ground:dirt',
})

minetest.register_node('ground:snowblock', {
	description = 'Snow',
	tiles = {'ground_snow.png'},
	groups = {crumbly=3},
})

minetest.register_node('ground:snow', {
	description = 'Snow',
   drawtype = 'mesh',
	mesh = '2-10-slab.obj',
   paramtype = 'light',
	paramtype2 = 'facedir',
	selection_box = {
		type = 'fixed',
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.3, 0.5},
		}
	},
	collision_box = {
		type = 'fixed',
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.3, 0.5},
		}
	},
	tiles = {'ground_snow.png'},
	groups = {crumbly=3, falling_node=1},
})

minetest.register_node('ground:ice', {
	description = 'Ice',
	tiles = {'ground_ice.png'},
	groups = {cracky=3},
})

minetest.register_node('ground:sand', {
	description = 'Sand',
	tiles = {'ground_sand.png'},
	groups = {crumbly=3, falling_node=1},
})

minetest.register_node('ground:desert_stone', {
	description = 'Desert Stone',
	tiles = {'ground_desert_stone.png'},
	groups = {cracky=3, stone=1, level=1},
	drop = 'ground:desert_cobble',
})

minetest.register_node('ground:desert_cobble', {
	description = 'Desert Cobble',
	tiles = {'ground_desert_cobble.png'},
	groups = {cracky=3, stone=1},
})

minetest.register_node('ground:desert_sand', {
	description = 'Desert Sand',
	tiles = {'ground_desert_sand.png'},
	groups = {crumbly=3, falling_node=1},
})

minetest.register_node('ground:water_source', {
	description = 'Water Source',
	drawtype = 'liquid',
	tiles = {
		{
			name = 'ground_water_source_animated.png',
			animation = {
				type = 'vertical_frames',
				aspect_w = 32,
				aspect_h = 32,
				length = 2.0,
			},
		},
	},
	alpha = 160,
	paramtype = 'light',
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = '',
	drowning = 1,
	liquidtype = 'source',
	liquid_alternative_flowing = 'ground:water_flowing',
	liquid_alternative_source = 'ground:water_source',
	liquid_viscosity = 1,
	post_effect_color = {a = 103, r = 30, g = 60, b = 90},
	groups = {water=3, liquid=3, puts_out_fire=1, cools_lava=1},
})

minetest.register_node('ground:water_flowing', {
	description = 'Flowing Water',
	drawtype = 'flowingliquid',
	tiles = {'ground_water.png'},
	special_tiles = {
		{
			name = 'ground_water_source_animated.png',
			backface_culling = false,
			animation = {
				type = 'vertical_frames',
				aspect_w = 32,
				aspect_h = 32,
				length = 0.8,
			},
		},
		{
			name = 'ground_water_source_animated.png',
			backface_culling = true,
			animation = {
				type = 'vertical_frames',
				aspect_w = 32,
				aspect_h = 32,
				length = 0.8,
			},
		},
	},
	alpha = 160,
	paramtype = 'light',
	paramtype2 = 'flowingliquid',
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = '',
	drowning = 1,
	liquidtype = 'flowing',
	liquid_alternative_flowing = 'ground:water_flowing',
	liquid_alternative_source = 'ground:water_source',
	liquid_viscosity = 1,
	post_effect_color = {a = 103, r = 30, g = 60, b = 90},
	groups = {water=3, liquid=3, puts_out_fire=1,
		not_in_creative_inventory=1, cools_lava=1},
--	sounds = default.node_sound_water_defaults(),
})
