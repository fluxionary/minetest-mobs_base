local modname = minetest.get_current_modname()
local modpath = minetest.get_modpath(modname)

mobs_base = {
	modname = modname,
	modpath = modpath,
	S = minetest.get_translator("mobs_animal"),
	log = function(level, messagefmt, ...)
		minetest.log(level, ("[%s] %s"):format(modname, messagefmt:format(...)))
	end,
}

dofile(modpath .. "/settings.lua")

-- dofile(modpath .. "/mob_reset_stick.lua")  -- TODO: not ported
dofile(modpath .. "/craftitems.lua")
dofile(modpath .. "/crafts.lua")
dofile(modpath .. "/aliases.lua")

dofile(modpath .. "/compat/init.lua")
dofile(modpath .. "/logic/init.lua")
dofile(modpath .. "/api/init.lua")
