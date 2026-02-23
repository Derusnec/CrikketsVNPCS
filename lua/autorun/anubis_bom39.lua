player_manager.AddValidModel( "Anubis", "models/LTUSAMODELS_inc/anubis_bom39/Anubis.mdl" )
list.Set( "PlayerOptionsModel", "Anubis", "models/LTUSAMODELS_inc/anubis_bom39/Anubis.mdl" )
player_manager.AddValidHands( "Anubis", "models/LTUSAMODELS_inc/anubis_bom39/Anubis_arms.mdl", 0, "00000000" )

local Category = "LTUSA + Bom39"

local NPC = {
	Name = "Anubis Friendly",
	Class = "npc_citizen",
	Model = "models/ltusamodels_inc/anubis_bom39/Anubis_npc.mdl",
	KeyValues = { citizentype = 4 },
	Category = Category,
	Health = "100",
	Weapons = { "weapon_smg1", "weapon_ar2", "weapon_shotgun" }
}
list.Set( "NPC", "anubis_f", NPC )

local Category = "LTUSA + Bom39"

local NPC = {
	Name = "Anubis Hostile",
	Class = "npc_combine_s",
	Model = "models/ltusamodels_inc/anubis_bom39/Anubis_npc_h.mdl",
	KeyValues = { SquadName = "testing123", Numgrenades = 5 },
	Category = Category,
	Health = "100",
	Weapons = { "weapon_smg1", "weapon_ar2", "weapon_shotgun" }
}
list.Set( "NPC", "anubis_h", NPC )