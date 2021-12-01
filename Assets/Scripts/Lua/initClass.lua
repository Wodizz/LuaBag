--常用别名定位
require("Object")
require("SplitTools")
Json = require("JsonUtility")

--Unity相关
GameObject = CS.UnityEngine.GameObject
Resources = CS.UnityEngine.Resources
Transform = CS.UnityEngine.Transform
RectTransform = CS.UnityEngine.RectTransform
Sprite = CS.UnityEngine.Sprite
SpriteAtlas = CS.UnityEngine.U2D.SpriteAtlas

Vector3 = CS.UnityEngine.Vector3
Vector2 = CS.UnityEngine.Vector2

--UI相关
-- 所有ui控件的基类
UIBehaviour = CS.UnityEngine.EventSystems
UI = CS.UnityEngine.UI
Image = UI.Image
Text = UI.Text
Button = UI.Button
Toggle = UI.Toggle
ScrollRect = UI.ScrollRect
-- 找到Canvas
Canvas = GameObject.Find("Canvas").transform

--自定义脚本相关
ABManager = CS.ABManager.Instance
IconsNameArray = CS.ProjectConstData.IconsNameArray