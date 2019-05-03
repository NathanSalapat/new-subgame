minetest.register_node('plants:grass_1', {
	description = 'grass',
	tiles = {'plants_grass_1.png'},
   drawtype = 'plantlike',
   inventory_image = "plants_grass_4.png",
	wield_image = "plants_grass_4.png",
	groups = {flora=1, grass=1, oddly_breakable_by_hand=1, attached_node=1},
	drop = 'plants:grass_1',
   waving = 1,
   walkable = false,
   sunlight_propagates = true,
   buildable_to = true,
   paramtype = 'light',
   selection_box = plants.grass_sel,
   on_place = function(itemstack, placer, pointed_thing)
      local stack = ItemStack('plants:grass_' .. math.random(1,4))
      local ret = minetest.item_place(stack, placer, pointed_thing)
      return ItemStack('plants:grass_1 '.. itemstack:get_count() - (1 - ret:get_count()))
   end
})

minetest.register_node('plants:grass_2', {
	description = 'grass',
	tiles = {'plants_grass_2.png'},
   drawtype = 'plantlike',
	groups = {flora=1, grass=1, oddly_breakable_by_hand=1, attached_node=1},
	drop = 'plants:grass_1',
   waving = 1,
   walkable = false,
   sunlight_propagates = true,
   buildable_to = true,
   paramtype = 'light',
   selection_box = plants.grass_sel,
})

minetest.register_node('plants:grass_3', {
	description = 'grass',
	tiles = {'plants_grass_3.png'},
   drawtype = 'plantlike',
	groups = {flora=1, grass=1, oddly_breakable_by_hand=1, attached_node=1},
	drop = 'plants:grass_1',
   waving = 1,
   walkable = false,
   sunlight_propagates = true,
   buildable_to = true,
   paramtype = 'light',
   selection_box = plants.grass_sel,
})

minetest.register_node('plants:grass_4', {
	description = 'grass',
	tiles = {'plants_grass_4.png'},
   drawtype = 'plantlike',
	groups = {flora=1, grass=1, oddly_breakable_by_hand=1, attached_node=1},
	drop = 'plants:grass_1',
   waving = 1,
   walkable = false,
   sunlight_propagates = true,
   buildable_to = true,
   paramtype = 'light',
   selection_box = plants.grass_sel,
})
