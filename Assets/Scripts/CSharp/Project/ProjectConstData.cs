using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine.Events;

[XLua.LuaCallCSharp]
public static class ProjectConstData
{
    public readonly static string[] IconsNameArray = new string[] 
    {
        "EquipIcon1",
        "EquipIcon2",
        "EquipIcon3",
        "EquipIcon4",
        "EquipIcon5",
        "EquipIcon6",
        "GemIcon1",
        "GemIcon2",
        "GemIcon3",
        "GemIcon4",
        "GemIcon5",
        "GemIcon6",
        "GemIcon7",
        "ItemIcon1",
        "ItemIcon2",
        "ItemIcon3",
        "ItemIcon4",
    };

    [XLua.LuaCallCSharp]
    public static List<Type> LuaCallCSharp = new List<Type>()
    {
        typeof(UnityAction),
        typeof(UnityAction<bool>),
    };
}
