minetest.register_abm({
   label = 'grass spread',
   nodenames = {'ground:dirt'},
   neighbors = {'ground:dirt_with_grass'},
   interval = 3,
   chance = 2,
   action = function(pos)
      local above_node = {x=pos.x, y=pos.y+1, z=pos.z}
      local above_node_name = minetest.get_node_or_nil(above_node).name
      local nodedef = minetest.registered_nodes[above_node_name]
      if nodedef.sunlight_propagates then
         minetest.add_node(pos, {name = 'ground:dirt_with_grass'})
      end
   end,
})

minetest.register_abm({
   nodenames = {'ground:dirt_with_grass'},
   interval = 3,
   chance = 2,
   action = function(pos)
      local above_node = {x=pos.x, y=pos.y+1, z=pos.z}
      local above_node_name = minetest.get_node_or_nil(above_node).name
      local nodedef = minetest.registered_nodes[above_node_name]
      if not nodedef.sunlight_propagates then
         minetest.add_node(pos, {name = 'ground:dirt'})
      end
   end,
})
