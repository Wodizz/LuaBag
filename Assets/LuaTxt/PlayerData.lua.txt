PlayerData = {}
-- 玩家三种类型道具
PlayerData.equips = {}
PlayerData.items = {}
PlayerData.gems = {}


-- 初始化方法
function PlayerData:Init()
    -- 服务器最多存道具id和数量 存全部太浪费了
    for _, v in pairs(ItemData) do
        if v.type == "Equip" then
            table.insert(PlayerData.equips, v)
        elseif v.type == "Item" then
            table.insert(PlayerData.items, v)
        elseif v.type == "Gem" then
            table.insert(PlayerData.gems, v)
        end
    end
end




