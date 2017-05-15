--Settings
mymonths = {}

--Turn damage on or off. This will make storms and hail cause damage to players
mymonths.damage = false

--You can turn weather off; this will put snow and puddles off too
mymonths.use_weather = true


--Have snow accumulate on the ground
mymonths.snow_on_ground = true

--Puddles appear when raining
mymonths.use_puddles = true


if minetest.get_modpath("lightning") then
   lightning.auto = false
end

local modpath = minetest.get_modpath("mymonths")
local input = io.open(modpath .. "/settings.txt", "r")

if input then

   dofile(modpath .. "/settings.txt")
   input:close()
   input = nil

end

dofile(modpath .. "/functions.lua")
dofile(modpath .. "/abms.lua")
dofile(modpath .. "/command.lua")
dofile(modpath .. "/months.lua")

if mymonths.use_weather == true then
   dofile(modpath .. "/weather.lua")
else
   mymonths.snow_on_ground = false
   mymonths.use_puddles = false
end

if mymonths.snow_on_ground == false then
   minetest.register_alias("mymonths:snow_cover_1", "air")
   minetest.register_alias("mymonths:snow_cover_2", "air")
   minetest.register_alias("mymonths:snow_cover_3", "air")
   minetest.register_alias("mymonths:snow_cover_4", "air")
   minetest.register_alias("mymonths:snow_cover_5", "air")
end

if mymonths.use_puddles == false then
   minetest.register_alias("mymonths:puddle", "air")
end
