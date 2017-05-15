--Privs
minetest.register_privilege("msg", {
	description = "private message players.",
	give_to_singleplayer = false
})

--Commands
minetest.register_chatcommand("msg", {
	params = "<name> <message>",
	description = "Send a private message",
	privs = {msg=true},
	func = function(name, param)
		local sendto, message = param:match("^(%S+)%s(.+)$")
		if not sendto then
			return false, "Invalid usage, see /help msg."
		end
		if not core.get_player_by_name(sendto) then
			return false, "The player " .. sendto
					.. " is not online."
		end
		core.log("action", "PM from " .. name .. " to " .. sendto
				.. ": " .. message)
		core.chat_send_player(sendto, "PM from " .. name .. ": "
				.. message)
		return true, "Message sent."
	end,
})
