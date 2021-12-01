-- 初始化所有类别名
require("initClass")
-- 初始化道具数据
require("ItemData")
-- 初始化玩家信息
require("PlayerData")
-- 初始化面板
require("BasePanel")
require("MainPanel")
require("BagPanel")
require("GridItem")


-- 调用初始化方法
PlayerData:Init()
MainPanel:Init()