minetest.register_decoration({
		deco_type = "simple",
		place_on = {"ground:dirt_with_grass"},
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = 0.02,
			spread = {x = 100, y = 100, z = 100},
			seed = 219,
			octaves = 3,
			persist = 0.6
		},
		y_min = 1,
		y_max = 30,
		decoration = "plants:grass_1",
})
