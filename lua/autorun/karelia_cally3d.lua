//█████████████████████████████████████████████████████████████████████████████████████████\\
//█▄─▄███▄─██─▄██▀▄─████▄─▄─▀█▄─█─▄███░█▄─▄─▀█▄─▄█─▄▄─█─█─██▀▄─██░▄▄░▄██▀▄─██▄─▄▄▀█▄─▄▄▀█░█\\
//██─██▀██─██─███─▀─█████─▄─▀██▄─▄████▄██─▄─▀██─██─██─█─▄─██─▀─███▀▄█▀██─▀─███─▄─▄██─██─█▄█\\
//▀▄▄▄▄▄▀▀▄▄▄▄▀▀▄▄▀▄▄▀▀▀▄▄▄▄▀▀▀▄▄▄▀▀▀▀▄▀▄▄▄▄▀▀▄▄▄▀▄▄▄▄▀▄▀▄▀▄▄▀▄▄▀▄▄▄▄▄▀▄▄▀▄▄▀▄▄▀▄▄▀▄▄▄▄▀▀▄▀\\

//=========================================================================================\\



//██████████████████████████████████████████████████████████████████████████\\
//█▄─▄▄─█▄─▄████▀▄─██▄─█─▄█▄─▄▄─█▄─▄▄▀█▄─▀█▀─▄█─▄▄─█▄─▄▄▀█▄─▄▄─█▄─▄███─▄▄▄▄█\\
//██─▄▄▄██─██▀██─▀─███▄─▄███─▄█▀██─▄─▄██─█▄█─██─██─██─██─██─▄█▀██─██▀█▄▄▄▄─█\\
//▀▄▄▄▀▀▀▄▄▄▄▄▀▄▄▀▄▄▀▀▄▄▄▀▀▄▄▄▄▄▀▄▄▀▄▄▀▄▄▄▀▄▄▄▀▄▄▄▄▀▄▄▄▄▀▀▄▄▄▄▄▀▄▄▄▄▄▀▄▄▄▄▄▀\\

//Karelia Bra

player_manager.AddValidModel( "Karelia SFW Bra", "models/ltusamodels_inc/karelia_cryptia/karelia_player_1.mdl" )
player_manager.AddValidHands( "Karelia SFW Bra", "models/ltusamodels_inc/karelia_cryptia/karelia_arms_valve.mdl", 0, "00000000" )

//Karelia Shirt

player_manager.AddValidModel( "Karelia SFW Shirt", "models/ltusamodels_inc/karelia_cryptia/karelia_player_2.mdl" )
player_manager.AddValidHands( "Karelia SFW Shirt", "models/ltusamodels_inc/karelia_cryptia/karelia_arms_valve.mdl", 0, "00000000" )

//Karelia Bra + Shorts

player_manager.AddValidModel( "Karelia SFW Bra + Shorts", "models/ltusamodels_inc/karelia_cryptia/karelia_player_3.mdl" )
player_manager.AddValidHands( "Karelia SFW Bra + Shorts", "models/ltusamodels_inc/karelia_cryptia/karelia_arms_valve.mdl", 0, "00000000" )

//Karelia Shirt + Shorts

player_manager.AddValidModel( "Karelia SFW Shirt + Shorts", "models/ltusamodels_inc/karelia_cryptia/karelia_player_4.mdl" )
player_manager.AddValidHands( "Karelia SFW Shirt + Shorts", "models/ltusamodels_inc/karelia_cryptia/karelia_arms_valve.mdl", 0, "00000000" )

//Karelia NSFW

player_manager.AddValidModel( "Karelia NSFW", "models/ltusamodels_inc/karelia_cryptia/karelia_player_nsfw.mdl" )
player_manager.AddValidHands( "Karelia NSFW", "models/ltusamodels_inc/karelia_cryptia/karelia_arms_valve.mdl", 0, "00000000" )

//Karelia Fut4

player_manager.AddValidModel( "Karelia PP", "models/ltusamodels_inc/karelia_cryptia/karelia_player_nsfw_fut4.mdl" )
player_manager.AddValidHands( "Karelia PP", "models/ltusamodels_inc/karelia_cryptia/karelia_arms_valve.mdl", 0, "00000000" )


//███████████████████████████\\
//█▄─▀█▄─▄█▄─▄▄─█─▄▄▄─█─▄▄▄▄█\\
//██─█▄▀─███─▄▄▄█─███▀█▄▄▄▄─█\\
//▀▄▄▄▀▀▄▄▀▄▄▄▀▀▀▄▄▄▄▄▀▄▄▄▄▄▀\\

local Category = "LTUSA + Cryptia"

// F

local NPC = {
	Name = "Karelia SFW Bra F",
	Class = "npc_citizen",
	Model = "models/ltusamodels_inc/karelia_cryptia/karelia_npc_f_1.mdl",
	KeyValues = { citizentype = 4 },
	Category = Category,
	Health = "100",
	Weapons = { "weapon_smg1", "weapon_ar2", "weapon_shotgun" }
}
list.Set( "NPC", "karelia_sfw_bra_f", NPC )

local NPC = {
	Name = "Karelia SFW Shirt F",
	Class = "npc_citizen",
	Model = "models/ltusamodels_inc/karelia_cryptia/karelia_npc_f_2.mdl",
	KeyValues = { citizentype = 4 },
	Category = Category,
	Health = "100",
	Weapons = { "weapon_smg1", "weapon_ar2", "weapon_shotgun" }
}
list.Set( "NPC", "karelia_sfw_shirt_f", NPC )

local NPC = {
	Name = "Kar SFW Bra + Shorts F",
	Class = "npc_citizen",
	Model = "models/ltusamodels_inc/karelia_cryptia/karelia_npc_f_3.mdl",
	KeyValues = { citizentype = 4 },
	Category = Category,
	Health = "100",
	Weapons = { "weapon_smg1", "weapon_ar2", "weapon_shotgun" }
}
list.Set( "NPC", "kar_sfw_bra_shorts_f", NPC )

local NPC = {
	Name = "Kar SFW Shirt + Shorts F",
	Class = "npc_citizen",
	Model = "models/ltusamodels_inc/karelia_cryptia/karelia_npc_f_4.mdl",
	KeyValues = { citizentype = 4 },
	Category = Category,
	Health = "100",
	Weapons = { "weapon_smg1", "weapon_ar2", "weapon_shotgun" }
}
list.Set( "NPC", "kar_sfw_shirt_shorts_f", NPC )

local NPC = {
	Name = "Karelia NSFW F",
	Class = "npc_citizen",
	Model = "models/ltusamodels_inc/karelia_cryptia/karelia_npc_f_nsfw.mdl",
	KeyValues = { citizentype = 4 },
	Category = Category,
	Health = "100",
	Weapons = { "weapon_smg1", "weapon_ar2", "weapon_shotgun" }
}
list.Set( "NPC", "karelia_nsfw_f", NPC )

local NPC = {
	Name = "Karelia PP F",
	Class = "npc_citizen",
	Model = "models/ltusamodels_inc/karelia_cryptia/karelia_npc_f_nsfw_fut4.mdl",
	KeyValues = { citizentype = 4 },
	Category = Category,
	Health = "100",
	Weapons = { "weapon_smg1", "weapon_ar2", "weapon_shotgun" }
}
list.Set( "NPC", "karelia_pp_f", NPC )


// H

local NPC = {
	Name = "Karelia SFW Bra H",
	Class = "npc_combine_s",
	Model = "models/ltusamodels_inc/karelia_cryptia/karelia_npc_h_1.mdl",
	KeyValues = { SquadName = "testing123", Numgrenades = 5 },
	Category = Category,
	Health = "100",
	Weapons = { "weapon_smg1", "weapon_ar2", "weapon_shotgun" }
}
list.Set( "NPC", "karelia_sfw_bra_h", NPC )

local NPC = {
	Name = "Karelia SFW Shirt H",
	Class = "npc_combine_s",
	Model = "models/ltusamodels_inc/karelia_cryptia/karelia_npc_h_2.mdl",
	KeyValues = { SquadName = "testing123", Numgrenades = 5 },
	Category = Category,
	Health = "100",
	Weapons = { "weapon_smg1", "weapon_ar2", "weapon_shotgun" }
}
list.Set( "NPC", "karelia_sfw_shirt_h", NPC )

local NPC = {
	Name = "Kar SFW Bra + Shorts H",
	Class = "npc_combine_s",
	Model = "models/ltusamodels_inc/karelia_cryptia/karelia_npc_h_3.mdl",
	KeyValues = { SquadName = "testing123", Numgrenades = 5 },
	Category = Category,
	Health = "100",
	Weapons = { "weapon_smg1", "weapon_ar2", "weapon_shotgun" }
}
list.Set( "NPC", "kar_sfw_bra_shorts_h", NPC )

local NPC = {
	Name = "Kar SFW Shirt + Shorts H",
	Class = "npc_combine_s",
	Model = "models/ltusamodels_inc/karelia_cryptia/karelia_npc_h_4.mdl",
	KeyValues = { SquadName = "testing123", Numgrenades = 5 },
	Category = Category,
	Health = "100",
	Weapons = { "weapon_smg1", "weapon_ar2", "weapon_shotgun" }
}
list.Set( "NPC", "kar_sfw_shirt_shorts_h", NPC )

local NPC = {
	Name = "Kar NSFW H",
	Class = "npc_combine_s",
	Model = "models/ltusamodels_inc/karelia_cryptia/karelia_npc_h_nsfw.mdl",
	KeyValues = { SquadName = "testing123", Numgrenades = 5 },
	Category = Category,
	Health = "100",
	Weapons = { "weapon_smg1", "weapon_ar2", "weapon_shotgun" }
}
list.Set( "NPC", "karelia_nsfw_h", NPC )

local NPC = {
	Name = "Kar PP H",
	Class = "npc_combine_s",
	Model = "models/ltusamodels_inc/karelia_cryptia/karelia_npc_h_nsfw_fut4.mdl",
	KeyValues = { SquadName = "testing123", Numgrenades = 5 },
	Category = Category,
	Health = "100",
	Weapons = { "weapon_smg1", "weapon_ar2", "weapon_shotgun" }
}
list.Set( "NPC", "karelia_pp_h", NPC )


//===============================================================================\\

	//░█████╗░██████╗░███████╗██████╗░██╗████████╗░██████╗\\
	//██╔══██╗██╔══██╗██╔════╝██╔══██╗██║╚══██╔══╝██╔════╝\\
	//██║░░╚═╝██████╔╝█████╗░░██║░░██║██║░░░██║░░░╚█████╗░\\
	//██║░░██╗██╔══██╗██╔══╝░░██║░░██║██║░░░██║░░░░╚═══██╗\\
	//╚█████╔╝██║░░██║███████╗██████╔╝██║░░░██║░░░██████╔╝\\
	//░╚════╝░╚═╝░░╚═╝╚══════╝╚═════╝░╚═╝░░░╚═╝░░░╚═════╝░\\
	
// All ports, QCs, Lua, texturing codes were made only by me: BIOHAZARD
// If you have used GMPublisher or any other program to decompile my mods,
// know that this port and these items are not yours, this signature is only
// to ensure that there will be no fraud, if this is deleted measures will be
// taken.

// Backups are not allowed without my authorization!

// By: BIOHAZARD

// All ported models are not my copyright, all credit always goes to the owner of 
// the model, if the owner demands that the model be removed, it will be removed. 
// Please do not make backups without my or the model owner's permission.

// BIOHAZARD is the main carrier and owner of the post of this model, any plagiarism 
// of the post or fake of mine, please report.


//░██████╗██╗░██████╗░███╗░░██╗███████╗██████╗░  ██████╗░██╗░░░██╗██╗\\
//██╔════╝██║██╔════╝░████╗░██║██╔════╝██╔══██╗  ██╔══██╗╚██╗░██╔╝╚═╝\\
//╚█████╗░██║██║░░██╗░██╔██╗██║█████╗░░██║░░██║  ██████╦╝░╚████╔╝░░░░\\
//░╚═══██╗██║██║░░╚██╗██║╚████║██╔══╝░░██║░░██║  ██╔══██╗░░╚██╔╝░░░░░\\
//██████╔╝██║╚██████╔╝██║░╚███║███████╗██████╔╝  ██████╦╝░░░██║░░░██╗\\
//╚═════╝░╚═╝░╚═════╝░╚═╝░░╚══╝╚══════╝╚═════╝░  ╚═════╝░░░░╚═╝░░░╚═╝\\

//    ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⡤⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
//    ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⢖⡽⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⢿⢦⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
//     ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⠞⢁⠞⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢧⠙⢧⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
//    ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⠋⢀⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⡆⠀⠹⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
//    ⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⠃⠀⣼⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⡀⠀⠸⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀
//    ⠀⠀⠀⠀⠀⠀⠀⠀⢠⡏⠀⠀⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⡇⠀⠀⢹⡄⠀⠀⠀⠀⠀⠀⠀⠀
//    ⠀⠀⠀⠀⠀⠀⠀⠀⢸⠀⠀⠀⢻⡀⠀⠀⠀⠀⣀⣤⠤⠶⠒⠒⠲⠤⢤⣀⠀⠀⠀⢀⡇⠀⠀⠈⣷⠀⠀⠀⠀⠀⠀⠀⠀
//    ⠀⠀⠀⠀⠀⠀⠀⠀⢸⡄⠀⠀⠈⢷⠀⣠⠶⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⠲⣄⠀⣼⠁⠀⠀⠀⢸⡀⠀⠀⠀⠀⠀⠀⠀
//    ⠀⠀⠀⠀⠀⢀⣠⠖⠋⠁⠀⠀⠀⠈⢻⣅⠀⠀⢀⣤⠴⠒⠚⠛⠒⠶⢤⣀⠀⠀⢈⡿⠁⠀⠀⠀⠀⠈⠛⢶⣄⠀⠀⠀⠀⠀
//    ⠀⠀⠀⢀⡴⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠙⠳⣶⡋⠀⠀⠀⠀⠀⠀⠀⠀  ⢉⣷⠶⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢷⡄⠀⠀⠀
//    ⠀⠀⣴⠋⠀⠀⠀⢀⣀⣠⣤⣤⣀⣀⡀⠀⠀⠀⠉⠛⠒⠶⢦⡴⠒⠒⠊⠉⠀⠀⠀⠀⣀⣀⣀⣀⣀⣀⡀⠀⠀⠀⠹⣆⠀⠀
//    ⠀⡾⠁⠀⢀⡤⠞⠉⠁⠀⠀⣾⠀⠉⠉⡗⢦⣄⠀⠀⢀⣴⣾⣿⣦⡀⠀⠀⢀⡤⢶⡏⠉⠁⢷⠀⠀⠉⠉⠛⠶⣤⡀⠹⡆⠀
//    ⣼⠁⢀⡴⠋⠀⠀⠀⠀⠀⠀⣇⠀⠀⠀⡇⠀⠈⢳⡄⣸⣿⣿⣿⣿⣇⢠⠔⠉⠀⢨⡇⠀⠀⢸⠀⠀⠀⠀⠀⠀ ⠈⠻⣦⣿⠀
//    ⡏⢠⠞⠀⠀⠀⠀⠀⠀⠀⠀⢿⠀⠀⠀⣷⠀⠀⠀⠙⣽⠿⢿⡿⠟⢿⡋⠀⠀⠀⣸⠃⠀⠀⣾⠀⠀⠀⠀⠀⠀⠀⠀ ⠘⣿⡄
//    ⣧⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣇⠀⠀⠘⣧⠀⠀⠀⢸⡄⠀⠀⠀⡟⠀⠀⠀⣰⠏⠀⠀⢰⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀ ⠘⠁
//    ⠙⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⣆⠀⠀⠈⠳⣄⡀⠀⡇⠀⠀⢠⡇⠀⣠⠞⠁⠀⠀⣰⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
//    ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⢧⡀⠀⠀⠀⠙⢻⡇⠀⠀⠘⡗⠋⠁⠀⠀⢀⡴⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
//    ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠳⣄⡀⠀⣸⠀⠀⠀⠀⢧⠀⢀⣠⠴⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
//    ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⣹⠃⠀⠀⠀⠀⠘⣟⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
//    ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡼⠃⠀⠀⠀⠀⠀⠀⠘⢦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
//    ⠀⠀⠀⠀⠀⠀⢀⡀⠀⠀⠀⠀⠀⠀⣀⣠⠴⠋⠀⠀⠀⠀⠀⡀⠀⠀⠀⠀⠙⠢⢤⣀⡀⠀⠀⠀⠀⠀⣀⣠⠀⠀⠀⠀⠀⠀
//    ⠀⠀⠀⠀⠀⠀⠀⠙⠿⢟⣛⠛⠛⠉⠉⠀⠀⠀⠀⠀⣀⣤⠞⠙⠦⣄⣀⠀⠀⠀⠀⠀⠉⠉⠛⢛⣫⡽⠛⠁⠀⠀⠀⠀⠀⠀
//    ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠙⠛⠒⠒⠒⠒⠛⠉⠉⠀⠀⠀⠀⠀⠉⠙⠓⠒⠶⠶⠖⠒⠛⠉⠁⠀⠀⠀⠀⠀⠀⠀

//===============================================================================\\