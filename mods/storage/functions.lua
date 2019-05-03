function storage.wooden_chest_formspec(pos, name)
   local meta = minetest.get_meta(pos)
   local existing_name = meta:get_string('infotext')
   name = name or existing_name

   local label = 'image[0,4;1,1;storage_label.png]'..
   'field[1.3,4.3;2,1;description;;'..name..']'..
   'button[3,4;1,1;save;Save]'

   local sort = 'button[4,4;1,1;sort;Sort]'

   local base =
	'size[8,7.75]'..
	common.gui_bg..
	common.gui_bg_img..
	common.gui_slots..
   'label[.5,.25;Upgrades]'..
   'image[2,0;1,1;storage_label_outline.png]'..
   'list[current_name;label_upgrade;2,0;1,1]'..
   'list[current_name;sort_upgrade;3,0;1,1]'..
	'list[current_name;main;1,1;6,3;]'..
	'list[current_player;main;0,5;8,3;]'..
   'listring[]'

   local upgrade_tier = tonumber(meta:get_string('upgrade'))
   if upgrade_tier == 0 then
      local formspec =
      base
      return formspec
   elseif upgrade_tier == 1 then --Sorting
      local formspec =
      base..sort
      return formspec
   elseif upgrade_tier == 2 then --Labeling
      local formspec =
      base..label
      return formspec
   elseif upgrade_tier == 3 then --Sorting & Labeling
      local formspec =
      base..label..sort
      return formspec
   end
end

function storage.sort_inventory(inv)  -- Copied from the Technic_chests mod.
	local inlist = inv:get_list("main")
	local typecnt = {}
	local typekeys = {}
	for _, st in ipairs(inlist) do
		if not st:is_empty() then
			local n = st:get_name()
			local w = st:get_wear()
			local m = st:get_metadata()
			local k = string.format("%s %05d %s", n, w, m)
			if not typecnt[k] then
				typecnt[k] = {
					name = n,
					wear = w,
					metadata = m,
					stack_max = st:get_stack_max(),
					count = 0,
				}
				table.insert(typekeys, k)
			end
			typecnt[k].count = typecnt[k].count + st:get_count()
		end
	end
	table.sort(typekeys)
	local outlist = {}
	for _, k in ipairs(typekeys) do
		local tc = typecnt[k]
		while tc.count > 0 do
			local c = math.min(tc.count, tc.stack_max)
			table.insert(outlist, ItemStack({
				name = tc.name,
				wear = tc.wear,
				metadata = tc.metadata,
				count = c,
			}))
			tc.count = tc.count - c
		end
	end
	if #outlist > #inlist then return end
	while #outlist < #inlist do
		table.insert(outlist, ItemStack(nil))
	end
	inv:set_list("main", outlist)
end
