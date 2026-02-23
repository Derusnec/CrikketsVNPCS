//Lua by: LTUSAMODELS.inc

player_manager.AddValidModel( "Lovander", "models/LTUSAMODELS_inc/lovander_bom39/lovander_player.mdl" )
player_manager.AddValidHands( "Lovander", "models/LTUSAMODELS_inc/lovander_bom39/lovander_arms.mdl", 0, "00000000" )

local Category = "LTUSA + Bom39"

local NPC = {
	Name = "Lovander Friendly",
	Class = "npc_citizen",
	Model = "models/ltusamodels_inc/lovander_bom39/lovander_npc.mdl",
	KeyValues = { citizentype = 4 },
	Category = Category,
	Health = "100",
	Weapons = { "weapon_smg1", "weapon_ar2", "weapon_shotgun" }
}
list.Set( "NPC", "lovander_f", NPC )

local NPC = {
	Name = "Lovander Hostile",
	Class = "npc_combine_s",
	Model = "models/ltusamodels_inc/lovander_bom39/lovander_npc_h.mdl",
	KeyValues = { SquadName = "testing123", Numgrenades = 5 },
	Category = Category,
	Health = "100",
	Weapons = { "weapon_smg1", "weapon_ar2", "weapon_shotgun" }
}
list.Set( "NPC", "lovander_h", NPC )