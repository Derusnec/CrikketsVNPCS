player_manager.AddValidModel( "Roxy - CryptiaCurves", "models/alvaroports/roxypm.mdl" );
player_manager.AddValidHands( "Roxy - CryptiaCurves", "models/alvaroports/roxyvm.mdl", 0, "00000000" )

local Category = "Alvaro Ports"

local NPC = { 	Name = "Roxy - Friendly Npc", 
				Class = "npc_citizen",
				Model = "models/alvaroports/roxynpc.mdl",
				Health = "100",
				KeyValues = { citizentype = 4 },
				Category = Category	}

list.Set( "NPC", "npc_roxy", NPC )