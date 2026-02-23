player_manager.AddValidModel( "Hex Maniac", "models/player/bom39/hex_maniac/hex_maniac_dress_sfw.mdl" )
player_manager.AddValidHands( "Hex Maniac", "models/player/bom39/hex_maniac/c_arms_hex_maniac_dress_sfw.mdl", 0, "00000000", true )

local FNPC =
{
	Name = "Hex Maniac (Friendly)",
	Class = "npc_citizen",
	KeyValues = { citizentype = CT_REBEL, SquadName = "resistance" },
	SpawnFlags = SF_CITIZEN_RANDOM_HEAD_FEMALE,
	Model = "models/player/bom39/hex_maniac/hex_maniac_dress_sfw_fnpc.mdl",
	Weapons = { },
	Category = "Bom39 NPCs",
}

list.Set( "NPC", "npc_hex_maniac_bom39_f", FNPC )
