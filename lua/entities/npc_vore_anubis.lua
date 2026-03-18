---------------------------------------------------------------------------
-- HI! Welcome to the new standardized vore template for my V-NPCs. Follow along with
-- the comments for the best results.

-- drg_animate 0/1, 0 disables bonelerping for overhauled bone tool adjustments
-- dump_bot_bones will print a formatted list of bone edits into console for easy copy/paste
-- dump_bot_flexes will print a formatted list of facial edits into console for easy copy/paste
---------------------------------------------------------------------------
if not DrGBase then return end -- Make sure you have DrGBase installed or nothing will work!
ENT.Base = "npc_vore_base" -- The base template for all bots, keep the same!

ENT.PrintName = "Anubis" -- This will be the printed name of your bot.
ENT.Category = "Crikket's V-NPC" -- This is the category your bot is in, Vore is the generic one.
ENT.ModNeeded = "https://steamcommunity.com/sharedfiles/filedetails/?id=3653361150" -- This is where you'll put the steam workshop ID for your V-NPC model.

--BASIC MODEL INFO
ENT.Models = {"models/ltusamodels_inc/anubis_bom39/anubis.mdl"} -- Insert the V-NPC model's path here. You can copy it in Gmod.
ENT.SpawnHealth = 512 --Spawn health (128=light, 256=normal, 384=beefy, 512=strong, 768=danger, 1024=boss, 2048=apex)
ENT.HealthRegen = 4 --two is basic, just enough for survivability. Bots regen pretty quick, be careful with this!
ENT.BloodColor = BLOOD_COLOR_RED --blood color, can be BLOOD_COLOR_YELLOW, _ANTLION, _MECH, or even DONT_BLEED
ENT.ModelScale = 1.2 --scale of initial model, be careful with this!
ENT.Skins = {0} --The bot's skin. This cannot be randomized without extra coding.
ENT.BodyGroups = {
	["Torso Clothes"] = 1,
	["Skirt"] = 1,
	["Bandages"] = 1,
	["Chains"] = 1,
	["Breasts Clothes"] = 1,
	["PP"] = 1
}

--AI BEHAVIOR
ENT.Omniscient = false --do we see all, everywhere, always?
ENT.Frightening = false --do we scare NPCs away?

--AI DETECTION BEHAVIOR
ENT.EyeBone = "ValveBiped.Bip01_Head1" --The bone the NPC will see from.
ENT.EyeOffset = Vector(0, 0, 0)
ENT.EyeAngle = Angle(0, 0, 0)
ENT.SightFOV = 115 --This is our field of view for the V-NPC
ENT.SightRange = 768 --This is our view distance in hammer units.
ENT.HearingCoefficient = 4 --The higher this is, the more sensitive their hearing. Judge it from 1 - 10, 10 being ultrahearing.
ENT.SpotDuration = 60 --How long do we pursue prey we see?

--AI MOVEMENT BEHAVIOR
ENT.WalkSpeed = 92 --The bot's walking speed, or idle speed.
ENT.RunSpeed = 112 --The bot's speed when in pursuit.
ENT.Acceleration = 72 --The bot's acceleration per second.
ENT.JumpHeight = 128 --Jump height! Recommended to leave as is.
ENT.DeathDropHeight = 768 --if we fall this far, we die.
ENT.ClimbLedges = true --we mantling?
ENT.ClimbProps = false --we mantling PROPS? Disabled due to DrgBase bugginess.
ENT.ClimbLedgesMaxHeight = 128 --How high can we climb? Be careful with this.
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
ENT.ClimbLedgesMinHeight = 128 --Recommended to set right above step height.

--ANIMATION BEHAVIOR
ENT.IdleAnimation = ACT_HL2MP_IDLE
ENT.WalkAnimation = ACT_HL2MP_WALK
ENT.RunAnimation = ACT_HL2MP_WALK
ENT.AttackAnimation = "gesture_becon_original" --attack animation, beckon is pretty solid for a faux-swallow motion.
ENT.MeleeAttackRange = 80 -- +16 enemy range. So 64, 72, 80, 88, 108 respectively
ENT.ReachEnemyRange = 64 --attack range: 48 = small, 56 = normal, 64 = efficient, 72 = tall, 96 = giant.

--AI SOUNDS, IDLE SOUNDS ARE PRETTY MUCH ALL THAT'S WORTH IT RIGHT NOW
ENT.OnSpawnSounds = {
    "player/windgust.wav"
}
--ENT.OnIdleSounds = {
--    "INSERT_SOUND_HERE",
--}
ENT.Footsteps = {
    ["Default"] = {
        "belly/barestep1.wav",
        "belly/barestep2.wav",
        "belly/barestep3.wav",
        "belly/barestep4.wav"
    },
}
ENT.Footsteps = { --Footstep sounds! Defaults to barefoot steps I added.
    ["Default"] = {
        "belly/barestep1.wav",
        "belly/barestep2.wav",
        "belly/barestep3.wav",
        "belly/barestep4.wav"
    },
}
ENT.VoreSoundPitch = 1.1
function ENT:EmitFootstep()
    if not self.Footsteps or not self.Footsteps["Default"] then return end
    self:EmitSound(table.Random(self.Footsteps["Default"]), 50, 100)
end

--AI VORE MECHANICS
ENT.VoreSettings = {}
ENT.VoreSettings.OnlyEatsEnemies = false
ENT.VoreSettings.EatsPlayers = true
ENT.VoreSettings.BurpsEnabled = true --we burping?
ENT.VoreSettings.HasWeightGain = true --is weight gain enabled? HELL YEAH!

--VORE BELLY VISUALS
ENT.BellyColor = Color(19, 19, 19) --gut color, debug starts white.
ENT.Belly_Offset = Vector(1.5, 4, 0) --gut offset from pelvis, change this!
ENT.BellyMaterial = "models/wormonlooker/belly/belly_anubis" --Use this to set custom belly materials. Check out the materials folder!
ENT.VoreSettings.MaxBaseSize = 0 --any leftover chub? 1 = full belly 0 = flat belly
ENT.VoreSettings.BellyFloorModifier = 0.3 --how low/high belly will be angled to avoid floor clipping. The higher the value, the more elevated.
ENT.VoreSettings.FatFoldsMaxSize = 0.2 --you can set this to zero to not have fat folds, or 1 for an obese mf.

--DIGESTION SETTINGS
ENT.VoreSettings.DigestionStrength = 8 --Digestion: 2 = weak, 4 = normal, 6 = athletic, 8 = predator, 10 = apex, 12 = instant
ENT.VoreSettings.AbsorptionSpeed = 2.5 --Absorption: 1 = weak, 1.5 = normal, 2 = athletic, 2.5 = predator, 3 = apex, 4 = instant
ENT.VoreSettings.StruggleMultiplier = 1 --Sets struggle deformation strength on belly: 1.5 = weak, 1 = normal, 0.5 = big pred/chubby pred

--WEIGHT GAIN BONE DEFINITIONS, CHANGE THESE!
ENT.VoreSettings.WeightGainBones = {
    "ValveBiped.Bip01_L_Thigh",
    "ValveBiped.Bip01_R_Thigh",

	"ValveBiped.Bip01_L_Calf",
	"ValveBiped.Bip01_R_Calf",

    "ValveBiped.Bip01_Pelvis",
    "ValveBiped.Bip01_Spine",
    "ValveBiped.Bip01_Spine1",

        "Phys_Breast",
        "Breast.L.001",
        "Breast.L.002",
        "Breast.L.003",
		"Breast.R.001",
		"Breast.R.002",
        "Breast.R.003",
		
        "Phy_Butt",
        "Butt.L.001",
		"Butt.L.002",
        "Butt.R.001",
		"Butt.R.002",
		
        "Penis.001",
		"Penis.002",
        "Penis.003",
		"Penis.004",
		
        "Sack.001",
		"Sack.002",
		"Sack.003",
}

--WEIGHT GAIN MULTIPLIERS
ENT.VoreSettings.WeightGainSettings = {
--This is our weight gain maximum.
	MaxBreast = 1.4;
	MaxThigh = 1.2;
	MaxCalf = 1.2;
    MaxWaist = 1.6;
    MaxSpine = 1.3;

--weight gain mults
	BoobMultiplier = 0.3;
	ThighMultiplier = 0.6;
	CalfMultiplier = 0.6;
    WaistMultiplier = 0.6;
    SpineMultiplier = 0.3;
}

--Defines generic breast bones for weight gain.
ENT.VoreSettings.WeightGainDefiners = {
	["Boob"] = function(value, max)
		return Vector(
			math.min(value, max * 0.9),
			math.min(value, max * 1.25),
			math.min(value, max * 1)
		)
	end,
	["Thigh"] = function(value, max)
		return Vector(
			math.min(value, max * 0.8),
			math.min(value, max * 1.2),
			math.min(value, max * 1.2)
		)
	end,
	["Calf"] = function(value, max)
		return Vector(
			math.min(value, max * 1),
			math.min(value, max * 1),
			math.min(value, max * 1)
		)
	end,
	["Waist"] = function(value, max)
		return Vector(
			math.min(value, max * 0.75),
			math.min(value, max * 0.5),
			math.min(value, max * 0.75)
		)
	end,
	["Spine"] = function(value, max)
		return Vector(
			math.min(value, max * 1),
			math.min(value, max * 0.5),
			math.min(value, max * 1)
		)
	end,
}

--FACIAL ANIMATION SETTINGS
ENT.VoreSettings.FlexFaces = {
	[0] = { --IDLE
                ["Peace"] = 1
	},
	[1] = { --SWALLOWING INITIALLY
                ["Wild"] = 1,
                ["Blink"] = 1,
	},
	[2] = { --HAS PREY IN BELLY
                ["Cool"] = 1,
	},
	[3] = { --BELCHING
                ["Happy"] = 1,
	},
	[4] = { --FINAL SWALLOW/TO FULL STATE
                ["Smug"] = 1,
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
	["Eye.R"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 0.000, 6.000)
	},
	["Eye.L"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 0.000, 6.000)
	},
	["ValveBiped.Bip01_Spine2"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -5.000, 0.000)
	},
	["ValveBiped.Bip01_Spine4"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -5.000, 0.000)
	},
	["ValveBiped.Bip01_Neck1"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -10.000, 0.000)
	},
	["ValveBiped.Bip01_L_Clavicle"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 5.000, 0.000)
	},
	["ValveBiped.Bip01_L_UpperArm"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 0.000, -25.000)
	},
	["ValveBiped.Bip01_L_Forearm"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 0.000, -20.000)
	},
	["ValveBiped.Bip01_L_Hand"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(-10.000, 15.000, 50.000)
	},
	["ValveBiped.Bip01_R_Clavicle"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 5.000, 0.000)
	},
	["ValveBiped.Bip01_R_UpperArm"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 0.000, 25.000)
	},
	["ValveBiped.Bip01_R_Forearm"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(10.000, -30.000, 20.000)
	},
	["ValveBiped.Bip01_R_Hand"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(15.000, -5.000, 10.000)
	},
	["ValveBiped.Bip01_L_Finger2"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(-9.531, -12.719, 0.000)
	},
	["ValveBiped.Bip01_L_Finger1"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(-15.906, 0.000, 0.000)
	},
	["ValveBiped.Bip01_L_Finger0"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -35.031, 0.000)
	},
	["ValveBiped.Bip01_L_Finger01"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 15.906, 0.000)
	},
	["ValveBiped.Bip01_L_Finger02"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 22.281, 0.000)
	},
	["ValveBiped.Bip01_L_Finger4"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(19.094, -36.000, 0.000)
	},
	["ValveBiped.Bip01_L_Finger3"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -24.000, 0.000)
	},
	["ValveBiped.Bip01_R_Finger2"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -47.781, -6.344)
	},
	["ValveBiped.Bip01_R_Finger21"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -95.563, 0.000)
	},
	["ValveBiped.Bip01_R_Finger22"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -19.094, 0.000)
	},
	["ValveBiped.Bip01_R_Finger1"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(12.719, -40.000, 0.000)
	},
	["ValveBiped.Bip01_R_Finger11"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -66.875, 0.000)
	},
	["ValveBiped.Bip01_R_Finger12"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -50.969, 0.000)
	},
	["ValveBiped.Bip01_R_Finger0"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -3.156, 0.000)
	},
	["ValveBiped.Bip01_R_Finger01"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 19.094, 0.000)
	},
	["ValveBiped.Bip01_R_Finger02"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 73.250, 0.000)
	},
	["ValveBiped.Bip01_R_Finger4"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(-25.469, -50.969, 0.000)
	},
	["ValveBiped.Bip01_R_Finger41"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -66.875, 0.000)
	},
	["ValveBiped.Bip01_R_Finger42"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -66.875, 0.000)
	},
	["ValveBiped.Bip01_R_Finger3"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(-9.531, -47.781, 0.000)
	},
	["ValveBiped.Bip01_R_Finger31"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -76.438, 0.000)
	},
	["ValveBiped.Bip01_R_Finger32"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -79.625, 0.000)
	},
	["Tail.001"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(22.281, 0.000, 10.000)
	},
	["Tail.002"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(-15.906, 0.000, -35.031)
	},
	["Tail.003"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(12.719, 0.000, -25.469)
	},
	["Tail.004"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(-25.469, 0.000, -47.781)
	},
	["Tail.005"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(-54.156, 0.000, 28.656)
	},
	["HandCuff.001"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -25.469, 0.000)
	},
	["HandCuff.002"] = {
		pos = Vector(0.375, 0.000, 0.094),
		ang = Angle(0.000, -38.219, 22.281)
	},
	["HandCuff.003"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 6.344, -12.719)
	},
	["HandCuff.004"] = {
		pos = Vector(0.000, 0.000, 0.281),
		ang = Angle(0.000, 0.000, 19.094)
	},
	["Penis.001"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 0.000, 30.000)
	},
	["Penis.002"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 0.000, 40.000)
	},
	["Penis.003"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 0.000, 20.000)
	},
	["Penis.004"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 0.000, 20.000)
	},
	["Sack.001"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 0.000, -10.000)
	},
	["Sack.002"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 0.000, -10.000)
	},
},

	[1] = { --SWALLOW POSE INITIAL
	["ValveBiped.Bip01_Spine2"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -5.000, 0.000)
	},
	["ValveBiped.Bip01_Spine4"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -20.000, 0.000)
	},
	["ValveBiped.Bip01_L_Clavicle"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 5.000, 0.000)
	},
	["ValveBiped.Bip01_L_UpperArm"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 0.000, -41.406)
	},
	["ValveBiped.Bip01_L_Forearm"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 0.000, -20.000)
	},
	["ValveBiped.Bip01_L_Hand"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(-10.000, 15.000, 50.000)
	},
	["ValveBiped.Bip01_R_Clavicle"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 15.906, 0.000)
	},
	["ValveBiped.Bip01_R_UpperArm"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -3.156, 35.031)
	},
	["ValveBiped.Bip01_R_Forearm"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(10.000, -57.344, 20.000)
	},
	["ValveBiped.Bip01_R_Hand"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(47.781, -44.594, 47.781)
	},
	["ValveBiped.Bip01_L_Finger2"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(-9.531, -12.719, 0.000)
	},
	["ValveBiped.Bip01_L_Finger1"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(-15.906, 0.000, 0.000)
	},
	["ValveBiped.Bip01_L_Finger0"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -35.031, 0.000)
	},
	["ValveBiped.Bip01_L_Finger01"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 15.906, 0.000)
	},
	["ValveBiped.Bip01_L_Finger02"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 22.281, 0.000)
	},
	["ValveBiped.Bip01_L_Finger4"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(19.094, -36.000, 0.000)
	},
	["ValveBiped.Bip01_L_Finger3"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -24.000, 0.000)
	},
	["ValveBiped.Bip01_R_Finger2"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -47.781, -6.344)
	},
	["ValveBiped.Bip01_R_Finger21"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -95.563, 0.000)
	},
	["ValveBiped.Bip01_R_Finger22"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -19.094, 0.000)
	},
	["ValveBiped.Bip01_R_Finger1"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(12.719, -40.000, 0.000)
	},
	["ValveBiped.Bip01_R_Finger11"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -66.875, 0.000)
	},
	["ValveBiped.Bip01_R_Finger12"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -50.969, 0.000)
	},
	["ValveBiped.Bip01_R_Finger0"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -3.156, 0.000)
	},
	["ValveBiped.Bip01_R_Finger01"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 19.094, 0.000)
	},
	["ValveBiped.Bip01_R_Finger02"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 73.250, 0.000)
	},
	["ValveBiped.Bip01_R_Finger4"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(-25.469, -50.969, 0.000)
	},
	["ValveBiped.Bip01_R_Finger41"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -66.875, 0.000)
	},
	["ValveBiped.Bip01_R_Finger42"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -66.875, 0.000)
	},
	["ValveBiped.Bip01_R_Finger3"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(-9.531, -47.781, 0.000)
	},
	["ValveBiped.Bip01_R_Finger31"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -76.438, 0.000)
	},
	["ValveBiped.Bip01_R_Finger32"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -79.625, 0.000)
	},
	["Tail.001"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(22.281, 0.000, 10.000)
	},
	["Tail.002"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(-15.906, 0.000, -35.031)
	},
	["Tail.003"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(12.719, 0.000, -25.469)
	},
	["Tail.004"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(-25.469, 0.000, -47.781)
	},
	["Tail.005"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(-54.156, 0.000, 28.656)
	},
	["Breast_Cloth.L.003"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 0.000, -25.469)
	},
	["Breast_Cloth.R.003"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 0.000, -25.000)
	},
	["HandCuff.002"] = {
		pos = Vector(0.500, 0.000, 0.000),
		ang = Angle(0.000, -47.781, 0.000)
	},
	["HandCuff.003"] = {
		pos = Vector(-0.281, 0.188, 0.000),
		ang = Angle(0.000, -50.969, 0.000)
	},
	["FaceCover.001"] = {
		pos = Vector(0.094, 2.500, 0.000),
		ang = Angle(0.000, 0.000, -73.250)
	},
	["Penis.001"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 0.000, 5.000)
	},
	["Penis.002"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 0.000, -5.000)
	},
	["Penis.003"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 0.000, -5.000)
	},
	["Penis.004"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 0.000, -5.000)
	},
	["Sack.001"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 0.000, -10.000)
	},
	["Sack.002"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 0.000, -10.000)
	},
},

	[2] = { --PREY IN BELLY POSE
	["ValveBiped.Bip01_Spine1"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -0.000, 0.000)
	},
	["ValveBiped.Bip01_Spine2"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -5.000, 0.000)
	},
	["ValveBiped.Bip01_Spine4"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -5.000, 0.000)
	},
	["ValveBiped.Bip01_Neck1"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -10.000, 0.000)
	},
	["ValveBiped.Bip01_L_UpperArm"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 0.000, -50.969)
	},
	["ValveBiped.Bip01_L_Forearm"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -0.000, -20.000)
	},
	["ValveBiped.Bip01_L_Hand"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(-10.000, 15.000, 50.000)
	},
	["ValveBiped.Bip01_R_UpperArm"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 0.000, 47.781)
	},
	["ValveBiped.Bip01_R_Forearm"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(9.969, -54.156, 12.719)
	},
	["ValveBiped.Bip01_R_Hand"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(-22.281, 12.719, -54.156)
	},
	["ValveBiped.Bip01_L_Finger2"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(-9.531, -12.719, 0.000)
	},
	["ValveBiped.Bip01_L_Finger1"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(-15.906, 0.000, 0.000)
	},
	["ValveBiped.Bip01_L_Finger0"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -35.031, 0.000)
	},
	["ValveBiped.Bip01_L_Finger01"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 15.906, 0.000)
	},
	["ValveBiped.Bip01_L_Finger02"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 22.281, 0.000)
	},
	["ValveBiped.Bip01_L_Finger4"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(19.094, -36.000, 0.000)
	},
	["ValveBiped.Bip01_L_Finger3"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -24.000, 0.000)
	},
	["ValveBiped.Bip01_R_Finger1"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(9.531, 9.531, 0.000)
	},
	["ValveBiped.Bip01_R_Finger0"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -22.281, 0.000)
	},
	["ValveBiped.Bip01_R_Finger4"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(-9.531, -19.094, 0.000)
	},
	["ValveBiped.Bip01_R_Finger41"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -25.469, 0.000)
	},
	["ValveBiped.Bip01_R_Finger3"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -9.531, 0.000)
	},
	["ValveBiped.Bip01_R_Finger31"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -19.094, 0.000)
	},
	["Phy_Breast"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 0.000, -0.000)
	},
	["Breast.L.001"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 0.000, 0.000)
	},
	["Breast.R.001"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -0.000, 0.000)
	},
	["Tail.001"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 0.000, 0.000)
	},
	["Tail.002"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(-0.000, 0.000, 28.656)
	},
	["Tail.003"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 0.000, 38.219)
	},
	["Tail.004"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(-0.000, 0.000, 38.219)
	},
	["Tail.005"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(-0.000, 0.000, -41.406)
	},
	["Breast_Cloth.L.002"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 10.000, 0.000)
	},
	["Breast_Cloth.L.003"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 20.000, 0.000)
	},
	["Breast_Cloth.R.002"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -10.000, 0.000)
	},
	["Breast_Cloth.R.003"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -20.000, 0.000)
	},
	["HandCuff.001"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -25.469, 0.000)
	},
	["HandCuff.002"] = {
		pos = Vector(0.500, 0.000, 0.094),
		ang = Angle(0.000, -50.969, 22.250)
	},
	["HandCuff.003"] = {
		pos = Vector(-0.000, 0.000, 0.000),
		ang = Angle(0.000, -15.906, -22.281)
	},
	["HandCuff.004"] = {
		pos = Vector(0.000, 0.000, 0.281),
		ang = Angle(0.000, 0.000, 19.094)
	},
	["Penis.001"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 0.000, 50.969)
	},
	["Penis.002"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 0.000, 38.219)
	},
	["Penis.003"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 0.000, -12.719)
	},
	["Penis.004"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 0.000, -19.094)
	},
	["Sack.001"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 0.000, -0.000)
	},
	["Sack.002"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 0.000, -0.000)
	},
	["Eye.R"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 0.000, 6.000)
	},
	["Eye.L"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 0.000, 6.000)
	},
},

	[3] = { --BELCHING POSE
	["ValveBiped.Bip01_R_Finger2"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -47.781, -6.344)
	},
	["ValveBiped.Bip01_R_Finger21"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -95.563, 0.000)
	},
	["ValveBiped.Bip01_R_Finger22"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -19.094, 0.000)
	},
	["ValveBiped.Bip01_R_Finger1"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(12.719, -40.000, 0.000)
	},
	["ValveBiped.Bip01_R_Finger11"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -66.875, 0.000)
	},
	["ValveBiped.Bip01_R_Finger12"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -50.969, 0.000)
	},
	["ValveBiped.Bip01_R_Finger0"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -3.156, 0.000)
	},
	["ValveBiped.Bip01_R_Finger01"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 19.094, 0.000)
	},
	["ValveBiped.Bip01_R_Finger02"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 73.250, 0.000)
	},
	["ValveBiped.Bip01_R_Finger4"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(-25.469, -50.969, 0.000)
	},
	["ValveBiped.Bip01_R_Finger41"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -66.875, 0.000)
	},
	["ValveBiped.Bip01_R_Finger42"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -66.875, 0.000)
	},
	["ValveBiped.Bip01_R_Finger3"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(-9.531, -47.781, 0.000)
	},
	["ValveBiped.Bip01_R_Finger31"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -76.438, 0.000)
	},
	["ValveBiped.Bip01_R_Finger32"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -79.625, 0.000)
	},
	["ValveBiped.Bip01_Spine1"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -6.344, 0.000)
	},
	["ValveBiped.Bip01_Spine2"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -5.000, 0.000)
	},
	["ValveBiped.Bip01_Spine4"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -5.000, 0.000)
	},
	["Eye.L"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 0.000, 6.000)
	},
	["Eye.R"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 0.000, 6.000)
	},
	["ValveBiped.Bip01_L_Clavicle"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 15.906, 0.000)
	},
	["ValveBiped.Bip01_L_UpperArm"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(-0.000, -0.000, -50.969)
	},
	["ValveBiped.Bip01_L_Forearm"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -12.719, -20.000)
	},
	["ValveBiped.Bip01_L_Hand"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(-25.469, 31.844, 73.250)
	},
	["ValveBiped.Bip01_R_Clavicle"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 6.344, 0.000)
	},
	["ValveBiped.Bip01_R_UpperArm"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 0.000, 31.844)
	},
	["ValveBiped.Bip01_R_Forearm"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(9.969, -54.156, 12.719)
	},
	["ValveBiped.Bip01_R_Hand"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(-22.281, 12.719, -54.156)
	},
	["ValveBiped.Bip01_L_Finger2"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(-9.531, -12.719, 0.000)
	},
	["ValveBiped.Bip01_L_Finger1"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(-15.906, 0.000, 0.000)
	},
	["ValveBiped.Bip01_L_Finger0"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -35.031, 0.000)
	},
	["ValveBiped.Bip01_L_Finger01"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 15.906, 0.000)
	},
	["ValveBiped.Bip01_L_Finger02"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 22.281, 0.000)
	},
	["ValveBiped.Bip01_L_Finger4"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(19.094, -36.000, 0.000)
	},
	["ValveBiped.Bip01_L_Finger3"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -24.000, 0.000)
	},
	["Phy_Breast"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 0.000, -0.000)
	},
	["Breast.L.001"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 0.000, 0.000)
	},
	["Breast.R.001"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -0.000, 0.000)
	},
	["Tail.001"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 0.000, 0.000)
	},
	["Tail.002"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(-0.000, 0.000, 28.656)
	},
	["Tail.003"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 0.000, 22.281)
	},
	["Tail.004"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 0.000, 22.281)
	},
	["Tail.005"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 0.000, 9.531)
	},
	["Breast_Cloth.L.002"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 10.000, 0.000)
	},
	["Breast_Cloth.L.003"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 20.000, -0.000)
	},
	["Breast_Cloth.R.002"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -10.000, 0.000)
	},
	["Breast_Cloth.R.003"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -20.000, -0.000)
	},
	["HandCuff.001"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -25.469, 0.000)
	},
	["HandCuff.002"] = {
		pos = Vector(0.500, 0.000, 0.094),
		ang = Angle(0.000, -50.969, 22.250)
	},
	["HandCuff.003"] = {
		pos = Vector(-0.000, 0.000, 0.000),
		ang = Angle(0.000, -15.906, -22.281)
	},
	["HandCuff.004"] = {
		pos = Vector(0.000, 0.000, 0.281),
		ang = Angle(0.000, 0.000, 19.094)
	},
	["FaceCover.001"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 0.000, -44.594)
	},
	["FaceCover.002"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 0.000, -19.094)
	},
	["FaceCover.003"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 0.000, -38.219)
	},
	["Penis.001"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 0.000, 35.031)
	},
	["Penis.002"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 0.000, 38.219)
	},
	["Penis.003"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 0.000, -12.719)
	},
	["Penis.004"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 0.000, -19.094)
	},
	["Sack.001"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 0.000, -0.000)
	},
	["Sack.002"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 0.000, -0.000)
	},
},

	[4] = { --FINAL SWALLOW/TO FULL POSE
	["ValveBiped.Bip01_Spine1"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -9.531, 0.000)
	},
	["ValveBiped.Bip01_Spine4"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 31.844, 0.000)
	},
	["ValveBiped.Bip01_Neck1"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 19.094, 0.000)
	},
	["ValveBiped.Bip01_L_Clavicle"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 5.000, 0.000)
	},
	["ValveBiped.Bip01_L_UpperArm"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(-19.094, -6.344, -73.250)
	},
	["ValveBiped.Bip01_L_Forearm"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(50.969, -31.844, -28.656)
	},
	["ValveBiped.Bip01_L_Hand"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(-35.031, 25.469, 31.844)
	},
	["ValveBiped.Bip01_R_Clavicle"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 15.906, 0.000)
	},
	["ValveBiped.Bip01_R_UpperArm"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(-22.281, -3.125, 50.969)
	},
	["ValveBiped.Bip01_R_Forearm"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(9.969, -76.438, 19.969)
	},
	["ValveBiped.Bip01_R_Hand"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(47.781, -44.594, 47.781)
	},
	["ValveBiped.Bip01_L_Finger0"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -44.594, 0.000)
	},
	["ValveBiped.Bip01_L_Finger01"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 15.906, 0.000)
	},
	["ValveBiped.Bip01_L_Finger02"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 22.281, 0.000)
	},
	["ValveBiped.Bip01_R_Finger2"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -47.781, -6.344)
	},
	["ValveBiped.Bip01_R_Finger21"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -95.563, 0.000)
	},
	["ValveBiped.Bip01_R_Finger22"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -19.094, 0.000)
	},
	["ValveBiped.Bip01_R_Finger1"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(12.719, -40.000, 0.000)
	},
	["ValveBiped.Bip01_R_Finger11"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -66.875, 0.000)
	},
	["ValveBiped.Bip01_R_Finger12"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -50.969, 0.000)
	},
	["ValveBiped.Bip01_R_Finger0"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -3.156, 0.000)
	},
	["ValveBiped.Bip01_R_Finger01"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 19.094, 0.000)
	},
	["ValveBiped.Bip01_R_Finger02"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 73.250, 0.000)
	},
	["ValveBiped.Bip01_R_Finger4"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(-25.469, -50.969, 0.000)
	},
	["ValveBiped.Bip01_R_Finger41"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -66.875, 0.000)
	},
	["ValveBiped.Bip01_R_Finger42"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -66.875, 0.000)
	},
	["ValveBiped.Bip01_R_Finger3"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(-9.531, -47.781, 0.000)
	},
	["ValveBiped.Bip01_R_Finger31"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -76.438, 0.000)
	},
	["ValveBiped.Bip01_R_Finger32"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -79.625, 0.000)
	},
	["Phy_Breast"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 0.000, -15.000)
	},
	["Breast.L.001"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 15.000, 0.000)
	},
	["Breast.R.001"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -15.000, 0.000)
	},
	["Tail.002"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 0.000, 28.656)
	},
	["Tail.003"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 0.000, 38.219)
	},
	["Tail.004"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 0.000, 38.219)
	},
	["Tail.005"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 0.000, -41.406)
	},
	["Breast_Cloth.L.003"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -12.719, 0.000)
	},
	["Breast_Cloth.R.002"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(28.656, 0.000, 22.281)
	},
	["Breast_Cloth.R.003"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 0.000, -19.094)
	},
	["HandCuff.002"] = {
		pos = Vector(0.500, 0.000, 0.000),
		ang = Angle(0.000, -47.781, 0.000)
	},
	["HandCuff.003"] = {
		pos = Vector(-0.281, 0.188, 0.000),
		ang = Angle(0.000, -50.969, 0.000)
	},
	["FaceCover.001"] = {
		pos = Vector(0.094, 2.500, 0.000),
		ang = Angle(0.000, 0.000, -73.250)
	},
	["Penis.001"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 0.000, 60.000)
	},
	["Penis.002"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 0.000, 5.000)
	},
	["Penis.003"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 0.000, -5.000)
	},
	["Penis.004"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 0.000, -5.000)
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