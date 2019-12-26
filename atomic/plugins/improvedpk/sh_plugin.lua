local PLUGIN = PLUGIN

PLUGIN.name = "Improved Permanent Kill"
PLUGIN.author = "Thadah Denyse & Adaster"
PLUGIN.desc = "Adds permanent death in the server options."

nut.config.add("pkActive", false, "Whether or not permakill is activated on the server.", nil, {
	category = "Permakill"
})

nut.config.add("pkWorld", false, "Whether or not world and self damage produce permanent death.", nil, {
	category = "Permakill"
})

function PLUGIN:PlayerDeath(client, inflictor, attacker)
	local character = client:getChar()

	if (nut.config.get("pkActive")) then
		if !(nut.config.get("pkWorld") and (client == attacker or inflictor:IsWorld())) then
			return
		end
		character:setData("permakilled", true)
	end
end

function PLUGIN:PlayerDeath(client, inflictor, attacker) -- makes the first option actually useful -.-
	local character = client:getChar()

	if (nut.config.get("pkActive") and (client == attacker or inflictor:IsWorld())) then
			return
		end
		character:setData("permakilled", true)
	end

function PLUGIN:PlayerSpawn(client)
	local character = client:getChar()
	if (nut.config.get("pkActive") and character and character:getData("permakilled")) then
		character:ban()
	end
end
