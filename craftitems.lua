local S = mobs_base.S

minetest.register_craftitem("mobs_base:leather", {
        description = S("Leather"),
        inventory_image = "mobs_base_leather.png",
        groups = {flammable = 2, leather = 1}
})

minetest.register_craftitem("mobs_base:saddle", {
	description = S("Saddle"),
	inventory_image = "mobs_base_saddle.png",
	groups = {flammable = 2, saddle = 1}
})

minetest.register_craftitem("mobs_base:nametag", {
        description = S("Name Tag"),
        inventory_image = "mobs_base_nametag.png",
        groups = {flammable = 2, nametag = 1}
})

minetest.register_craftitem("mobs_base:protector", {
	description = S("Mob Protection Rune"),
	inventory_image = "mobs_base_protector.png",
	groups = {flammable = 2}
})

minetest.register_craftitem("mobs_base:protector2", {
	description = S("Mob Protection Rune (Level 2)"),
	inventory_image = "mobs_base_protector2.png",
	groups = {flammable = 2}
})

-- food
minetest.register_craftitem("mobs_base:meat_raw", {
	description = S("Raw Meat"),
	inventory_image = "mobs_base_meat_raw.png",
	on_use = minetest.item_eat(3),
	groups = {food_meat_raw = 1, flammable = 2}
})

minetest.register_craftitem("mobs_base:meat", {
	description = S("Meat"),
	inventory_image = "mobs_base_meat.png",
	on_use = minetest.item_eat(8),
	groups = {food_meat = 1, flammable = 2}
})

minetest.register_node("mobs_base:meatblock", {
	description = S("Meat Block"),
	tiles = {"mobs_base_meat_top.png", "mobs_base_meat_bottom.png", "mobs_base_meat_side.png"},
	paramtype2 = "facedir",
	groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2},
	sounds = minetest.get_modpath("default") and default.node_sound_leaves_defaults(),
	on_place = minetest.rotate_node,
	on_use = minetest.item_eat(20)
})

-- tools
minetest.register_tool("mobs_base:lasso", {
	description = S("Lasso (right-click animal to put in inventory)"),
	inventory_image = "mobs_base_magic_lasso.png",
	groups = {flammable = 2}
})

minetest.register_tool("mobs_base:net", {
	description = S("Net (right-click animal to put in inventory)"),
	inventory_image = "mobs_base_net.png",
	groups = {flammable = 2}
})

minetest.register_tool("mobs_base:shears", {
	description = S("Steel Shears (right-click to shear)"),
	inventory_image = "mobs_base_shears.png",
	groups = {flammable = 2}
})
