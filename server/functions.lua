if (GetResourceState("es_extended") == "started") then
    if (exports["es_extended"] and exports["es_extended"].getSharedObject) then
        ESX = exports["es_extended"]:getSharedObject()
    else
        TriggerEvent("esx:getSharedObject", function(obj) ESX = obj end)
    end
end

function debug2(msg)
    if Config.Debug then
        local lineInfo = debug.getinfo(2, "Sl")
        local lineStr = ""
        if lineInfo then
            lineStr = " (" .. lineInfo.source .. ":" .. lineInfo.currentline .. ")"
        end

        if msg == nil then
            print("[Ludaro|Debug]" .. lineStr .. ": nil")
        elseif type(msg) == "table" then
            print("[Ludaro|Debug]" .. lineStr .. ":")
            print(ESX.DumpTable(msg))
        else
            print("[Ludaro|Debug]" .. lineStr .. ": " .. tostring(msg))
        end
    end
end

