resource_manifest_version "44febabe-d386-4d18-afbe-5e627f4af937"

description "LosOce_Stop"

client_scripts {
	"config.lua",
	"client/client.lua",
}

server_scripts {
}

-- Client Side Exported Functions --
exports { 
}	

-- Server Side Exported Functions --	
server_exports {
}

-- Prequisites --
dependencies {
	"es_extended",
}