minetest.register_node('spawn:window_corner', {
   description = 'Window Corner',
   drawtype = "mesh",
   mesh = 'spawn_window_corner.obj',
   paramtype = "light",
   paramtype2 = "facedir",
--   selection_box = colbox_floor,
--   collision_box = colbox_floor,
   tiles = {'spawn_wall.png', 'black.png'},
   groups = {spawn=1}
})

minetest.register_node('spawn:window_panel', {
   description = 'Window Panel',
   drawtype = "mesh",
   mesh = 'spawn_window_panel.obj',
   paramtype = "light",
   paramtype2 = "facedir",
--   selection_box = colbox_floor,
--   collision_box = colbox_floor,
   tiles = {'spawn_stars1.png'},
   groups = {spawn=1}
})

minetest.register_node('spawn:wall', {
   description = "Wall",
   tiles = {'spawn_wall.png'},
   groups = {spawn=1}
})
