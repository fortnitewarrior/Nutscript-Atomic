
SCHEMA.name = "Atomic"
SCHEMA.author = "Adaster"
SCHEMA.desc = "Set in a post-apocalyptic world." -- this is useless since we use schemaDesc in the language files

-- This will make players drop their equipped weapons on death.
function SCHEMA:PlayerDeath( client )
    local items = client:getChar():getInv():getItems()
    for k, item in pairs( items ) do
        if item.isWeapon then
            if item:getData( "equip" ) then
                nut.item.spawn( item.uniqueID, client:GetShootPos(), function()
                    item:remove()
                end, Angle(), item.data )
            end
        end
    end
end

nut.chat.register("event", {
	onCanSay =  function(speaker, text)
		return speaker:IsSuperAdmin()
	end,
	onCanHear = 10000000,
	onChatAdd = function(speaker, text)
		chat.AddText(Color(255, 0, 250), " [Event] ", color_white, text)
	end,
	prefix = {"/ev"}
})


nut.flag.add("v", "Access to blackmarket goods.")

nut.currency.set("", "Cap", "Caps")

nut.util.include("sh_commands.lua")

nut.util.includeDir("hooks")
