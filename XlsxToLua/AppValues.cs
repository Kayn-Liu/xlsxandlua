using System;
using System.Collections.Generic;
using System.Text;

namespace LanguageXlsxToLua
{
    public static class AppValues
    {
        public static Dictionary<string, string> Languages = new Dictionary<string, string>()
        {
            ["CN"] = "Chinese",
            ["EN"] = "English",
            ["TH"] = "Thai",
            ["VN"] = "Vietnamese",
            ["IN"] = "Indonesian",
        };

        public static string Xlsx = ".xlsx";
        public static string Lua = ".lua";

        public static string XlsxPath = System.Environment.GetFolderPath(Environment.SpecialFolder.DesktopDirectory) +
            @"\LanguageInput\";

        public static string OutputPath = System.Environment.GetFolderPath(Environment.SpecialFolder.DesktopDirectory) +
            @"\LanguageOutput\";
    }

    public struct XlsxFileInfo
    {
        public string Name;
        public string Path;
        public string NameWOSuffix;
        public string Prefix;
        public string NameWOPrefix;
    }

    public struct Field 
    {
        /// <summary>
        /// 字段名称
        /// </summary>
        public string Name;

        /// <summary>
        /// 字段值
        /// </summary>
        public string Value;
    }

    public enum LuaFieldType 
    { 
        Single = 1,
        Array = 2,
        Hash = 3,
    }

    public class LuaFieldNode
    {
        public LuaFieldType FieldType;
        public string Value; //当lua字段直接对应单个文本时
        public SortedDictionary<int, LuaFieldNode> List; //模拟lua表中的数组结构
        public Dictionary<string, LuaFieldNode> Map; //模拟lua表中的哈希结构

        public void AddValue(string value)
        {
            this.Value = value;
            FieldType = LuaFieldType.Single;
        }

        public void AddArrayNode(int index, LuaFieldNode node)
        {
            if (List == null) 
                List = new SortedDictionary<int, LuaFieldNode>();
            List[index] = node;
            FieldType = LuaFieldType.Array;
        }

        public void AddMapNode(string key, LuaFieldNode node)
        {
            if (Map == null)
                Map = new Dictionary<string, LuaFieldNode>();
            Map[key] = node;
            FieldType = LuaFieldType.Hash;
        }

        public void AddTableNode(string key, LuaFieldNode node)
        {
            if (Int32.TryParse(key, out int index))
            {
                AddArrayNode(index, node);
            }
            else
            {
                AddMapNode(key, node);
            }
        }

        public bool TryGetNode(string key, out LuaFieldNode node)
        {
            if (int.TryParse(key, out int index))
            {
                if (List == null)
                {
                    node = null;
                    return false;
                }
                return List.TryGetValue(index, out node);
            }
            else
            {
                if (Map == null)
                {
                    node = null;
                    return false;
                }
                return Map.TryGetValue(key, out node);
            }
        }
    }
}
