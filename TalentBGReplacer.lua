local addonName = ...
local db
local L = TalentBGReplacer_L

-- 应用背景贴图
local function ApplyBackground()
    local specIndex = GetSpecialization()
    if not specIndex then return end

    local specID = GetSpecializationInfo(specIndex)
    local textureName = TBR_DB and TBR_DB[specID]
    local texParent = PlayerSpellsFrame and PlayerSpellsFrame.TalentsFrame

    if not textureName or textureName == "" then
        if texParent and texParent.__TBR_Overlay then
            texParent.__TBR_Overlay:SetTexture(nil)
            texParent.__TBR_Overlay:Hide()
        end
        return
    end

    if not texParent then return end
    if texParent.__TBR_Overlay then
        texParent.__TBR_Overlay:SetTexture(nil)
        texParent.__TBR_Overlay:Hide()
    end

    local fullPath = "Interface\\AddOns\\TBRT\\" .. textureName
    local overlay = texParent:CreateTexture(nil, "ARTWORK", nil, 1)
    overlay:SetAllPoints()
    overlay:SetTexture(fullPath)
    overlay:SetTexCoord(0, 1, 0, 1)
    overlay:SetAlpha(1)
    texParent.__TBR_Overlay = overlay

    C_Timer.After(0.05, function()
        if not overlay:GetTexture() then
            print(string.format(L.LOAD_FAIL, fullPath))
        end
    end)
end

-- 设置界面
local function CreateOptionsPanel()
    local panel = CreateFrame("Frame", "TBRConfigPanel", UIParent, "BasicFrameTemplateWithInset")
    panel:SetSize(360, 260)
    panel:SetPoint("CENTER")
    panel:SetMovable(true)
    panel:EnableMouse(true)
    panel:RegisterForDrag("LeftButton")
    panel:SetScript("OnDragStart", panel.StartMoving)
    panel:SetScript("OnDragStop", panel.StopMovingOrSizing)
    panel:Hide()
    tinsert(UISpecialFrames, "TBRConfigPanel")

    panel.title = panel:CreateFontString(nil, "OVERLAY", "GameFontHighlightLarge")
    panel.title:SetPoint("TOP", 0, -10)
    panel.title:SetText(L.TITLE)

    local input = CreateFrame("EditBox", "TBRTextureInput", panel, "InputBoxTemplate")
    input:SetSize(200, 30)
    input:SetAutoFocus(false)

    local dropdown = CreateFrame("Frame", "TBRSpecDropdown", panel, "UIDropDownMenuTemplate")
    dropdown:SetPoint("TOP", panel, "TOP", 0, -40)

    UIDropDownMenu_Initialize(dropdown, function()
        for i = 1, GetNumSpecializations() do
            local specID, name = GetSpecializationInfo(i)
            UIDropDownMenu_AddButton({
                text = name,
                func = function()
                    dropdown.selectedSpecID = specID
                    UIDropDownMenu_SetSelectedName(dropdown, name)
                    input:SetText(db[specID] or "")
                end,
            })
        end
    end)

    UIDropDownMenu_SetWidth(dropdown, 200)
    UIDropDownMenu_SetText(dropdown, L.SELECT_SPEC)

    input:SetPoint("TOP", dropdown, "BOTTOM", 0, -10)

    local note = panel:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    note:SetPoint("TOP", input, "BOTTOM", 0, -5)
    note:SetWidth(320)
    note:SetJustifyH("CENTER")
    note:SetJustifyV("TOP")
    note:SetText(L.INPUT_HINT)

    local function CreateButton(text)
        local btn = CreateFrame("Button", nil, panel, "UIPanelButtonTemplate")
        btn:SetSize(100, 24)
        btn:SetText(text)
        return btn
    end

    local saveButton = CreateButton(L.SAVE)
    local clearButton = CreateButton(L.CLEAR)
    local reloadButton = CreateButton(L.RELOAD)

    saveButton:SetPoint("TOP", note, "BOTTOM", 0, -10)
    clearButton:SetPoint("TOPRIGHT", saveButton, "TOPLEFT", -10, 0)
    reloadButton:SetPoint("TOPLEFT", saveButton, "TOPRIGHT", 10, 0)

    saveButton:SetScript("OnClick", function()
        local path = input:GetText()
        local specID = dropdown.selectedSpecID
        if specID then
            if path and path ~= "" then
                db[specID] = path
                print(string.format(L.SET_SUCCESS, specID, path))
            else
                db[specID] = nil
                print(string.format(L.CLEAR_SUCCESS, specID))
            end
        end
    end)

    clearButton:SetScript("OnClick", function()
        local specID = dropdown.selectedSpecID
        if specID then
            db[specID] = nil
            input:SetText("")
            print(string.format(L.CLEAR_SUCCESS, specID))
        end
    end)

    reloadButton:SetScript("OnClick", function()
        ReloadUI()
    end)

    return panel
end

-- 钩子逻辑
local function SetupTalentFrameHook()
    if PlayerSpellsFrame and PlayerSpellsFrame.TalentsFrame then
        if not PlayerSpellsFrame.TalentsFrame.__TBRHooked then
            PlayerSpellsFrame.TalentsFrame.__TBRHooked = true
            PlayerSpellsFrame.TalentsFrame:HookScript("OnShow", function()
                C_Timer.After(0.05, ApplyBackground)
            end)
            if PlayerSpellsFrame.TalentsFrame:IsShown() then
                C_Timer.After(0.05, ApplyBackground)
            end
        end
    else
        C_Timer.After(0.05, SetupTalentFrameHook)
    end
end

-- 事件注册
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:RegisterEvent("PLAYER_SPECIALIZATION_CHANGED")
f:RegisterEvent("PLAYER_ENTERING_WORLD")
f:SetScript("OnEvent", function(self, event, arg1)
    if event == "ADDON_LOADED" and arg1 == addonName then
        if type(TBR_DB) ~= "table" then
            TBR_DB = {}
        end
        db = TBR_DB
        CreateOptionsPanel()
        SetupTalentFrameHook()
    elseif event == "PLAYER_SPECIALIZATION_CHANGED" and arg1 == "player" then
        ApplyBackground()
    elseif event == "PLAYER_ENTERING_WORLD" then
        C_Timer.After(1, ApplyBackground)
    end
end)

-- 命令
SLASH_TBR1 = "/tbr"
SlashCmdList["TBR"] = function()
    if TBRConfigPanel:IsShown() then
        TBRConfigPanel:Hide()
    else
        TBRConfigPanel:Show()
    end
end
