TheBoringGuildDKP = LibStub("AceAddon-3.0"):NewAddon("TheBoringGuildDKP", "AceHook-3.0")

local LibGP = LibStub("LibGearPoints-1.2-MRT");

CUSTOM_ITEM_DKP = {
-- Molten Core
	-- Druid Tier
	[16828]	= 60,
	[16829]	= 75,
	[16830]	= 60,
	[16833]	= 90,
	[16831]	= 75,
	[16834]	= 90,
	[16835]	= 90,
	[16836]	= 75,
	[16901] = 105,
	
	--Hunter Tier
	[16851] = 60,
	[16849] = 75,
	[16850] = 60,
	[16845] = 90,
	[16848] = 75,
	[16852] = 75,
	[16846] = 90,
	[16847] = 90,
	[16938] = 105,

	--Mage Tier
	[16795] = 90,
	[16797] = 75,
	[16798] = 90,
	[16799] = 60,
	[16801] = 75,
	[16802] = 60,
	[16796] = 90,
	[16800] = 75,
	[16915] = 105,

	--Priest Tier,
	[16811] = 75,
	[16813] = 90,
	[16817] = 60,
	[16812] = 75,
	[16814] = 90,
	[16816] = 75,
	[16815] = 90,
	[16819] = 60,
	[16922] = 105,

	--Rogue Tier
	[16827] = 60,
	[16824] = 75,
	[16825] = 60,
	[16820] = 90,
	[16821] = 90,
	[16826] = 75,
	[16822] = 90,
	[16823] = 75,
	[16909] = 105,

	--Shaman Tier
	[16838] = 60,
	[16837] = 75,
	[16840] = 60,
	[16841] = 90,
	[16844] = 75,
	[16839] = 75,
	[16842] = 90,
	[16843] = 90,
	[16946] = 105,

	--Warlock Tier
	[16808] = 90,
	[16807] = 75,
	[16809] = 90,
	[16804] = 60,
	[16805] = 75,
	[16806] = 60,
	[16810] = 90,
	[16803] = 75,
	[16930] = 105,

	--Warrior Tier
	[16864] = 60,
	[16861] = 60,
	[16865] = 90,
	[16863] = 75,
	[16866] = 90,
	[16867] = 90,
	[16868] = 75,
	[16862] = 75,
	[16962] = 105,

	-- Not tier
	[18823] = 105,
	[18703] = 105,
	[17105] = 90,
	[17103] = 105,
	[17063] = 105,
	[19138] = 75,
	[18563] = 120,
	[18564] = 120,
	[17072] = 75,
	[17076] = 105,
	[18832] = 105,
	[19140] = 105,
	[17109] = 75,
	[18814] = 105,
	[17102] = 90,
	[18806] = 60,
	[18805] = 105,
	[17077] = 0,
	[18817] = 90,
	[18829] = 75,
	[17107] = 90,
	[17066] = 90,
	[17073] = 75,
	[18815] = 60,
	[17204] = 120,
	[18803] = 75,
	[19142] = 75,
	[19139] = 60,
	[18811] = 60,
	[19143] = 75,
	[18861] = 60,
	[18808] = 60,
	[17071] = 90,
	[18879] = 75,
	[18870] = 75,
	[18824] = 0,
	[17106] = 105,
	[19136] = 90,
	[18872] = 75,
	[17065] = 75,
	[18822] = 90,
	[19137] = 105,
	[18816] = 105,
	[18821] = 75,
	[19147] = 90,
	[19145] = 90,
	[19144] = 60,
	[18875] = 105,
	[18809] = 60,
	[17074] = 60,
	[17082] = 60,
	[18878] = 75,
	[17104] = 105,
	[18842] = 105,
	[17069] = 90,
	[18820] = 105,
	[18646] = 105,
	[18810] = 105,
	[19146] = 75,
	[18812] = 75,
-- Onyxia
	--Tier
	[16900] = 105,
	[16939] = 105,
	[16914] = 105,
	[16921] = 105,
	[16908] = 105,
	[16947] = 105,
	[16929] = 105,
	[16963] = 105,

	--Not tier
	[17067] = 60,
	[17068] = 105,
	[18205] = 60,
	[18422] = 75, --Head of Ony
	[18423] = 75, --Head of Ony
	[18705] = 0,
	[18813] = 60,
	[17078] = 60,
	[17064] = 105,
	[17075] = 105
}

function OnTooltipSetItem(tooltip, ...)
  local _, itemlink = tooltip:GetItem()
  local dkpcost = LibGP:GetValue(itemlink)
  if not dkpcost then return end
  offdkpcost = 0
  if dkpcost == 60 then offdkpcost = 25 end
  if dkpcost == 75 then offdkpcost = 30 end
  if dkpcost == 90 then offdkpcost = 35 end
  if dkpcost == 105 then offdkpcost = 40 end
  tooltip:AddLine(
    ("DKP: %d (OS: %s)"):format(dkpcost, offdkpcost), r, g, b);
end

function TheBoringGuildDKP:OnEnable()
  local obj = EnumerateFrames()
  while obj do
    if obj:IsObjectType("GameTooltip") then
      assert(obj:HasScript("OnTooltipSetItem"))
      self:HookScript(obj, "OnTooltipSetItem", OnTooltipSetItem)
    end
    obj = EnumerateFrames(obj)
  end
end

-- /Run MRT_AutoAddLootItem("playerName", "itemLink", itemCount)
