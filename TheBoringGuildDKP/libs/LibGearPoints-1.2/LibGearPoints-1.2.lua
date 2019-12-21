--[[
--]]

local MAJOR_VERSION = "LibGearPoints-1.2-MRT"
local MINOR_VERSION = 11303

local lib, oldMinor = LibStub:NewLibrary(MAJOR_VERSION, MINOR_VERSION)
if not lib then return end

function lib:GetValue(item)
	if not item then return end
	local _, itemLink = GetItemInfo(item)
	local itemID = itemLink:match("item:(%d+)")
	if not itemID then return end
	itemID = tonumber(itemID)
	if not CUSTOM_ITEM_DKP[itemID] then return end
	return (CUSTOM_ITEM_DKP[itemID])
end