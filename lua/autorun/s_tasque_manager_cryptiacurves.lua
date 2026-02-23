//█████████████████████████████████████████████████████████████████████████████████████████\\
//█▄─▄███▄─██─▄██▀▄─████▄─▄─▀█▄─█─▄███░█▄─▄─▀█▄─▄█─▄▄─█─█─██▀▄─██░▄▄░▄██▀▄─██▄─▄▄▀█▄─▄▄▀█░█\\
//██─██▀██─██─███─▀─█████─▄─▀██▄─▄████▄██─▄─▀██─██─██─█─▄─██─▀─███▀▄█▀██─▀─███─▄─▄██─██─█▄█\\
//▀▄▄▄▄▄▀▀▄▄▄▄▀▀▄▄▀▄▄▀▀▀▄▄▄▄▀▀▀▄▄▄▀▀▀▀▄▀▄▄▄▄▀▀▄▄▄▀▄▄▄▄▀▄▀▄▀▄▄▀▄▄▀▄▄▄▄▄▀▄▄▀▄▄▀▄▄▀▄▄▀▄▄▄▄▀▀▄▀\\

//=========================================================================================\\



//██████████████████████████████████████████████████████████████████████████\\
//█▄─▄▄─█▄─▄████▀▄─██▄─█─▄█▄─▄▄─█▄─▄▄▀█▄─▀█▀─▄█─▄▄─█▄─▄▄▀█▄─▄▄─█▄─▄███─▄▄▄▄█\\
//██─▄▄▄██─██▀██─▀─███▄─▄███─▄█▀██─▄─▄██─█▄█─██─██─██─██─██─▄█▀██─██▀█▄▄▄▄─█\\
//▀▄▄▄▀▀▀▄▄▄▄▄▀▄▄▀▄▄▀▀▄▄▄▀▀▄▄▄▄▄▀▄▄▀▄▄▀▄▄▄▀▄▄▄▀▄▄▄▄▀▄▄▄▄▀▀▄▄▄▄▄▀▄▄▄▄▄▀▄▄▄▄▄▀\\

//Normal

player_manager.AddValidModel( "Tasque Manager NSFW", "models/ltusamodels_inc/s_tm_cryptia/s_tm_player.mdl" )
player_manager.AddValidHands( "Tasque Manager NSFW", "models/ltusamodels_inc/s_tm_cryptia/s_tm_arms.mdl", 0, "00000000" )

//Cloth

player_manager.AddValidModel( "Tasque Manager SFW", "models/ltusamodels_inc/s_tm_cryptia/s_tm_cloth_player.mdl" )
player_manager.AddValidHands( "Tasque Manager SFW", "models/ltusamodels_inc/s_tm_cryptia/s_tm_arms.mdl", 0, "00000000" )

//Singer

player_manager.AddValidModel( "Singer Tasque Manager", "models/ltusamodels_inc/s_tm_cryptia/s_singer_tm_player.mdl" )
player_manager.AddValidHands( "Singer Tasque Manager", "models/ltusamodels_inc/s_tm_cryptia/s_singer_tm_arms.mdl", 0, "00000000" )



//███████████████████████████\\
//█▄─▀█▄─▄█▄─▄▄─█─▄▄▄─█─▄▄▄▄█\\
//██─█▄▀─███─▄▄▄█─███▀█▄▄▄▄─█\\
//▀▄▄▄▀▀▄▄▀▄▄▄▀▀▀▄▄▄▄▄▀▄▄▄▄▄▀\\


local Category = "LTUSA + Cryptia"

//Normal

local NPC = {
	Name = "Tasque Manager NSFW Friendly",
	Class = "npc_citizen",
	Model = "models/ltusamodels_inc/s_tm_cryptia/npcs/s_tm_npc_f.mdl",
	KeyValues = { citizentype = 4 },
	Category = Category,
	Health = "100",
	Weapons = { "weapon_smg1", "weapon_ar2", "weapon_shotgun" }
}
list.Set( "NPC", "s_tm_f", NPC )

local NPC = {
	Name = "Tasque Manager NSFW Hostile",
	Class = "npc_combine_s",
	Model = "models/ltusamodels_inc/s_tm_cryptia/npcs/s_tm_npc_h.mdl",
	KeyValues = { SquadName = "testing123", Numgrenades = 5 },
	Category = Category,
	Health = "100",
	Weapons = { "weapon_smg1", "weapon_ar2", "weapon_shotgun" }
}
list.Set( "NPC", "s_tm_h", NPC )

//Cloth

local NPC = {
	Name = "Tasque Manager SFW Friendly",
	Class = "npc_citizen",
	Model = "models/ltusamodels_inc/s_tm_cryptia/npcs/s_tm_cloth_npc_f.mdl",
	KeyValues = { citizentype = 4 },
	Category = Category,
	Health = "100",
	Weapons = { "weapon_smg1", "weapon_ar2", "weapon_shotgun" }
}
list.Set( "NPC", "s_tm_cloth_f", NPC )

local NPC = {
	Name = "Tasque Manager SFW Hostile",
	Class = "npc_combine_s",
	Model = "models/ltusamodels_inc/s_tm_cryptia/npcs/s_tm_cloth_npc_h.mdl",
	KeyValues = { SquadName = "testing123", Numgrenades = 5 },
	Category = Category,
	Health = "100",
	Weapons = { "weapon_smg1", "weapon_ar2", "weapon_shotgun" }
}
list.Set( "NPC", "s_tm_cloth_h", NPC )

//Singer

local NPC = {
	Name = "Singer Tasque Manager Friendly",
	Class = "npc_citizen",
	Model = "models/ltusamodels_inc/s_tm_cryptia/npcs/s_singer_tm_npc_f.mdl",
	KeyValues = { citizentype = 4 },
	Category = Category,
	Health = "100",
	Weapons = { "weapon_smg1", "weapon_ar2", "weapon_shotgun" }
}
list.Set( "NPC", "s_singer_tm_f", NPC )

local NPC = {
	Name = "Singer Tasque Manager Hostile",
	Class = "npc_combine_s",
	Model = "models/ltusamodels_inc/s_tm_cryptia/npcs/s_singer_tm_npc_h.mdl",
	KeyValues = { SquadName = "testing123", Numgrenades = 5 },
	Category = Category,
	Health = "100",
	Weapons = { "weapon_smg1", "weapon_ar2", "weapon_shotgun" }
}
list.Set( "NPC", "s_singer_tm_h", NPC )



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