local function on_activate(self, staticdata)
    if minetest.registered_entities[new_name] then
        minetest.add_entity(self.object:get_pos(), new_name, staticdata)
    end

    mobs_base.api.remove_mob(self)
end

local function get_staticdata(self)
    return self
end


function mobs_base.api.alias_mob(old_name, new_name)
    minetest.register_alias(old_name, new_name)

    if minetest.registered_entities[old_name] then
        local def = minetest.registered_entities[old_name]
        def.physical = false
        def.static_save = false
        def.on_activate = on_activate
        def.get_staticdata = get_staticdata

    else
        minetest.register_entity(":" .. old_name, {
            physical = false,
            static_save = false,
            on_activate = on_activate,
            get_staticdata = get_staticdata
        })
    end
end
