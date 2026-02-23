--Add Playermodel
player_manager.AddValidModel( "Meru the Succubus (B21)", "models/b211/meru/meru.mdl" )
player_manager.AddValidModel( "Meru the Succubus (B21) No Emissive", "models/b21/meru/meru_n_e.mdl" )
player_manager.AddValidHands( "Meru the Succubus (B21)", "models/b211/meru/c_arms/meru_arms.mdl", 0, "00000000" )
player_manager.AddValidHands( "Meru the Succubus (B21) No Emissive", "models/b21/meru/c_arms/meru_n_e_arms.mdl", 0, "00000000" )
list.Set( "PlayerOptionsModel", "Meru the Succubus (B21)", "models/b211/meru/meru.mdl" )
list.Set( "PlayerOptionsModel", "Meru the Succubus (B21) No Emissive", "models/b21/meru/meru_n_e.mdl" )

--Add NPC
local Category = "B21"

--Friendly NPC
local NPC =
{
	Name = "Meru the Succubus Friendly",
	Class = "npc_citizen",
	KeyValues = { citizentype = 4 },
	Model = "models/b211/meru/meru.mdl",
	Health = "100",
	Category = Category
}
list.Set( "NPC", "npc_meru_the_succubus_friendly", NPC )

local Category = "B21"

--Hostile NPC
local NPC =
{
	Name = "Meru the Succubus Hostile",
	Class = "npc_citizen",
	KeyValues = { citizentype = 4, SquadName = "overwatch", Hostile = "1" },
	Model = "models/b211/meru/meru.mdl",
	Health = "100",
	Category = Category
}
list.Set( "NPC", "npc_meru_the_succubus_hostile", NPC )

--Add NPC
local Category = "B21"

--Friendly NPC
local NPC =
{
	Name = "Meru the Succubus(No Emissive) Friendly",
	Class = "npc_citizen",
	KeyValues = { citizentype = 4 },
	Model = "models/b21/meru/meru_n_e.mdl",
	Health = "100",
	Category = Category
}
list.Set( "NPC", "npc_meru_the_succubus_n_e_friendly", NPC )

local Category = "B21"

--Hostile NPC
local NPC =
{
	Name = "Meru the Succubus(No Emissive) Hostile",
	Class = "npc_citizen",
	KeyValues = { citizentype = 4, SquadName = "overwatch", Hostile = "1" },
	Model = "models/b21/meru/meru_n_e.mdl",
	Health = "100",
	Category = Category
}
list.Set( "NPC", "npc_meru_the_succubus_n_e_hostile", NPC )