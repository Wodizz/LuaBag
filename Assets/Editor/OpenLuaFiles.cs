using UnityEngine;
using UnityEditor;
using System;

public class LuaTxtEditor
{

    [UnityEditor.Callbacks.OnOpenAssetAttribute(1)]
    public static bool step1(int instanceID, int line)
    {
        //string name = EditorUtility.InstanceIDToObject(instanceID).name;
        //Debug.Log("Open Asset step: 1 (" + name + ")");

        return false;
    }

    [UnityEditor.Callbacks.OnOpenAssetAttribute(2)]
    public static bool step2(int instanceID, int line)
    {
        string strFilePath = AssetDatabase.GetAssetPath(EditorUtility.InstanceIDToObject(instanceID));
        string strFileName = Application.dataPath + "/" + strFilePath.Replace("Assets/", "");

        if (strFileName.EndsWith(".lua") || strFileName.EndsWith(".shader"))
        {
            System.Diagnostics.Process process = new System.Diagnostics.Process();
            System.Diagnostics.ProcessStartInfo startInfo = new System.Diagnostics.ProcessStartInfo();
            startInfo.WindowStyle = System.Diagnostics.ProcessWindowStyle.Hidden;
            startInfo.FileName = @"D:\VSCode\Microsoft VS Code\Code.exe";
            startInfo.Arguments = strFileName;
            process.StartInfo = startInfo;
            process.Start();
            return true; 
        }
        Debug.Log("Not Found 'VSCODE.EXE'.");
        return false;

    }

}