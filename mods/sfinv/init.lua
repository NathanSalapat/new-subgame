dofile(minetest.get_modpath("sfinv") .. "/api.lua")

sfinv.register_page("sfinv:crafting", {
	title = "Crafting",
	get = function(self, player, context)
		return sfinv.make_formspec(player, context, [[
            list[current_player;craft;0,0;3,3;]
            list[current_player;craftpreview;4,1;1,1;]
				image[3,1;1,1;common_arrow.png]
            image[7,2;1,1;creative_trash_icon.png]
            list[detached:trash;main;7,2;1,1;]
				listring[current_player;main]
				listring[current_player;craft]
			]], true)
	end
})
