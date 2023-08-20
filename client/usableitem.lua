

RegisterNetEvent('myPDrug:PlaceSeed')
AddEventHandler('myPDrug:PlaceSeed', function(job)
   
    if lib.table.contains(Config.Policejobs, job) then
        Config.Function.Notify(locale("cop"))
    else
        enterbuildingmode()
    end
end)


RegisterCommand('testy', function(source, args, rawCommand)
    print("ats")
    LeaveCursorMode()
    TriggerEvent("myPDrug:PlaceSeed", "unemployed")
end)