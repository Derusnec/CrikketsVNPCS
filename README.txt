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
- 37 Unique V-NPCs, 4 of which variations with unique animations/flexes/stats
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

  -DAEMON SUPPORT (Not required!)
https://steamcommunity.com/sharedfiles/filedetails/?id=2574407396 <-- NPC DAEMON, EXPLANATION LOWER
https://steamcommunity.com/sharedfiles/filedetails/?id=3215765831 <-- FOR INCLUDED NPC DAEMON PROFILE
https://steamcommunity.com/sharedfiles/filedetails/?id=632126535 <-- FOR INCLUDED NPC DAEMON PROFILE
https://steamcommunity.com/sharedfiles/filedetails/?id=3383071568 <-- FOR INCLUDED NPC DAEMON PROFILE
https://steamcommunity.com/sharedfiles/filedetails/?id=3383071568 <-- FOR INCLUDED NPC DAEMON PROFILE
https://steamcommunity.com/sharedfiles/filedetails/?id=3568776204 <-- FOR INCLUDED NPC DAEMON PROFILE
https://steamcommunity.com/sharedfiles/filedetails/?id=248353440 <-- FOR INCLUDED NPC DAEMON PROFILE

  -RECOMMENDATIONS
https://steamcommunity.com/sharedfiles/filedetails/?id=3529402381 <-- Will muffle sounds when eaten
https://steamcommunity.com/sharedfiles/filedetails/?id=3439688457 <-- V-NPCs will break through HL2 doors
https://steamcommunity.com/sharedfiles/filedetails/?id=933160196 <-- Replace any HL2 weapon pickup with SWEPS
https://steamcommunity.com/sharedfiles/filedetails/?id=2890177857 <-- Cleans up ragdolls/weapon drops/etc
https://steamcommunity.com/sharedfiles/filedetails/?id=2741170971 <-- Female combine voices for daemon, if you want

------------------------------------------------------------------------------
NPC DAEMON EXPLANATION
------------------------------------------------------------------------------
NPC Daemon is a daemon in of itself and requires an intense level of autism and source knowledge to figure out. But it's very powerful and can turn sandbox maps into an "ecosystem". It's not really a gamemode or has any goal in particular, but it puts the V-NPCs in a dynamic environment where you "encounter" them rather than spawning them. The basic profile I provide will spawn HL2 NPCs, random extras for spice and use predators as the great equalizer in small numbers, think insta-kill bosses you run from or fight amongst the normal NPCs you can scavenge weapons from. If you're willing to teach yourself/read up on the official addon page you can add more V-NPCs to the mix, change whatever you want.

https://imgur.com/a/crikkets-v-npc-daemon-guide-also-bot-pics-E5O6crv <-- Here's an in-game picture guide on enabling it once downloaded, it's included in the github. This is from a much older build, but the same exact steps still apply.


------------------------------------------------------------------------------
INSTALLATION GUIDE -> PAY ATTENTION!
------------------------------------------------------------------------------
1. Watch the epic tutorial
https://drive.google.com/file/d/12QkX5tqMFHRFavc1ETXr4Vv9iS2_flYD/view?usp=drive_link

------------------------------------------------------------------------------
KNOWN BUGS/ISSUES
------------------------------------------------------------------------------
-Weight gain bone offsets are currently not working, going to implement a fix soon™
-Belly Clipping Fix can cause some odd belly angles on certain V-NPCs
-(DAEMON) blood bullet decals can sometimes be seen flickering, this is cuz of the femcombine and will be patched once I add their assets locally as the Femcombine Elite is going to be a V-NPC

------------------------------------------------------------------------------
CHANGELOG
------------------------------------------------------------------------------
CHANGELOGS are now going to be put in releases!

------------------------------------------------------------------------------
ROADMAP
------------------------------------------------------------------------------
-Repatch weight gain bone offsets
-Autoduck support for large V-NPCs (In development hell)

V-NPCs in the works:
 -Humanoid Turret Girl V2
 -Tactical FemCombine
 -Lady Moon
 -Phalia
NEXT BATCH (To be updated)
 -https://steamcommunity.com/sharedfiles/filedetails/?id=3677664005 [JallerArts] Assaultron

SEND ME REQUESTS ON THE VORE FORUMS!
Must be a playermodel or NPC, more likely to do it if it has facial flexes or even bone facial flexes!
