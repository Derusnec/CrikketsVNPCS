---------------------------------------------------------------------------
-- HI! Welcome to the new standardized vore template for my V-NPCs. Follow along with
-- the comments for the best results.

-- drg_animate 0/1, 0 disables bonelerping for overhauled bone tool adjustments
-- dump_bot_bones will print a formatted list of bone edits into console for easy copy/paste
-- dump_bot_flexes will print a formatted list of facial edits into console for easy copy/paste
---------------------------------------------------------------------------
if not DrGBase then return end -- Make sure you have DrGBase installed or nothing will work!
ENT.Base = "npc_vore_base" -- The base template for all bots, keep the same!

ENT.PrintName = "Meru (Neko)" -- This will be the printed name of your bot.
ENT.Category = "Crikket's V-NPC" -- This is the category your bot is in, Vore is the generic one.
ENT.ModNeeded = "NO" -- This is where you'll put the steam workshop ID for your V-NPC model.

--BASIC MODEL INFO
ENT.Models = {"models/b211/meru/meru.mdl"} -- Insert the V-NPC model's path here. You can copy it in Gmod.
ENT.SpawnHealth = 128 --Spawn health (128=light, 256=normal, 384=beefy, 512=strong, 768=danger, 1024=boss, 2048=apex)
ENT.HealthRegen = 6 --two is basic, just enough for survivability. Bots regen pretty quick, be careful with this!
ENT.BloodColor = BLOOD_COLOR_RED --blood color, can be BLOOD_COLOR_YELLOW, _ANTLION, _MECH, or even DONT_BLEED
ENT.ModelScale = 1.1 --scale of initial model, be careful with this!
ENT.Skins = {1} --The bot's skin. This cannot be randomized without extra coding.
ENT.BodyGroups = {
	["Meru Cat Ears"] = 1,
	["Meru Hair"] = 1
}

--AI BEHAVIOR
ENT.Omniscient = false --do we see all, everywhere, always?
ENT.Frightening = false --do we scare NPCs away?

--AI DETECTION BEHAVIOR
ENT.EyeBone = "ValveBiped.Bip01_Head1" --The bone the NPC will see from.
ENT.EyeOffset = Vector(0, 0, 0)
ENT.EyeAngle = Angle(0, 0, 0)
ENT.SightFOV = 120 --This is our field of view for the V-NPC
ENT.SightRange = 512 --This is our view distance in hammer units.
ENT.HearingCoefficient = 4 --The higher this is, the more sensitive their hearing. Judge it from 1 - 10, 10 being ultrahearing.
ENT.SpotDuration = 45 --How long do we pursue prey we see?

--AI MOVEMENT BEHAVIOR
ENT.WalkSpeed = 128 --The bot's walking speed, or idle speed.
ENT.RunSpeed = 192 --The bot's speed when in pursuit.
ENT.Acceleration = 256 --The bot's acceleration per second.
ENT.JumpHeight = 512 --Jump height! Recommended to leave as is.
ENT.DeathDropHeight = 4096 --if we fall this far, we die.
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
ENT.ClimbSpeed = 128 --The ladder climb rate.
ENT.ClimbUpAnimation = ACT_ZOMBIE_CLIMB_UP --Most NPCs have this activity.
ENT.ClimbDownAnimation = ACT_ZOMBIE_CLIMB_DOWN --Most NPCs have this activity.
ENT.ClimbOffset = Vector(0, 0, 0) --Climb offsets for better visuals when climbing. I don't bother.
ENT.MaxYawRate = 384 --The bot's turning speed, 128 = tank, 256 = normal, 384 = snap, 512 = guided missile
ENT.StepHeight = 20 --How high can your bot step up ledges without climbing? 20 = normal, 40 = big gal, 60 = giant
ENT.ClimbLedgesMinHeight = 21 --Recommended to set right above step height.

--ANIMATION BEHAVIOR
ENT.IdleAnimation = ACT_HL2MP_IDLE
ENT.WalkAnimation = ACT_HL2MP_RUN
ENT.RunAnimation = ACT_HL2MP_RUN_DUEL
ENT.AttackAnimation = "zombie_attack_special_original" --attack animation, beckon is pretty solid for a faux-swallow motion.
ENT.MeleeAttackRange = 72 -- +16 enemy range. So 64, 72, 80, 88, 108 respectively
ENT.ReachEnemyRange = 56 --attack range: 48 = small, 56 = normal, 64 = efficient, 72 = tall, 96 = giant.

--AI SOUNDS, IDLE SOUNDS ARE PRETTY MUCH ALL THAT'S WORTH IT RIGHT NOW
--ENT.OnSpawnSounds = {
--    "INSERT_SOUND_HERE"
--}
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

ENT.Footsteps = { --Footstep sounds! Defaults to barefoot steps I added.
    ["Default"] = {
        "belly/barestep1.wav",
        "belly/barestep2.wav",
        "belly/barestep3.wav",
        "belly/barestep4.wav"
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
ENT.BellyColor = Color(184, 56, 56) --gut color
ENT.Belly_Offset = Vector(-3, 4, 0) --gut offset from pelvis
ENT.BellyMaterial = "models/wormonlooker/belly/belly_meru" --this is belly materials, special use case
ENT.VoreSettings.MaxBaseSize = 0 --any leftover chub? 1 = full belly 0 = flat belly
ENT.VoreSettings.BellyFloorModifier = 0.3 --how low/high belly will be angled to avoid floor clipping. The higher the value, the more elevated.
ENT.VoreSettings.FatFoldsMaxSize = 0.1 --you can set this to zero to not have fat folds, or 1 for an obese mf.

--DIGESTION SETTINGS
ENT.VoreSettings.DigestionStrength = 6 --Digestion: 2 = weak, 4 = normal, 6 = athletic, 8 = predator, 10 = apex, 12 = instant
ENT.VoreSettings.AbsorptionSpeed = 2.5 --Absorption: 1 = weak, 1.5 = normal, 2 = athletic, 2.5 = predator, 3 = apex, 4 = instant
ENT.VoreSettings.StruggleMultiplier = 1.5 --Sets struggle deformation strength on belly: 1.5 = weak, 1 = normal, 0.5 = big pred/chubby pred

--WEIGHT GAIN BONE DEFINITIONS, CHANGE THESE!
ENT.VoreSettings.WeightGainBones = {
    "ValveBiped.Bip01_L_Thigh",
    "ValveBiped.Bip01_R_Thigh",

	"ValveBiped.Bip01_L_Calf",
	"ValveBiped.Bip01_R_Calf",

    "ValveBiped.Bip01_Pelvis",
    "ValveBiped.Bip01_Spine",
    "ValveBiped.Bip01_Spine1",

        "Breast1_R",
		"Breast2_R",
        "Breast1_L",
		"Breast2_R",
		
		"ButtTail1",
		"ButtTail2",
		"ButtTail3",
		"ButtTail4",
		"ButtTail5",
		"ButtTail6",
		"ButtTail7",
		"ButtTail8",
		"ButtTail9",
		"ButtTail10", --No need to remove end commas on this table.
}

--WEIGHT GAIN MULTIPLIERS
ENT.VoreSettings.WeightGainSettings = {
--This is our weight gain maximum.
	MaxBreast = 1.2;
	MaxThigh = 1.6;
	MaxCalf = 1.1;
    MaxWaist = 1.6;
    MaxSpine = 1.4;

--weight gain mults
	BoobMultiplier = 0.2;
	ThighMultiplier = 0.6;
	CalfMultiplier = 0.3;
    WaistMultiplier = 0.6;
    SpineMultiplier = 0.3;
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
    ["SquintL"] = 0.250,
    ["SquintR"] = 0.250,
    ["EyeLidCurveL"] = 1.000,
    ["EyeLidCurveR"] = 1.000,
    ["WClosed"] = 1.000,
    ["EyeBrowLow1L"] = 1.000,
    ["EyeBrowLow1R"] = 1.000,
    ["HighLightLowL"] = 1.000,
    ["HighLightLowR"] = 1.000,


	},
	[1] = { --SWALLOWING INITIALLY
    ["AlmostWinkL"] = 1.000,
    ["AlmostWinkR"] = 1.000,
    ["I"] = 1.000,
    ["WOpen"] = 0.750,
    ["HappyL"] = 1.000,
    ["HappyR"] = 1.000,
    ["WideL"] = 0.300,
    ["WideR"] = 0.300,
    ["SmileAlmostOpen"] = 0.470,
    ["StarL"] = 1.000,
    ["StarR"] = 1.000,
    ["EyeBrowLow2L"] = 1.000,
    ["EyeBrowLow2R"] = 1.000,
    ["EyeBrowUp2L"] = 1.000,
    ["EyeBrowUp2R"] = 1.000,
    ["EyeLidCurveL"] = 1.000,
    ["EyeLidCurveR"] = 1.000,
    ["HighLightLowL"] = 1.000,
    ["HighLightLowR"] = 1.000,


	},
	[2] = { --HAS PREY IN BELLY
    ["BlinkL"] = 0.250,
    ["BlinkR"] = 0.250,
    ["EyeLidCurveL"] = 1.000,
    ["EyeLidCurveR"] = 1.000,
    ["WClosed"] = 0.600,
    ["HappyL"] = 1.000,
    ["HappyR"] = 1.000,
    ["SmileAlmostOpen"] = 1.000,
    ["EyeBrowLow2L"] = 1.000,
    ["EyeBrowLow2R"] = 1.000,


	},
	[3] = { --BELCHING
    ["EyeBiggerL"] = 0.500,
    ["EyeBiggerR"] = 0.500,
    ["EyeLidCurveL"] = 1.000,
    ["EyeLidCurveR"] = 1.000,
    ["SmirkOpen"] = 1.000,
    ["WClosed"] = 1.000,
    ["HappyR"] = 1.000,
    ["MouthSideL"] = 1.000,
    ["MadOpenR"] = 0.520,
    ["EyeBrowLow1L"] = 1.000,
    ["EyeBrowLow1R"] = 1.000,
    ["EyeBrowUp1L"] = 0.250,
    ["EyeBrowUp1R"] = 0.250,
    ["EyeBrowUp2L"] = 1.000,
    ["EyeBrowUp2R"] = 1.000,


	},
	[4] = { --FINAL SWALLOW/TO FULL STATE
    ["CalmedL"] = 0.400,
    ["CalmedR"] = 0.400,
    ["EyeLidCurveL"] = 1.000,
    ["EyeLidCurveR"] = 1.000,
    ["WClosed"] = 1.000,
    ["HappyL"] = 1.000,
    ["HappyR"] = 1.000,
    ["TongueOutUpLeft"] = 1.000,
    ["MouthSideL"] = 1.000,
    ["MouthUp"] = 1.000,
    ["HighLightLowL"] = 1.000,
    ["HighLightLowR"] = 1.000,

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
		ang = Angle(0, 0, 8)
	},
	["ValveBiped.Bip01_L_Thigh"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -24, 0)
	},
	["ValveBiped.Bip01_L_Foot"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 16, 0)
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
		ang = Angle(0, 15, 0)
	},
	["ValveBiped.Bip01_Spine4"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -30, 0)
	},
	["ValveBiped.Bip01_R_Clavicle"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(-15, 15, -12)
	},
	["ValveBiped.Bip01_R_UpperArm"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 0, 30)
	},
	["ValveBiped.Bip01_R_Forearm"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -40, 0)
	},
	["ValveBiped.Bip01_R_Hand"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(-34, 0, -64)
	},
	["ValveBiped.Bip01_L_Clavicle"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(15, 15, -12)
	},
	["ValveBiped.Bip01_L_UpperArm"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 0, -30)
	},
	["ValveBiped.Bip01_L_Forearm"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -40, 0)
	},
	["ValveBiped.Bip01_L_Hand"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(34, 0, 64)
	},
	["Eye_L"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 0, -3),
		scale = Vector(1 ,1 ,0.7)
	},
	["Eye_R"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 0, 3),
		scale = Vector(1 ,1 ,0.7)
	},
	["ValveBiped.Bip01_L_Finger21"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -45, 0)
	},
	["ValveBiped.Bip01_L_Finger1"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(-15, 0, -24)
	},
	["ValveBiped.Bip01_L_Finger11"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -45, 0)
	},
	["ValveBiped.Bip01_L_Finger12"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -45, 0)
	},
	["ValveBiped.Bip01_L_Finger0"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -32, 0)
	},
	["ValveBiped.Bip01_L_Finger02"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 76, 0)
	},
	["ValveBiped.Bip01_L_Finger4"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(35, 0, 45)
	},
	["ValveBiped.Bip01_L_Finger41"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -45, 0)
	},
	["ValveBiped.Bip01_L_Finger42"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -45, 0)
	},
	["ValveBiped.Bip01_L_Finger3"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(15, 0, 12)
	},
	["ValveBiped.Bip01_L_Finger31"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -45, 0)
	},
	["ValveBiped.Bip01_L_Finger32"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -45, 0)
	},
	["ValveBiped.Bip01_L_Finger22"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -45, 0)
	},
	["ValveBiped.Bip01_R_Finger21"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -45, 0)
	},
	["ValveBiped.Bip01_R_Finger22"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -45, 0)
	},
	["ValveBiped.Bip01_R_Finger1"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(15, 0, 24)
	},
	["ValveBiped.Bip01_R_Finger11"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -45, 0)
	},
	["ValveBiped.Bip01_R_Finger12"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -45, 0)
	},
	["ValveBiped.Bip01_R_Finger0"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -32, 0)
	},
	["ValveBiped.Bip01_R_Finger02"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 76, 0)
	},
	["ValveBiped.Bip01_R_Finger4"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(-35, 0, -45)
	},
	["ValveBiped.Bip01_R_Finger41"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -45, 0)
	},
	["ValveBiped.Bip01_R_Finger42"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -45, 0)
	},
	["ValveBiped.Bip01_R_Finger3"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(-15, 0, -12)
	},
	["ValveBiped.Bip01_R_Finger31"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -45, 0)
	},
	["ValveBiped.Bip01_R_Finger32"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -45, 0)
	},
	["ButtTail2"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -10, 0)
	},
	["ButtTail3"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -15, 0)
	},
	["ButtTail4"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 10, 0)
	},
	["ButtTail5"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 15, 0)
	},
	["ButtTail6"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 20, 0)
	},
	["ButtTail7"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -10, 0)
	},
	["ButtTail8"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -15, 0)
	},
	["ButtTail9"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -20, 0)
	},
	["ButtTail10"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -30, 0)
	},
},

	[1] = { --SWALLOW POSE INITIAL
	["ValveBiped.Bip01_Pelvis"] = {
		pos = Vector(0, 0, -2),
		ang = Angle(0, 0, 8)
	},
	["ValveBiped.Bip01_L_Thigh"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -24, 0)
	},
	["ValveBiped.Bip01_L_Foot"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 16, 0)
	},
	["ValveBiped.Bip01_Spine"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 10, 0)
	},
	["ValveBiped.Bip01_Spine1"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -38, 0)
	},
	["ValveBiped.Bip01_Spine2"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 15, 0)
	},
	["ValveBiped.Bip01_Spine4"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -30, 0)
	},
	["ValveBiped.Bip01_R_Clavicle"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(-15, 15, -12)
	},
	["ValveBiped.Bip01_R_UpperArm"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 19, 30)
	},
	["ValveBiped.Bip01_R_Forearm"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -22, 0)
	},
	["ValveBiped.Bip01_R_Hand"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(-34, 0, -63)
	},
	["ValveBiped.Bip01_L_Clavicle"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(15, 15, -12)
	},
	["ValveBiped.Bip01_L_UpperArm"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 19, -25)
	},
	["ValveBiped.Bip01_L_Forearm"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -13, 0)
	},
	["ValveBiped.Bip01_L_Hand"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(34, 0, 63)
	},
	["Eye_L"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 12, -3),
		scale = Vector(1 ,1 ,0.7)
	},
	["Eye_R"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 12, 3),
		scale = Vector(1 ,1 ,0.7)
	},
	["ValveBiped.Bip01_L_Finger21"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -44, 0)
	},
	["ValveBiped.Bip01_L_Finger1"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(-15, 0, -24)
	},
	["ValveBiped.Bip01_L_Finger11"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -44, 0)
	},
	["ValveBiped.Bip01_L_Finger12"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -44, 0)
	},
	["ValveBiped.Bip01_L_Finger0"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -32, 0)
	},
	["ValveBiped.Bip01_L_Finger02"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 75, 0)
	},
	["ValveBiped.Bip01_L_Finger4"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(35, 0, 44)
	},
	["ValveBiped.Bip01_L_Finger41"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -44, 0)
	},
	["ValveBiped.Bip01_L_Finger42"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -44, 0)
	},
	["ValveBiped.Bip01_L_Finger3"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(15, 0, 12)
	},
	["ValveBiped.Bip01_L_Finger31"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -44, 0)
	},
	["ValveBiped.Bip01_L_Finger32"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -44, 0)
	},
	["ValveBiped.Bip01_L_Finger22"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -44, 0)
	},
	["ValveBiped.Bip01_R_Finger21"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -44, 0)
	},
	["ValveBiped.Bip01_R_Finger22"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -44, 0)
	},
	["ValveBiped.Bip01_R_Finger1"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(15, 0, 24)
	},
	["ValveBiped.Bip01_R_Finger11"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -44, 0)
	},
	["ValveBiped.Bip01_R_Finger12"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -44, 0)
	},
	["ValveBiped.Bip01_R_Finger0"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -32, 0)
	},
	["ValveBiped.Bip01_R_Finger02"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 75, 0)
	},
	["ValveBiped.Bip01_R_Finger4"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(-35, 0, -44)
	},
	["ValveBiped.Bip01_R_Finger41"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -44, 0)
	},
	["ValveBiped.Bip01_R_Finger42"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -44, 0)
	},
	["ValveBiped.Bip01_R_Finger3"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(-15, 0, -12)
	},
	["ValveBiped.Bip01_R_Finger31"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -44, 0)
	},
	["ValveBiped.Bip01_R_Finger32"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -44, 0)
	},
	["ButtTail2"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -10, 0)
	},
	["ButtTail3"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -15, 0)
	},
	["ButtTail4"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 10, 0)
	},
	["ButtTail5"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 19, 25)
	},
	["ButtTail6"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 20, 41)
	},
	["ButtTail7"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -10, 41)
	},
	["ButtTail8"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -15, 19)
	},
	["ButtTail9"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(-57, 86, 0)
	},
	["ButtTail10"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -30, 0)
	},
},

	[2] = { --PREY IN BELLY POSE
	["ValveBiped.Bip01_Pelvis"] = {
		pos = Vector(0, 0, -2),
		ang = Angle(0, 0, 8)
	},
	["ValveBiped.Bip01_L_Thigh"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -24, 0)
	},
	["ValveBiped.Bip01_L_Foot"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 16, 0)
	},
	["ValveBiped.Bip01_Spine"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 10, 0)
	},
	["ValveBiped.Bip01_Spine1"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -38, 0)
	},
	["ValveBiped.Bip01_Spine2"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 15, 0)
	},
	["ValveBiped.Bip01_Spine4"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -30, 0)
	},
	["ValveBiped.Bip01_R_Clavicle"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(-15, 15, -12)
	},
	["ValveBiped.Bip01_R_UpperArm"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 19, 30)
	},
	["ValveBiped.Bip01_R_Forearm"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -22, 0)
	},
	["ValveBiped.Bip01_R_Hand"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(-34, 0, -63)
	},
	["ValveBiped.Bip01_L_Clavicle"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(15, 15, -12)
	},
	["ValveBiped.Bip01_L_UpperArm"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 19, -25)
	},
	["ValveBiped.Bip01_L_Forearm"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -13, 0)
	},
	["ValveBiped.Bip01_L_Hand"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(34, 0, 63)
	},
	["ValveBiped.Bip01_Neck1"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -54, 0)
	},
	["Eye_L"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 12, -3),
		scale = Vector(1 ,1 ,0.7)
	},
	["Eye_R"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 12, 3),
		scale = Vector(1 ,1 ,0.7)
	},
	["ValveBiped.Bip01_L_Finger21"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -44, 0)
	},
	["ValveBiped.Bip01_L_Finger1"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(-15, 0, -24)
	},
	["ValveBiped.Bip01_L_Finger11"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -44, 0)
	},
	["ValveBiped.Bip01_L_Finger12"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -44, 0)
	},
	["ValveBiped.Bip01_L_Finger0"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -32, 0)
	},
	["ValveBiped.Bip01_L_Finger02"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 75, 0)
	},
	["ValveBiped.Bip01_L_Finger4"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(35, 0, 44)
	},
	["ValveBiped.Bip01_L_Finger41"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -44, 0)
	},
	["ValveBiped.Bip01_L_Finger42"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -44, 0)
	},
	["ValveBiped.Bip01_L_Finger3"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(15, 0, 12)
	},
	["ValveBiped.Bip01_L_Finger31"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -44, 0)
	},
	["ValveBiped.Bip01_L_Finger32"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -44, 0)
	},
	["ValveBiped.Bip01_L_Finger22"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -44, 0)
	},
	["ValveBiped.Bip01_R_Finger21"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -44, 0)
	},
	["ValveBiped.Bip01_R_Finger22"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -44, 0)
	},
	["ValveBiped.Bip01_R_Finger1"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(15, 0, 24)
	},
	["ValveBiped.Bip01_R_Finger11"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -44, 0)
	},
	["ValveBiped.Bip01_R_Finger12"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -44, 0)
	},
	["ValveBiped.Bip01_R_Finger0"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -32, 0)
	},
	["ValveBiped.Bip01_R_Finger02"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 75, 0)
	},
	["ValveBiped.Bip01_R_Finger4"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(-35, 0, -44)
	},
	["ValveBiped.Bip01_R_Finger41"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -44, 0)
	},
	["ValveBiped.Bip01_R_Finger42"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -44, 0)
	},
	["ValveBiped.Bip01_R_Finger3"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(-15, 0, -12)
	},
	["ValveBiped.Bip01_R_Finger31"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -44, 0)
	},
	["ValveBiped.Bip01_R_Finger32"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -44, 0)
	},
	["ButtTail2"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -10, 0)
	},
	["ButtTail3"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -15, 0)
	},
	["ButtTail4"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 10, 0)
	},
	["ButtTail5"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 19, 25)
	},
	["ButtTail6"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 20, 41)
	},
	["ButtTail7"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -10, 41)
	},
	["ButtTail8"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -15, 19)
	},
	["ButtTail9"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(-57, 86, 0)
	},
	["ButtTail10"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -30, 0)
	},
},

	[3] = { --BELCHING POSE
	["ValveBiped.Bip01_Pelvis"] = {
		pos = Vector(0, 0, -2),
		ang = Angle(0, 0, 8)
	},
	["ValveBiped.Bip01_L_Thigh"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -24, 0)
	},
	["ValveBiped.Bip01_L_Foot"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 16, 0)
	},
	["ValveBiped.Bip01_Spine"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 10, 0)
	},
	["ValveBiped.Bip01_Spine1"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -38, 0)
	},
	["ValveBiped.Bip01_Spine2"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 18, 0)
	},
	["ValveBiped.Bip01_Spine4"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -20, 0)
	},
	["ValveBiped.Bip01_R_Clavicle"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(-15, 15, -12)
	},
	["ValveBiped.Bip01_R_UpperArm"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 19, 30)
	},
	["ValveBiped.Bip01_R_Forearm"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -22, 0)
	},
	["ValveBiped.Bip01_R_Hand"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(-34, 0, -63)
	},
	["ValveBiped.Bip01_L_Clavicle"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(15, 15, -12)
	},
	["ValveBiped.Bip01_L_UpperArm"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 19, -25)
	},
	["ValveBiped.Bip01_L_Forearm"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -13, 0)
	},
	["ValveBiped.Bip01_L_Hand"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(34, 0, 63)
	},
	["ValveBiped.Bip01_Neck1"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -23, 0)
	},
	["Eye_L"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 0, 1),
		scale = Vector(1 ,1 ,0.7)
	},
	["Eye_R"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 0, -1),
		scale = Vector(1 ,1 ,0.7)
	},
	["ValveBiped.Bip01_L_Finger21"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -44, 0)
	},
	["ValveBiped.Bip01_L_Finger1"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(-15, 0, -24)
	},
	["ValveBiped.Bip01_L_Finger11"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -44, 0)
	},
	["ValveBiped.Bip01_L_Finger12"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -44, 0)
	},
	["ValveBiped.Bip01_L_Finger0"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -32, 0)
	},
	["ValveBiped.Bip01_L_Finger02"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 75, 0)
	},
	["ValveBiped.Bip01_L_Finger4"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(35, 0, 44)
	},
	["ValveBiped.Bip01_L_Finger41"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -44, 0)
	},
	["ValveBiped.Bip01_L_Finger42"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -44, 0)
	},
	["ValveBiped.Bip01_L_Finger3"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(15, 0, 12)
	},
	["ValveBiped.Bip01_L_Finger31"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -44, 0)
	},
	["ValveBiped.Bip01_L_Finger32"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -44, 0)
	},
	["ValveBiped.Bip01_L_Finger22"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -44, 0)
	},
	["ValveBiped.Bip01_R_Finger21"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -44, 0)
	},
	["ValveBiped.Bip01_R_Finger22"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -44, 0)
	},
	["ValveBiped.Bip01_R_Finger1"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(15, 0, 24)
	},
	["ValveBiped.Bip01_R_Finger11"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -44, 0)
	},
	["ValveBiped.Bip01_R_Finger12"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -44, 0)
	},
	["ValveBiped.Bip01_R_Finger0"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -32, 0)
	},
	["ValveBiped.Bip01_R_Finger02"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 75, 0)
	},
	["ValveBiped.Bip01_R_Finger4"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(-35, 0, -44)
	},
	["ValveBiped.Bip01_R_Finger41"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -44, 0)
	},
	["ValveBiped.Bip01_R_Finger42"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -44, 0)
	},
	["ValveBiped.Bip01_R_Finger3"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(-15, 0, -12)
	},
	["ValveBiped.Bip01_R_Finger31"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -44, 0)
	},
	["ValveBiped.Bip01_R_Finger32"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -44, 0)
	},
},

	[4] = { --FINAL SWALLOW/TO FULL POSE
	["ValveBiped.Bip01_Neck1"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -44, 0)
	},
	["ValveBiped.Bip01_Pelvis"] = {
		pos = Vector(0, 0, -2),
		ang = Angle(0, 0, 8)
	},
	["ValveBiped.Bip01_L_Thigh"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -24, 0)
	},
	["ValveBiped.Bip01_L_Foot"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 16, 0)
	},
	["ValveBiped.Bip01_Spine"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 10, 0)
	},
	["ValveBiped.Bip01_Spine1"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -38, 0)
	},
	["ValveBiped.Bip01_Spine2"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 15, 0)
	},
	["ValveBiped.Bip01_Spine4"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -30, 0)
	},
	["ValveBiped.Bip01_R_Clavicle"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(-10, 15, -12)
	},
	["ValveBiped.Bip01_R_UpperArm"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 19, 30)
	},
	["ValveBiped.Bip01_R_Forearm"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -22, 0)
	},
	["ValveBiped.Bip01_R_Hand"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(-34, 0, -63)
	},
	["ValveBiped.Bip01_L_Clavicle"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(10, 15, -12)
	},
	["ValveBiped.Bip01_L_UpperArm"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 19, -25)
	},
	["ValveBiped.Bip01_L_Forearm"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -13, 0)
	},
	["ValveBiped.Bip01_L_Hand"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(34, 0, 63)
	},
	["Eye_L"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 12, -3),
		scale = Vector(1 ,1 ,0.7)
	},
	["Eye_R"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 12, 3),
		scale = Vector(1 ,1 ,0.7)
	},
	["ValveBiped.Bip01_L_Finger21"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -44, 0)
	},
	["ValveBiped.Bip01_L_Finger1"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(-15, 0, -24)
	},
	["ValveBiped.Bip01_L_Finger11"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -44, 0)
	},
	["ValveBiped.Bip01_L_Finger12"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -44, 0)
	},
	["ValveBiped.Bip01_L_Finger0"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -32, 0)
	},
	["ValveBiped.Bip01_L_Finger02"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 75, 0)
	},
	["ValveBiped.Bip01_L_Finger4"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(35, 0, 44)
	},
	["ValveBiped.Bip01_L_Finger41"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -44, 0)
	},
	["ValveBiped.Bip01_L_Finger42"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -44, 0)
	},
	["ValveBiped.Bip01_L_Finger3"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(15, 0, 12)
	},
	["ValveBiped.Bip01_L_Finger31"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -44, 0)
	},
	["ValveBiped.Bip01_L_Finger32"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -44, 0)
	},
	["ValveBiped.Bip01_L_Finger22"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -44, 0)
	},
	["ValveBiped.Bip01_R_Finger21"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -44, 0)
	},
	["ValveBiped.Bip01_R_Finger22"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -44, 0)
	},
	["ValveBiped.Bip01_R_Finger1"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(15, 0, 24)
	},
	["ValveBiped.Bip01_R_Finger11"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -44, 0)
	},
	["ValveBiped.Bip01_R_Finger12"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -44, 0)
	},
	["ValveBiped.Bip01_R_Finger0"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -32, 0)
	},
	["ValveBiped.Bip01_R_Finger02"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 75, 0)
	},
	["ValveBiped.Bip01_R_Finger4"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(-35, 0, -44)
	},
	["ValveBiped.Bip01_R_Finger41"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -44, 0)
	},
	["ValveBiped.Bip01_R_Finger42"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -44, 0)
	},
	["ValveBiped.Bip01_R_Finger3"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(-15, 0, -12)
	},
	["ValveBiped.Bip01_R_Finger31"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -44, 0)
	},
	["ValveBiped.Bip01_R_Finger32"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -44, 0)
	},
	["ButtTail2"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -10, 0)
	},
	["ButtTail3"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -15, 0)
	},
	["ButtTail4"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 10, 0)
	},
	["ButtTail5"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 19, 25)
	},
	["ButtTail6"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 20, 41)
	},
	["ButtTail7"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -10, 41)
	},
	["ButtTail8"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -15, 19)
	},
	["ButtTail9"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(-57, 86, 0)
	},
	["ButtTail10"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, -30, 0)
	},
},
}


ENT.VoreSettings.BoneOffsets = {
	["ValveBiped.Bip01_R_Clavicle"] = {
		Max = 24, --< Max Angle
		Multi = 10, --< The slope of the angle changing
		Start = 6, --< Inital Angle
		["Angle"] = Angle(0,1,0),
	},
	["ValveBiped.Bip01_L_Clavicle"] = {
		Max = 24,
		Multi = 10,
		Start = 6,
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

-- DO NOT TOUCH --
AddCSLuaFile()
DrGBase.AddNextbot(ENT)