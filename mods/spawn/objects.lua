minetest.register_node('spawn:ladder', {
   description = 'Ladder',
   drawtype = 'mesh',
   mesh = 'spawn_ladder.obj',
   paramtype = 'light',
   paramtype2 = 'facedir',
   climbable = true,
   selection_box = {
      type = 'fixed',
         fixed = {
            {-.4, -.5, .3, .4, .5, .5},},
   },
   collision_box = {
      type = 'fixed',
         fixed = {
            {-.4, -.5, .3, .4, .5, .5},},
   },
   tiles = {'spawn_rail_blank.png', 'spawn_floor_blank.png'},
   groups = {oddly_breakable_by_hand=3}
})

local colbox_console = {
   type = 'fixed',
   fixed = {
      {-.5, -.5, -.5, .5, .2, .5},}}

minetest.register_node('spawn:console1', {
   description = 'Console',
   drawtype = 'mesh',
   mesh = 'spawn_console.obj',
   paramtype = 'light',
   paramtype2 = 'facedir',
   light_source = 2,
   selection_box = colbox_console,
   collision_box = colbox_console,
   tiles = {'spawn_floor_blank.png', 'spawn_console_top1.png', 'spawn_console_front.png'},
   groups = {oddly_breakable_by_hand=3}
})

minetest.register_node('spawn:console2', {
   description = 'Console',
   drawtype = 'mesh',
   mesh = 'spawn_console.obj',
   paramtype = 'light',
   paramtype2 = 'facedir',
   light_source = 3,
   selection_box = colbox_console,
   collision_box = colbox_console,
   tiles = {'spawn_floor_blank.png', 'spawn_console_top2.png', 'spawn_console_front.png'},
   groups = {oddly_breakable_by_hand=3}
})

minetest.register_node('spawn:console3', {
   description = 'Console',
   drawtype = 'mesh',
   mesh = 'spawn_console.obj',
   paramtype = 'light',
   paramtype2 = 'facedir',
   light_source = 2,
   selection_box = colbox_console,
   collision_box = colbox_console,
   tiles = {'spawn_floor_blank.png', 'spawn_console_top3.png', 'spawn_console_front.png'},
   groups = {oddly_breakable_by_hand=3}
})
