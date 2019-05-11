-- This function does random spreading of plants, designed specifically to use with grasses and weeds.
-- It's mostly self explanitory, but the fill ratio can be tricky, so I'll explain how that works.
-- Maxspread is how far the child node can be from the parent in either direction.
-- Needed_air is how much air space should be preserved. Calculate this value in the following manner.
-- Double maxspread, add one, then square. How much air do you want in that space, fill that value in the needed_air variable.

function common.plant_spread(baby_plant, parent_plant, pos, maxspread, undernode, replacing, needed_air)
   local ran_num = math.random(1,8)
   local spreadx = math.random(0,maxspread)
   local spready = math.random(0,maxspread)
   local location = {}
   if ran_num == 1 then
      location = {x=pos.x+spreadx, y=pos.y, z=pos.z}
   elseif ran_num == 2 then
      location = {x=pos.x+spreadx, y=pos.y, z=pos.z+spready}
   elseif ran_num == 3 then
      location = {x=pos.x, y=pos.y, z=pos.z+spready}
   elseif ran_num == 4 then
      location = {x=pos.x-spreadx, y=pos.y, z=pos.z+spready}
   elseif ran_num == 5 then
      location = {x=pos.x-spreadx, y=pos.y, z=pos.z}
   elseif ran_num == 6 then
      location = {x=pos.x-spreadx, y=pos.y, z=pos.z-spready}
   elseif ran_num == 7 then
      location = {x=pos.x, y=pos.y, z=pos.z-spready}
   elseif ran_num == 8 then
      location = {x=pos.x+spreadx, y=pos.y, z=pos.z-spready}
   end
   local under_location = ({x=location.x, y=location.y-1, z=location.z})
   local under_name = minetest.get_node_or_nil(under_location)
   local location_name = minetest.get_node_or_nil(location)
   if under_name == nil then
      print 'node does not exist'
      return -- Should under_name somehow not be a node this will keep the script from crashing.
   end
   if under_name.name == undernode then
      print 'name matches.'
      if location_name.name == replacing then
         local diff = maxspread
         local pos1 = {x=location.x+diff, y=location.y, z=location.z+diff}
   		local pos0 = {x=location.x-diff, y=location.y, z=location.z-diff}
   		local air = minetest.find_nodes_in_area(pos0, pos1, replacing) --looking for item that is being replaced. Usually air
         local open_spaces = #air
         if open_spaces > needed_air then
            minetest.set_node(location, {name = baby_plant})
            minetest.set_node(pos, {name = parent_plant})
         end
      end
   end
end
