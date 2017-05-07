gamer = {}

-- GUI related stuff
gamer.gui_bg = 'bgcolor[#080808BB;true]'
gamer.gui_bg_img = 'background[5,5;1,1;gui_background.png;true]'
gamer.gui_slots = 'listcolors[#00000069;#5A5A5A;#141318;#30434C;#FFF]'

gamer.gui_survival_form = 'size[8,7.5]'..
			gamer.gui_bg..
			gamer.gui_bg_img..
			gamer.gui_slots..
			'list[current_player;main;0,3.5;8,1;]'..
			'list[current_player;main;0,4.5;8,3;8]'..
			'list[current_player;craft;0,0;3,3;]'..
			'list[current_player;craftpreview;4,1;1,1;]'..
			'image[3,1;1,1;gui_furnace_arrow_bg.png^[transformR270]'..
			'listring[current_player;main]'..
			'listring[current_player;craft]'

minetest.register_item(':', {
	type = 'none',
	wield_image = 'wieldhand.png',
	wield_scale = {x=1,y=1,z=2.5},
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level = 0,
		groupcaps = {
			crumbly = {times={[2]=3.00, [3]=0.70}, uses=0, maxlevel=1},
			snappy = {times={[3]=0.40}, uses=0, maxlevel=1},
			oddly_breakable_by_hand = {times={[1]=3.50,[2]=2.00,[3]=0.10}, uses=0},
         cracky = {times={[3]=0.40, [4]=0.30,}, uses=0, maxlevel=2},
         spawn = {times={[1]=.1,}, uses=0}
		},
		damage_groups = {fleshy=1},
	}
})

gamer.registered_player_models = { }

-- Local for speed.
local models = gamer.registered_player_models

function gamer.player_register_model(name, def)
	models[name] = def
end

-- Default player appearance
gamer.player_register_model('gamer_model.b3d', {
	animation_speed = 30,
	textures = {'gamer_skin.png', },
	animations = {
		-- Standard animations.
		stand     = { x=  0, y= 79, },
		lay       = { x=162, y=166, },
		walk      = { x=168, y=187, },
		mine      = { x=189, y=198, },
		walk_mine = { x=200, y=219, },
		sit       = { x= 81, y=160, },
	},
})

-- Player stats and animations
local player_model = {}
local player_textures = {}
local player_anim = {}
local player_sneak = {}
gamer.player_attached = {}

function gamer.player_get_animation(player)
	local name = player:get_player_name()
	return {
		model = player_model[name],
		textures = player_textures[name],
		animation = player_anim[name],
	}
end

-- Called when a player's appearance needs to be updated
function gamer.player_set_model(player, model_name)
	local name = player:get_player_name()
	local model = models[model_name]
	if model then
		if player_model[name] == model_name then
			return
		end
		player:set_properties({
			mesh = model_name,
			textures = player_textures[name] or model.textures,
			visual = 'mesh',
			visual_size = model.visual_size or {x=1, y=1},
		})
		gamer.player_set_animation(player, 'stand')
	else
		player:set_properties({
			textures = { 'player.png', 'player_back.png', },
			visual = 'upright_sprite',
		})
	end
	player_model[name] = model_name
end

function gamer.player_set_textures(player, textures)
	local name = player:get_player_name()
	player_textures[name] = textures
	player:set_properties({textures = textures,})
end

function gamer.player_set_animation(player, anim_name, speed)
	local name = player:get_player_name()
	if player_anim[name] == anim_name then
		return
	end
	local model = player_model[name] and models[player_model[name]]
	if not (model and model.animations[anim_name]) then
		return
	end
	local anim = model.animations[anim_name]
	player_anim[name] = anim_name
	player:set_animation(anim, speed or model.animation_speed, animation_blend)
end

-- Update appearance when the player joins
minetest.register_on_joinplayer(function(player)
	gamer.player_attached[player:get_player_name()] = false
	gamer.player_set_model(player, 'gamer_model.b3d')
	player:set_local_animation({x=0, y=79}, {x=168, y=187}, {x=189, y=198}, {x=200, y=219}, 30)

	-- set GUI
	if not minetest.setting_getbool('creative_mode') then
		player:set_inventory_formspec(gamer.gui_survival_form)
	end
	player:hud_set_hotbar_image('gui_hotbar.png')
	player:hud_set_hotbar_selected_image('gui_hotbar_selected.png')
end)

minetest.register_on_leaveplayer(function(player)
	local name = player:get_player_name()
	player_model[name] = nil
	player_anim[name] = nil
	player_textures[name] = nil
end)

-- Localize for better performance.
local player_set_animation = gamer.player_set_animation
local player_attached = gamer.player_attached

-- Check each player and apply animations
minetest.register_globalstep(function(dtime)
	for _, player in pairs(minetest.get_connected_players()) do
		local name = player:get_player_name()
		local model_name = player_model[name]
		local model = model_name and models[model_name]
		if model and not player_attached[name] then
			local controls = player:get_player_control()
			local walking = false
			local animation_speed_mod = model.animation_speed or 30

			-- Determine if the player is walking
			if controls.up or controls.down or controls.left or controls.right then
				walking = true
			end

			-- Determine if the player is sneaking, and reduce animation speed if so
			if controls.sneak then
				animation_speed_mod = animation_speed_mod / 2
			end

			-- Apply animations based on what the player is doing
			if player:get_hp() == 0 then
				player_set_animation(player, 'lay')
			elseif walking then
				if player_sneak[name] ~= controls.sneak then
					player_anim[name] = nil
					player_sneak[name] = controls.sneak
				end
				if controls.LMB then
					player_set_animation(player, 'walk_mine', animation_speed_mod)
				else
					player_set_animation(player, 'walk', animation_speed_mod)
				end
			elseif controls.LMB then
				player_set_animation(player, 'mine')
			else
				player_set_animation(player, 'stand', animation_speed_mod)
			end
		end
	end
end)
