//Lua by: LTUSAMODELS.inc

player_manager.AddValidModel( "Toriel Mama", "models/LTUSAMODELS_inc/torielv2_bom39/torielv2_player.mdl" )
player_manager.AddValidHands( "Toriel Mama", "models/LTUSAMODELS_inc/torielv2_bom39/torielv2_arms.mdl", 0, "00000000" )

local Category = "LTUSA + Bom39"

local NPC = {
	Name = "Toriel Mama Friendly",
	Class = "npc_citizen",
	Model = "models/ltusamodels_inc/torielv2_bom39/torielv2_npc.mdl",
	KeyValues = { citizentype = 4 },
	Category = Category,
	Health = "100",
	Weapons = { "weapon_smg1", "weapon_ar2", "weapon_shotgun" }
}
list.Set( "NPC", "torielm_f", NPC )

local NPC = {
	Name = "Toriel Mama Hostile",
	Class = "npc_combine_s",
	Model = "models/ltusamodels_inc/torielv2_bom39/torielv2_npc_h.mdl",
	KeyValues = { SquadName = "testing123", Numgrenades = 5 },
	Category = Category,
	Health = "100",
	Weapons = { "weapon_smg1", "weapon_ar2", "weapon_shotgun" }
}
list.Set( "NPC", "torielm_h", NPC )