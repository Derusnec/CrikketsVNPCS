---------------------------------------------------------------------------
-- HI! Welcome to the new standardized vore template for my V-NPCs. Follow along with
-- the comments for the best results.

-- drg_animate 0/1, 0 disables bonelerping for overhauled bone tool adjustments
-- dump_bot_bones will print a formatted list of bone edits into console for easy copy/paste
-- dump_bot_flexes will print a formatted list of facial edits into console for easy copy/paste
---------------------------------------------------------------------------
if not DrGBase then return end -- Make sure you have DrGBase installed or nothing will work!
ENT.Base = "npc_vore_base" -- The base template for all bots, keep the same!

ENT.PrintName = "Angela" -- This will be the printed name of your bot.
ENT.Category = "Crikket's V-NPC" -- This is the category your bot is in, Vore is the generic one.
ENT.ModNeeded = "https://steamcommunity.com/sharedfiles/filedetails/?id=3558714376" -- This is where you'll put the steam workshop ID for your V-NPC model.

--BASIC MODEL INFO
ENT.Models = {"models/kemonoroo/angela/angela.mdl"} -- Insert the V-NPC model's path here. You can copy it in Gmod.
ENT.SpawnHealth = 256 --Spawn health (128=light, 256=normal, 384=beefy, 512=strong, 768=danger, 1024=boss, 2048=apex)
ENT.HealthRegen = 4 --two is basic, just enough for survivability. Bots regen pretty quick, be careful with this!
ENT.BloodColor = BLOOD_COLOR_RED --blood color, can be BLOOD_COLOR_YELLOW, _ANTLION, _MECH, or even DONT_BLEED
ENT.ModelScale = 1 --scale of initial model, be careful with this!
ENT.Skins = {1} --The bot's skin. This cannot be randomized without extra coding.
ENT.BodyGroups = {
	["Body"] = 14,
	["Ear"] = 1,
	["Fur"] = 1,
	["Leggings"] = 1,
	["Nimb"] = 2,
	["Shoes"] = 1,
	["Skirt"] = 2,
	["Thong"] = 4,
	["Top"] = 1,
	["Nun Clothes"] = 1,
	["Nun"] = 1
}

--AI BEHAVIOR
ENT.Omniscient = false --do we see all, everywhere, always?
ENT.Frightening = false --do we scare NPCs away?

--AI DETECTION BEHAVIOR
ENT.EyeBone = "ValveBiped.Bip01_Head1" --The bone the NPC will see from.
ENT.EyeOffset = Vector(0, 0, 0)
ENT.EyeAngle = Angle(0, 0, 0)
ENT.SightFOV = 90 --This is our field of view for the V-NPC
ENT.SightRange = 512 --This is our view distance in hammer units.
ENT.HearingCoefficient = 8 --The higher this is, the more sensitive their hearing. Judge it from 1 - 10, 10 being ultrahearing.
ENT.SpotDuration = 90 --How long do we pursue prey we see?

--AI MOVEMENT BEHAVIOR
ENT.WalkSpeed = 144 --The bot's walking speed, or idle speed.
ENT.RunSpeed = 72 --The bot's speed when in pursuit.
ENT.Acceleration = 144 --The bot's acceleration per second.
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
ENT.ClimbSpeed = 56 --The ladder climb rate.
ENT.ClimbUpAnimation = ACT_ZOMBIE_CLIMB_UP --Most NPCs have this activity.
ENT.ClimbDownAnimation = ACT_ZOMBIE_CLIMB_DOWN --Most NPCs have this activity.
ENT.ClimbOffset = Vector(0, 0, 0) --Climb offsets for better visuals when climbing. I don't bother.
ENT.MaxYawRate = 256 --The bot's turning speed, 128 = tank, 256 = normal, 384 = snap, 512 = guided missile
ENT.StepHeight = 20 --How high can your bot step up ledges without climbing? 20 = normal, 40 = big gal, 60 = giant
ENT.ClimbLedgesMinHeight = 21 --Recommended to set right above step height.

--ANIMATION BEHAVIOR
ENT.IdleAnimation = ACT_HL2MP_IDLE_SCARED
ENT.WalkAnimation = ACT_HL2MP_RUN_PANICKED
ENT.RunAnimation = ACT_HL2MP_WALK_CROUCH_FIST
ENT.AttackAnimation = "seq_preskewer" --attack animation, beckon is pretty solid for a faux-swallow motion.
ENT.MeleeAttackRange = 72 -- +16 enemy range. So 64, 72, 80, 88, 108 respectively
ENT.ReachEnemyRange = 56 --attack range: 48 = small, 56 = normal, 64 = efficient, 72 = tall, 96 = giant.

--AI SOUNDS, IDLE SOUNDS ARE PRETTY MUCH ALL THAT'S WORTH IT RIGHT NOW
ENT.OnIdleSounds = {
    "belly/npc_angela_vocal_01.wav",
    "belly/npc_angela_vocal_02.wav",
    "belly/npc_angela_vocal_03.wav",
    "belly/npc_angela_vocal_04.wav",
    "belly/npc_angela_vocal_05.wav",
    "belly/npc_angela_vocal_06.wav"
}
ENT.IdleSoundDelay = math.random(4,12)
ENT.ClientIdleSounds = false
--ENT.OnDamageSounds = {
    --"INSERT_SOUND_HERE",
    --"INSERT_SOUND_HERE",
    --"INSERT_SOUND_HERE"
--}
--ENT.DamageSoundDelay = 1
--ENT.OnDeathSounds = {
--    "INSERT_SOUND_HERE"
--}
ENT.Footsteps = {
    ["Default"] = {
        "player/footsteps/cleats_conc_01.wav",
        "player/footsteps/cleats_conc_02.wav",
        "player/footsteps/cleats_conc_03.wav",
        "player/footsteps/cleats_conc_04.wav"
    },
}
function ENT:EmitFootstep()
    if not self.Footsteps or not self.Footsteps["Default"] then return end
    self:EmitSound(table.Random(self.Footsteps["Default"]), 75, 100)
end
ENT.VoreSoundPitch = 1.3
--AI VORE MECHANICS
ENT.VoreSettings = {}
ENT.VoreSettings.OnlyEatsEnemies = false
ENT.VoreSettings.EatsPlayers = true
ENT.VoreSettings.BurpsEnabled = true --we burping?
ENT.VoreSettings.HasWeightGain = true --is weight gain enabled? HELL YEAH!

--VORE BELLY VISUALS
ENT.BellyColor = Color(255, 250, 233) --gut color
ENT.Belly_Offset = Vector(-3, 7, 0) --gut offset from pelvis
--ENT.BellyMaterial = "models/wormonlooker/belly/belly_celshaded" --this is belly materials, special use case
ENT.VoreSettings.MaxBaseSize = 0.4 --any leftover chub? 1 = full belly 0 = flat belly
ENT.VoreSettings.BellyFloorModifier = 3 --how low/high belly will be angled. The higher the value, the more elevated.
ENT.VoreSettings.FatFoldsMaxSize = 0.7 --you can set this to zero to not have fat folds

--DIGESTION SETTINGS
ENT.VoreSettings.DigestionStrength = 2 --Digestion: 2 = weak, 4 = normal, 6 = athletic, 8 = predator, 10 = apex, 12 = instant
ENT.VoreSettings.AbsorptionSpeed = 1 --Absorption 1 = weak, 1.5 = normal, 2 = athletic, 2.5 = predator, 3 = apex, 4 = instant
ENT.VoreSettings.StruggleMultiplier = 1 --1.5 = weak, 1 = normal, 0.5 = big pred/chubby pred

--WEIGHT GAIN BONE DEFINITIONS
ENT.VoreSettings.WeightGainBones = {
    "ValveBiped.Bip01_L_Thigh",
    "ValveBiped.Bip01_R_Thigh",

	"ValveBiped.Bip01_L_Calf",
	"ValveBiped.Bip01_R_Calf",

    "ValveBiped.Bip01_Pelvis",
    "ValveBiped.Bip01_Spine",
    "ValveBiped.Bip01_Spine1",

        "Thigh_R",
        "Thigh_L",
		"BreastRoot",
        "Breast_L",
        "Breast_L.001",
		"Breast_L.002",
		"Breast_L.003",
        "Breast_L.004",
        "Breast_R",
        "Breast_R.001",
		"Breast_R.002",
		"Breast_R.003",
        "Breast_R.004",
		
		"Butt_L",
		"Butt_L.001",
		"Butt_L.002",
		"Butt_R",
		"Butt_R.001",
		"Butt_R.002",
		
		"Tail1",
		"Tail2",
		"Tail3",
		"Tail4",
}

--WEIGHT GAIN MULTIPLIERS
ENT.VoreSettings.WeightGainSettings = {
--weight gain max
	MaxBreast = 1.7;
	MaxThigh = 1.2;
	MaxCalf = 1.1;
    MaxWaist = 1.3;
    MaxSpine = 0.7;

--weight gain mults
	BoobMultiplier = 0.6;
	ThighMultiplier = 0.5;
	CalfMultiplier = 0.3;
    WaistMultiplier = 0.3;
    SpineMultiplier = 0.15;
}

--Defines generic breast bones for weight gain.
ENT.VoreSettings.WeightGainDefiners = {
	["breast"] = function(value, max)
		return Vector(
			math.min(value, max * 1.5),
			math.min(value, max * 1.5),
			math.min(value, max * 1.5)
		)
	end,
}

--FACIAL ANIMATION SETTINGS
ENT.VoreSettings.FlexFaces = {
	[0] = { --IDLE
    ["Mouth_Frown"] = 1.000,
    ["Emote_Concerned"] = 1.000,
    ["Eyes_Shrink"] = 0.570,
    ["EyesLookUp"] = 0.900,

	},
	[1] = { --SWALLOWING INITIALLY
    ["AA"] = 1.000,
    ["TH"] = 1.000,
    ["Blink"] = 1.000,

	},
	[2] = { --HAS PREY IN BELLY
    ["Mouth_Frown"] = 1.000,
    ["Emote_Blush"] = 1.000,
    ["EyesLookDown"] = 0.600,

	},
	[3] = { --BELCHING
    ["AA"] = 1.000,
    ["Eyes_Shrink"] = 1.000,
    ["Emote_Embarassed"] = 1.000,
    ["EyesLookUp"] = 1.000,
    ["Eyes_Up_Open"] = 0.280,
	},
	[4] = { --FINAL SWALLOW/TO FULL STATE
    ["Emote_Angry"] = 1.000,
    ["Blink"] = 0.460,

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
	["ValveBiped.Bip01_R_Clavicle"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 12, 0)
	},
	["ValveBiped.Bip01_R_UpperArm"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(5, -5, 0)
	},
	["ValveBiped.Bip01_R_Forearm"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -5, 0)
	},
	["ValveBiped.Bip01_L_Clavicle"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 12, 0)
	},
	["ValveBiped.Bip01_L_UpperArm"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(-5, -5, 0)
	},
	["ValveBiped.Bip01_L_Forearm"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -5, 0)
	},
	["Tail1"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(10, 0, -15)
	},
	["Tail2"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 15, -15)
	},
	["Tail3"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 15, -15)
	},
	["Tail4"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -15, 10)
	},
	["Nun_Thong"] = {
		pos = Vector(0, 0, 1),
		ang = Angle(-10, 3, 22)
	},
	["Nun_Thong.002"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(-3, 3, -22)
	},
	["Nun_Thong.003"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 0, 25)
	},
	["Tail5"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -15, 15)
	},
	["Tail6"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 0, 30)
	},

},

	[1] = { --SWALLOW POSE INITIAL
	["ValveBiped.Bip01_Spine"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -16, 0)
	},
	["ValveBiped.Bip01_Spine1"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -22, 0)
	},
	["ValveBiped.Bip01_R_Clavicle"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 12, 0)
	},
	["ValveBiped.Bip01_R_UpperArm"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(5, -5, 0)
	},
	["ValveBiped.Bip01_R_Forearm"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -5, 0)
	},
	["ValveBiped.Bip01_L_Clavicle"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 12, 0)
	},
	["ValveBiped.Bip01_L_UpperArm"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(-5, -5, 0)
	},
	["ValveBiped.Bip01_L_Forearm"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -5, 0)
	},
	["Tail1"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(10, 0, -15)
	},
	["Tail2"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 15, -15)
	},
	["Tail3"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 15, -15)
	},
	["Tail4"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -15, 10)
	},
	["Nun_Thong"] = {
		pos = Vector(0, 0, 1),
		ang = Angle(-10, 3, 22)
	},
	["Nun_Thong.002"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(-3, 3, -22)
	},
	["Nun_Thong.003"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 0, 25)
	},
	["Tail5"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -15, 15)
	},
	["Tail6"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 0, 30)
	},

},

	[2] = { --PREY IN BELLY POSE
	["ValveBiped.Bip01_Spine1"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -5, 0)
	},
	["ValveBiped.Bip01_Spine2"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -5, 0)
	},
	["ValveBiped.Bip01_Spine4"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -5, 0)
	},
	["ValveBiped.Bip01_R_Clavicle"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 12, 0)
	},
	["ValveBiped.Bip01_R_UpperArm"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(5, -5, 0)
	},
	["ValveBiped.Bip01_R_Forearm"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -5, 0)
	},
	["ValveBiped.Bip01_L_Clavicle"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 12, 0)
	},
	["ValveBiped.Bip01_L_UpperArm"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(-5, -5, 0)
	},
	["ValveBiped.Bip01_L_Forearm"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -5, 0)
	},
	["BreastRoot"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 0, -16)
	},
	["Tail1"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(10, 0, -15)
	},
	["Tail2"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 15, -15)
	},
	["Tail3"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 15, -15)
	},
	["Tail4"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -15, 10)
	},
	["Nun_Thong"] = {
		pos = Vector(0, 0, 1),
		ang = Angle(-10, 3, 22)
	},
	["Nun_Thong.002"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(-3, 3, -22)
	},
	["Nun_Thong.003"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 0, 25)
	},
	["Breast_L.001"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -10, 0)
	},
	["Breast_R.001"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 10, 0)
	},
	["Tail5"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -15, 15)
	},
	["Tail6"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 0, 30)
	},
	["Breast_L.003"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -45, 0)
	},
	["Breast_R.003"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 45, 0)
	},
},

	[3] = { --BELCHING POSE
	["ValveBiped.Bip01_Spine1"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -5, 0)
	},
	["ValveBiped.Bip01_Spine2"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -5, 0)
	},
	["ValveBiped.Bip01_Spine4"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -5, 0)
	},
	["ValveBiped.Bip01_R_Clavicle"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 12, 0)
	},
	["ValveBiped.Bip01_R_UpperArm"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(5, -5, 0)
	},
	["ValveBiped.Bip01_R_Forearm"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -5, 0)
	},
	["ValveBiped.Bip01_L_Clavicle"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 12, 0)
	},
	["ValveBiped.Bip01_L_UpperArm"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(-5, -10, -41)
	},
	["ValveBiped.Bip01_L_Forearm"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(3, -96, 0)
	},
	["ValveBiped.Bip01_L_Hand"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(-3, -35, -19)
	},
	["ValveBiped.Bip01_Neck1"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(19, -25, 6)
	},
	["BreastRoot"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 0, -16)
	},
	["Tail1"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(10, 0, -15)
	},
	["Tail2"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 15, -15)
	},
	["Tail3"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 15, -15)
	},
	["Tail4"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -15, 10)
	},
	["Nun_Thong"] = {
		pos = Vector(0, 0, 1),
		ang = Angle(-10, 3, 22)
	},
	["Nun_Thong.002"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(-3, 3, -22)
	},
	["Nun_Thong.003"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 0, 25)
	},
	["Breast_L.001"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -10, 0)
	},
	["Breast_R.001"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 10, 0)
	},
	["Tail5"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -15, 15)
	},
	["Tail6"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 0, 30)
	},
	["Breast_L.003"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -45, 0)
	},
	["Breast_R.003"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 45, 0)
	},

},

	[4] = { --FINAL SWALLOW/TO FULL POSE
	["ValveBiped.Bip01_R_Clavicle"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 12, 0)
	},
	["ValveBiped.Bip01_R_UpperArm"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(5, -5, 0)
	},
	["ValveBiped.Bip01_R_Forearm"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -5, 0)
	},
	["ValveBiped.Bip01_L_Clavicle"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 12, 0)
	},
	["ValveBiped.Bip01_L_UpperArm"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(-5, -5, 0)
	},
	["ValveBiped.Bip01_L_Forearm"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -5, 0)
	},
	["Tail1"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(10, 0, -15)
	},
	["Tail2"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 15, -15)
	},
	["Tail3"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 15, -15)
	},
	["Tail4"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -15, 10)
	},
	["Nun_Thong"] = {
		pos = Vector(0, 0, 1),
		ang = Angle(-10, 3, 22)
	},
	["Nun_Thong.002"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(-3, 3, -22)
	},
	["Nun_Thong.003"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 0, 25)
	},
	["Tail5"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -15, 15)
	},
	["Tail6"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 0, 30)
	},
},
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

	local phase = self:GetNWInt("FacialPhase", -1)
	local data = AnimatedBoneList[phase] or AnimatedBoneList[0]

	if phase ~= self.LastFacialPhase then
		self.FacialPhaseStartTime = CurTime()
		self.FacialPhaseStartTime = CurTime()
		self.LastFacialPhase = phase
	end

	local boneCount = self:GetBoneCount()
	local speed = 2 --<<<<<<<<<<<<<<<<<<<<<<<<<<<<SETS SPEED OF BONE-LERP, HIGHER = FASTER MOVEMENTS

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

		cur.pos = LerpVector(FrameTime() * speed, cur.pos, tgtPos)
		cur.ang = LerpAngle(FrameTime() * speed, cur.ang, tgtAng)

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

-- DO NOT TOUCH --
AddCSLuaFile()
DrGBase.AddNextbot(ENT)