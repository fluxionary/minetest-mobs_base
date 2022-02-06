if minetest.get_modpath("dye") and minetest.get_modpath("farming") then
    minetest.register_craft({
        output = "mobs_base:nametag",
        recipe = { { "default:paper", "dye:black", "farming:string" } }
    })
end

if minetest.get_modpath("default") and minetest.get_modpath("farming") then
    minetest.register_craft({
        output = "mobs_base:lasso",
        recipe = {
            { "farming:string", "", "farming:string" },
            { "", "default:diamond", "" },
            { "farming:string", "", "farming:string" }
        }
    })
	minetest.register_craft({
		output = "mobs_base:net",
		recipe = {
			{"group:stick", "", "group:stick"},
			{"group:stick", "", "group:stick"},
			{"farming:string", "group:stick", "farming:string"}
		}
	})
end

if minetest.get_modpath("default") then
	minetest.register_craft({
		output = "mobs_base:shears",
		recipe = {
			{"default:steel_ingot", ""},
			{"group:stick", "default:steel_ingot"}
		}
	})

	minetest.register_craft({
		output = "mobs_base:protector",
		recipe = {
			{"default:stone", "default:stone", "default:stone"},
			{"default:stone", "default:goldblock", "default:stone"},
			{"default:stone", "default:stone", "default:stone"}
		}
	})

	minetest.register_craft({
		output = "mobs_base:protector2",
		recipe = {
			{"mobs_base:protector", "default:mese_crystal", "mobs_base:protector"},
			{"default:mese_crystal", "default:diamondblock", "default:mese_crystal"},
			{"mobs_base:protector", "default:mese_crystal", "mobs_base:protector"}
		}
	})

	minetest.register_craft({
		output = "mobs_base:saddle",
		recipe = {
			{"mobs_base:leather", "mobs_base:leather", "mobs_base:leather"},
			{"mobs_base:leather", "default:steel_ingot", "mobs_base:leather"},
			{"mobs_base:leather", "default:steel_ingot", "mobs_base:leather"}
		}
	})
end

minetest.register_craft({
	output = "mobs_base:meatblock",
	recipe = {
		{"group:food_meat", "group:food_meat", "group:food_meat"},
		{"group:food_meat", "group:food_meat", "group:food_meat"},
		{"group:food_meat", "group:food_meat", "group:food_meat"}
	}
})

minetest.register_craft({
    type = "cooking",
    output = "mobs_base:meat",
    recipe = "mobs_base:meat_raw",
    cooktime = 5
})
