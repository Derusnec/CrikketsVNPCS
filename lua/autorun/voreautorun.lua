if SERVER then
    util.AddNetworkString("UGotVored")
    util.AddNetworkString("StopVoreClient")
    util.AddNetworkString("VoreNoModNotif")
    util.AddNetworkString("refresh_cpanel_makenpc")
	
	local pvsAxisVectors = {
		Vector(1, 0, 0),
		Vector(-1, 0, 0),
		Vector(0, 1, 0),
		Vector(0, -1, 0),
		Vector(0, 0, 1),
		Vector(0, 0, -1)
	}

	local function addEntityToPVS(ent)
		if not IsValid(ent) then return end

		local center = ent:WorldSpaceCenter()
		AddOriginToPVS(center)

		local mins, maxs = ent:OBBMins(), ent:OBBMaxs()
		for _, dir in ipairs(pvsAxisVectors) do
			local localPoint = Vector(
				dir.x > 0 and maxs.x or (dir.x < 0 and mins.x or 0),
				dir.y > 0 and maxs.y or (dir.y < 0 and mins.y or 0),
				dir.z > 0 and maxs.z or (dir.z < 0 and mins.z or 0)
			)
			AddOriginToPVS(ent:LocalToWorld(localPoint))
		end
	end
	
	hook.Add("SetupPlayerVisibility", "Vore_PostDeath_PVS", function(ply)
		if not ply.Vored then return end

		local belly = ply.VoreBelly
		if not IsValid(belly) then return end

		addEntityToPVS(belly)
		addEntityToPVS(belly:GetNWEntity("NPCParent"))
		addEntityToPVS(ply)
	end)

    hook.Add("PlayerSpawn", "vore_player_spawned", function(ply, trans)
        ply:SetParent(nil)
        ply.Vored = false
        
        -- IMPORTANT: We only stop the PVS and the Client View 
        -- once the player has actually respawned.
        ply.VoreBelly = nil
        
        net.Start("StopVoreClient")
        net.Send(ply)
    end)
end

local camera_sway = CreateClientConVar("vnpcs_camerasway", "1", true)

properties.Add("vnpcs_eatme", {
	MenuLabel = "Eat me!",
	Order = 999,
	MenuIcon = "vnpcs/vnpcsicon16.png",
	Filter = function(self, ent, ply)
		if not ent.IsDrGNextbot then return false end
		if not ent.Predator then return false end
		return true
	end,
	Action = function(self, ent)
        self:MsgStart()
		net.WriteEntity( ent )
		self:MsgEnd()
	end,
	Receive = function(self, len, ply)
		local ent = net.ReadEntity()
        print(ent, SERVER)
        ent:ClearPatrols()
        ent:SetEntityRelationship(ply, D_HT, 99999)
        ent:SetEnemy(ply)
        ent:SpotEntity(ply)
	end
})

if not CLIENT then return end

if CLIENT then
  DrGBase.SetIcon("Crikket's V-NPC", "vgui/cricket_icon.png")
end

local function DownloadAndMount(id)
    steamworks.DownloadUGC(id, function(path, file)
        game.MountGMA(path)
    end)
end

if not DrGBase then 
    chat.AddText(Color(255,66,66), "YOU NEED DrGBASE IN ORDER FOR V-NPCS TO WORK\n", Color(255,145,42),"https://steamcommunity.com/sharedfiles/filedetails/?id=1560118657")
    return 
end


--[[CLIENT ONLY NOW]]

local viewHook = "vore_camera"
local scrollHook = "vore_mousewheel"
local hudHook = "vore_hud"

local is_internal_view = false
local function setInternalView(bool, npc, belly)
    if is_internal_view == bool then return end

    is_internal_view = bool

    if not npc or not IsValid(npc) then return end
    if not belly or not IsValid(belly) then return end

    if bool then
        
        npc.OldColor = npc:GetColor()
        belly.OldColor = belly:GetColor()

        npc:SetColor(Color(0,0,0))
        belly:SetColor(Color(0,0,0))

        npc:SetRenderMode(RENDERMODE_GLOW)
        belly:SetRenderMode(RENDERMODE_GLOW)
    else
        npc:SetColor(npc.OldColor)
        belly:SetColor(belly.OldColor)
    end
end

local function displayText(text, x, y, font, color)
    surface.SetFont(font) -- Set the font
    local width, height = surface.GetTextSize( text )
    local x,y = x -width/2, y - height/2

    surface.SetTextColor(color) -- Set text color
    surface.SetTextPos(x, y) -- Set text position, top left corner
    surface.DrawText(text, false) -- Draw the text
end

local function noMoreVore()
    local ply = LocalPlayer()

    hook.Remove('CalcView', viewHook)
    hook.Remove("CreateMove", scrollHook)
    hook.Remove("HUDShouldDraw", hudHook)
    hook.Remove("HUDPaint", hudHook)
    if IsValid(ply) then
        ply:RemoveFlags(FL_NOTARGET)
        ply:DrawViewModel(true)
    end
    setInternalView(false)
end

local function OnVored()
    local belly = net.ReadEntity()
    local npc = net.ReadEntity()
    local ZmMult = 1
    local bellyAnchorPoint = belly:GetParentAttachment()

    local isWormsBelly = belly:GetClass() == "ent_vore_belly"

    gui.AddCaption( "*Gulp*", 5 )

    local ply = LocalPlayer()

    hook.Add('CalcView', viewHook, function(ply, origin, ang, fov) --SUPER HARD CODED, GET RID OF THIS CODE
        if not IsValid(belly) or not IsValid(npc) then
            noMoreVore()
            return
        end
    
        ply:AddFlags(FL_NOTARGET)
        ply:DrawViewModel(false)

        local entPos = belly:GetPos()

        if isWormsBelly then
            local bone_matrix = belly:GetBoneMatrix(1)
            local bone_pos = bone_matrix:GetTranslation()
            local bone_ang = bone_matrix:GetAngles()
            local bone_scale = bone_matrix:GetScale()

            entPos = bone_pos - Vector(0,0,5) + bone_ang:Right() * bone_scale * -15

            if camera_sway:GetBool() == false  and bellyAnchorPoint >= 0 then
                --[[
                local npc_bone_matrix = npc:GetBoneMatrix(bellyAnchorPoint)
                local npc_bone_ang = npc_bone_matrix:GetAngles()
                
                ang = ang - ply:GetViewPunchAngles() - bone_ang - npc:GetAngles() - npc_bone_ang
                ]]
                entPos = bone_pos
                ang = ang - ply:GetViewPunchAngles()
            else
                ang = ang - ply:GetViewPunchAngles() - bone_ang 
            end
            ang = Angle(ang.x, ang.y, 0) --whatever
        else
            ang = ang - ply:GetViewPunchAngles() - belly:GetAngles() - npc:GetAngles()
            ang = Angle(ang.x, ang.y, 0) --whatever
        end

        local tr = util.TraceLine({
            start = entPos,
            endpos = (entPos - (ang:Forward() * 100) * ZmMult),
            filter = {belly, npc, ply}
        })

        local view = {
            origin = tr.HitPos + (tr.HitNormal),
            angles = ang,
            fov = fov,
            drawviewer = false 
        }

        return view
    end)

    hook.Add("HUDShouldDraw", hudHook, function( name ) 
        if name == "CHudDamageIndicator" or name == "CHudDeathNotice" or name == "CHudPoisonDamageIndicator" or name == "CHudCrosshair" or name == "CHudAmmo" then 
            return false 
        end
    end)

    hook.Add("HUDPaint", hudHook, function()
        local ply = LocalPlayer()
        if ply:FlashlightIsOn() then
            setInternalView(true, npc, belly)
        else
            setInternalView(false, npc, belly)
        end

        if not IsValid(ply) or not ply:Alive() then
            setInternalView(false, npc, belly)
            local text = "You have been digested..."

            surface.SetFont( "Trebuchet24" ) -- Set the font
            local x,y = (ScrW() / 2), ScrH() * .75 

            displayText(text, x, y + 3, "Trebuchet24", Color(0,0,0))
            displayText(text, x, y, "Trebuchet24", Color(229,145,145))
            return
        end

        if is_internal_view then
            displayText("this is the temporary internal view, i might finish it", ScrW()/2, ScrH()/2, "BudgetLabel", Color(255,255,255))
        end
	end)

    hook.Add("CreateMove", scrollHook, function(cmd)
         if cmd:GetMouseWheel() ~= 0 then
            ZmMult = ZmMult - cmd:GetMouseWheel() * 0.05
            if ZmMult < 0.5 then
                ZmMult = 0.5
            end
            if ZmMult > 4 then
                ZmMult = 4
            end
        end
    end)
end

local function noModBitch()
    local mod = net.ReadString()
    local npcName = net.ReadString()
    local frame = vgui.Create("DFrame")
    frame:SetTitle('"'..npcName..'" Failure')
    frame:SetSize(250, 200)
    frame:Center()
    frame:MakePopup()

    local label = vgui.Create("DLabel", frame)
    label:SetText("Model failed to load, check console for more info.\n                If you don't have the model?")
    label:SetSize(380, 60)
    label:SetPos(10, 10)

    local id = string.match(mod, "id=(%d+)")

    steamworks.FileInfo( id, function( result ) 

        if not result then
            local label = vgui.Create("DLabel", frame)
            label:SetText(mod)
            label:SetSize(360, 30)
            label:SetPos(20, 60)
            return
        end
        -------
        local page = vgui.Create("DButton", frame)
        page:SetText("Open Workshop Page")
        page:SetSize(170, 30)
        page:SetPos(40, 60)

        page.DoClick = function()
            steamworks.ViewFile(id)
            frame:Close()
        end
        local label = vgui.Create("DLabel", frame)
        label:SetText("Subscribe to the addon to have it permanently.\n                     Requires server restart.")
        label:SetSize(230, 30)
        label:SetPos(15, 90)

        local download = vgui.Create("DButton", frame)
        download:SetText("Download and Mount")
        download:SetSize(170, 30)
        download:SetPos(40, 129)
        download.DoClick = function()
            DownloadAndMount(id)
            frame:Close()
        end

        local label = vgui.Create("DLabel", frame)
        label:SetText("  Temporarily downloads the addon.")
        label:SetSize(240, 30)
        label:SetPos(39, 160)
    end)   
end

net.Receive("UGotVored", OnVored)
net.Receive("StopVoreClient", noMoreVore)
net.Receive("VoreNoModNotif", noModBitch)

--[[SETTINGS AND STUFF]]

local function populate()
    spawnmenu.AddToolMenuOption("V-NPCs", "Personalization", "vnpcs_settings", "Settings", "", "", function(panel)
        panel:ClearControls()

        panel:Help("Personalization\n")
        panel:CheckBox("Burps Enabled", "vnpcs_burps")
        panel:CheckBox("Patrolling while full", "vnpcs_patrol_full")
        panel:CheckBox("Weight Gain", "vnpcs_gain")
        panel:CheckBox("Insta-vore", "vnpcs_instavore")
        panel:CheckBox("Camera Sway", "vnpcs_camerasway")
        panel:NumSlider("Belly-fat Loss", "vnpcs_belly_fat_lose", 0, 8, 1)
        panel:ControlHelp("This makes V-NPCs will lose their belly fat after awhile. Tied to absorption power.")
        panel:NumSlider("Weight Gain Loss", "vnpcs_weight_loss", 0, 8, 1)
        panel:ControlHelp("This makes V-NPCs will lose weight they gained after awhile. Tied to absorption power and weight gain multiplier.")


        panel:Help("\nMultipliers\n")
        panel:ControlHelp("(Multiplies the NPC's settings)")

        panel:NumSlider("Digestion Power multiplier", "vnpcs_digestion_multi", 0, 20, 1)
        panel:NumSlider("Absorption Power multiplier", "vnpcs_absorption_multi", 0, 20, 1)
        panel:NumSlider("Struggle Animation multiplier", "vnpcs_struggle_multi", 0, 8, 1)
        panel:NumSlider("Weight Gain multiplier", "vnpcs_gain_multi", 0, 8, 1)
        panel:NumSlider("Belly-fat gain multiplier", "vnpcs_fat_multi", 0, 2, 1)
        panel:NumSlider("Belly-fat max multiplier", "vnpcs_fatcap_multi", 0, 4, 1)

        panel:Help("\nForcers\n")
        panel:ControlHelp("Sets the variable to the multiplier, so all V-NPCs have the same values/settings")

        panel:CheckBox("Force Digestion Power", "vnpcs_global_digestion")
        panel:ControlHelp("Default is 2")
        panel:CheckBox("Force Absorption Power", "vnpcs_global_absorption")
        panel:ControlHelp("Default is 1.5")
        panel:CheckBox("Force Struggle Animation", "vnpcs_global_struggle")
        panel:ControlHelp("Default is 1.2")
        panel:CheckBox("Force Belly-fat Max", "vnpcs_global_fatcap")
        panel:ControlHelp("Default is 0.5")

        panel:ControlHelp("")

        panel:CheckBox("Force Burps", "vnpcs_global_burps")
        panel:CheckBox("Force Weight Gain", "vnpcs_global_gain")
    end)

    spawnmenu.AddToolMenuOption("V-NPCs", "Personalization", "vnpcs_personality", "Personality", "", "", function(panel)
        panel:ClearControls()

        panel:Help("this is system will be replaced later by a more advanced one later")
        panel:Help("")

        panel:Help("\nForcers\n")
        panel:ControlHelp("Sets the variable to the multiplier, so all V-NPCs have the same values/settings")

        panel:CheckBox("Hungry for Players", "vnpcspersonality_players")
        panel:CheckBox("Hungry for NPCs", "vnpcspersonality_npcs")
    end)
end

hook.Add("PopulateToolMenu", "VNpcsToolMenu", populate)