function storage.wooden_chest_formspec(name)
   local formspec =
	'size[8,7.75]'..
	common.gui_bg..
	common.gui_bg_img..
	common.gui_slots..
	'list[current_name;main;1,0;6,3;]'..
   'image[0,3;1,1;storage_label.png]'..
   'field[1.3,3.3;2,1;description;;'..name..']'..
   'button[3,3;1,1;save;Save]'..
   'button[4,3;1,1;sort;Sort]'..
	'list[current_player;main;0,4;8,3;]'..
   'listring[]'
   return formspec
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
