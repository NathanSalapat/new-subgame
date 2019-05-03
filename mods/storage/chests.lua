minetest.register_node('storage:wooden_chest', {
	description = 'Wooden Chest',
	tiles = {'storage_wooden_chest_top.png',
      'storage_wooden_chest_top.png',
      'storage_wooden_chest_side.png',
      'storage_wooden_chest_side.png',
      'storage_wooden_chest_back.png',
      'storage_wooden_chest_front.png'},
	groups = {choppy=2,oddly_breakable_by_hand=2},
	paramtype2 = 'facedir',
--	sounds = default.node_sound_wood_defaults(),
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string('formspec', wooden_chest_formspec)
      meta:set_string('upgrade', 0)
		local inv = meta:get_inventory()
		inv:set_size('main', 18)
      inv:set_size('sort_upgrade', 1)
      inv:set_size('label_upgrade', 1)
	end,
	can_dig = function(pos,player)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		return inv:is_empty('main')
	end,
   allow_metadata_inventory_put = function(pos, listname, index, stack, player)
      local meta = minetest.get_meta(pos)
      local inv = meta:get_inventory()
      if listname == 'sort_upgrade' then
         if inv:is_empty('sort_upgrade') and stack:get_name() == 'ground:dirt' then
            return 1
         else return 0
         end
      elseif listname == 'label_upgrade' then
         if inv:is_empty('label_upgrade') and stack:get_name() == 'items:label' then
            return 1
         else return 0
         end
      else
         return 99
      end
   end,
   on_metadata_inventory_put = function(pos, listname, index, stack, player)
      local meta = minetest.get_meta(pos)
      if listname == 'sort_upgrade' then
         if stack:get_name() == ('ground:dirt') then --Needs changing to something more suitable
            local upgrade_val = tonumber(meta:get_string('upgrade'))
            local upgrade_new = upgrade_val + 1
            print ('upgrade value '..upgrade_new)
            meta:set_string('upgrade', upgrade_new)
            meta:set_string('formspec', storage.wooden_chest_formspec(pos))
         end
      end
      if listname == 'label_upgrade' then
         if stack:get_name() == ('items:label') then
            local upgrade_val = tonumber(meta:get_string('upgrade'))
            local upgrade_new = upgrade_val + 2
            print ('upgrade value '..upgrade_new)
            meta:set_string('upgrade', upgrade_new)
            meta:set_string('formspec', storage.wooden_chest_formspec(pos))
         end
      end
   end,
   on_metadata_inventory_take = function(pos, listname, index, stack, player)
      local meta = minetest.get_meta(pos)
      if listname == 'sort_upgrade' then
         if stack:get_name() == ('ground:dirt') then
            local upgrade_val = tonumber(meta:get_string('upgrade'))
            local upgrade_new = upgrade_val - 1
            print ('upgrade value '..upgrade_new)
            meta:set_string('upgrade', upgrade_new)
            meta:set_string('formspec', storage.wooden_chest_formspec(pos))
         end
      elseif listname == 'label_upgrade' then
         if stack:get_name() == ('items:label') then
            local upgrade_val = tonumber(meta:get_string('upgrade'))
            local upgrade_new = upgrade_val - 2
            print ('upgrade value '..upgrade_new)
            meta:set_string('upgrade', upgrade_new)
            meta:set_string('infotext', '')
            meta:set_string('formspec', storage.wooden_chest_formspec(pos))
         end
      end
   end,
   allow_metadata_inventory_move = function (pos, from_list, from_index, to_list, to_index, count, player)
      local meta = minetest.get_meta(pos)
      local inv = meta:get_inventory()
      local stack = inv:get_stack(from_list, from_index)
      if to_list == 'sort_upgrade' then
         if inv:is_empty('sort_upgrade') and stack:get_name() == ('ground:dirt') then
            return 1
            else return 0
            end
      elseif to_list == 'label_upgrade' then
         if inv:is_empty('label_upgrade') and stack:get_name() == ('items:label') then
            return 1
            else return 0
            end
         else
         return 99
      end
   end,
   on_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
      local meta = minetest.get_meta(pos)
      local inv = meta:get_inventory()
      if from_list == 'sort_upgrade' then
         local upgrade_val = tonumber(meta:get_string('upgrade'))
         local upgrade_new = upgrade_val - 1
         print ('upgrade value '..upgrade_new)
         meta:set_string('upgrade', upgrade_new)
         meta:set_string('formspec', storage.wooden_chest_formspec(pos))
      elseif from_list == 'label_upgrade' then
         local upgrade_val = tonumber(meta:get_string('upgrade'))
         local upgrade_new = upgrade_val - 2
         print ('upgrade value '..upgrade_new)
         meta:set_string('upgrade', upgrade_new)
         meta:set_string('formspec', storage.wooden_chest_formspec(pos))
      end
      if to_list == 'sort_upgrade' then
         local stack = inv:get_stack(to_list, to_index)
         if stack:get_name() == ('ground:dirt') then
            local upgrade_val = tonumber(meta:get_string('upgrade'))
            local upgrade_new = upgrade_val + 1
            print ('upgrade value '..upgrade_new)
            meta:set_string('upgrade', upgrade_new)
            meta:set_string('formspec', storage.wooden_chest_formspec(pos))
         end
      elseif to_list == 'label_upgrade' then
         local stack = inv:get_stack(to_list, to_index)
         if stack:get_name() == ('items:label') then
            local upgrade_val = tonumber(meta:get_string('upgrade'))
            local upgrade_new = upgrade_val + 2
            print ('upgrade value '..upgrade_new)
            meta:set_string('upgrade', upgrade_new)
            meta:set_string('formspec', storage.wooden_chest_formspec(pos))
         end
      end
   end,
   on_receive_fields = function(pos, formname, fields, sender)
      local meta = minetest.get_meta(pos)
		if fields ['save'] then
         meta:set_string('infotext', fields.description)
         meta:set_string('formspec', storage.wooden_chest_formspec(pos, fields.description))
      elseif fields ['sort'] then
         storage.sort_inventory(meta:get_inventory())
      end
   end,
})
