-- 加载json字符串
local jsonTxt = ABManager:LoadRes("json", "ItemData", typeof(CS.UnityEngine.TextAsset))
-- json解析
--print(jsonTxt.text)
local itemList = Json.decode(jsonTxt.text)
-- 获取的是一个table
-- print(itemList[1].id .. itemList[1].name)

-- 根据键值对来存储数据的道具表
ItemData = {}

-- 转存数据到自定义表 _, value 的声明可以不使用key值
for _, value in pairs(itemList) do
    table.insert(ItemData,value)
end

-- print(ItemData[0].name)