

local plants = lib.callback.await('myDrugsP:GetPlants', false)

if plants then
    for k,v in pairs(plants) do
        function onEnter()
            model = GetHashKey(Config.PlantModel)
            prop = CreateObject(model, v.x, v.y, v.z, 0, true, true, true)
        
            SetEntityCoords(prop, v.x, v.y, v.z, 0, 0, 0, true)
            print("setting prop to coords", v.x, v.y, v.z)
        end
        function inside()

            distance = #(GetEntityCoords(PlayerPedId()) - vec3(v.x, v.y, v.z))
            
            if distance < 5 then
                ESX.ShowHelpNotification("E drücken :(")
            end
    end
        local loadbox = lib.zones.box({
            coords = vec3(v.x, v.y, v.z),
            size = vec3(50, 50, 50),
            rotation = 45,
            debug = false,
            inside = inside,
            onEnter = onEnter,
            onExit = onExit
        })

        


    end
end