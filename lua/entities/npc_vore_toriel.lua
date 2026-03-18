---------------------------------------------------------------------------
-- HI! Welcome to the new standardized vore template for my V-NPCs. Follow along with
-- the comments for the best results.

-- drg_animate 0/1, 0 disables bonelerping for overhauled bone tool adjustments
-- dump_bot_bones will print a formatted list of bone edits into console for easy copy/paste
-- dump_bot_flexes will print a formatted list of facial edits into console for easy copy/paste
---------------------------------------------------------------------------
if not DrGBase then return end -- Make sure you have DrGBase installed or nothing will work!
ENT.Base = "npc_vore_base" -- The base template for all bots, keep the same!

ENT.PrintName = "Toriel" -- This will be the printed name of your bot.
ENT.Category = "Crikket's V-NPC" -- This is the category your bot is in, Vore is the generic one.
ENT.ModNeeded = "https://steamcommunity.com/sharedfiles/filedetails/?id=3647264258" -- This is where you'll put the steam workshop ID for your V-NPC model.

--BASIC MODEL INFO
ENT.Models = {"models/ltusamodels_inc/torielv2_bom39/torielv2_player.mdl"} -- Insert the V-NPC model's path here. You can copy it in Gmod.
ENT.SpawnHealth = 512 --Spawn health (128=light, 256=normal, 384=beefy, 512=strong, 768=danger, 1024=boss, 2048=apex)
ENT.HealthRegen = 4 --two is basic, just enough for survivability. Bots regen pretty quick, be careful with this!
ENT.BloodColor = BLOOD_COLOR_RED --blood color, can be BLOOD_COLOR_YELLOW, _ANTLION, _MECH, or even DONT_BLEED
ENT.ModelScale = 1.2 --scale of initial model, be careful with this!
ENT.Skins = {0} --The bot's skin. This cannot be randomized without extra coding.

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
ENT.WalkSpeed = 64 --The bot's walking speed, or idle speed.
ENT.RunSpeed = 128 --The bot's speed when in pursuit.
ENT.Acceleration = 72 --The bot's acceleration per second.
ENT.JumpHeight = 64 --Jump height! Recommended to leave as is.
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
ENT.MaxYawRate = 128 --The bot's turning speed, 128 = tank, 256 = normal, 384 = snap, 512 = guided missile
ENT.StepHeight = 40 --How high can your bot step up ledges without climbing? 20 = normal, 40 = big gal, 60 = giant
ENT.ClimbLedgesMinHeight = 128 --Recommended to set right above step height.

--ANIMATION BEHAVIOR
ENT.IdleAnimation = ACT_HL2MP_IDLE_DUEL
ENT.WalkAnimation = ACT_HL2MP_WALK_DUEL
ENT.RunAnimation = ACT_HL2MP_WALK_DUEL
ENT.AttackAnimation = "gesture_becon_original" --attack animation, beckon is pretty solid for a faux-swallow motion.
ENT.MeleeAttackRange = 80 -- +16 enemy range. So 64, 72, 80, 88, 108 respectively
ENT.ReachEnemyRange = 64 --attack range: 48 = small, 56 = normal, 64 = efficient, 72 = tall, 96 = giant.

--AI SOUNDS, IDLE SOUNDS ARE PRETTY MUCH ALL THAT'S WORTH IT RIGHT NOW
--ENT.OnSpawnSounds = {
--    "ambient/random_animals/gator_01.wav"
--}
ENT.OnIdleSounds = {
    "belly/toriel_idle_1.wav",
	"belly/toriel_idle_2.wav",
	"belly/toriel_idle_3.wav",
}
ENT.IdleSoundDelay = math.random(16,32)
ENT.ClientIdleSounds = false
--ENT.OnDamageSounds = {
    --"npc/zombie/zombie_pain1.wav",
    --"npc/zombie/zombie_pain2.wav",
    --"npc/headcrab/headcrab_pain1.wav"
--}
--ENT.DamageSoundDelay = 1
ENT.OnDeathSounds = {
    "belly/toriel_death_1.wav"
}
ENT.Footsteps = {
    ["Default"] = {
        "belly/barestep1.wav",
        "belly/barestep2.wav",
        "belly/barestep3.wav",
        "belly/barestep4.wav"
    },
}
function ENT:EmitFootstep()
    if not self.Footsteps or not self.Footsteps["Default"] then return end
    self:EmitSound(table.Random(self.Footsteps["Default"]), 70, 80)
end
ENT.VoreSoundPitch = 1.2
--AI VORE MECHANICS
ENT.VoreSettings = {}
ENT.VoreSettings.OnlyEatsEnemies = false
ENT.VoreSettings.EatsPlayers = true
ENT.VoreSettings.BurpsEnabled = true --we burping?
ENT.VoreSettings.HasWeightGain = true --is weight gain enabled? HELL YEAH!

--VORE BELLY VISUALS
ENT.BellyColor = Color(69, 63, 144) --gut color, debug starts white.
ENT.Belly_Offset = Vector(-2, 6, 0) --gut offset from pelvis, change this!
ENT.Belly_Angles = Angle(0, 80, 90) --The rotation of the gut!
ENT.BellyMaterial = "models/wormonlooker/belly/belly_toriel" --Use this to set custom belly materials. Check out the materials folder!
ENT.VoreSettings.MaxBaseSize = 0 --any leftover chub? 1 = full belly 0 = flat belly
ENT.VoreSettings.BellyFloorModifier = 0.2 --how low/high belly will be angled to avoid floor clipping. The higher the value, the more elevated.
ENT.VoreSettings.FatFoldsMaxSize = 1 --you can set this to zero to not have fat folds, or 1 for an obese mf.

--DIGESTION SETTINGS
ENT.VoreSettings.DigestionStrength = 4 --Digestion: 2 = weak, 4 = normal, 6 = athletic, 8 = predator, 10 = apex, 12 = instant
ENT.VoreSettings.AbsorptionSpeed = 1 --Absorption: 1 = weak, 1.5 = normal, 2 = athletic, 2.5 = predator, 3 = apex, 4 = instant
ENT.VoreSettings.StruggleMultiplier = 0.5 --Sets struggle deformation strength on belly: 1.5 = weak, 1 = normal, 0.5 = big pred/chubby pred

--WEIGHT GAIN BONE DEFINITIONS, CHANGE THESE!
ENT.VoreSettings.WeightGainBones = {
    "ValveBiped.Bip01_L_Thigh",
    "ValveBiped.Bip01_R_Thigh",

	"ValveBiped.Bip01_L_Calf",
	"ValveBiped.Bip01_R_Calf",

    "ValveBiped.Bip01_Pelvis",
    "ValveBiped.Bip01_Spine",
    "ValveBiped.Bip01_Spine1",

        "breast.L.001",
        "breast.L.002",
        "breast.L.003",
        "breast.L.004",

        "breast.R.001",
        "breast.R.002",
        "breast.R.003",
        "breast.R.004",
		
		"butt.L.001",
		"butt.L.002",
		"butt.L.003",
		"butt.L.004",
		"butt.L.005",
		"butt.R.001",
		"butt.R.002",
		"butt.R.003",
		"butt.R.004",
		"butt.R.005",
		
		"belly.001",
		"belly.002",
}

--WEIGHT GAIN MULTIPLIERS
ENT.VoreSettings.WeightGainSettings = {
--This is our weight gain maximum.
	MaxBreast = 1.2;
	MaxThigh = 1.4;
	MaxCalf = 1.4;
    MaxWaist = 1.4;
    MaxSpine = 1.4;

--weight gain mults
	BoobMultiplier = 0.2;
	ThighMultiplier = 0.4;
	CalfMultiplier = 0.4;
    WaistMultiplier = 0.4;
    SpineMultiplier = 0.4;
}

--Defines generic breast bones for weight gain.
ENT.VoreSettings.WeightGainDefiners = {
	["Boob"] = function(value, max)
		return Vector(
			math.min(value, max * 0.8),
			math.min(value, max * 1.1),
			math.min(value, max * 0.8)
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
			math.min(value, max * 0.9),
			math.min(value, max * 0.8),
			math.min(value, max * 0.9)
		)
	end,
	["Spine"] = function(value, max)
		return Vector(
			math.min(value, max * 0.9),
			math.min(value, max * 1),
			math.min(value, max * 1)
		)
	end,
}

--FACIAL ANIMATION SETTINGS
ENT.VoreSettings.FlexFaces = {
	[0] = { --rest
                ["FX_Sad"] = 1,
	},
	[1] = { --swallow
                ["FX_Angry"] = 1,
                ["FX_Fufu"] = 1,
                ["FX_Wow"] = 0.5,
	},
	[2] = { --full
                ["Blink"] = 0.3,
                ["FX_Smile"] = 1,
	},
	[3] = { --burp
                ["FX_Wow"] = 1,
                ["FX_Happy"] = 1,
	},
	[4] = { --final gulp
                ["FX_Tasty"] = 1,
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
	[0] = { -- rest
	["ValveBiped.Bip01_L_Clavicle"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(10.000, 5.000, 0.000)
	},
	["ValveBiped.Bip01_L_UpperArm"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -20.000, 30.000)
	},
	["ValveBiped.Bip01_L_Forearm"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(20.000, 30.000, 0.000)
	},
	["ValveBiped.Bip01_L_Hand"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(12.000, -30.000, 40.000)
	},
	["ValveBiped.Bip01_R_Clavicle"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(-10.000, 0.000, 0.000)
	},
	["ValveBiped.Bip01_R_UpperArm"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(5.000, 20.000, -50.000)
	},
	["ValveBiped.Bip01_R_Hand"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(12.000, -12.000, -25.000)
	},
	["phy_chest"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(10.000, 5.000, -15.000)
	},
	["breast.L.001"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(10.000, 0.000, 0.000)
	},
	["breast.R.001"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(-10.000, 0.000, 0.000)
	},
	["skirt.B"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 0.000, 20.000)
	},
	["skirt.B.001"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(6.000, 0.000, 15.000)
	},
	["skirt.B.003"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 0.000, 15.000)
	},
	["skirt.B.004"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 0.000, 40.000)
	},
	["skirt.F"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 0.000, -10.000)
	},
	["skirt.F.004"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 0.000, -40.000)
	},
	["phy_tail"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 0.000, -25.000)
	},
	["phy_tail.001"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 0.000, -45.000)
	},
},

	[1] = { -- swallow
	["ValveBiped.Bip01_Spine4"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -20.000, 0.000)
	},
	["ValveBiped.Bip01_Neck1"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 15.000, 0.000)
	},
	["ValveBiped.Bip01_L_Clavicle"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(10.000, 5.000, 0.000)
	},
	["ValveBiped.Bip01_L_UpperArm"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(-3.156, 9.531, -22.281)
	},
	["ValveBiped.Bip01_L_Forearm"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(20.000, 30.000, 0.000)
	},
	["ValveBiped.Bip01_L_Hand"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(-25.469, 31.844, 86.000)
	},
	["ValveBiped.Bip01_L_Finger21"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 54.156, 0.000)
	},
	["ValveBiped.Bip01_L_Finger0"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -22.281, 0.000)
	},
	["ValveBiped.Bip01_L_Finger41"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 47.781, 0.000)
	},
	["ValveBiped.Bip01_L_Finger31"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 50.969, 0.000)
	},
	["ValveBiped.Bip01_R_Clavicle"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(-10.000, 0.000, 0.000)
	},
	["ValveBiped.Bip01_R_UpperArm"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 44.594, 0.000)
	},
	["ValveBiped.Bip01_R_Hand"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(22.281, 38.219, -66.875)
	},
	["ValveBiped.Bip01_R_Finger21"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 54.156, 0.000)
	},
	["ValveBiped.Bip01_R_Finger22"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 28.656, 0.000)
	},
	["ValveBiped.Bip01_R_Finger0"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -28.656, 0.000)
	},
	["ValveBiped.Bip01_R_Finger4"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 12.719, 0.000)
	},
	["ValveBiped.Bip01_R_Finger41"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 50.969, 0.000)
	},
	["ValveBiped.Bip01_R_Finger3"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 3.156, 0.000)
	},
	["ValveBiped.Bip01_R_Finger31"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 50.969, 0.000)
	},
	["ValveBiped.Bip01_R_Finger32"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 9.531, 0.000)
	},
	["phy_tail"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 0.000, -25.000)
	},
	["phy_tail.001"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 0.000, -45.000)
	},
	["skirt.B"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 0.000, 20.000)
	},
	["skirt.B.001"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(6.000, 0.000, 15.000)
	},
	["skirt.B.003"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 0.000, 15.000)
	},
	["skirt.B.004"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 0.000, 40.000)
	},
	["skirt.F"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 0.000, -10.000)
	},
	["skirt.F.004"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 0.000, -40.000)
	},
},

	[2] = { -- full
	["ValveBiped.Bip01_Spine"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -5.000, -15.000)
	},
	["ValveBiped.Bip01_Spine1"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(-5.000, -10.000, 0.000)
	},
	["ValveBiped.Bip01_L_Clavicle"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(20.000, 5.000, 0.000)
	},
	["ValveBiped.Bip01_L_Forearm"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 50.000, 0.000)
	},
	["ValveBiped.Bip01_L_Hand"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 40.000, 60.000)
	},
	["ValveBiped.Bip01_R_Clavicle"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(-20.000, -5.000, 0.000)
	},
	["ValveBiped.Bip01_R_Forearm"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 40.000, 0.000)
	},
	["ValveBiped.Bip01_R_Hand"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 40.000, -60.000)
	},
	["skirt.B"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 0.000, 20.000)
	},
	["skirt.B.001"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(6.000, 0.000, 15.000)
	},
	["skirt.B.003"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 0.000, 15.000)
	},
	["skirt.B.004"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 0.000, 40.000)
	},
	["skirt.F"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 0.000, -10.000)
	},
	["skirt.F.004"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 0.000, -40.000)
	},
	["phy_chest"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 0.000, -20.000)
	},
	["breast.L.001"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(-12.000, -6.000, 12.000)
	},
	["breast.R.001"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(12.000, 6.000, 12.000)
	},
	["ValveBiped.Bip01_Neck1"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(-20.000, -10.000, 0.000)
	},
},


	[3] = { -- burp
	["ValveBiped.Bip01_Spine"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -5.000, -15.000)
	},
	["ValveBiped.Bip01_Spine1"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(-5.000, -10.000, 0.000)
	},
	["ValveBiped.Bip01_Spine4"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(6.000, 15.000, -15.000)
	},
	["ValveBiped.Bip01_Neck1"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(-20.000, -10.000, 0.000)
	},
	["ValveBiped.Bip01_L_Clavicle"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(20.000, 10.000, 0.000)
	},
	["ValveBiped.Bip01_L_Forearm"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 50.000, 0.000)
	},
	["ValveBiped.Bip01_L_Hand"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 40.000, 60.000)
	},
	["ValveBiped.Bip01_L_Finger2"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -40.000, 0.000)
	},
	["ValveBiped.Bip01_L_Finger1"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -40.000, 0.000)
	},
	["ValveBiped.Bip01_L_Finger11"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -40.000, 0.000)
	},
	["ValveBiped.Bip01_L_Finger12"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -45.000, 0.000)
	},
	["ValveBiped.Bip01_L_Finger01"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 25.000, 0.000)
	},
	["ValveBiped.Bip01_L_Finger02"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 45.000, 0.000)
	},
	["ValveBiped.Bip01_L_Finger4"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -40.000, 0.000)
	},
	["ValveBiped.Bip01_L_Finger3"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -40.000, 0.000)
	},
	["ValveBiped.Bip01_R_Clavicle"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 0.000, 25.000)
	},
	["ValveBiped.Bip01_R_UpperArm"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(20.000, 0.000, -10.000)
	},
	["ValveBiped.Bip01_R_Forearm"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(-20.000, -60.000, 0.000)
	},
	["ValveBiped.Bip01_R_Hand"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(15.000, 35.000, 50.000)
	},
	["ValveBiped.Bip01_R_Finger21"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 45.000, 0.000)
	},
	["ValveBiped.Bip01_R_Finger22"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 20.000, 0.000)
	},
	["ValveBiped.Bip01_R_Finger0"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(-10.000, 0.000, 0.000)
	},
	["ValveBiped.Bip01_R_Finger31"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 45.000, 0.000)
	},
	["ValveBiped.Bip01_R_Finger32"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -10.000, 0.000)
	},
	["phy_chest"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(5.000, 0.000, -20.000)
	},
	["breast.L.001"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 0.000, -5.000)
	},
	["breast.R.001"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(12.000, 6.000, 12.000)
	},
	["phy_tail"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 0.000, 10.000)
	},
	["phy_tail.001"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 0.000, 5.000)
	},
},

	[4] = { -- final gulp
	["ValveBiped.Bip01_Spine4"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -20.000, 0.000)
	},
	["ValveBiped.Bip01_Neck1"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 15.000, 0.000)
	},
	["ValveBiped.Bip01_L_Clavicle"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(10.000, 5.000, 0.000)
	},
	["ValveBiped.Bip01_L_UpperArm"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(-3.156, 9.531, -22.281)
	},
	["ValveBiped.Bip01_L_Forearm"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(20.000, 30.000, 0.000)
	},
	["ValveBiped.Bip01_L_Hand"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(-25.469, 31.844, 86.000)
	},
	["ValveBiped.Bip01_L_Finger21"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 54.156, 0.000)
	},
	["ValveBiped.Bip01_L_Finger0"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -22.281, 0.000)
	},
	["ValveBiped.Bip01_L_Finger41"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 47.781, 0.000)
	},
	["ValveBiped.Bip01_L_Finger31"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 50.969, 0.000)
	},
	["ValveBiped.Bip01_R_Clavicle"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(-10.000, 0.000, 0.000)
	},
	["ValveBiped.Bip01_R_UpperArm"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 44.594, 0.000)
	},
	["ValveBiped.Bip01_R_Hand"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(22.281, 38.219, -66.875)
	},
	["ValveBiped.Bip01_R_Finger21"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 54.156, 0.000)
	},
	["ValveBiped.Bip01_R_Finger22"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 28.656, 0.000)
	},
	["ValveBiped.Bip01_R_Finger0"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -28.656, 0.000)
	},
	["ValveBiped.Bip01_R_Finger4"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 12.719, 0.000)
	},
	["ValveBiped.Bip01_R_Finger41"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 50.969, 0.000)
	},
	["ValveBiped.Bip01_R_Finger3"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 3.156, 0.000)
	},
	["ValveBiped.Bip01_R_Finger31"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 50.969, 0.000)
	},
	["ValveBiped.Bip01_R_Finger32"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 9.531, 0.000)
	},
	["phy_tail"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 0.000, -25.000)
	},
	["phy_tail.001"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 0.000, -45.000)
	},
	["skirt.B"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 0.000, 20.000)
	},
	["skirt.B.001"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(6.000, 0.000, 15.000)
	},
	["skirt.B.003"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 0.000, 15.000)
	},
	["skirt.B.004"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 0.000, 40.000)
	},
	["skirt.F"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 0.000, -10.000)
	},
	["skirt.F.004"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 0.000, -40.000)
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