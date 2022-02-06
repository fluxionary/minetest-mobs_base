mobs_base.compat.mobs_redo = {}


local function parse_anim_key(key)
    if type(key) == "string" then
        return key:match("^([^1234]+)([1234]?)_([^_]+)$")
    end
end


function mobs_base.compat.mobs_redo.transform_animation(redo_animaion)
    local mobkit_anim = {}

    for key, value in pairs(redo_animaion) do
        local name, variant, kind = parse_anim_key(key)


        if name and kind then
            local anims = mobkit_anim[name] or {}
            variant = (tonumber(variant) or 0) + 1
            local anim = anims[variant] or {}

            if kind == "start" then
                local range = anim["range"] or {}
                range.x = value
                anim["range"] = range
            elseif kind == "end" then
                local range = anim["range"] or {}
                range.y = value
                anim["range"] = range
            elseif kind == "speed" then
                anim["speed"] = value
            elseif kind == "loop" then
                anim["loop"] = value
            else
                mobs_animal.log("warning", "translating animation: unknown key format. %s %s", key, value)
            end

            anims[variant] = anim
            mobkit_anim[name] = anims

        else
            -- assume it's in a different format
            mobs_animal.log("warning", "translating animation: unknown key format. %s %s", key, value)
            mobkit_anim[key] = value
        end
    end

    for _, anims in pairs(mobkit_anim) do
        for _, anim in ipairs(anims) do
            if not anim.range then
                anim.range = {}
            end
            if not anim.range.x then
                anim.range.x = anim.range.y or 0
            end
            if not anim.range.y then
                anim.range.y = anim.range.x or 0
            end
            if not anim.speed then
                anim.speed = 1
            end
        end
    end

    return mobkit_anim
end


function mobs_base.compat.mobs_redo.transform_sounds(redo_soundspecs)
    return redo_soundspecs
end
