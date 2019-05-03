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

minetest.register_ore({
   ore_type       = 'stratum',
   ore            = 'ground:dirt',
   wherein        = 'ground:stone',
   clust_scarcity = 1,
   y_min          = 25,
   y_max          = 30,
   noise_params    = {
      offset = 27,
      scale = 4,
      spread = {x = 100, y = 100, z = 100},
      seed = 90122,
      octaves = 3,
      persist = 0.7
   },
   np_stratum_thickness = {
      offset = 8,
      scale = 4,
      spread = {x = 100, y = 100, z = 100},
      seed = 17,
      octaves = 3,
      persist = 0.7
  },
})
