local gain_global = CreateConVar("vnpcs_gain", "1", {FCVAR_ARCHIVE, FCVAR_REPLICATED})
local gain_force = CreateConVar("vnpcs_global_gain", "0", {FCVAR_ARCHIVE, FCVAR_REPLICATED})
local gain_multi = CreateConVar("vnpcs_gain_multi", "1", {FCVAR_ARCHIVE, FCVAR_REPLICATED})

local function whatIsBone(boneName, definers)
	boneName = (boneName or ""):lower()  -- <<< REQUIRED

	local function has(s)
		return boneName:find(s:lower(), 1, true) ~= nil
	end

	if definers then
		for ident, _ in pairs(definers) do
			if has(ident) then
				return ident
			end
		end
	end

	if has("breast") or has ("tit") or has("boob") or has("bust") then
		return "Boob"
	elseif has("thigh") or has("leg_bone1") then
		return "Thigh"
	elseif has("calf") or has("leg_bone3") then
		return "Calf"
	elseif has("arm") then
		return "Arm"
	elseif has("pelvis") or has("hips") or has("butt") or has ("siri") or has ("ass") then
		return "Waist"
	elseif has("spine") then
		return "Spine"
	elseif has("tail") then
		return "Tail"
	end

	return "Unknown"
end

function ENT:UpdateBoneScale(_bonescale)
	if not gain_global:GetBool() then return end
	if not gain_force:GetBool() then
		if not self.VoreSettings.HasWeightGain then return end
	end

	self:SetNWFloat("Bonescale", _bonescale)
	self:OnWeightGain(_bonescale)
end

function ENT:GainWeight(amountGained)
	self.BoneScale = self.BoneScale + amountGained * gain_multi:GetFloat() * self:GetModelScale()
	self:UpdateBoneScale(self.BoneScale)
end

function ENT:SetWeight(new)
	self.BoneScale = new
	self:UpdateBoneScale(self.BoneScale)
end

function ENT:DoVisualBonescale(_bonescale)
	local setting = self.VoreSettings.WeightGainSettings
	local definers = self.VoreSettings.WeightGainDefiners

	for _, boneName in ipairs(self.VoreSettings.WeightGainBones) do
		local boneID = self:LookupBone(boneName)
		if not boneID then continue end

		local is = whatIsBone(boneName, definers) ----this isn't smart and runs multiple times, rewrite to only run once and cache that info.
		--print(is)
		local multiplier = 0.5
		local max  = 1.5
		if setting[is.."Multiplier"] then
			multiplier = tonumber(setting[is.."Multiplier"]) or 0.5
		end
		if setting["Max"..is] then
			max = tonumber(setting["Max"..is]) or 1.5
		end

		local actual_scale = _bonescale + (multiplier - 1) * (_bonescale - 1)

		local scaleVec, posAdjust
		if definers and definers[is] then
			scaleVec, posAdjust = definers[is](actual_scale, max) 
		elseif is == "Boob" then
			scaleVec = Vector(
				math.min(actual_scale, 1.65 * max),
				math.min(actual_scale, 1.7 * max),
				math.min(actual_scale, 2.2 * max)
			)
		elseif is == "Waist" then
			scaleVec = Vector(
				math.min(actual_scale, 1.3 * max),  -- Width
				math.min(actual_scale, 1.4 * max),  -- Depth
				math.min(actual_scale, 1.6 * max)   -- Height
			)
		elseif is == "Spine" then
			scaleVec = Vector(
				math.min(actual_scale, 1.6 * max),  -- Width
				math.min(actual_scale, 1),  -- Depth
				math.min(actual_scale, 1.6 * max)   -- Height
			)
		else
			scaleVec = Vector(
				math.min(actual_scale, 1),  -- Width
				math.min(actual_scale, 1.6 * max),  -- Depth
				math.min(actual_scale, 1.6 * max)   -- Height
			)
		end
				
		self:ManipulateBoneScale(boneID, scaleVec)
		if posAdjust then
			self:ManipulateBonePosition(boneID, posAdjust, true)
		end
	end
end