if (GetResourceState("es_extended") == "started") then
    if (exports["es_extended"] and exports["es_extended"].getSharedObject) then
        ESX = exports["es_extended"]:getSharedObject()
    else
        TriggerEvent("esx:getSharedObject", function(obj) ESX = obj end)
    end
end

ESX.RegisterUsableItem(Config.Itemname, function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    job = xPlayer.job.name
    print("what")
    TriggerClientEvent("myPDrug:PlaceSeed", source, job)
end)
