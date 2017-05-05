minetest.register_node('spawn:window', {
   description = 'Floor',
   drawtype = "mesh",
   mesh = 'spawn_window_corner.obj',
   paramtype = "light",
   paramtype2 = "facedir",
--   selection_box = colbox_floor,
--   collision_box = colbox_floor,
   tiles = {'spawn_wall.png', 'black.png'},
   groups = {oddly_breakable_by_hand=3}
})

minetest.register_node('spawn:wall', {
   description = "Wall",
   tiles = {'spawn_wall.png'},
   groups = {oddly_breakable_by_hand=3}
})
