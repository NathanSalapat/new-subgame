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
		meta:set_string('formspec', storage.wooden_chest_formspec(''))
		local inv = meta:get_inventory()
		inv:set_size('main', 6*3)
	end,
	can_dig = function(pos,player)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		return inv:is_empty('main')
	end,
   on_receive_fields = function(pos, formname, fields, sender)
      local meta = minetest.get_meta(pos)
		if fields ['save'] then
         meta:set_string('infotext', fields.description)
         meta:set_string('formspec', storage.wooden_chest_formspec(fields.description))
      elseif fields ['sort'] then
         storage.sort_inventory(meta:get_inventory())
      end
   end,
})
