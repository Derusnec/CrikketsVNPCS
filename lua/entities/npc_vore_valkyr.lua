---------------------------------------------------------------------------
-- HI! Welcome to the new standardized vore template for my V-NPCs. Follow along with
-- the comments for the best results.

-- drg_animate 0/1, 0 disables bonelerping for overhauled bone tool adjustments
-- dump_bot_bones will print a formatted list of bone edits into console for easy copy/paste
-- dump_bot_flexes will print a formatted list of facial edits into console for easy copy/paste
---------------------------------------------------------------------------
if not DrGBase then return end -- Make sure you have DrGBase installed or nothing will work!
ENT.Base = "npc_vore_base" -- The base template for all bots, keep the same!

ENT.PrintName = "Valkyr" -- This will be the printed name of your bot.
ENT.Category = "Crikket's V-NPC" -- This is the category your bot is in, Vore is the generic one.
ENT.ModNeeded = "https://steamcommunity.com/sharedfiles/filedetails/?id=3558233973" -- This is where you'll put the steam workshop ID for your V-NPC model.

--BASIC MODEL INFO
ENT.Models = {"models/alvaroports/valkyrpm.mdl"} -- Insert the V-NPC model's path here. You can copy it in Gmod.
ENT.SpawnHealth = 512 --Spawn health (128=light, 256=normal, 384=beefy, 512=strong, 768=danger, 1024=boss, 2048=apex)
ENT.HealthRegen = 4 --two is basic, just enough for survivability. Bots regen pretty quick, be careful with this!
ENT.BloodColor = BLOOD_COLOR_RED --blood color, can be BLOOD_COLOR_YELLOW, _ANTLION, _MECH, or even DONT_BLEED
ENT.ModelScale = 1.1 --scale of initial model, be careful with this!
ENT.Skins = {0} --The bot's skin. This cannot be randomized without extra coding.
ENT.BodyGroups = {
	["Shirt"] = 2,
	["Safe For Work"] = 1,
	["Sleeves"] = 1 --Make sure the last entry is without a closing comma.
}

--AI BEHAVIOR
ENT.Omniscient = false --do we see all, everywhere, always?
ENT.Frightening = false --do we scare NPCs away?

--AI DETECTION BEHAVIOR
ENT.EyeBone = "ValveBiped.Bip01_Head1" --The bone the NPC will see from.
ENT.EyeOffset = Vector(0, 0, 0)
ENT.EyeAngle = Angle(0, 0, 0)
ENT.SightFOV = 100 --This is our field of view for the V-NPC
ENT.SightRange = 1024 --This is our view distance in hammer units.
ENT.HearingCoefficient = 2 --The higher this is, the more sensitive their hearing. Judge it from 1 - 10, 10 being ultrahearing.
ENT.SpotDuration = 45 --How long do we pursue prey we see?

--AI MOVEMENT BEHAVIOR
ENT.WalkSpeed = 72 --The bot's walking speed, or idle speed.
ENT.RunSpeed = 384 --The bot's speed when in pursuit.
ENT.Acceleration = 256 --The bot's acceleration per second.
ENT.JumpHeight = 128 --Jump height! Recommended to leave as is.
ENT.DeathDropHeight = 1024 --if we fall this far, we die.
ENT.ClimbLedges = true --we mantling?
ENT.ClimbProps = false --we mantling PROPS? Disabled due to DrgBase bugginess.
ENT.ClimbLedgesMaxHeight = 256 --How high can we climb? Be careful with this.
ENT.LedgeDetectionDistance = 512 --Don't change.
ENT.ClimbLadders = true --Ladders need specialized navmesh support, hard for me to test.
ENT.ClimbLaddersUp = true --Ladders need specialized navmesh support, hard for me to test.
ENT.LaddersUpDistance = 9999 --Just let them climb as high as they need.
ENT.ClimbLaddersUpMaxHeight = math.huge --math.huge is forever
ENT.ClimbLaddersUpMinHeight = 16 --The minimum height to climb a ladder.
ENT.ClimbLaddersDown = false --Let them jump down instead, less buggy.
ENT.ClimbSpeed = 64 --The ladder climb rate.
ENT.ClimbUpAnimation = ACT_ZOMBIE_CLIMB_UP --Most NPCs have this activity.
ENT.ClimbDownAnimation = ACT_ZOMBIE_CLIMB_DOWN --Most NPCs have this activity.
ENT.ClimbOffset = Vector(0, 0, 0) --Climb offsets for better visuals when climbing. I don't bother.
ENT.MaxYawRate = 384 --The bot's turning speed, 128 = tank, 256 = normal, 384 = snap, 512 = guided missile
ENT.StepHeight = 20 --How high can your bot step up ledges without climbing? 20 = normal, 40 = big gal, 60 = giant
ENT.ClimbLedgesMinHeight = 21 --Recommended to set right above step height.

--ANIMATION BEHAVIOR
ENT.IdleAnimation = ACT_HL2MP_IDLE --Check out https://wiki.facepunch.com/gmod/Enums/ACT for HL2MP activities (the rest generally dont work but experiment with your specific models.)
ENT.WalkAnimation = ACT_HL2MP_WALK --Check out https://wiki.facepunch.com/gmod/Enums/ACT for HL2MP activities (the rest generally dont work but experiment with your specific models.)
ENT.RunAnimation = ACT_HL2MP_RUN_DUEL --Check out https://wiki.facepunch.com/gmod/Enums/ACT for HL2MP activities (the rest generally dont work but experiment with your specific models.)
ENT.AttackAnimation = "zombie_attack_07_original" --attack animation, beckon is pretty solid for a faux-swallow motion.
ENT.MeleeAttackRange = 72 -- +16 enemy range. So 64, 72, 80, 88, 108 respectively
ENT.ReachEnemyRange = 64 --attack range: 48 = small, 56 = normal, 64 = efficient, 72 = tall, 96 = giant.

--AI SOUNDS, IDLE SOUNDS ARE PRETTY MUCH ALL THAT'S WORTH IT RIGHT NOW
ENT.OnSpawnSounds = {
    "belly/valkyr_1.wav",
    "belly/valkyr_1.wav",
    "belly/valkyr_1.wav"
}
--ENT.OnIdleSounds = {
--    "INSERT_SOUND_HERE",
--}
ENT.IdleSoundDelay = math.random(8,24) --Needs a better system as it only sets the random number on spawn.
ENT.ClientIdleSounds = false
--ENT.DamageSoundDelay = 1 --Delay between the sounds of V-NPC taking damage, recommended to be kinda high to prevent spam.
--ENT.OnDamageSounds = {
    --"INSERT_SOUND_HERE",
    --"INSERT_SOUND_HERE",
    --"INSERT_SOUND_HERE" --Make sure to close these tables without a ending comma.
--}
--ENT.OnDeathSounds = {
--    "INSERT_SOUND_HERE"
--}

--VORE SOUNDS, ONLY USE THIS IF YOU WANT YOUR OWN CUSTOM SOUNDS!
--ENT.VoreSounds = { --this is only 'human' sounds, belly sounds are different
--	["big_burp"] = {
--		"burps/burp1.wav",

--	},
--	["small_burp"] = {
--		"burps/burp7.wav",

--	},
--	["swallow"] = {
--		"gulps/g1.wav",

--	}
--}

ENT.VoreSoundPitch = 1.1 --The pitch of the vore sounds above, also default sounds.

ENT.Footsteps = { --Footstep sounds! Defaults to barefoot steps I added.
    ["Default"] = {
        "player/footsteps/fs_tile_01.wav",
        "player/footsteps/fs_tile_02.wav",
        "player/footsteps/fs_tile_03.wav",
        "player/footsteps/fs_tile_04.wav",
        "player/footsteps/fs_tile_05.wav",
        "player/footsteps/fs_tile_06.wav",
        "player/footsteps/fs_tile_07.wav",
        "player/footsteps/fs_tile_08.wav",
        "player/footsteps/fs_tile_09.wav"
    },
}
function ENT:EmitFootstep()
    if not self.Footsteps or not self.Footsteps["Default"] then return end
    self:EmitSound(table.Random(self.Footsteps["Default"]), 70, 85)
end

--AI VORE MECHANICS
ENT.VoreSettings = {}
ENT.VoreSettings.OnlyEatsEnemies = false
ENT.VoreSettings.EatsPlayers = true
ENT.VoreSettings.BurpsEnabled = true --we burping?
ENT.VoreSettings.HasWeightGain = true --is weight gain enabled? HELL YEAH!

--BELLY VISUALS/SETUP
ENT.Belly_Offset = Vector(-2, 6, 0) --gut offset from pelvis, change this!
ENT.Belly_Angles = Angle(0, 100, 90) --The rotation of the gut!
ENT.BellyMaterial = "models/wormonlooker/belly/belly_valkyr" --Use this to set custom belly materials. Check out the materials folder!
ENT.VoreSettings.BellyFloorModifier = 0.3 --how low/high belly will be angled to avoid floor clipping. The higher the value, the more elevated.
--ENT.SpineBone = "" --Replace and uncomment with a bone name if the NPC couldn't find a proper anchor for the belly.

--BELLY PROPERTIES
ENT.BellyProperties = {
	BellyColor = Color(230, 113, 70), --< Replaces color of belly, uses RGB 
	DigestionStrength = 8, --Digestion: 2 = weak, 4 = normal, 6 = athletic, 8 = predator, 10 = apex, 12 = instant
	AbsorptionPower = 2.5, --Absorption: 1 = weak, 1.5 = normal, 2 = athletic, 2.5 = predator, 3 = apex, 4 = instant
	MaxBaseSize = 0, --< Max size for Belly fat
	BaseSize = 0, --< Inital belly size when spawned in
	FatFoldsMaxSize = 0.4, --< Fat folds max size (Fat folds are at the origin of the belly model)
	StopClipFix = false, --< Stops the clipping prevention.
}

--ENT.BellyObject = "ent_vore_belly" --If you are using a custom belly, it goes here.


--WEIGHT GAIN BONE DEFINITIONS, CHANGE THESE!
ENT.VoreSettings.WeightGainBones = {
    "ValveBiped.Bip01_L_Thigh",
    "ValveBiped.Bip01_R_Thigh",

	"ValveBiped.Bip01_L_Calf",
	"ValveBiped.Bip01_R_Calf",

    "ValveBiped.Bip01_Pelvis",
    "ValveBiped.Bip01_Spine",
    "ValveBiped.Bip01_Spine1",

        "Butt_l",
		"Butt_01_l",
		"Butt_r",
		"Butt_01_r",
		
		"Breast_l",
		"Breast_01_l",
		"Breast_02_l",
		"Breast_r",
		"Breast_01_r",
		"Breast_02_r",
}

--WEIGHT GAIN MULTIPLIERS
ENT.VoreSettings.WeightGainSettings = {
--This is our weight gain maximum.
	MaxBreast = 1.4;
	MaxThigh = 1.2;
	MaxCalf = 1.1;
    MaxWaist = 1.2;
    MaxSpine = 1.2;

--How strong do we gain weight in these areas? Keep low!
	BoobMultiplier = 0.4;
	ThighMultiplier = 0.2;
	CalfMultiplier = 0.2;
    WaistMultiplier = 0.1;
    SpineMultiplier = 0.2;
}

--This is temporary and will be changed in the future, defines max expansion and x,y,z growth rate for associated bones.
ENT.VoreSettings.WeightGainDefiners = {
	["Boob"] = function(value, max)
		return Vector(
			math.min(value, max * 1),
			math.min(value, max * 1.3),
			math.min(value, max * 1)
		)
	end,
	["Thigh"] = function(value, max)
		return Vector(
			math.min(value, max * 0.75),
			math.min(value, max * 1),
			math.min(value, max * 1)
		)
	end,
	["Calf"] = function(value, max)
		return Vector(
			math.min(value, max * 0.75),
			math.min(value, max * 1),
			math.min(value, max * 1)
		)
	end,
	["Waist"] = function(value, max)
		return Vector(
			math.min(value, max * 1.2),
			math.min(value, max * 0.8),
			math.min(value, max * 1)
		)
	end,
	["Spine"] = function(value, max)
		return Vector(
			math.min(value, max * 0.8),
			math.min(value, max * 1.1),
			math.min(value, max * 1.5)
		)
	end,
}

--FACIAL ANIMATION SETTINGS
ENT.VoreSettings.FlexFaces = {
	[0] = { --IDLE, use dump_bot_flexes!
    ["Stare"] = 1.000,
    ["Serious"] = 1.000,
	},
	[1] = { --SWALLOWING INITIALLY
    ["Blink_Happy"] = 1.000,
    ["Sadness"] = 1.000,
    ["Serious"] = 1.000,
	},
	[2] = { --HAS PREY IN BELLY
    ["Blink_Happy"] = 0.400,
    ["Cheerful"] = 0.600,
    ["Sadness"] = 0.510,
	},
	[3] = { --BELCHING
    ["Eye_Happy"] = 1.000,
    ["Surprise"] = 1.000,
    ["Upper"] = 1.000,
	},
	[4] = { --FINAL SWALLOW/TO FULL STATE
    ["Wink"] = 1.000,
    ["Cheerful"] = 1.000,
	},
}

--THIS IS FOR MODELS WITH DRESSES/SKIRTS THAT CLIP AS WEIGHT GAIN OCCURS!
--To be fair, I don't get how this works yet. Eventually, I will.
--ENT.DressList = {
--	["HemSE01_L"] = {pos = Vector(0, 0, -6)},
--	["HemSE02_L"] = {pos = Vector(0, 0, 0)},
--	["HemSE03_L"] = {pos = Vector(0, 0, 0)},
--	["HemBA21_L"] = {pos = Vector(0, 0, 0)},
--	["HemBA11_L"] = {pos = Vector(0, 0, 0)},
--	["Sweet_0_0"] = {pos = Vector(0, 0, 6.5)},
--	["Sweet_5_0"] = {pos = Vector(0, 0, 0)},
--	["Sweet_0_4"] = {pos = Vector(6, 0, 0)},
--	["Sweet_5_4"] = {pos = Vector(0, 0, 0)},
--	["Sweet_0_8"] = {pos = Vector(0, 0, -6)},
--	["Sweet_4_8"] = {pos = Vector(0, 0, 0)},
--	["Sweet_8_8"] = {pos = Vector(0, 0, 0)},
--	["Sweet_0_11"] = {pos = Vector(-7, 0, 0)},
--	["Sweet_4_11"] = {pos = Vector(0, 0, 0)},
--	["Sweet_8_11"] = {pos = Vector(0, 0, 0)},
--	["HemSD13_R"] = {pos = Vector(-6, 0, 0)},
--	["HemSD14_R"] = {pos = Vector(0, 0, 0)}
--}

--ENT.TriggerBone = "ValveBiped.Bip01_Pelvis"
--ENT.TriggerThreshold = Vector(1.0, 1.0, 1.0)
--ENT.OffsetFullFactor = 1.5

local function LerpAngle(t, ang1, ang2)
	return Angle(
		Lerp(t, ang1.p, ang2.p),
		Lerp(t, ang1.y, ang2.y),
		Lerp(t, ang1.r, ang2.r)
	)
end

--ANIMATION/BONE-LERP SETTINGS, USE DUMP_BOT_BONES FOR POSE EXPORTS
local AnimatedBoneList = {
	[0] = { --IDLE POSE
	["ValveBiped.Bip01_Pelvis"] = {
		pos = Vector(0, 0, -2),
		ang = Angle(0, 0, 10)
	},
	["ValveBiped.Bip01_L_Thigh"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(-5, -25, 5)
	},
	["ValveBiped.Bip01_L_Calf"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 45, 0)
	},
	["ValveBiped.Bip01_L_Foot"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(10, -30, -5)
	},
	["ValveBiped.Bip01_R_Thigh"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(5, -15, 5)
	},
	["ValveBiped.Bip01_R_Calf"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 35, 0)
	},
	["ValveBiped.Bip01_R_Foot"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(10, -22, 19)
	},
	["ValveBiped.Bip01_Spine"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 10, 0)
	},
	["ValveBiped.Bip01_Spine1"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 10, 0)
	},
	["ValveBiped.Bip01_Spine2"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -10, 0)
	},
	["ValveBiped.Bip01_Spine4"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -10, 0)
	},
	["ValveBiped.Bip01_Neck1"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -20, 0)
	},
	["ValveBiped.Bip01_L_UpperArm"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 0, -45)
	},
	["ValveBiped.Bip01_L_Forearm"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(-10, 0, -15)
	},
	["ValveBiped.Bip01_R_UpperArm"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 0, 45)
	},
	["ValveBiped.Bip01_R_Forearm"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(10, 0, 15)
	},
	["Tail_01_x"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 0, 35)
	},
	["Tail_02_x"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 0, 22)
	},
	["Tail_03_x"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 0, 29)
	},
	["Tail_04_x"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 0, 45)
	},
	["Tail_05_x"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 0, 64)
	},
	["ValveBiped.Bip01_R_Finger2"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(6, 13, 0)
	},
	["ValveBiped.Bip01_R_Finger22"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -19, 0)
	},
	["ValveBiped.Bip01_R_Finger1"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(6, 32, 0)
	},
	["ValveBiped.Bip01_R_Finger12"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -25, 0)
	},
	["ValveBiped.Bip01_R_Finger0"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -38, 35)
	},
	["ValveBiped.Bip01_R_Finger02"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 25, 0)
	},
	["ValveBiped.Bip01_R_Finger4"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(-16, 0, 0)
	},
	["ValveBiped.Bip01_R_Finger42"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -22, 0)
	},
	["ValveBiped.Bip01_R_Finger32"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -29, 0)
	},
	["ValveBiped.Bip01_L_Finger2"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(-6, 13, 0)
	},
	["ValveBiped.Bip01_L_Finger22"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -19, 0)
	},
	["ValveBiped.Bip01_L_Finger1"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(-6, 32, 0)
	},
	["ValveBiped.Bip01_L_Finger12"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -25, 0)
	},
	["ValveBiped.Bip01_L_Finger0"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -38, -35)
	},
	["ValveBiped.Bip01_L_Finger02"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 25, 0)
	},
	["ValveBiped.Bip01_L_Finger4"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(16, 0, 0)
	},
	["ValveBiped.Bip01_L_Finger42"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -22, 0)
	},
	["ValveBiped.Bip01_L_Finger32"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -29, 0)
	},
},

	[1] = { --SWALLOW POSE INITIAL
	["Jawbone_x"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 0, 15)
	},
	["ValveBiped.Bip01_Pelvis"] = {
		pos = Vector(0, 0, 2),
		ang = Angle(0, 0, -5)
	},
	["ValveBiped.Bip01_L_Thigh"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 10, 0)
	},
	["ValveBiped.Bip01_L_Foot"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 35, 0)
	},
	["ValveBiped.Bip01_L_Toe0"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -45, 0)
	},
	["ValveBiped.Bip01_R_Foot"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 35, 0)
	},
	["ValveBiped.Bip01_R_Toe0"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -35, 0)
	},
	["ValveBiped.Bip01_Spine2"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -16, 0)
	},
	["ValveBiped.Bip01_Spine4"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -3, 0)
	},
	["ValveBiped.Bip01_Neck1"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 19, 0)
	},
	["ValveBiped.Bip01_L_UpperArm"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(-13, 3, -35)
	},
	["ValveBiped.Bip01_L_Forearm"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -83, 0)
	},
	["ValveBiped.Bip01_L_Hand"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -29, -3)
	},
	["ValveBiped.Bip01_R_UpperArm"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(3, 22, 22)
	},
	["ValveBiped.Bip01_R_Forearm"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -41, 0)
	},
	["ValveBiped.Bip01_R_Hand"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(16, 0, -73)
	},
	["Breast_l"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 6, 0)
	},
	["Breast_01_l"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 0, -22)
	},
	["Breast_02_l"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 0, -80)
	},
	["Tail_03_x"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 0, 16)
	},
	["Tail_04_x"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 0, 22)
	},
	["Tail_05_x"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 0, 51)
	},
	["ValveBiped.Bip01_L_Finger1"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(-19, 6, 19)
	},
	["ValveBiped.Bip01_L_Finger12"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -3, 0)
	},
	["ValveBiped.Bip01_L_Finger0"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(6, -32, -32)
	},
	["ValveBiped.Bip01_L_Finger02"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 3, 0)
	},
	["ValveBiped.Bip01_L_Finger4"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(13, 41, 10)
	},
	["ValveBiped.Bip01_L_Finger42"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -38, 0)
	},
	["ValveBiped.Bip01_L_Finger3"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(6, 6, 6)
	},
	["ValveBiped.Bip01_L_Finger32"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -19, 0)
	},
	["ValveBiped.Bip01_R_Finger1"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(10, 0, 0)
	},
	["ValveBiped.Bip01_R_Finger0"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(-6, -19, 57)
	},
	["ValveBiped.Bip01_R_Finger4"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(-10, 0, -19)
	},
	["ValveBiped.Bip01_R_Finger3"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(-6, 0, 0)
	},
},

	[2] = { --PREY IN BELLY POSE
	["ValveBiped.Bip01_Pelvis"] = {
		pos = Vector(0, 0, -2),
		ang = Angle(0, 0, 10)
	},
	["ValveBiped.Bip01_L_Thigh"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(-5, -25, 5)
	},
	["ValveBiped.Bip01_L_Calf"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 45, 0)
	},
	["ValveBiped.Bip01_L_Foot"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(10, -30, -5)
	},
	["ValveBiped.Bip01_R_Thigh"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(5, -15, 5)
	},
	["ValveBiped.Bip01_R_Calf"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 35, 0)
	},
	["ValveBiped.Bip01_R_Foot"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(10, -22, 19)
	},
	["ValveBiped.Bip01_Spine"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -10, 0)
	},
	["ValveBiped.Bip01_Spine2"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -10, 0)
	},
	["ValveBiped.Bip01_Spine4"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -10, 0)
	},
	["ValveBiped.Bip01_Neck1"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -20, 0)
	},
	["ValveBiped.Bip01_L_UpperArm"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 0, -45)
	},
	["ValveBiped.Bip01_L_Forearm"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(-10, -25, -15)
	},
	["ValveBiped.Bip01_L_Hand"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 0, 57)
	},
	["ValveBiped.Bip01_R_UpperArm"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 19, 45)
	},
	["ValveBiped.Bip01_R_Forearm"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(10, -13, -22)
	},
	["ValveBiped.Bip01_R_Hand"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -10, -22)
	},
	["Tail_02_x"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 0, -29)
	},
	["Tail_05_x"] = {
		pos = Vector(0, 0, 7),
		ang = Angle(0, 0, 38)
	},
	["ValveBiped.Bip01_L_Finger2"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(-6, 13, 0)
	},
	["ValveBiped.Bip01_L_Finger22"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -19, 0)
	},
	["ValveBiped.Bip01_L_Finger1"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(-6, 32, 0)
	},
	["ValveBiped.Bip01_L_Finger12"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -25, 0)
	},
	["ValveBiped.Bip01_L_Finger0"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -38, -35)
	},
	["ValveBiped.Bip01_L_Finger02"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 25, 0)
	},
	["ValveBiped.Bip01_L_Finger4"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(16, 0, 0)
	},
	["ValveBiped.Bip01_L_Finger42"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -22, 0)
	},
	["ValveBiped.Bip01_L_Finger32"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -29, 0)
	},
	["ValveBiped.Bip01_R_Finger2"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(6, 13, 0)
	},
	["ValveBiped.Bip01_R_Finger22"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -19, 0)
	},
	["ValveBiped.Bip01_R_Finger1"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(6, 32, 0)
	},
	["ValveBiped.Bip01_R_Finger12"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -25, 0)
	},
	["ValveBiped.Bip01_R_Finger0"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -38, 35)
	},
	["ValveBiped.Bip01_R_Finger02"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 25, 0)
	},
	["ValveBiped.Bip01_R_Finger4"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(-16, 0, 0)
	},
	["ValveBiped.Bip01_R_Finger42"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -22, 0)
	},
	["ValveBiped.Bip01_R_Finger32"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -29, 0)
	},

},

	[3] = { --BELCHING POSE
	["ValveBiped.Bip01_Pelvis"] = {
		pos = Vector(0, 0, -2),
		ang = Angle(0, 0, 10)
	},
	["ValveBiped.Bip01_L_Thigh"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(-5, -25, 5)
	},
	["ValveBiped.Bip01_L_Calf"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 45, 0)
	},
	["ValveBiped.Bip01_L_Foot"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(10, -30, -5)
	},
	["ValveBiped.Bip01_R_Thigh"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(5, -15, 5)
	},
	["ValveBiped.Bip01_R_Calf"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 35, 0)
	},
	["ValveBiped.Bip01_R_Foot"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(10, -22, 19)
	},
	["ValveBiped.Bip01_Spine"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 10, 0)
	},
	["ValveBiped.Bip01_Spine1"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -10, 0)
	},
	["ValveBiped.Bip01_Spine2"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -10, 0)
	},
	["ValveBiped.Bip01_Spine4"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 13, 0)
	},
	["ValveBiped.Bip01_Neck1"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -20, 0)
	},
	["Jawbone_x"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 0, 10)
	},
	["ValveBiped.Bip01_L_UpperArm"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 0, -45)
	},
	["ValveBiped.Bip01_L_Forearm"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(-10, -29, -41)
	},
	["ValveBiped.Bip01_L_Hand"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(13, 25, -32)
	},
	["ValveBiped.Bip01_R_UpperArm"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(25, -13, -29)
	},
	["ValveBiped.Bip01_R_Forearm"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(19, -41, 22)
	},
	["ValveBiped.Bip01_R_Hand"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(6, 19, 0)
	},
	["Breast_l"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -10, 0)
	},
	["Breast_01_l"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 0, 10)
	},
	["Breast_r"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 10, 0)
	},
	["Breast_01_r"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 0, 10)
	},
	["Tail_01_x"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 0, 35)
	},
	["Tail_02_x"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 0, 22)
	},
	["Tail_04_x"] = {
		pos = Vector(0, 0, -9),
		ang = Angle(0, 0, -67)
	},
	["Tail_05_x"] = {
		pos = Vector(0, 0, 11),
		ang = Angle(0, 0, 64)
	},
	["ValveBiped.Bip01_L_Finger2"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(-6, 13, 0)
	},
	["ValveBiped.Bip01_L_Finger22"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -80, 0)
	},
	["ValveBiped.Bip01_L_Finger1"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(-6, 32, -19)
	},
	["ValveBiped.Bip01_L_Finger12"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -73, 0)
	},
	["ValveBiped.Bip01_L_Finger0"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -38, -35)
	},
	["ValveBiped.Bip01_L_Finger02"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 89, 0)
	},
	["ValveBiped.Bip01_L_Finger4"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(16, 0, 35)
	},
	["ValveBiped.Bip01_L_Finger42"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -70, 0)
	},
	["ValveBiped.Bip01_L_Finger3"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 0, 13)
	},
	["ValveBiped.Bip01_L_Finger32"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -86, 0)
	},
	["ValveBiped.Bip01_R_Finger2"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(6, 38, 0)
	},
	["ValveBiped.Bip01_R_Finger22"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 19, 0)
	},
	["ValveBiped.Bip01_R_Finger1"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(6, 67, 0)
	},
	["ValveBiped.Bip01_R_Finger12"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -25, 0)
	},
	["ValveBiped.Bip01_R_Finger0"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(10, -38, -6)
	},
	["ValveBiped.Bip01_R_Finger02"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 25, 0)
	},
	["ValveBiped.Bip01_R_Finger4"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(-16, 29, 0)
	},
	["ValveBiped.Bip01_R_Finger3"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 35, 0)
	},
	["ValveBiped.Bip01_R_Finger32"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -3, 0)
	},
},

	[4] = { --FINAL SWALLOW/TO FULL POSE
	["ValveBiped.Bip01_Pelvis"] = {
		pos = Vector(0, 0, 2),
		ang = Angle(0, 0, -5)
	},
	["ValveBiped.Bip01_L_Thigh"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 10, 0)
	},
	["ValveBiped.Bip01_L_Foot"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 35, 0)
	},
	["ValveBiped.Bip01_L_Toe0"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -45, 0)
	},
	["ValveBiped.Bip01_R_Foot"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 35, 0)
	},
	["ValveBiped.Bip01_R_Toe0"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -35, 0)
	},
	["ValveBiped.Bip01_Spine2"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -16, 0)
	},
	["ValveBiped.Bip01_Spine4"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -3, 0)
	},
	["ValveBiped.Bip01_Neck1"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 19, 0)
	},
	["ValveBiped.Bip01_L_UpperArm"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(-13, 3, -35)
	},
	["ValveBiped.Bip01_L_Forearm"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -83, 0)
	},
	["ValveBiped.Bip01_L_Hand"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -29, -3)
	},
	["ValveBiped.Bip01_R_UpperArm"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(3, 22, 22)
	},
	["ValveBiped.Bip01_R_Forearm"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -41, 0)
	},
	["ValveBiped.Bip01_R_Hand"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(16, 0, -73)
	},
	["Breast_l"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 6, 0)
	},
	["Breast_01_l"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 0, -22)
	},
	["Breast_02_l"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 0, -80)
	},
	["Tail_03_x"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 0, 16)
	},
	["Tail_04_x"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 0, 22)
	},
	["Tail_05_x"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 0, 51)
	},
	["ValveBiped.Bip01_L_Finger1"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(-19, 6, 19)
	},
	["ValveBiped.Bip01_L_Finger12"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -3, 0)
	},
	["ValveBiped.Bip01_L_Finger0"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(6, -32, -32)
	},
	["ValveBiped.Bip01_L_Finger02"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 3, 0)
	},
	["ValveBiped.Bip01_L_Finger4"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(13, 41, 10)
	},
	["ValveBiped.Bip01_L_Finger42"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -38, 0)
	},
	["ValveBiped.Bip01_L_Finger3"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(6, 6, 6)
	},
	["ValveBiped.Bip01_L_Finger32"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -19, 0)
	},
	["ValveBiped.Bip01_R_Finger1"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(10, 0, 0)
	},
	["ValveBiped.Bip01_R_Finger0"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(-6, -19, 57)
	},
	["ValveBiped.Bip01_R_Finger4"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(-10, 0, -19)
	},
	["ValveBiped.Bip01_R_Finger3"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(-6, 0, 0)
	},
},
}

--WEIGHT GAIN BONE OFFSETS
--These take priority over above poses, will adjust specific bones for weight gain
ENT.VoreSettings.BoneOffsets = {
	["ValveBiped.Bip01_R_Clavicle"] = {
		Max = 25, --< Max Angle
		Multi = 5, --< The slope of the angle changing
		Start = 16, --< Inital Angle
		["Angle"] = Angle(0,1,0),
	},
	["ValveBiped.Bip01_L_Clavicle"] = {
		Max = 32,
		Multi = 5,
		Start = 16,
		["Angle"] = Angle(0,1,0),
	} 
}

--ACTUAL CODE, LOOK AWAY LEST YOUR EYES START TO BLEED!
function ENT:CustomOnInitialize()
	self.BoneBlendState = {}
	self.LastFacialPhase = 0
	self.FacialPhaseStartTime = CurTime()
end

local function InterpolateKeyframes(keyframes, tNorm, boneName)
	local closestBefore, closestAfter = nil, nil

	for k,_ in pairs(keyframes) do
		if k <= tNorm then
			if (not closestBefore) or k > closestBefore then closestBefore = k end
        	end
		if k >= tNorm then
			if (not closestAfter) or k < closestAfter then closestAfter = k end
		end
	end

	closestBefore = closestBefore or closestAfter
	closestAfter  = closestAfter  or closestBefore

	local frame1 = keyframes[closestBefore] or {}
	local frame2 = keyframes[closestAfter]  or {}

	local a = (closestAfter - closestBefore)
	local f = (a > 0) and ( (tNorm - closestBefore) / a ) or 0

	local b1 = frame1[boneName]
	local b2 = frame2[boneName]

	if not b1 and not b2 then
		return vector_origin, angle_zero
	end

	local pos1 = b1 and b1.pos or vector_origin
	local pos2 = b2 and b2.pos or pos1

	local ang1 = b1 and b1.ang or angle_zero
	local ang2 = b2 and b2.ang or ang1

	return LerpVector(f, pos1, pos2), LerpAngle(f, ang1, ang2)
end

function ENT:AnimatedBoneOffsets()
	if not self.BoneBlendState then
		self.BoneBlendState = {}
	end

	if SERVER then return end

	local phase = self:GetNWInt("FacialPhase", -1)
	local data = AnimatedBoneList[phase] or AnimatedBoneList[0]

	if phase ~= self.LastFacialPhase then
		self.FacialPhaseStartTime = CurTime()
		self.FacialPhaseStartTime = CurTime()
		self.LastFacialPhase = phase
	end

	local boneCount = self:GetBoneCount()
	local speed = 3 --<<<<<<<<<<<<<<<<<<<<<<<<<<<<SETS SPEED OF BONE-LERP, HIGHER = FASTER MOVEMENTS

	for i = 0, boneCount - 1 do
		local boneName = self:GetBoneName(i)
		if not boneName then continue end

		local tgtPos, tgtAng = vector_origin, angle_zero

		if data.keyframes and data.length then
			local elapsed = CurTime() - self.FacialPhaseStartTime
			local tNorm = elapsed / data.length
			tNorm = math.abs((tNorm % 2) - 1)
			tgtPos, tgtAng = InterpolateKeyframes(data.keyframes, tNorm, boneName)

		elseif data.pose or data[boneName] then
			local tgt = (data.pose and data.pose[boneName]) or data[boneName]
			if tgt then
				tgtPos = tgt.pos or vector_origin
				tgtAng = tgt.ang or angle_zero
			end
		end

		local cur = self.BoneBlendState[boneName]
		if not cur then
			cur = {pos = vector_origin, ang = angle_zero}
			self.BoneBlendState[boneName] = cur
		end

		local lerpTime = 1 - math.exp(-speed * FrameTime())
		cur.pos = LerpVector(lerpTime, cur.pos, tgtPos)
		cur.ang = LerpAngle(lerpTime, cur.ang, tgtAng)

		self:ManipulateBonePosition(i, cur.pos)
		self:ManipulateBoneAngles(i, cur.ang)
	end
end

function ENT:Think()
  if self.BaseClass.Think then
    self.BaseClass.Think(self)
  end

  if self._VoreAnimateBonesThink then
    self:_VoreAnimateBonesThink()
  end

  if CLIENT and GetConVar("drg_animate"):GetBool() then
    self:AnimatedBoneOffsets()
  end
end

function ENT:DumpFlexData()
    if self:GetFlexNum() <= 0 then
        print("[DrGBase] No flexes found.")
        return
    end

    print("local FaceData = {")

    for i = 0, self:GetFlexNum() - 1 do
        local name = self:GetFlexName(i)
        local weight = self:GetFlexWeight(i)

        if weight > 0 then
            print(string.format('    ["%s"] = %.3f,', name, weight))
        end
    end

    print("}")
end

local cvar_AnimatedBones = GetConVar("drg_animate") or CreateConVar(...)

-- DO NOT TOUCH --
AddCSLuaFile()
DrGBase.AddNextbot(ENT)