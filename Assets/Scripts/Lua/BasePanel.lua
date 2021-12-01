Object:subClass("BasePanel")

BasePanel.panelObj = nil
BasePanel.isInit = false

-- 模拟一个字典 key是控件名 value是控件
BasePanel.controlDic = {}

function BasePanel:Init(name)
    if self.isInit == false then
        self.panelObj = ABManager:LoadRes("prefabs", name, typeof(GameObject))
        self.panelObj.transform:SetParent(Canvas, false)
        self.panelObj.transform.localScale = Vector3.one
        self.panelObj.transform.localPosition = Vector3.zero
        -- 找按钮 存起来
        -- c#数组对象
        local ctrls = self.panelObj.transform:GetComponentsInChildren(typeof(Button))
        -- 为了避免无用控件 控件命名必须统一规范
        -- btn控件名
        -- img控件名
        -- txt控件名 ...
        for i = 0, ctrls.Length - 1 do
            local controlName = ctrls[i].name
            -- 反射得到类型name
            local controlTypeName = ctrls[i]:GetType().Name
            if string.find(controlName, "Btn") ~= nil or 
                string.find(controlName, "Txt") ~= nil or 
                string.find(controlName, "Img") ~= nil or 
                string.find(controlName, "Toggle") ~= nil then
                    -- 同一对象挂载多个控件 所以把单个对象当做表 将控件加入表中
                    -- 通过自定义索引的方式 加入新控件
                    -- 最终存储形式
                    -- {btnRole = { Image = 图片, Button = 按钮}}
                    if self.controlDic[controlName] ~= nil then
                        self.controlDic[controlName][controlTypeName] =  ctrls[i]
                    else
                        -- 为了有区分 将控件类型名也存入表中
                        self.controlDic[controlName] = {[controlTypeName] = ctrls[i]}
                    end
            end
        end
        self.isInit = true
    end
end

-- 通过组件名与类型名 得到ui控件
function BasePanel:GetControl(name, typeName)
    if self.controlDic[name] ~= nil then
        local ctrl = self.controlDic[name]
        if ctrl[typeName] ~= nil then
            return ctrl[typeName] 
        end
    end
    return nil
end

function BasePanel:Show()
    self:AddEvent()
end

function BasePanel:Hide()
    self:DelEvent()
end

function BasePanel:AddEvent()
    
end

function BasePanel:DelEvent()
    
end