//Lua by: LTUSAMODELS.inc

player_manager.AddValidModel( "Queen Chrysalis", "models/LTUSAMODELS_inc/queen_bom39/chrysalis_player.mdl" )
player_manager.AddValidHands( "Queen Chrysalis", "models/LTUSAMODELS_inc/queen_bom39/chrysalis_arms.mdl", 0, "00000000" )

local Category = "LTUSA + Bom39"

local NPC = {
	Name = "Chrysalis Friendly",
	Class = "npc_citizen",
	Model = "models/ltusamodels_inc/queen_bom39/chrysalis_npc.mdl",
	KeyValues = { citizentype = 4 },
	Category = Category,
	Health = "100",
	Weapons = { "weapon_smg1", "weapon_ar2", "weapon_shotgun" }
}
list.Set( "NPC", "queen_f", NPC )

local NPC = {
	Name = "Chrysalis Hostile",
	Class = "npc_combine_s",
	Model = "models/ltusamodels_inc/queen_bom39/chrysalis_npc_h.mdl",
	KeyValues = { SquadName = "testing123", Numgrenades = 5 },
	Category = Category,
	Health = "100",
	Weapons = { "weapon_smg1", "weapon_ar2", "weapon_shotgun" }
}
list.Set( "NPC", "queen_h", NPC )