minetest.register_abm{
	nodenames = {'group:grass'},
	interval = 1,
	chance = 2,
   action = function(pos)
      local month = mymonths.month_counter
      local node_name = minetest.get_node_or_nil(pos).name
      local nodedef = minetest.registered_nodes[node_name]
      local thing_that_grows = nodedef.grows_to
      local time_of_growing = nodedef.grows_in_month
      if tonumber(month) == time_of_growing then
         if thing_that_grows ~= 'spread' then
            minetest.set_node(pos, {name = thing_that_grows})
         elseif thing_that_grows == 'spread' then
            common.plant_spread('plants:grass_1', 'plants:grass_4', pos, 2, 'ground:dirt_with_grass', 'air', 20)
         end
      end
   end,
}
