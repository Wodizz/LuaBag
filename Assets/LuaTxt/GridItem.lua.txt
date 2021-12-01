-- 生成一个表 继承Object
Object:subClass("GridItem")

-- 成员变量
GridItem.obj = nil
GridItem.imgGridItem = nil
GridItem.txtGridItem = nil


-- 初始化
function GridItem:Init(info)
    self.obj = ABManager:LoadRes("prefabs", "GridItem", typeof(GameObject))
    self.imgGridItem = self.obj.transform:Find("Bg/GridItemImg"):GetComponent(typeof(Image))
    self.txtGridItem = self.obj.transform:Find("Bg/GridItemTxt"):GetComponent(typeof(Text))
    self.imgGridItem.sprite = BagPanel.iconAtlas:GetSprite(IconsNameArray[info.id])
    self.txtGridItem.text = info.num
end

function GridItem:Destroy()
    GameObject.Destroy(self.obj)
    self.obj = nil
end

