# XlsxAndLua

This project contains two sub-projects that combined as a set of tool to help parse certain format of xlsx files to lua and back.

###  [LuaToXlsx](/LuaToXlsx) 

It is written in lua and more detailed information can be found in **[here](/LuaToXlsx/README.md)**.


### [XlsxToLua](/XlsxToLua)

It is a C# project written in .net 3.1 and for more information, click **[here](/XlsxToLua/README.md)**.

# Xlsx format:
![XlsxFormat](/Images/XlsxFormat.png)

- The first row is to define languages that are involved

- The first column defines field names that will be used as variable keys in the output lua table.

- Note that field names have '-' means they are originated from a table structure in lua. Say ChatText-1, ChatText-2, ... are representing the following structure: 

```
    local ChatText = {
        1 = "blah",
        2 = "blah2",
        --... so on and so forth
    }
```

# Output structure:



## Supported Languages and Enums:

- Languages define in the first row need to be within the following enums as is:

```
    local LanguageEnum = {
        Chinese = "CN",
        English = "EN",
        Thai = "TH",
        Vietnamese = "VN",
        Indonesian = "IN",
    }
```

- If more languages were needed, please review the codes and add the languages to the enums in [LuaToXlsx.lua](/LuaToXlsx/LuaToXlsx.lua) and [XlsxToLua-AppValues.cs](/XlsxToLua/AppValues.cs).

## Caution

It is very raw and strong formated project that were created to help with my current project to deal with language configs. So it, most likely, will not be a very convenient tool for you to use, unless you happen to need to deal with the same style of configs. Nonetheless, I upload this project for future references and anyone who might need it.

