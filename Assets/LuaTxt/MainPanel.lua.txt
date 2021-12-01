-- 只要是新的面板 就新建一个表
BasePanel:subClass("MainPanel")


-- 虽然lua不存在声明变量
-- 为了方便阅读
MainPanel.panelObj = nil
MainPanel.btnRole = nil
MainPanel.btnSkill = nil
MainPanel.isInit = false

-- 初始化函数
function MainPanel:Init()
    -- 调用父类Init()方法必须.调用然后传自己self 这样方法中的self才会是自己
    self.base.Init(self, "MainPanel")
    -- 找到对应控件
    self.btnRole = self:GetControl("RoleBtn", "Button")
    self.btnSkill = self:GetControl("SkillBtn", "Button")
    self:Show()
end

function MainPanel:AddEvent()

    self.btnRole.onClick:AddListener(function()
        -- 这里的self是button 这是一个闭包 AddListener先传入self.btnRole 匿名函数再调用self
        self:OnbtnRoleClicked()
    end)


    self.btnSkill.onClick:AddListener(function()
        self:OnbtnSkillClicked()
    end)
end


function MainPanel:DelEvent()
    self.btnRole.onClick:RemoveAllListeners()
end

function MainPanel:Show()
    self:AddEvent()
end

function MainPanel:Hide()
    self:DelEvent()
end

function MainPanel:OnbtnRoleClicked()
    BagPanel:Init()
end

function MainPanel:OnbtnSkillClicked()
    print(self)
end