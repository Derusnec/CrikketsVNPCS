------------------------------------------------------------------------------
Crikket's V-NPCs for V0.4!
------------------------------------------------------------------------------
Welcome to my MOD PACK! First off, the most important:

This mod-pack requires Wormonlooker's V-NPC V0.4 downloaded to function! Please check him out, support him, download his stuff, he's the reason this shit even exists.

https://mega.nz/file/d3UlXA6Q#82dot96zbay5eNBwMO7FZQ8lE7yW8SrulhsRJOcbZrM <-- Stock V-NPC V0.4
------------------------------------------------------------------------------
FEATURES
------------------------------------------------------------------------------
- 27 Unique V-NPCs, 3 variations with unique animations/flexes/stats
- Complementary belly textures for all V-NPCs
- Basic sound support for V-NPCs, including many custom sounds
- NPC Daemon (autospawner) profile to dynamically spawn V-NPCs
- Bonelerp animation support by Alicia, all V-NPCs have custom bonelerp animation
- Locally available assets, no more random workshop takedowns bricking V-NPCs
- Robust PVS fix to really crack down on any invisible NPC/world glitches when being eaten
-Template files included, my own and the original V-NPC 0.4 file. Found in it's own folder

- Developer console commands for easier V-NPC creation
  -drg_animate (0/1): Will pause/disable bonelerp animations and allow posing with Overhauled Bone Tool
  -dump_bot_bones: Will print out all bones in console after posing with OBT for easy copy/paste
  -dump_bot_flexes: Will print out all flexes in console for easy copy/paste
------------------------------------------------------------------------------
REQUIREMENTS + RECOMMENDATIONS
------------------------------------------------------------------------------
  -REQUIREMENTS
https://drive.google.com/drive/folders/1P9-shIordo0xFCEBPR1y-YeNNrrZm-d5?usp=drive_link <-- ALL ASSETS IN MOD!
https://github.com/Derusnec/CrikketsVNPCS <-- THE ACTUAL MOD CODE!

FOR SOUNDS: Most sounds are custom, but footsteps/GLaDOS voicelines are currently sourced from Portal 2 + L4D2 + TF2. I will add them soon to overcome this problem, but for now those games must be mounted. This won't break the mod otherwise, there will just be some missing sounds.

  -RECOMMENDATIONS
https://steamcommunity.com/sharedfiles/filedetails/?id=2574407396 <-- NPC DAEMON, MORE INFORMATION LOWER
https://steamcommunity.com/sharedfiles/filedetails/?id=3215765831 <-- FOR INCLUDED NPC DAEMON PROFILE
https://steamcommunity.com/sharedfiles/filedetails/?id=632126535 <-- FOR INCLUDED NPC DAEMON PROFILE

  -SOFT RECOMMENDATIONS
https://steamcommunity.com/sharedfiles/filedetails/?id=3529402381 <-- Will unintentionally muffle bellies
https://steamcommunity.com/sharedfiles/filedetails/?id=3439688457 <-- V-NPCs will break through HL2 doors, don't forget to download requirement
https://steamcommunity.com/sharedfiles/filedetails/?id=933160196 <-- Replace any HL2 weapon pickup with SWEPS of your choice (Daemon)
https://steamcommunity.com/sharedfiles/filedetails/?id=2890177857 <-- Cleans up map (Daemon)
------------------------------------------------------------------------------
NPC DAEMON EXPLANATION
------------------------------------------------------------------------------
NPC Daemon is a daemon in of itself and requires an intense level of autism and source knowledge to figure out. But it's very powerful and can turn sandbox maps into an "ecosystem". It's not really a gamemode or has any goal in particular, but it puts the V-NPCs in a dynamic environment where you "encounter" them rather than spawning them. The basic profile I provide will spawn HL2 NPCs, random extras for spice and use predators as the great equalizer in small numbers, think insta-kill bosses you run from or fight amongst the normal NPCs you can scavenge weapons from. If you're willing to teach yourself/read up on the official addon page you can add more V-NPCs to the mix, change whatever you want.

https://imgur.com/a/crikkets-v-npc-daemon-guide-also-bot-pics-E5O6crv <-- Here's an in-game picture guide on enabling it once downloaded, it's included in the github.
------------------------------------------------------------------------------
INSTALLATION GUIDE -> PAY ATTENTION!
------------------------------------------------------------------------------
1. Install V-NPCs V0.4 (link above) and extract the folder to your Garrysmod/garrysmod/addons folder. The files need to be in a folder, so vnpcs04/[file_contents]

2. Install my github .lua files by clicking Code -> Download .zip, extract this folder into your addons folder the same exact way as step one

3. Install the assets for the mod. You can either download the entire folder for initial install or pick and choose which to install. Workshop support is still present if you don't want to do this! I just can't promise they will keep working
  3b. IMPORTANT: Folders labeled VNPC_REQUIRED_[insert_name_here] are REQUIRED and DO NOT SUPPORT WORKSHOP LINKS. Make sure you at least download these

4. Extract the folders inside of CrikketVNPC into your Garrysmod/garrysmod/addons, your addons folder should be filled with files like VNPC_Anubis and so on

5. In the end, in your addons folder there should be a folder for base VNPCs 0.4, CrikketsVNPCS, and then a bunch of VNPC_[insert_name] folders (or just the required ones)
