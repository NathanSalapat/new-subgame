minetest.register_ore({
   ore_type       = 'scatter',
   ore            = 'metals:stone_with_iron',
   wherein        = 'ground:stone',
   clust_scarcity = 8 * 8 * 8,
   clust_num_ores = 12,
   clust_size     = 3,
   y_min          = -31000,
   y_max          = 0,
})

minetest.register_ore({
   ore_type       = 'scatter',
   ore            = 'metals:stone_with_iron2',
   wherein        = 'metals:stone_with_iron',
   clust_scarcity = 4 * 4 * 4,
   clust_num_ores = 12,
   clust_size     = 3,
   y_min          = -31000,
   y_max          = -50,
})
