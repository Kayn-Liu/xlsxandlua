--region------------------ some localized variables ------------------
local print = print;
local tostring = tostring;
local require = require;
local strFind = string.find;
local strSub = string.sub;
local strGsub = string.gsub;
local tblConcat = table.concat;
local tblInsert = table.insert;
local tblSort = table.sort;
--endregion-------------------------------------------------

local lfs = require ("lfs")
local sourcePath = "Input/";
local rootPath = lfs.currentdir().."/"..sourcePath;
local outputPath = "Output";
local Workbook = require("xlsxwriter.workbook");

local LanguageEnum = {
    Chinese = "CN",
    English = "EN",
    Thai = "TH",
    Vietnamese = "VN",
    Indonesian = "IN",
}

--region------------------  local functions ------------------
local function printTable(t)
    for key, value in pairs(t) do
        print(tostring(key).." : "..tostring(value));
    end
end 

local function checkIsLua(fileName)
    --TODO need to optimize lua file check, to rule out .lua.meta sort of files
    return strFind(fileName, ".lua");
end

local keyBuilder = { [1] = "", [2] = "-", [3] = ""};
local function buildPrefixKey(prefix, key)
    keyBuilder[1] = prefix;
    keyBuilder[3] = key;
    return tblConcat(keyBuilder);
end 

local function unfoldTable(buffer, tableName, tableContent, prefix)
    for key, value in pairs(tableContent) do
        if type(value) == "table" then
            if prefix == "" then
                unfoldTable(buffer, tableName, value, key);
            else
                local subPrefix = buildPrefixKey(prefix, key);
                unfoldTable(buffer, tableName, value, subPrefix);
            end
        else
            if prefix ~= "" then
                local prefixKey = buildPrefixKey(prefix, key);
                tblInsert(buffer, {prefixKey, value});
            else
                tblInsert(buffer, {key, value});
            end
        end
    end
end

local function cleanUpName(strList, name)
    for _, str in ipairs(strList) do
        if string.find(name, str) then
            return string.gsub(name, str, "");
        end
    end
    return name;
end

local function sortLuaData(data)
    local array = {};
    local map = {};
    for key, value in pairs(data) do
        if type(key) == "number" then
            tblInsert(array, key);
        else
            tblInsert(map, key);
        end
    end
    tblSort(array);
    tblSort(map);
    return {array = array, map = map, data = data};
end

local csvBuilder = {[1] = "", [2] = ""};
local function parseLuaToCSV(path, header, dataStruct)
    local workbook = Workbook:new(path);
    local worksheet = workbook:add_worksheet("Language");
    local wrapFormat = workbook:add_format();
    wrapFormat:set_text_wrap();
    wrapFormat:set_align("vcenter");

    local row = 0;
    --first write in the title line
    for index, title in ipairs(header) do
         --col starts from 1, but xlsx is 0 indexed, so col-1;
        local col = index - 1;
        worksheet:write(row, col, title);
        worksheet:set_column(col, col, col == 0 and 20 or 30);
    end
    row = row + 1;
    
    local indexArray = dataStruct.array;
    local keyArray = dataStruct.map;
    local dataPool = dataStruct.data;

    --traverse indexArray to fetch number index
    --then use that index to fetch data from dataPool;
    for _, index in ipairs(indexArray) do
        worksheet:write(row, 0, index, wrapFormat);
        local valueArray = dataPool[index];
        for col, value in ipairs(valueArray) do
            worksheet:write(row, col, value, wrapFormat);
        end
        row = row + 1;
    end

    --traverse keyArray and write the data
    for _, key in ipairs(keyArray) do
        worksheet:write(row, 0, key, wrapFormat);
        local valueArray = dataPool[key];
        for col, value in ipairs(valueArray) do
            worksheet:write(row, col, value, wrapFormat);
        end
        row = row + 1;
    end
    
    workbook:close();
end
--endregion-------------------------------------------------

--region------------------  Module functions ------------------
local M = {};
local langList = {};

---key: modual; value : <field, language1, langauge2, ...>;
local luaDataMap = {}; 

function M.CountLanguages()
    for entry in lfs.dir(rootPath) do
        if entry ~= '.' and entry ~= ".." then --skip lfs default header
            tblInsert(langList, entry);
        end
    end
end

function M.FetchLuaData(index, language)
    local langPath = rootPath..language;
    for entry in lfs.dir(langPath) do
        if entry ~= '.' and entry ~= ".." then --skip lfs default header
            local suffixIndex = checkIsLua(entry);
            if suffixIndex then
                local nameWOSuffix = strSub(entry, 0, suffixIndex-1);
                -- print(entry.." : "..tostring(nameWOSuffix));
                local luaPath = sourcePath..language.."/"..nameWOSuffix;
                local luaTable = require(luaPath);
                local buffer = {};
                unfoldTable(buffer, nameWOSuffix, luaTable, "");
                M.CacheData(nameWOSuffix, index, buffer);
            end 
        end
    end
end

function M.CacheData(moduleName, languageIndex, data)
    moduleName = cleanUpName(langList, moduleName);
    if not luaDataMap[moduleName] then
        luaDataMap[moduleName] = {};
    end

    local moduleTable = luaDataMap[moduleName];
    for _, subTable in ipairs(data) do
        local fieldName = subTable[1];
        local fieldValue = subTable[2];
        if not moduleTable[fieldName] then
            moduleTable[fieldName] = {};
        end
        moduleTable[fieldName][languageIndex] = fieldValue;
    end
end

function M.LuaDataToCSV()
    local header = {"field", };
    for _, language in ipairs(langList) do
        tblInsert(header, LanguageEnum[language]);
    end

    for module, dataStruct in pairs(luaDataMap) do
        print("Parsing module: "..module);
        local path = outputPath.."/"..module..".xlsx";
        parseLuaToCSV(path, header, dataStruct);
    end
end

function M.Start()
    M.CountLanguages();
    for index, language in pairs(langList) do
        M.FetchLuaData(index, language);
    end

    --sort data into array and map
    for module, data in pairs(luaDataMap) do
        luaDataMap[module] = sortLuaData(luaDataMap[module]);
    end

    --delete output folder first
    local fullOutputPath = lfs.currentdir().."/"..outputPath;
    local success = lfs.rmdir(fullOutputPath);
    print("Remove output folder: "..tostring(success));
    lfs.mkdir(fullOutputPath);
    print("Remake directory: "..fullOutputPath);

    M.LuaDataToCSV();
end
--endregion-------------------------------------------------

return M;