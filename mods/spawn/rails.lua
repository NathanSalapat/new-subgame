local colbox_rail_angle = {
   type = 'fixed',
   fixed = {
      {-.4, -.5, -.4, -.3, .3, -.3},
      {-.3, -.5, -.3, -.2, .3, -.2},
      {-.2, -.5, -.2, -.1, .3, -.1},
      {-.1, -.5, -.1, 0, .3, 0},
      {0, -.5, 0, .1, .3, .1},
      {.1, -.5, .1, .2, .3, .2},
      {.2, -.5, .2, .3, .3, .3},
      {.3, -.5, .3, .4, .3, .4},
   }
}

local colbox_rail_single = {
   type = 'fixed',
   fixed = {
      {-.5, -.5, .4, .5, .3, .5},
   }
}

local colbox_rail_double = {
   type = 'fixed',
   fixed = {
      {-.5, -.5, -.5, -.4, .3, .5},
      {.4, -.5, -.5, .5, .3, .5}
   }
}

for i in ipairs (ship_parts_colors) do
	local shipcol = ship_parts_colors[i][1]
   local shipval = ship_parts_colors[i][2]
   local shipdesc = ship_parts_colors[i][3]

   local ship_rail = {  -- description, name, model, texture, colbox
      {shipcol..' Rail Angled', shipdesc..'ra', 'rail_angle', '(spawn_rail_overlay.png^['..shipval..')', colbox_rail_angle},
      {shipcol..' Rail Single', shipdesc..'rs', 'rail_single', '(spawn_rail_overlay.png^['..shipval..')', colbox_rail_single},
      {shipcol..' Rail Double', shipdesc..'rd', 'rail_double', '(spawn_rail_overlay.png^['..shipval..')', colbox_rail_double}
   }

   for i in ipairs (ship_rail) do
      local desc = ship_rail[i][1]
      local name = ship_rail[i][2]
      local model = ship_rail[i][3]
      local tex = ship_rail[i][4]
      local colbox = ship_rail[i][5]

      minetest.register_node('spawn:'..name, {
         description = desc,
         drawtype = "mesh",
         mesh = "spawn_"..model..'.obj',
         paramtype = "light",
         paramtype2 = "facedir",
         light_source = 4,
         selection_box = colbox,
         collision_box = colbox,
         tiles = {'spawn_rail_blank.png^'..tex, 'spawn_floor_blank.png'},
         groups = {oddly_breakable_by_hand=3}
      })
   end
end
