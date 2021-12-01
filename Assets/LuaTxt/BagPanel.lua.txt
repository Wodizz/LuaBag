BagPanel = {}
-- 变量声明
BagPanel.panelObj = nil
BagPanel.toggleEquip = nil
BagPanel.toggleItem = nil
BagPanel.toggleGem = nil
BagPanel.btnClose = nil
BagPanel.transGridItemContent = nil
BagPanel.iconAtlas = nil
BagPanel.isInit = false
-- 格子表
BagPanel.gridItems = {}

function BagPanel:Init()
    if self.isInit == false then
        -- 实例化面板
        self.panelObj = ABManager:LoadRes("prefabs", "BagPanel", typeof(GameObject), Canvas)
        self.panelObj.transform.localScale = Vector3.one
        self.panelObj.transform.localPosition = Vector3.zero
        -- 加载图集
        self.iconAtlas = ABManager:LoadRes("SpriteAtlas", "Icons", typeof(SpriteAtlas))
        -- 找到对应控件
        self.toggleEquip = self.panelObj.transform:Find("Bg/ToggleContent/EquipToggle"):GetComponent(typeof(Toggle))
        self.toggleItem = self.panelObj.transform:Find("Bg/ToggleContent/ItemToggle"):GetComponent(typeof(Toggle))
        self.toggleGem = self.panelObj.transform:Find("Bg/ToggleContent/GemToggle"):GetComponent(typeof(Toggle))
        self.btnClose = self.panelObj.transform:Find("Bg/CloseBtn"):GetComponent(typeof(Button))
        self.transGridItemContent = self.panelObj.transform:Find("Bg/ItemPanel/ItemContentMask/GridItemContent")
        self.isInit = true
    end
    self:Show()
end

function BagPanel:Show()
    self:AddEvent()
    self.panelObj:SetActive(true)
    self.toggleEquip.isOn = true
    self:SwitchItemPanel(1)
end


function BagPanel:Hide()
    self:DelEvent()
    self.panelObj:SetActive(false)
end


function BagPanel:AddEvent()
    self.btnClose.onClick:AddListener(function()
        self:OnbtnCloseClicked()
    end)
    self.toggleEquip.onValueChanged:AddListener(function(value)
        self:OntoggleEquipValueChanged(value)
    end)
    self.toggleItem.onValueChanged:AddListener(function(value)
        self:OntoggleItemValueChanged(value)
    end)
    self.toggleGem.onValueChanged:AddListener(function(value)
        self:OntoggleGemValueChanged(value)
    end)
end


function BagPanel:DelEvent()
    self.toggleEquip.onValueChanged:RemoveAllListeners()
    self.toggleItem.onValueChanged:RemoveAllListeners()
    self.toggleGem.onValueChanged:RemoveAllListeners()
    self.btnClose.onClick:RemoveAllListeners()
end

function BagPanel:OntoggleEquipValueChanged(isCheck)
    if isCheck then
        BagPanel:SwitchItemPanel(1)
    end
end

function BagPanel:OntoggleItemValueChanged(isCheck)
    if isCheck then
        BagPanel:SwitchItemPanel(2)
    end
end

function BagPanel:OntoggleGemValueChanged(isCheck)
    if isCheck then
        BagPanel:SwitchItemPanel(3)
    end
end

function BagPanel:OnbtnCloseClicked()
    BagPanel:Hide()
end

-- type 1:装备 2:道具 3:宝石
function BagPanel:SwitchItemPanel(type)
    -- 先回收
    for _,v in pairs(self.gridItems) do
        if v ~= nil then
            v:Destroy()
        end
    end
    -- 清空表
    self.gridItems = {}
    -- 在创建
    if type == 1 then
        for i = 1, #PlayerData.equips do
            self:CreateItem(PlayerData.equips[i])
        end
    elseif type == 2 then
        for i = 1, #PlayerData.items do
            self:CreateItem(PlayerData.items[i])
        end
    else
        for i = 1, #PlayerData.gems do
            self:CreateItem(PlayerData.gems[i])
        end
    end
end

function BagPanel:CreateItem(info)
    -- 利用自定义的new 生成一个新表
    local gridObj = GridItem:new()
    gridObj:Init(info)
    gridObj.obj.transform:SetParent(self.transGridItemContent, false)
    -- 存入格子表
    table.insert(self.gridItems, gridObj)
end