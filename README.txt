------------------------------------------------------------------------------
Crikket's V-NPCs for V0.4!
------------------------------------------------------------------------------
Welcome to my MOD PACK! First off, the most important:

This mod-pack requires Wormonlooker's V-NPC V0.4 downloaded to function! Please check him out, support him, download his stuff, he's the reason this shit even exists. (If you're here you know this, why am I writing this?)

https://mega.nz/file/d3UlXA6Q#82dot96zbay5eNBwMO7FZQ8lE7yW8SrulhsRJOcbZrM <-- Stock V-NPC V0.4

------------------------------------------------------------------------------
DISCLAIMER
------------------------------------------------------------------------------
ATTENTION, ATTENTION! Clankers were used in the creation of this mod. I'm a college dev early dropout turned electrician, I might be able to parse through code okay but I sure as hell am not a programmer. I just want to nip any AI discourse in the bud here and on the forum, yes, AI was used for some of these features. Notably the PVS fix because it was cursed and the jitter bug fix, which wasn't that bad but required changes to all my bot .lua files. This project has gotten much bigger than it originally was and it's fun for me to make these V-NPCs and apply my source engine knowledge, but it started as my own personal project I had no plans of releasing and therefore did not care about disclosure or anything. I just want to make it clear to people that AI was a component and that I am less knowledgeable than you might think. The primary goal is to make free sexy NPCs for myself and other people, not to flex some "vore dev" skills or whatnot. Either use the pack or don't, if the idea of indirectly supporting AI through downloading my open source pack irks you, other creators like Unkn0wn have great packs that will more than definitely satisfy your needs.

Other Credits
Wormonlooker, obviously, for creating the main component of this mod.
The only other major coding component in this mod is Aliva's bonelerp animations, thanks Aliva for being cool with my use of this code, it makes every V-NPC much more unique imo!
------------------------------------------------------------------------------
FEATURES
------------------------------------------------------------------------------
- 27 Unique V-NPCs, 3 variations with unique animations/flexes/stats
- Complementary belly textures for all V-NPCs
- Basic sound support for V-NPCs, including many custom sounds
- NPC Daemon (autospawner) profile to dynamically spawn V-NPCs
- Bonelerp animation support by Aliva, all V-NPCs have custom bonelerp animation
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
https://steamcommunity.com/sharedfiles/filedetails/?id=3529402381 <-- Will muffle sounds when eaten
https://steamcommunity.com/sharedfiles/filedetails/?id=3439688457 <-- V-NPCs will break through HL2 doors
https://steamcommunity.com/sharedfiles/filedetails/?id=933160196 <-- Replace any HL2 weapon pickup with SWEPS
https://steamcommunity.com/sharedfiles/filedetails/?id=2890177857 <-- Cleans up ragdolls/weapon drops/etc


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


------------------------------------------------------------------------------
KNOWN BUGS/ISSUES
------------------------------------------------------------------------------
-NPC clavicles are a little wonky on old models, need to go back and change vectors/poses for better appearance


------------------------------------------------------------------------------
CHANGELOG
------------------------------------------------------------------------------
3/2/26: Initial update, I'm going to consider this to be the official first real update of the mod. The changelog is pretty much this entire readme plus the downloads, so I won't go into detail, in the future I will explain update additions/what asset files are added/etc.

3/6/26: Purrslime added, weight gain definers added for all V-NPCs current and new. Weight gain definers added to template file. GLaDOS is next, I accidentally deleted her finished file a week ago so I've been struggling to do her again (lots of voicelines) but it's time to lock in. I'm going to blow through my V-NPC roadmap until any more major additions.


------------------------------------------------------------------------------
ROADMAP
------------------------------------------------------------------------------
-Repatch weight gain bone offsets
-Autoduck support for large V-NPCs (In development hell)

V-NPCs in the works:
  -GLaDOS
V-NPCs in list:
  -https://steamcommunity.com/sharedfiles/filedetails/?id=3217986388 [Kemono] Akky
  -https://steamcommunity.com/sharedfiles/filedetails/?id=3628868280 Toy Chica by BlackHat/Clawnie
  -https://steamcommunity.com/sharedfiles/filedetails/?id=3337580323 [Kemono] Lady Moon
  -https://steamcommunity.com/sharedfiles/filedetails/?id=3638168031 PUR-03
  -https://steamcommunity.com/sharedfiles/filedetails/?id=2873749273 Humanoid Turret Girl V2
  -https://steamcommunity.com/sharedfiles/filedetails/?id=3663233017 Ghostly Wendrith
  -https://steamcommunity.com/sharedfiles/filedetails/?id=3644692257 Phalia

SEND ME REQUESTS ON THE VORE FORUMS!
Must be a playermodel or NPC, more likely to do it if it has facial flexes or even bone facial flexes!
