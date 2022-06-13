using System;
using System.Collections.Generic;
using System.Text;

namespace LanguageXlsxToLua
{
    public static  class LuaHelper
    {
        static string Indentation = "\t";
        static string TableSeparator = "-";
        static string KeyValueString = "{0} = {1},\n";
        static string IndexValueString = "[{0}] = {1},\n";
        static string TableCloser = "},\n";

        public static string GetLuaStringFromFields(Field[] fields)
        {
            LuaFieldNode tree = BuildLuaTableTree(fields);

            StringBuilder sb = new StringBuilder();
            sb.Append("local Language = {\n");

            if (tree.List != null)
            {
                foreach (KeyValuePair<int, LuaFieldNode> pair in tree.List)
                {
                    sb.Append(ParseArrayBranch(pair.Key, pair.Value, Indentation));
                }
            }
            

            if (tree.Map != null)
            {
                foreach (KeyValuePair<string, LuaFieldNode> pair in tree.Map)
                {
                    sb.Append(ParseMapBranch(pair.Key, pair.Value, Indentation));
                }
            }

            sb.Append("\n}\nreturn Language;");
            return sb.ToString();
        }

        /// <summary>
        /// Parse field data into a tree reflecting 
        /// </summary>
        /// <param name="fields"></param>
        /// <returns></returns>
        static LuaFieldNode BuildLuaTableTree(Field[] fields)
        {
            LuaFieldNode root = new LuaFieldNode();
            foreach (Field field in fields)
            {
                UnfoldLuaField(root, field.Name, field.Value);
            }
            return root;
        }

        static void UnfoldLuaField(LuaFieldNode root, string name, string value)
        {
            string[] parts = name.Split(TableSeparator);
            string fieldName = parts[0];
            int treeDepth = parts.Length;
            LuaFieldNode node;
            if (!root.TryGetNode(fieldName, out node))
            {
                node = new LuaFieldNode();
                root.AddTableNode(fieldName, node);
            }


            if (parts.Length == 1)
            {
                node.AddValue(value);
            }
            else
            {
                for (int i = 1; i < treeDepth; i++)
                {
                    string key = parts[i];
                    LuaFieldNode child = null;
                    if (!node.TryGetNode(key, out child))
                    {
                        child = new LuaFieldNode();
                        node.AddTableNode(key, child);
                    }
  
                    node = child;
                }
                node.AddValue(value);
            }
        }

        static string ParseArrayBranch(int index, LuaFieldNode node, string indentation)
        {
            StringBuilder sb = new StringBuilder();

            switch (node.FieldType)
            {
                case LuaFieldType.Single:
                    sb.Append(indentation + string.Format(IndexValueString, index, node.Value));
                    break;

                case LuaFieldType.Array:
                    sb.Append(indentation + "[" + index + "] = {\n");
                    foreach (KeyValuePair<int, LuaFieldNode> pair in node.List)
                    {
                        sb.Append(ParseArrayBranch(pair.Key, pair.Value, indentation + Indentation));
                    }
                    sb.Append(indentation + TableCloser);
                    break;

                case LuaFieldType.Hash:
                    sb.Append(indentation + "[" + index + "] = {\n");
                    foreach (KeyValuePair<string, LuaFieldNode> pair in node.Map)
                    {
                        sb.Append(ParseMapBranch(pair.Key, pair.Value, indentation + Indentation));
                    }
                    sb.Append(indentation + TableCloser);
                    break;
            };

            return sb.ToString();
        }

        static string ParseMapBranch(string key, LuaFieldNode node, string indentation)
        {
            StringBuilder sb = new StringBuilder();

            switch (node.FieldType)
            {
                case LuaFieldType.Single:
                    sb.Append(indentation + string.Format(KeyValueString, key, node.Value));
                    break;

                case LuaFieldType.Array:
                    sb.Append(indentation + key + " = {\n");
                    foreach (KeyValuePair<int, LuaFieldNode> pair in node.List)
                    {
                        sb.Append(ParseArrayBranch(pair.Key, pair.Value, indentation + Indentation));
                    }
                    sb.Append(indentation + TableCloser);
                    break;

                case LuaFieldType.Hash:
                    sb.Append(indentation + key + " = {\n");
                    foreach (KeyValuePair<string, LuaFieldNode> pair in node.Map)
                    {
                        sb.Append(ParseMapBranch(pair.Key, pair.Value, indentation + Indentation));
                    }
                    sb.Append(indentation + TableCloser);
                    break;
            };

            return sb.ToString();
        }
    }
}
