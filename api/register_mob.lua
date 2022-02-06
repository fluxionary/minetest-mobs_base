local transform_animation = mobs_base.compat.mobs_redo.transform_animation
local transform_sounds = mobs_base.compat.mobs_redo.transform_sounds

function mobs_base.api.register_mob(name, def)
    def.on_step = def.on_step or mobs_base.stepfunc or mobkit.stepfunc
    def.on_activate = def.on_activate or mobs_base.actfunc or mobkit.actfunc
    def.get_staticdata = def.get_staticdata or mobs_base.statfunc or mobkit.statfunc
    --def.logic = def.logic or (def.type and mobs_base.logic[def.type]) or mobkit.default_brain  -- TODO
    def.logic = mobkit.default_brain

    def.stepheight = def.stepheight or 1.1
    --def.fly_in = def.fly_in or "air"
    def.jump_height = def.jump_height or 4
    def.physical = (def.physical ~= false)  -- mobs_redo mobs assume physical
    def.collide_with_objects = (def.collide_with_objects ~= false)
    def.collisionbox = def.collisionbox or {-0.25, -0.25, -0.25, 0.25, 0.25, 0.25}
    def.selectionbox = def.selectionbox or def.collisionbox
    def.visual_size = def.visual_size or {x = 1, y = 1}
    def.view_range = def.view_range or 5

    if type(def.textures) == "table" then
        local textures = {}
        for _, texture in ipairs(def.textures) do
            if type(texture) == "table" then
                table.insert(textures, texture[1])
            else
                table.insert(textures, texture)
            end
        end
        def.textures = textures
    end

    ----------------

    def.timeout = def.timeout or def.lifetimer or 0
    def.buoyancy = def.buoyancy or (1 - (def.floats or 0))
    def.lung_capacity = def.lung_capacity or ((def.suffocation or 0) > 0 and 1) or 0

    def.max_hp = def.max_hp or def.min_hp or 10

    def.animation = transform_animation(def.animation)
    def.sounds = transform_sounds(def.sounds)

    def.max_speed = def.max_speed or def.run_velocity or def.walk_velocity or 1
    def.attack = def.attack
    def.armor_groups = def.armor_groups or (type(def.armor) == "table" and def.armor) or (type(def.armor) == "number" and {fleshy = def.armor}) or def.armor or 100

    minetest.register_entity(name, def)
end
