spawn = {}

ship_parts_colors = { -- color_name, color:value, color code
   {'Pink', 'colorize:red:125', 'p'},
   {'Green', 'colorize:green:150', 'g'},
   {'Blue', 'colorize:blue:150', 'b'},
   {'Yellow', 'colorize:orange:150', 'y'},
}

dofile(minetest.get_modpath('spawn')..'/floors.lua')
dofile(minetest.get_modpath('spawn')..'/rails.lua')
dofile(minetest.get_modpath('spawn')..'/objects.lua')
dofile(minetest.get_modpath('spawn')..'/walls.lua')
