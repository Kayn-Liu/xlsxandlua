using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.IO;

namespace LanguageXlsxToLua
{
    internal class Program
    {
        static void Main(string[] args)
        {
            PrepareFolder();
            List<XlsxFileInfo> xlsxFiles = GetXlsxFileInfo();

            foreach (XlsxFileInfo xlsxFile in xlsxFiles)
            {
                Console.WriteLine("Start processing file: " + xlsxFile.Name);
                DataTable dt = GetExcelToDataTableBySheet(xlsxFile.Path, "Language$");
                string[] languages = GetLanguages(dt);
                Dictionary<string, Field[]> languageData = GetLanguageData(languages, dt);
                Dictionary<string, string> languageLuaContent = new Dictionary<string, string>();
                foreach (KeyValuePair<string, Field[]> pair in languageData)
                {
                    languageLuaContent[pair.Key] = LuaHelper.GetLuaStringFromFields(pair.Value);
                }
                CheckAndCreateLanguageFolder(languages);
                WriteLuaFiles(xlsxFile, languageLuaContent);
            }

            Console.WriteLine("Finished!");
            Console.ReadLine();
        }

        static void PrepareFolder()
        {
            Console.WriteLine("Checking for input folder at path: " + AppValues.XlsxPath);
            try
            {
                if (!Directory.Exists(AppValues.XlsxPath))
                {
                    throw new Exception("No input folder at path: " + AppValues.XlsxPath);
                }
            }
            catch (Exception e)
            {
                Console.WriteLine("!!! Error: " + e.Message);
                throw;
            }

            Console.WriteLine("Preparing output path at: " + AppValues.OutputPath);

            if (Directory.Exists(AppValues.OutputPath))
            {
                Directory.Delete(AppValues.OutputPath, true);
            }

            Directory.CreateDirectory(AppValues.OutputPath);
        }

        static List<XlsxFileInfo> GetXlsxFileInfo()
        {
            List<XlsxFileInfo> xlsxFiles = new List<XlsxFileInfo>();
            DirectoryInfo df = new DirectoryInfo(AppValues.XlsxPath);
            FileInfo[] fileInfo = df.GetFiles();
            foreach (FileInfo file in fileInfo)
            {
                if (!file.Name.Contains(AppValues.Xlsx)) continue;
                string fileName = file.Name;
                int suffixSeperator = fileName.LastIndexOf('.');
                string nameWOSuffix = fileName.Substring(0, suffixSeperator);
                int prefixSeperator = fileName.IndexOf('_');
                string prefix = fileName.Substring(0, prefixSeperator);
                string module = fileName.Substring(prefixSeperator + 1, suffixSeperator - prefixSeperator - 1);
                XlsxFileInfo info = new XlsxFileInfo();
                {
                    info.Name = file.Name;
                    info.Path = file.FullName;
                    info.NameWOSuffix = nameWOSuffix;
                    info.Prefix = prefix;
                    info.NameWOPrefix = module;
                }
                xlsxFiles.Add(info);
            }
            return xlsxFiles;
        }
        static DataTable GetExcelToDataTableBySheet(string FileFullPath, string SheetName)
        {
            //此连接可以操作.xls与.xlsx文件
            string strConn = "Provider=Microsoft.Ace.OleDb.12.0;" + "data source=" + FileFullPath + ";Extended Properties='Excel 12.0; HDR=NO; IMEX=1'";

            OleDbConnection conn = new OleDbConnection(strConn);

            conn.Open();

            DataSet ds = new DataSet();

            OleDbDataAdapter odda = new OleDbDataAdapter(string.Format("SELECT * FROM [{0}]", SheetName), conn);

            //OleDbDataAdapter odda = new OleDbDataAdapter(string.Format("select * from [Sheet1$]", conn),conn);             　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　

            odda.Fill(ds, SheetName);

            conn.Close();

            return ds.Tables[0];
        }

        static string[] GetLanguages(DataTable dt)
        {
            int colCount = AppValues.ColumnCount;
            string[] languages = new string[colCount];
            for (int col = 1; col <= colCount; col++) //[0][0] is meaningless, so count col at 1
            {
                string lang_short = dt.Rows[0][col].ToString();
                languages[col - 1] = AppValues.Languages[lang_short];
            }
            return languages;
        }

        /// <summary>
        /// Classify fields by languages
        /// </summary>
        /// <returns>  Dictionary[key: language；Field[]: text field array]  </returns>
        static Dictionary<string, Field[]> GetLanguageData(string[] languages, DataTable dt)
        {
            int rowCount = dt.Rows.Count;
            Dictionary<string, Field[]> data = new Dictionary<string, Field[]>();
            foreach (string language in languages)
            {
                data[language] = new Field[rowCount - 1];
            }

            DataRowCollection sheet = dt.Rows;
            for (int row = 1; row < rowCount; row++)
            {
                string fieldName = sheet[row][0].ToString();
                for (int col = 1; col <= AppValues.ColumnCount; col++)
                {
                    string language = languages[col - 1];
                    string value = sheet[row][col].ToString();
                    value = value.Replace("\n", "\\n");
                    if (!String.Equals(language, "Chinese")) //对非中文语言中的全角双引号替换成半角双引号
                    {
                        value = value.Replace('“', '"');
                        value = value.Replace('”', '"');
                    }
                    value = "'" + value + "'";
                    data[language][row - 1] = new Field()
                    {
                        Name = fieldName,
                        Value = value,
                    };
                }
            }

            return data;
        }

        static void CheckAndCreateLanguageFolder(string[] languages)
        {
            foreach (string language in languages)
            {
                string langPath = AppValues.OutputPath + language;
                if (!Directory.Exists(langPath))
                {
                    Directory.CreateDirectory(langPath);
                }
            }

        }

        static void WriteLuaFiles(XlsxFileInfo info, Dictionary<string, string> languageLuaContent)
        {
            Console.WriteLine("Start writing lua files...");
            foreach (KeyValuePair<string, string> pairs in languageLuaContent)
            {
                string language = pairs.Key;
                Console.WriteLine("Writing " + language + " lua file...");
                string langPath = 
                    AppValues.OutputPath + language + "/" + info.Prefix + language + "_" + info.NameWOPrefix + AppValues.Lua;
                using (StreamWriter sw = new StreamWriter(langPath))
                {
                    sw.Write(pairs.Value);
                    sw.Flush();
                    sw.Close();
                }
            }
        }
    }
}
