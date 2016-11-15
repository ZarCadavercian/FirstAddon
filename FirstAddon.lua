local addonName = ...
local currChar
local FA = CreateFrame("Frame");

FA.Event = {}
FA:RegisterEvent("ADDON_LOADED")
FA:RegisterEvent("PLAYER_LOGIN")

FA:SetScript("OnEvent",function( self, event, ...)
    self.Events[event](self, ...)
end)


FA.Events["ADDON_LOADED"] = function( self, loadedAddon )
    if loadedAddon ~= addonName then return end
    self:UnregisterEvent("ADDON_LOADED")
end

function FA.manageTooltip(tooltip, ... )
    local name, link = tooltip:GetItem()
    if not link then return end
    tooltip:AddLine("Prearity lvl: 0")
    tooltip:Show()
end

ItemRefTooltip:HookScript("OnTooltipSetItem", function(tooltip, ...)
    RH.manageTooltip(tooltip, ...)
end)
GameTooltip:HookScript("OnTooltipSetItem", function(tooltip, ...)
    RH.manageTooltip(tooltip, ...)
end)
WorldMapTooltip.ItemTooltip.Tooltip:HookScript("OnTooltipSetItem", function(tooltip, ...)
    RH.manageTooltip(tooltip, ...)
end)