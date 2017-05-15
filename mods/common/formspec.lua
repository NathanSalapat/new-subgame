-- Create the trash field
local trash = minetest.create_detached_inventory("trash", {
	-- Allow the stack to be placed and remove it in on_put()
	-- This allows the creative inventory to restore the stack
	allow_put = function(inv, listname, index, stack, player)
		return stack:get_count()
	end,
	on_put = function(inv, listname)
		inv:set_list(listname, {})
	end,
})
trash:set_size("main", 1)

common.gui_bg = 'bgcolor[#080808BB;true]'
common.gui_bg_img = 'background[5,5;1,1;gui_background.png;true]'
common.gui_slots = 'listcolors[#00000069;#5A5A5A;#141318;#30434C;#FFF]'

common.gui_survival_form = 'size[8,7.5]'..
			common.gui_bg..
			common.gui_bg_img..
			common.gui_slots..
			'list[current_player;main;0,3.5;8,1;]'..
			'list[current_player;main;0,4.5;8,3;8]'..
			'list[current_player;craft;0,0;3,3;]'..
			'list[current_player;craftpreview;4,1;1,1;]'..
			'image[3,1;1,1;common_arrow.png'..
         'image[4,3.3;1,1;creative_trash_icon.png'..
         'list[detached:trash;main;4,3.3;1,1;]'..
			'listring[current_player;main]'..
			'listring[current_player;craft]'
