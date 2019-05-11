local colbox_floor = {
   type = 'fixed',
   fixed = {
      {-.5, .3, -.5, .5, .5, .5},
   }
}

local colbox_floor_edge = {
   type = 'fixed',
   fixed = {
      {-.5, .3, -.5, .5, .5, .5},
   }
}

local colbox_floor_square = {
   type = 'fixed',
   fixed = {
      {-.5, .4, -.5, .5, .5, .5},
   }
}

local colbox_floor_angle = {
   type = 'fixed',
   fixed = {
      {.25, .4, 0, .5, .5, .25},
      {0, .4, -.5, .5, .5, 0},
      {-.25, .4, -.25, 0, .5, -.5}
   }
}

local colbox_ramp_1 = {
   type = 'fixed',
   fixed = {
      {-.5, -.5, 0, .5, 0, .5},
      {-.5, -.5, -.5, .5, -.25, 0},
   }
}

minetest.register_node('spawn:floor', {
   description = 'Floor',
   drawtype = "mesh",
   mesh = 'spawn_floor.obj',
   paramtype = "light",
   paramtype2 = "facedir",
   light_source = 2,
   selection_box = colbox_floor,
   collision_box = colbox_floor,
   tiles = {'spawn_floor_blank.png'},
   groups = {spawn=1}
})

minetest.register_node('spawn:ramp1', {
   description = 'Ramp Bottom',
   drawtype = "mesh",
   mesh = 'spawn_ramp-1.obj',
   paramtype = "light",
   paramtype2 = "facedir",
   light_source = 2,
   selection_box = colbox_ramp_1,
   collision_box = colbox_ramp_1,
   tiles = {'spawn_floor_blank.png'},
   groups = {spawn=1}
})

minetest.register_node('spawn:ramp2', {
   description = 'Ramp Top',
   drawtype = "mesh",
   mesh = 'spawn_ramp-2.obj',
   paramtype = "light",
   paramtype2 = "facedir",
   light_source = 2,
   selection_box = common.colbox_stair,
   collision_box = common.colbox_stair,
   tiles = {'spawn_floor_blank.png'},
   groups = {spawn=1}
})

minetest.register_node('spawn:stairs', {
   description = 'Stairs',
   drawtype = "mesh",
   mesh = 'spawn_stairs.obj',
   paramtype = "light",
   paramtype2 = "facedir",
   selection_box = common.colbox_stair,
   collision_box = common.colbox_stair,
   tiles = {'spawn_rail_blank.png', 'spawn_floor_blank.png'},
   groups = {spawn=1}
})

for i in ipairs (ship_parts_colors) do
	local shipcol = ship_parts_colors[i][1]
   local shipval = ship_parts_colors[i][2]
   local shipdesc = ship_parts_colors[i][3]

   local ship_floor = { -- description, name, model, texture, colbox
   {shipcol..' Walkway Inside Corner', shipdesc..'eic', 'edge_incorner', '(spawn_ship_floor_corner_inside.png^['..shipval..')', colbox_floor_edge},
   {shipcol..' Walkway Outside Corner', shipdesc..'eoc', 'edge_outcorner', '(spawn_ship_floor_outcorn.png^['..shipval..')', colbox_floor_edge},
   {shipcol..' Walkway Edge', shipdesc..'es', 'edge_straight', '(spawn_ship_floor.png^['..shipval..')', colbox_floor_edge},
   {shipcol..' Floor Angle', shipdesc..'fa', 'floor_angle', '(spawn_ship_floor_angle.png^['..shipval..')', colbox_floor_angle},
   {shipcol..' Floor Square', shipdesc..'fs', 'floor_square', '(spawn_ship_floor_double.png^['..shipval..')', colbox_floor_square},
   {shipcol..' Ramp Top Right', shipdesc..'r2r', 'ramp-2', '(spawn_ship_floor.png^['..shipval..')^[transform2', common.colbox_stair},
   {shipcol..' Ramp Bottom Right', shipdesc..'r1r', 'ramp-1', '(spawn_ship_floor.png^['..shipval..')^[transform2', colbox_ramp_1},
   {shipcol..' Ramp Top Left', shipdesc..'r2l', 'ramp-2', '(spawn_ship_floor.png^['..shipval..')', common.colbox_stair},
   {shipcol..' Ramp Bottom Left', shipdesc..'r1l', 'ramp-1', '(spawn_ship_floor.png^['..shipval..')', colbox_ramp_1}
   }

   for i in ipairs (ship_floor) do
	   local desc = ship_floor[i][1]
      local name = ship_floor[i][2]
      local model = ship_floor[i][3]
      local tex = ship_floor[i][4]
      local colbox = ship_floor[i][5]

      minetest.register_node('spawn:'..name, {
         description = desc,
         drawtype = "mesh",
         mesh = "spawn_"..model..'.obj',
         paramtype = "light",
         paramtype2 = "facedir",
         light_source = 2,
         selection_box = colbox,
         collision_box = colbox,
         tiles = {'spawn_floor_blank.png^'..tex, 'spawn_floor_blank.png'},
         groups = {spawn=1}
      })
   end
end
