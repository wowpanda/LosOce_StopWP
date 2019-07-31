-- 		 		LosOceanic_StopWP = Stop Weapon Drops of Peds				--
--						Becasue No one likes free guns						--
--			By DK - 2019			...	Dont forget your Bananas!			--
------------------------------------------------------------------------------

Config = {}
Config.Locale = 'en'

------------------------------------------------------------------------------
-- Gun Drops																--
------------------------------------------------------------------------------

-- Target Radius
Config.Radius = 55

-- Ignore Ped Hash
Config.IgnoreList = {
}

------------------------------------------------------------------------------
--	Gangs/Anger of AI														--
------------------------------------------------------------------------------

-- Passive AI - No gun fights with ballers etc...
Congif.Disable = true

-- Group names, Hashes converted prior to running script.
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

------------------------------------------------------------------------------