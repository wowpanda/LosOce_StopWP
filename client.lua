Config = {}
Config.IgnoreList = {
ALL THE PEDS TO BE COUNTED.
}

Config.RelationList = {
"PLAYER",
"GANG_1",
"GANG_2",
"GANG_9",
"GANG_10",
"AMBIENT_GANG_LOST",
"AMBIENT_GANG_MEXICAN",
"AMBIENT_GANG_FAMILY",
"AMBIENT_GANG_BALLAS",
"AMBIENT_GANG_MARABUNTE",
"AMBIENT_GANG_CULT",
"AMBIENT_GANG_SALVA",
"AMBIENT_GANG_WEICHENG",
"AMBIENT_GANG_HILLBILLY",
"MERRYWEATHER",
"SECURITY_GUARD",
"PRIVATE_SECURITY",
}

-- All Ped Group hashes outside this list of peds needs to not be counted. So we need to get this list of peds...

local RelationList = {} -- This is the target list...

function SetTableHash()
	for _,v in ipairs(Config.RelationList) do
		local v = GetHashKey(v)
		table.insert(RelationList, v)
	end
end

function SetWeaponDrops()
	-- Set Your Player as a Ped Entity to use its Coords in the ESX Function.
	local iPlayerPed = GetPlayerPed(-1)
	local iPlayerPedEntity = GetEntityCoords(iPlayerPed)
	-- Target Peds as the array and 25 being the distance around the player.
	local Target, 25 = ESX.Game.GetClosestPedReverse(iPlayerPedEntity, IgnoreList)
	-- For each ped inside the Target array pulled from ESX.
	for i=1, #Target, 1 do
		-- Are we sure its a ped?
		if IsEntityAPed(Target) then
			-- If Entity is not dead then...
			if not IsPedDeadOrDying(Target) then
				-- Dont Drop Guns!
				SetPedDropsWeaponsWhenDead(Target, false)
			else
				-- Now if they are dead, I want to make sure we tell the server they are not needed. "CLEAN UP ISLE 7"
				if IsEntityDead(Target) then
					if IsPedInAnyVehicle(Target, false) then
						RemovePedElegantly(Target)
					end
				end
			end
		end
	end			
end	

Citizen.CreateThread(function()
	SetTableHash()
	Wait(50)
    while true do
        SetWeaponDrops()
    end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(250)
		if RelationList ~= nil then
			for _,v in ipairs(RelationList) do
				local v = group
				SetRelationshipBetweenGroups(0, group, GetHashKey('PLAYER'))
			end
		else break
		end
	end
end)