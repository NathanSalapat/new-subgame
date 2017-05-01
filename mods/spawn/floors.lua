local colbox_floor = {
   type = 'fixed',
   fixed = {
      {-.5, .3, -.5, .5, .5, .5},
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
   groups = {oddly_breakable_by_hand=3}
})

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
         groups = {oddly_breakable_by_hand=3}
      })
   end
end
