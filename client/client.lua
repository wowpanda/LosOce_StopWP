-- 		 		LosOceanic_StopWP = Stop Weapon Drops of Peds				--
--						Becasue No one likes free guns						--
--			By DK - 2019			...	Dont forget your Bananas!			--
------------------------------------------------------------------------------

--[ Loading ESX Object Dependancies ]--

ESX = nil

Citizen.CreateThread(function()
		while ESX == nil do
			TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
			Citizen.Wait(250)
		end
end)

--[ ESX Loaded - Generate Code Below ]--

------------------------------------------------------------------------------
--	Script Locals Variables													--
------------------------------------------------------------------------------

local RelationList = {} -- This is the Relationship list of hashes...

------------------------------------------------------------------------------
--	Functions																--
------------------------------------------------------------------------------

function SetTableHash()
	for _,v in ipairs(Config.RelationList) do
		local v = GetHashKey(v)
		table.insert(RelationList, v)
	end
end

function SetWeaponDrops()
	-- Set Your Player as a Ped Entity to use its Coords in the ESX Function.
	local iPed = GetPlayerPed(-1)
	local iPedx = GetEntityCoords(iPed)
	-- Target Peds as the array and 25 being the distance around the player.
	local Target = ESX.Game.GetPedsInArea(iPedx, Config.Radius, Config.IgnoreList)
	-- For each ped inside the Target array pulled from ESX.
	for i=1, #Target, 1 do
		-- Are we sure its a ped?
		if not IsPedAPlayer(Target[i]) then
			-- If Entity is not dead then...
			if not IsPedDeadOrDying(Target[i]) then
				-- Dont Drop Guns!
				SetPedDropsWeaponsWhenDead(Target[i], false)
					if IsEntityAMissionEntity(Target[i]) then 
						break
					else
						RemovePedElegantly(Target[i])
					end
			else
				-- Now if they are dead, I want to make sure we tell the server they are not needed. "CLEAN UP ISLE 7"
				if IsEntityDead(Target[i]) then
					if IsPedInAnyVehicle(Target[i], false) then
						RemovePedElegantly(Target[i])
					end
				end
			end
		end
	end			
end	

------------------------------------------------------------------------------
--	Threads																	--
------------------------------------------------------------------------------

-- Stop Weapon Drops

Citizen.CreateThread(function()
    while true do
		Citizen.Wait(0)			-- Every Frame
        SetWeaponDrops()		-- Set all Peds in Config.Radius to not drop guns.
    end
end)

------------------------------------------------------------------------------

-- Stop AI Agro

Citizen.CreateThread(function()
	SetTableHash()
	while Config.Disable do
		Citizen.Wait(50)
		if RelationList ~= nil then
			for _,v in ipairs(RelationList) do
				local v = group
				SetRelationshipBetweenGroups(0, group, GetHashKey('PLAYER'))
			end
		end
	end
end)

------------------------------------------------------------------------------