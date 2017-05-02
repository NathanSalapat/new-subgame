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

local colbox_tube_light = {
   type = 'fixed',
   fixed = {
      {-.1, -.5, -.4, .1, -.4, .4},}}

minetest.register_node('spawn:tube_light', {
   description = 'Tube Light',
   drawtype = 'mesh',
   mesh = 'spawn_tube_light.obj',
   paramtype = 'light',
   paramtype2 = 'facedir',
   light_source = 14,
   selection_box = colbox_tube_light,
   collision_box = colbox_tube_light,
   tiles = {'spawn_tube_light.png'},
   groups = {oddly_breakable_by_hand=3},
   on_place = minetest.rotate_node,
   on_timer = function(pos)
      local node = minetest.get_node(pos)
      local timer = minetest.get_node_timer(pos)
      local time = math.random(3,15) --this timer controls the light that is off.
      minetest.set_node(pos,{name='spawn:tube_light_bad',param2=node.param2})
      timer:start(time)
   end,
})

minetest.register_node('spawn:tube_light_bad', {
   description = 'Bad Tube Light',
   drawtype = 'mesh',
   mesh = 'spawn_tube_light.obj',
   paramtype = 'light',
   paramtype2 = 'facedir',
   light_source = 1,
   selection_box = colbox_tube_light,
   collision_box = colbox_tube_light,
   tiles = {'spawn_tube_light.png'},
   groups = {oddly_breakable_by_hand=3},
   on_place = minetest.rotate_node,
   on_construct = function(pos)
      local timer = minetest.get_node_timer(pos)
      timer:start(10)
   end,
   on_timer = function(pos)
      local node = minetest.get_node(pos)
      local timer = minetest.get_node_timer(pos)
      local time = math.random(1,3) --this timer controls the light that is on.
      minetest.set_node(pos,{name='spawn:tube_light',param2=node.param2})
      timer:start(time)
   end,
})
