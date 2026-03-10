---------------------------------------------------------------------------
-- HI! Welcome to the new standardized vore template for my V-NPCs. Follow along with
-- the comments for the best results.

-- drg_animate 0/1, 0 disables bonelerping for overhauled bone tool adjustments
-- dump_bot_bones will print a formatted list of bone edits into console for easy copy/paste
-- dump_bot_flexes will print a formatted list of facial edits into console for easy copy/paste
---------------------------------------------------------------------------
if not DrGBase then return end -- Make sure you have DrGBase installed or nothing will work!
ENT.Base = "npc_vore_base" -- The base template for all bots, keep the same!

ENT.PrintName = "D.VA (Casual)" -- This will be the printed name of your bot.
ENT.Category = "Crikket's V-NPC" -- This is the category your bot is in, Vore is the generic one.
ENT.ModNeeded = "https://steamcommunity.com/sharedfiles/filedetails/?id=3659914671" -- This is where you'll put the steam workshop ID for your V-NPC model.

--BASIC MODEL INFO
ENT.Models = {"models/fds/dvascrag/dva_outfits.mdl"} -- Insert the V-NPC model's path here. You can copy it in Gmod.
ENT.SpawnHealth = 128 --Spawn health (128=light, 256=normal, 384=beefy, 512=strong, 768=danger, 1024=boss, 2048=apex)
ENT.HealthRegen = 8 --two is basic, just enough for survivability. Bots regen pretty quick, be careful with this!
ENT.BloodColor = BLOOD_COLOR_RED --blood color, can be BLOOD_COLOR_YELLOW, _ANTLION, _MECH, or even DONT_BLEED
ENT.ModelScale = 1 --scale of initial model, be careful with this!
ENT.Skins = {0} --The bot's skin. This cannot be randomized without extra coding.
ENT.BodyGroups = {
	["Shoes"] = 1,
	["Hair"] = 1,
	["Bottom"] = 3
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
ENT.SpotDuration = 60 --How long do we pursue prey we see?

--AI MOVEMENT BEHAVIOR
ENT.WalkSpeed = 144 --The bot's walking speed, or idle speed.
ENT.RunSpeed = 225 --The bot's speed when in pursuit.
ENT.Acceleration = 256 --The bot's acceleration per second.
ENT.JumpHeight = 256 --Jump height! Recommended to leave as is.
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
ENT.ClimbSpeed = 96 --The ladder climb rate.
ENT.ClimbUpAnimation = ACT_ZOMBIE_CLIMB_UP --Most NPCs have this activity.
ENT.ClimbDownAnimation = ACT_ZOMBIE_CLIMB_DOWN --Most NPCs have this activity.
ENT.ClimbOffset = Vector(0, 0, 0) --Climb offsets for better visuals when climbing. I don't bother.
ENT.MaxYawRate = 256 --The bot's turning speed, 128 = tank, 256 = normal, 384 = snap, 512 = guided missile
ENT.StepHeight = 20 --How high can your bot step up ledges without climbing? 20 = normal, 40 = big gal, 60 = giant
ENT.ClimbLedgesMinHeight = 21 --Recommended to set right above step height.

--ANIMATION BEHAVIOR
ENT.IdleAnimation = ACT_HL2MP_IDLE --Check out https://wiki.facepunch.com/gmod/Enums/ACT for HL2MP activities (the rest generally dont work but experiment with your specific models.)
ENT.WalkAnimation = ACT_HL2MP_RUN --Check out https://wiki.facepunch.com/gmod/Enums/ACT for HL2MP activities (the rest generally dont work but experiment with your specific models.)
ENT.RunAnimation = ACT_HL2MP_RUN --Check out https://wiki.facepunch.com/gmod/Enums/ACT for HL2MP activities (the rest generally dont work but experiment with your specific models.)
ENT.AttackAnimation = "gesture_becon_original" --attack animation, beckon is pretty solid for a faux-swallow motion.
ENT.MeleeAttackRange = 72 -- +16 enemy range. So 64, 72, 80, 88, 108 respectively
ENT.ReachEnemyRange = 56 --attack range: 48 = small, 56 = normal, 64 = efficient, 72 = tall, 96 = giant.

--AI SOUNDS, IDLE SOUNDS ARE PRETTY MUCH ALL THAT'S WORTH IT RIGHT NOW
ENT.OnSpawnSounds = {
    "belly/dva_casual_spawn_1.wav",
    "belly/dva_casual_spawn_2.wav",
    "belly/dva_casual_spawn_3.wav",
    "belly/dva_casual_spawn_4.wav",
    "belly/dva_casual_spawn_5.wav"
}
ENT.OnIdleSounds = {
    "belly/dva_casual_idle_1.wav",
    "belly/dva_casual_idle_2.wav",
    "belly/dva_casual_idle_3.wav",
    "belly/dva_casual_idle_4.wav",
    "belly/dva_casual_idle_5.wav",
    "belly/dva_casual_idle_6.wav",
    "belly/dva_casual_idle_7.wav",
    "belly/dva_casual_idle_8.wav",
    "belly/dva_casual_idle_9.wav",
    "belly/dva_casual_idle_10.wav",
    "belly/dva_casual_idle_11.wav",
    "belly/dva_casual_idle_12.wav",
    "belly/dva_casual_idle_13.wav",
    "belly/dva_casual_idle_14.wav",
    "belly/dva_casual_idle_15.wav",
    "belly/dva_casual_idle_16.wav",
    "belly/dva_casual_idle_17.wav",
    "belly/dva_generic_idle_1.wav",
    "belly/dva_generic_idle_2.wav",
    "belly/dva_generic_idle_3.wav",
    "belly/dva_generic_idle_4.wav",
    "belly/dva_generic_idle_5.wav",
    "belly/dva_generic_idle_6.wav",
    "belly/dva_generic_idle_7.wav"
}
ENT.IdleSoundDelay = math.random(6,32)
ENT.ClientIdleSounds = false
ENT.OnDeathSounds = {
    "belly/dva_casual_death_1.wav",
    "belly/dva_casual_death_2.wav"
}
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
    self:EmitSound(table.Random(self.Footsteps["Default"]), 70, 110)
end
ENT.VoreSoundPitch = 1.2
--AI VORE MECHANICS
ENT.VoreSettings = {}
ENT.VoreSettings.OnlyEatsEnemies = false
ENT.VoreSettings.EatsPlayers = true
ENT.VoreSettings.BurpsEnabled = true --we burping?
ENT.VoreSettings.HasWeightGain = true --is weight gain enabled? HELL YEAH!

--VORE BELLY VISUALS
ENT.BellyColor = Color(227, 173, 163) --gut color, debug starts white.
ENT.Belly_Offset = Vector(0, 4, 0) --gut offset from pelvis, change this!
ENT.BellyMaterial = "models/wormonlooker/belly/belly_dvacasual" --Use this to set custom belly materials. Check out the materials folder!
ENT.VoreSettings.MaxBaseSize = 0 --any leftover chub? 1 = full belly 0 = flat belly
ENT.VoreSettings.BellyFloorModifier = 0.3 --how low/high belly will be angled to avoid floor clipping. The higher the value, the more elevated.
ENT.VoreSettings.FatFoldsMaxSize = 0.1 --you can set this to zero to not have fat folds, or 1 for an obese mf.

--DIGESTION SETTINGS
ENT.VoreSettings.DigestionStrength = 6 --Digestion: 2 = weak, 4 = normal, 6 = athletic, 8 = predator, 10 = apex, 12 = instant
ENT.VoreSettings.AbsorptionSpeed = 2 --Absorption: 1 = weak, 1.5 = normal, 2 = athletic, 2.5 = predator, 3 = apex, 4 = instant
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

		
		"Butt.L",
		"Butt.TO.L",
		"Butt.TI.L",
		"Butt.BO.L",
		"Butt.BI.L",
		
		"Butt.R",
		"Butt.TO.R",
		"Butt.TI.R",
		"Butt.BO.R",
		"Butt.BI.R", --No need to remove end commas on this table.
}

--WEIGHT GAIN MULTIPLIERS
ENT.VoreSettings.WeightGainSettings = {
--This is our weight gain maximum.
	MaxBreast = 1;
	MaxThigh = 1.6;
	MaxCalf = 1.4;
    MaxWaist = 1.2;
    MaxSpine = 1.4;

--weight gain mults
	BoobMultiplier = 0.1;
	ThighMultiplier = 0.4;
	CalfMultiplier = 0.2;
    WaistMultiplier = 0.2;
    SpineMultiplier = 0.2;
}

--Defines generic breast bones for weight gain.
ENT.VoreSettings.WeightGainDefiners = {
	["Boob"] = function(value, max)
		return Vector(
			math.min(value, max * 1),
			math.min(value, max * 1),
			math.min(value, max * 1)
		)
	end,
	["Thigh"] = function(value, max)
		return Vector(
			math.min(value, max * 0.75),
			math.min(value, max * 0.75),
			math.min(value, max * 0.9)
		)
	end,
	["Calf"] = function(value, max)
		return Vector(
			math.min(value, max * 0.75),
			math.min(value, max * 0.9),
			math.min(value, max * 0.9)
		)
	end,
	["Waist"] = function(value, max)
		return Vector(
			math.min(value, max * 1),
			math.min(value, max * 1),
			math.min(value, max * 1)
		)
	end,
	["Spine"] = function(value, max)
		return Vector(
			math.min(value, max * 1),
			math.min(value, max * 0.75),
			math.min(value, max * 0.7)
		)
	end,
}

--FACIAL ANIMATION SETTINGS
ENT.VoreSettings.FlexFaces = {
	[0] = { --rest
                ["MouthOpen"] = 0.1,
                ["MouthPushbackL"] = 0.2,
                ["MouthPushbackR"] = 0.2,
                ["BottomlipMiddleDown"] = 0.1,
                ["UpperlipMiddleUp"] = 0.1,
                ["EyesquintL"] = 0.4,
                ["EyesquintR"] = 0.4,
                ["EyecloseR"] = 0.1,
                ["EyecloseL"] = 0.1,
                ["BrowDownR"] = 0.7,
                ["BrowDownL"] = 0.7,
                ["BrowInnerRDown"] = 0.2,
                ["BrowInnerLDown"] = 0.2,
	},
	[1] = { --swallow
                ["Blink"] = 0.75,
                ["Teste"] = 0.2,
                ["Teste1"] = 0.2,
                ["MouthStretchL"] = 0.4,
                ["MouthStrechL"] = 0.4,
                ["MouthPushbackL"] = 0.4,
                ["MouthPushbackR"] = 0.4,
                ["BottomlipLDown"] = 0.3,
                ["BottomlipRDown"] = 0.3,
                ["UpperlipUp"] = 0.4,
                ["UpperlipRUp"] = 0.3,
                ["UpperlipLUp"] = 0.5,
                ["UpperlipL1UP"] = 0.3,
                ["BrowInnerRDown"] = 0.5,
                ["BrowInnerLDown"] = 0.5,
                ["BrowInnerRUp"] = 0.4,
                ["BrowInnerLUp"] = 0.4,
                ["MouthSmileL"] = 0.5,
                ["MouthSmileR"] = 0.5,
                ["MouthOpen"] = 1,
                ["EyesquintL"] = 1,
                ["EyesquintR"] = 1,
	},
	[2] = { --full
                ["MouthOpen"] = 0.25,
                ["MouthPushbackL"] = 1,
                ["MouthPushbackR"] = 1,
                ["BottomlipMiddleDown"] = 0.15,
                ["UpperlipMiddleUp"] = 0.15,
                ["EyesquintL"] = 0.5,
                ["EyesquintR"] = 0.5,
                ["EyecloseR"] = 0.2,
                ["EyecloseL"] = 0.2,
                ["BrowDownR"] = 1,
                ["BrowDownL"] = 1,
                ["BrowInnerRDown"] = 0.4,
                ["BrowInnerLDown"] = 0.4,
                ["MouthSmileL"] = 0.4,
                ["MouthSmileR"] = 0.3,
                ["Teste"] = 0.5,
                ["Teste1"] = 0.4,
                ["MouthStretchL"] = 1,
                ["MouthStrechL"] = 1,
	},
	[3] = { --burp
                ["MouthSmileL"] = 0.4,
                ["MouthSmileR"] = 0.4,
                ["MouthOpen"] = 0.8,
                ["MouthStretchL"] = 0.3,
                ["MouthStrechL"] = 0.5,
                ["Teste1"] = 0.2,
                ["BottomlipDown"] = 0.6,
                ["UpperlipUp"] = 1,
                ["Eyeswide"] = 0.4,
                ["BrowRaiseL"] = 0.5,
                ["BrowRaiseR"] = 0.5,
                ["BrowInnerLUp"] = 0.3,
                ["BrowInnerRUp"] = 0.3,
	},
	[4] = { --final gulp
                ["Blink"] = 1,
                ["Lipstogether"] = 1,
                ["MouthPushbackL"] = 0.2,
                ["MouthPushbackR"] = 0.2,
                ["BottomlipMiddleDown"] = 0.1,
                ["UpperlipMiddleUp"] = 0.1,
                ["BrowDownR"] = 0.7,
                ["BrowDownL"] = 0.7,
                ["BrowInnerRDown"] = 0.2,
                ["BrowInnerLDown"] = 0.2,
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
	["ValveBiped.Bip01_Pelvis"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 0.000, -5.000)
	},
	["ValveBiped.Bip01_L_Thigh"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(-15.000, 0.000, -5.000)
	},
	["ValveBiped.Bip01_L_Calf"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(5.000, 0.000, 0.000)
	},
	["ValveBiped.Bip01_L_Foot"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(10.000, 6.000, 6.000)
	},
	["ValveBiped.Bip01_R_Thigh"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(15.000, 0.000, 0.000)
	},
	["ValveBiped.Bip01_R_Foot"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 10.000, 10.000)
	},
	["ValveBiped.Bip01_Spine"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -10.000, 0.000)
	},
	["ValveBiped.Bip01_Spine1"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 5.000, 0.000)
	},
	["ValveBiped.Bip01_Spine2"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 5.000, 0.000)
	},
	["ValveBiped.Bip01_Spine4"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 5.000, 0.000)
	},
	["ValveBiped.Bip01_Neck1"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -10.000, 0.000)
	},
	["ValveBiped.Bip01_L_Clavicle"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 10.000, 0.000)
	},
	["ValveBiped.Bip01_L_UpperArm"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 0.000, -24.000)
	},
	["ValveBiped.Bip01_R_Clavicle"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 10.000, 0.000)
	},
	["ValveBiped.Bip01_R_UpperArm"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 0.000, 24.000)
	},
	["ValveBiped.Bip01_R_Hand"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 20.000, 0.000)
	},
	["ValveBiped.Bip01_L_Finger2"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -80.000, 12.000)
	},
	["ValveBiped.Bip01_L_Finger21"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -60.000, 0.000)
	},
	["ValveBiped.Bip01_L_Finger22"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -80.000, 0.000)
	},
	["ValveBiped.Bip01_L_Finger1"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(-16.000, -80.000, 0.000)
	},
	["ValveBiped.Bip01_L_Finger11"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -60.000, 0.000)
	},
	["ValveBiped.Bip01_L_Finger12"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -80.000, 0.000)
	},
	["ValveBiped.Bip01_L_Finger0"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -20.000, 0.000)
	},
	["ValveBiped.Bip01_L_Finger01"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 40.000, 0.000)
	},
	["ValveBiped.Bip01_L_Finger02"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 90.000, 0.000)
	},
	["ValveBiped.Bip01_L_Finger4"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(40.000, -80.000, 0.000)
	},
	["ValveBiped.Bip01_L_Finger41"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -60.000, 0.000)
	},
	["ValveBiped.Bip01_L_Finger42"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -80.000, 0.000)
	},
	["ValveBiped.Bip01_L_Finger3"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(15.000, -80.000, 0.000)
	},
	["ValveBiped.Bip01_L_Finger31"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -60.000, 0.000)
	},
	["ValveBiped.Bip01_L_Finger32"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -80.000, 0.000)
	},
	["ValveBiped.Bip01_R_Finger2"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(-12.000, -80.000, 0.000)
	},
	["ValveBiped.Bip01_R_Finger21"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -60.000, 0.000)
	},
	["ValveBiped.Bip01_R_Finger22"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -80.000, 0.000)
	},
	["ValveBiped.Bip01_R_Finger1"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -80.000, 10.000)
	},
	["ValveBiped.Bip01_R_Finger11"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -60.000, 0.000)
	},
	["ValveBiped.Bip01_R_Finger12"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -80.000, 0.000)
	},
	["ValveBiped.Bip01_R_Finger0"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -20.000, 0.000)
	},
	["ValveBiped.Bip01_R_Finger01"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 40.000, 0.000)
	},
	["ValveBiped.Bip01_R_Finger02"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 90.000, 0.000)
	},
	["ValveBiped.Bip01_R_Finger4"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(-40.000, -80.000, 0.000)
	},
	["ValveBiped.Bip01_R_Finger41"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -60.000, 0.000)
	},
	["ValveBiped.Bip01_R_Finger42"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -80.000, 0.000)
	},
	["ValveBiped.Bip01_R_Finger3"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(-24.000, -80.000, 0.000)
	},
	["ValveBiped.Bip01_R_Finger31"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -60.000, 0.000)
	},
	["ValveBiped.Bip01_R_Finger32"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -80.000, 0.000)
	},
},

	[1] = { -- swallow
	["ValveBiped.Bip01_Pelvis"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 0.000, -5.000)
	},
	["ValveBiped.Bip01_L_Thigh"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(-15.000, 0.000, -5.000)
	},
	["ValveBiped.Bip01_L_Calf"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(5.000, 0.000, 0.000)
	},
	["ValveBiped.Bip01_L_Foot"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(10.000, 6.000, 6.000)
	},
	["ValveBiped.Bip01_R_Thigh"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(15.000, 0.000, 0.000)
	},
	["ValveBiped.Bip01_R_Foot"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 10.000, 10.000)
	},
	["ValveBiped.Bip01_Spine"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -10.000, 0.000)
	},
	["ValveBiped.Bip01_Spine1"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 5.000, 0.000)
	},
	["ValveBiped.Bip01_Spine2"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -10.000, 0.000)
	},
	["ValveBiped.Bip01_Spine4"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -10.000, 0.000)
	},
	["ValveBiped.Bip01_Neck1"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -10.000, 0.000)
	},
	["ValveBiped.Bip01_L_Clavicle"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 10.000, 0.000)
	},
	["ValveBiped.Bip01_L_UpperArm"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 0.000, -24.000)
	},
	["ValveBiped.Bip01_R_Clavicle"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 5.000, 0.000)
	},
	["ValveBiped.Bip01_R_UpperArm"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 25.000, 23.969)
	},
	["ValveBiped.Bip01_R_Forearm"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -45.000, 0.000)
	},
	["ValveBiped.Bip01_R_Hand"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(19.094, 0.000, -31.844)
	},
	["ValveBiped.Bip01_R_Finger2"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(-12.000, -80.000, 0.000)
	},
	["ValveBiped.Bip01_R_Finger21"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -60.000, 0.000)
	},
	["ValveBiped.Bip01_R_Finger22"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -80.000, 0.000)
	},
	["ValveBiped.Bip01_R_Finger1"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -80.000, 10.000)
	},
	["ValveBiped.Bip01_R_Finger11"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -60.000, 0.000)
	},
	["ValveBiped.Bip01_R_Finger12"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -80.000, 0.000)
	},
	["ValveBiped.Bip01_R_Finger0"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -20.000, 0.000)
	},
	["ValveBiped.Bip01_R_Finger01"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 40.000, 0.000)
	},
	["ValveBiped.Bip01_R_Finger02"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 90.000, 0.000)
	},
	["ValveBiped.Bip01_R_Finger4"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(-40.000, -80.000, 0.000)
	},
	["ValveBiped.Bip01_R_Finger41"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -60.000, 0.000)
	},
	["ValveBiped.Bip01_R_Finger42"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -80.000, 0.000)
	},
	["ValveBiped.Bip01_R_Finger3"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(-24.000, -80.000, 0.000)
	},
	["ValveBiped.Bip01_R_Finger31"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -60.000, 0.000)
	},
	["ValveBiped.Bip01_R_Finger32"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -80.000, 0.000)
	},
},

	[2] = { -- full
	["ValveBiped.Bip01_Pelvis"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 0.000, -5.000)
	},
	["ValveBiped.Bip01_L_Thigh"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(-15.000, 0.000, -5.000)
	},
	["ValveBiped.Bip01_L_Calf"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(5.000, 0.000, 0.000)
	},
	["ValveBiped.Bip01_L_Foot"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(10.000, 6.000, 6.000)
	},
	["ValveBiped.Bip01_R_Thigh"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(15.000, 0.000, 0.000)
	},
	["ValveBiped.Bip01_R_Foot"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 10.000, 10.000)
	},
	["ValveBiped.Bip01_Spine"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -20.000, 0.000)
	},
	["ValveBiped.Bip01_Spine1"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 5.000, 0.000)
	},
	["ValveBiped.Bip01_Spine2"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 5.000, 0.000)
	},
	["ValveBiped.Bip01_Spine4"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 5.000, 0.000)
	},
	["ValveBiped.Bip01_Neck1"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -10.000, 0.000)
	},
	["ValveBiped.Bip01_L_Clavicle"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 10.000, 0.000)
	},
	["ValveBiped.Bip01_L_UpperArm"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 0.000, -24.000)
	},
	["ValveBiped.Bip01_R_Clavicle"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 10.000, 0.000)
	},
	["ValveBiped.Bip01_R_UpperArm"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 0.000, 24.000)
	},
	["ValveBiped.Bip01_R_Hand"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 20.000, 0.000)
	},
	["Breast.L"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -10.000, 10.000)
	},
	["Breast.R"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 10.000, 10.000)
	},
	["ValveBiped.Bip01_L_Finger2"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -80.000, 12.000)
	},
	["ValveBiped.Bip01_L_Finger21"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -60.000, 0.000)
	},
	["ValveBiped.Bip01_L_Finger22"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -80.000, 0.000)
	},
	["ValveBiped.Bip01_L_Finger1"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(-16.000, -80.000, 0.000)
	},
	["ValveBiped.Bip01_L_Finger11"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -60.000, 0.000)
	},
	["ValveBiped.Bip01_L_Finger12"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -80.000, 0.000)
	},
	["ValveBiped.Bip01_L_Finger0"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -20.000, 0.000)
	},
	["ValveBiped.Bip01_L_Finger01"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 40.000, 0.000)
	},
	["ValveBiped.Bip01_L_Finger02"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 90.000, 0.000)
	},
	["ValveBiped.Bip01_L_Finger4"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(40.000, -80.000, 0.000)
	},
	["ValveBiped.Bip01_L_Finger41"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -60.000, 0.000)
	},
	["ValveBiped.Bip01_L_Finger42"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -80.000, 0.000)
	},
	["ValveBiped.Bip01_L_Finger3"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(15.000, -80.000, 0.000)
	},
	["ValveBiped.Bip01_L_Finger31"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -60.000, 0.000)
	},
	["ValveBiped.Bip01_L_Finger32"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -80.000, 0.000)
	},
	["ValveBiped.Bip01_R_Finger2"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(-12.000, -80.000, 0.000)
	},
	["ValveBiped.Bip01_R_Finger21"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -60.000, 0.000)
	},
	["ValveBiped.Bip01_R_Finger22"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -80.000, 0.000)
	},
	["ValveBiped.Bip01_R_Finger1"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -80.000, 10.000)
	},
	["ValveBiped.Bip01_R_Finger11"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -60.000, 0.000)
	},
	["ValveBiped.Bip01_R_Finger12"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -80.000, 0.000)
	},
	["ValveBiped.Bip01_R_Finger0"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -20.000, 0.000)
	},
	["ValveBiped.Bip01_R_Finger01"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 40.000, 0.000)
	},
	["ValveBiped.Bip01_R_Finger02"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 90.000, 0.000)
	},
	["ValveBiped.Bip01_R_Finger4"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(-40.000, -80.000, 0.000)
	},
	["ValveBiped.Bip01_R_Finger41"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -60.000, 0.000)
	},
	["ValveBiped.Bip01_R_Finger42"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -80.000, 0.000)
	},
	["ValveBiped.Bip01_R_Finger3"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(-24.000, -80.000, 0.000)
	},
	["ValveBiped.Bip01_R_Finger31"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -60.000, 0.000)
	},
	["ValveBiped.Bip01_R_Finger32"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -80.000, 0.000)
	},
	["BreastMid.L"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 25.000, 10.000)
	},
	["BreastMid.R"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -25.000, 10.000)
	},
},


	[3] = { -- burp
	["ValveBiped.Bip01_Pelvis"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 0.000, -5.000)
	},
	["ValveBiped.Bip01_L_Thigh"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(-15.000, 0.000, -5.000)
	},
	["ValveBiped.Bip01_L_Calf"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(5.000, 0.000, 0.000)
	},
	["ValveBiped.Bip01_L_Foot"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(10.000, 6.000, 6.000)
	},
	["ValveBiped.Bip01_R_Thigh"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(15.000, 0.000, 0.000)
	},
	["ValveBiped.Bip01_R_Foot"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 10.000, 10.000)
	},
	["ValveBiped.Bip01_Spine"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -20.000, 0.000)
	},
	["ValveBiped.Bip01_Spine1"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 5.000, 0.000)
	},
	["ValveBiped.Bip01_Spine2"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 5.000, 0.000)
	},
	["ValveBiped.Bip01_Spine4"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 5.000, 0.000)
	},
	["ValveBiped.Bip01_Neck1"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 5.000, 0.000)
	},
	["ValveBiped.Bip01_L_Clavicle"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(20.000, 5.000, 0.000)
	},
	["ValveBiped.Bip01_L_UpperArm"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 0.000, -30.000)
	},
	["ValveBiped.Bip01_L_Forearm"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(-10.000, -25.000, -20.000)
	},
	["ValveBiped.Bip01_L_Hand"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 20.000, 0.000)
	},
	["ValveBiped.Bip01_R_Clavicle"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(-20.000, 5.000, 0.000)
	},
	["ValveBiped.Bip01_R_UpperArm"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 0.000, 30.000)
	},
	["ValveBiped.Bip01_R_Forearm"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(10.000, -25.000, 20.000)
	},
	["ValveBiped.Bip01_R_Hand"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 20.000, 0.000)
	},
	["Breast.L"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -10.000, 10.000)
	},
	["Breast.R"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 10.000, 10.000)
	},
	["ValveBiped.Bip01_L_Finger2"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -80.000, 12.000)
	},
	["ValveBiped.Bip01_L_Finger21"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -60.000, 0.000)
	},
	["ValveBiped.Bip01_L_Finger22"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -80.000, 0.000)
	},
	["ValveBiped.Bip01_L_Finger1"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(-16.000, -80.000, 0.000)
	},
	["ValveBiped.Bip01_L_Finger11"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -60.000, 0.000)
	},
	["ValveBiped.Bip01_L_Finger12"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -80.000, 0.000)
	},
	["ValveBiped.Bip01_L_Finger0"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -20.000, 0.000)
	},
	["ValveBiped.Bip01_L_Finger01"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 40.000, 0.000)
	},
	["ValveBiped.Bip01_L_Finger02"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 90.000, 0.000)
	},
	["ValveBiped.Bip01_L_Finger4"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(40.000, -80.000, 0.000)
	},
	["ValveBiped.Bip01_L_Finger41"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -60.000, 0.000)
	},
	["ValveBiped.Bip01_L_Finger42"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -80.000, 0.000)
	},
	["ValveBiped.Bip01_L_Finger3"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(15.000, -80.000, 0.000)
	},
	["ValveBiped.Bip01_L_Finger31"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -60.000, 0.000)
	},
	["ValveBiped.Bip01_L_Finger32"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -80.000, 0.000)
	},
	["ValveBiped.Bip01_R_Finger2"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(-12.000, -80.000, 0.000)
	},
	["ValveBiped.Bip01_R_Finger21"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -60.000, 0.000)
	},
	["ValveBiped.Bip01_R_Finger22"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -80.000, 0.000)
	},
	["ValveBiped.Bip01_R_Finger1"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -80.000, 10.000)
	},
	["ValveBiped.Bip01_R_Finger11"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -60.000, 0.000)
	},
	["ValveBiped.Bip01_R_Finger12"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -80.000, 0.000)
	},
	["ValveBiped.Bip01_R_Finger0"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -20.000, 0.000)
	},
	["ValveBiped.Bip01_R_Finger01"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 40.000, 0.000)
	},
	["ValveBiped.Bip01_R_Finger02"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 90.000, 0.000)
	},
	["ValveBiped.Bip01_R_Finger4"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(-40.000, -80.000, 0.000)
	},
	["ValveBiped.Bip01_R_Finger41"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -60.000, 0.000)
	},
	["ValveBiped.Bip01_R_Finger42"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -80.000, 0.000)
	},
	["ValveBiped.Bip01_R_Finger3"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(-24.000, -80.000, 0.000)
	},
	["ValveBiped.Bip01_R_Finger31"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -60.000, 0.000)
	},
	["ValveBiped.Bip01_R_Finger32"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -80.000, 0.000)
	},
	["BreastMid.L"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 25.000, 10.000)
	},
	["BreastMid.R"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -25.000, 10.000)
	},
},

	[4] = { -- final gulp
	["ValveBiped.Bip01_Pelvis"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 0.000, -5.000)
	},
	["ValveBiped.Bip01_L_Thigh"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(-15.000, 0.000, -5.000)
	},
	["ValveBiped.Bip01_L_Calf"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(5.000, 0.000, 0.000)
	},
	["ValveBiped.Bip01_L_Foot"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(10.000, 6.000, 6.000)
	},
	["ValveBiped.Bip01_R_Thigh"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(15.000, 0.000, 0.000)
	},
	["ValveBiped.Bip01_R_Foot"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 10.000, 10.000)
	},
	["ValveBiped.Bip01_Spine"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -10.000, 0.000)
	},
	["ValveBiped.Bip01_Spine1"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 5.000, 0.000)
	},
	["ValveBiped.Bip01_Spine2"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -15.000, 0.000)
	},
	["ValveBiped.Bip01_Spine4"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -10.000, 0.000)
	},
	["ValveBiped.Bip01_Neck1"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -5.000, 0.000)
	},
	["ValveBiped.Bip01_L_Clavicle"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 10.000, 0.000)
	},
	["ValveBiped.Bip01_L_UpperArm"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 0.000, -24.000)
	},
	["ValveBiped.Bip01_R_Clavicle"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 5.000, 0.000)
	},
	["ValveBiped.Bip01_R_UpperArm"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 25.000, 23.969)
	},
	["ValveBiped.Bip01_R_Forearm"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -45.000, 0.000)
	},
	["ValveBiped.Bip01_R_Hand"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(19.094, 0.000, -31.844)
	},
	["ValveBiped.Bip01_R_Finger2"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(-12.000, -80.000, 0.000)
	},
	["ValveBiped.Bip01_R_Finger21"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -60.000, 0.000)
	},
	["ValveBiped.Bip01_R_Finger22"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -80.000, 0.000)
	},
	["ValveBiped.Bip01_R_Finger1"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -80.000, 10.000)
	},
	["ValveBiped.Bip01_R_Finger11"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -60.000, 0.000)
	},
	["ValveBiped.Bip01_R_Finger12"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -80.000, 0.000)
	},
	["ValveBiped.Bip01_R_Finger0"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -20.000, 0.000)
	},
	["ValveBiped.Bip01_R_Finger01"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 40.000, 0.000)
	},
	["ValveBiped.Bip01_R_Finger02"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, 90.000, 0.000)
	},
	["ValveBiped.Bip01_R_Finger4"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(-40.000, -80.000, 0.000)
	},
	["ValveBiped.Bip01_R_Finger41"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -60.000, 0.000)
	},
	["ValveBiped.Bip01_R_Finger42"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -80.000, 0.000)
	},
	["ValveBiped.Bip01_R_Finger3"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(-24.000, -80.000, 0.000)
	},
	["ValveBiped.Bip01_R_Finger31"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -60.000, 0.000)
	},
	["ValveBiped.Bip01_R_Finger32"] = {
		pos = Vector(0.000, 0.000, 0.000),
		ang = Angle(0.000, -80.000, 0.000)
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