player_manager.AddValidModel( "GLaDOS_Humanoid_RW22", "models/meercat/glados_humanoid_rw22/glados_humanoid_rw22.mdl" )
list.Set( "PlayerOptionsModel", "GLaDOS_Humanoid_RW22", "models/meercat/glados_humanoid_rw22/glados_humanoid_rw22.mdl" )
player_manager.AddValidHands( "GLaDOS_Humanoid_RW22", "models/meercat/glados_humanoid_rw22/glados_humanoid_rw22_hands_new.mdl", 0, "00000000" )

hook.Add("PreDrawPlayerHands", "glados_huamnoid_rw22_hands_to_body", function(hands, vm, ply, wpn)
    if IsValid(hands) and hands:GetModel() == "models/meercat/glados_humanoid_rw22/glados_humanoid_rw22_hands_new.mdl" then
        hands:SetSkin(ply:GetSkin())
	end
	if  ply:GetBodygroup(5) == 0 and
	    IsValid(hands) and hands:GetModel() == "models/meercat/glados_humanoid_rw22/glados_humanoid_rw22_hands_new.mdl" then
        hands:SetBodygroup(4, 0)
    else
		hands:SetBodygroup(4, 1)
	end
end)


local eyeBones = {
    "Eye",
}

local maxOffset = 0.2

local function RandomizeEyePosition(entity)
    -- Генерируем случайные смещения по оси X и Y (горизонтально и вертикально)
    local randomX = math.Rand(-maxOffset, maxOffset)
    local randomZ = math.Rand(-maxOffset, maxOffset)
    local randomY = 0 

    for _, boneName in ipairs(eyeBones) do
        local boneIndex = entity:LookupBone(boneName)
        if boneIndex then
            entity:ManipulateBonePosition(boneIndex, Vector(randomX, randomY, randomZ))
        end
    end
end

-- Таймер для регулярного обновления позиции глаз каждую секунду
timer.Create("glados_humanoid_rw22_eye_random", math.random(2, 6), 0, function()
    for _, entity in ipairs(ents.GetAll()) do
        if (entity:IsPlayer() and entity:GetModel() == 	"models/meercat/glados_humanoid_rw22/glados_humanoid_rw22.mdl")	or
           (entity:IsNPC() and entity:GetModel() == 	"models/meercat/glados_humanoid_rw22/glados_humanoid_rw22_fr.mdl")	or
           (entity:IsNPC() and entity:GetModel() == 	"models/meercat/glados_humanoid_rw22/glados_humanoid_rw22_hs.mdl")	then
			RandomizeEyePosition(entity)
        end
    end

    -- Обновляем интервал таймера с новым случайным значением
    timer.Adjust("glados_humanoid_rw22_eye_random", math.random(2, 6))
end)

---ADD NPC
local Category = "GLaDOS_Humanoid_RW22"

local NPC =
{
	Name = "Friendly_GLaDOS_Humanoid_RW22",
	Class = "npc_citizen",
	Model = "models/meercat/glados_humanoid_rw22/glados_humanoid_rw22_fr.mdl",
	Health = "100",
	KeyValues ={ citizentype = 4 },
		Weapons = { "weapon_smg1" },
		Category = Category
}

list.Set( "NPC", "Friendly_GLaDOS_Humanoid_RW22", NPC)


local NPC =
{
	Name = "Hostile_GLaDOS_Humanoid_RW22",
	Class = "npc_combine",
	Model = "models/meercat/glados_humanoid_rw22/glados_humanoid_rw22_hs.mdl",
	Health = "100",
	KeyValues = { citizentype = 4 },
	Weapons = { "weapon_smg1" },
	Category = Category
}

list.Set( "NPC", "Hostile_GLaDOS_Humanoid_RW22", NPC)
