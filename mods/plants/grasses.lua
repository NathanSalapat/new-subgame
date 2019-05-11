local grasses_group = {flora=1, grass=1, dig_immediate=3, attached_node=1, flamable=3, not_in_creative=1}

minetest.register_node('plants:grass_1', {
	description = 'Grass',
	tiles = {'plants_grass_1.png'},
   drawtype = 'plantlike',
   inventory_image = "plants_grass_4.png",
	wield_image = "plants_grass_4.png",
	groups = grasses_group,
	drop = 'plants:fiber',
   waving = 1,
   walkable = false,
   sunlight_propagates = true,
   buildable_to = true,
   paramtype = 'light',
   selection_box = plants.grass_sel,
   grows_in_month = 5,
   grows_to = 'plants:grass_2',
})

minetest.register_node('plants:grass_2', {
	description = 'Grass',
	tiles = {'plants_grass_2.png'},
   drawtype = 'plantlike',
	groups = grasses_group,
	drop = 'plants:fiber',
   waving = 1,
   walkable = false,
   sunlight_propagates = true,
   buildable_to = true,
   paramtype = 'light',
   selection_box = plants.grass_sel,
   grows_in_month = 6,
   grows_to = 'plants:grass_3',
})

minetest.register_node('plants:grass_3', {
	description = 'Grass',
	tiles = {'plants_grass_3.png'},
   drawtype = 'plantlike',
	groups = grasses_group,
	drop = 'plants:fiber',
   waving = 1,
   walkable = false,
   sunlight_propagates = true,
   buildable_to = true,
   paramtype = 'light',
   selection_box = plants.grass_sel,
   grows_in_month = 7,
   grows_to = 'plants:grass_4',
})

minetest.register_node('plants:grass_4', {
	description = 'Grass',
	tiles = {'plants_grass_4.png'},
   drawtype = 'plantlike',
	groups = grasses_group,
	drop = 'plants:fiber',
   waving = 1,
   walkable = false,
   sunlight_propagates = true,
   buildable_to = true,
   paramtype = 'light',
   selection_box = plants.grass_sel,
   grows_in_month = 7,
   grows_to = 'plants:grass_5',
})


minetest.register_node('plants:grass_5', {
	description = 'Seeding Grass',
	tiles = {'plants_grass_5.png'},
   drawtype = 'plantlike',
	groups = grasses_group,
	drop = 'plants:fiber',
   waving = 1,
   walkable = false,
   sunlight_propagates = true,
   buildable_to = true,
   paramtype = 'light',
   selection_box = plants.grass_sel,
   grows_in_month = 8,
   grows_to = 'spread',

})
