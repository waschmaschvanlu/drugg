function GetCursorScreenPosition()
	if (not IsControlEnabled(0, 239)) then
		EnableControlAction(0, 239, true)
	end
	if (not IsControlEnabled(0, 240)) then
		EnableControlAction(0, 240, true)
	end

	return vector2(GetControlNormal(0, 239), GetControlNormal(0, 240))
end

function ScreenToWorld(screenPosition, maxDistance)
	local pos = GetGameplayCamCoord()
	local rot = GetGameplayCamRot(0)
	local fov = GetGameplayCamFov()
	local cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", pos.x, pos.y, pos.z, rot.x, rot.y, rot.z, fov, 0, 2)
	local camRight, camForward, camUp, camPos = GetCamMatrix(cam)
	DestroyCam(cam, true)

	screenPosition = vector2(screenPosition.x - 0.5, screenPosition.y - 0.5) * 2.0

	local fovRadians = DegreesToRadians(fov)
	local to = camPos + camForward + (camRight * screenPosition.x * fovRadians * GetAspectRatio(false) * 0.534375) - (camUp * screenPosition.y * fovRadians * 0.534375)

	local direction = (to - camPos) * maxDistance
	local endPoint = camPos + direction

	local rayHandle = StartShapeTestRay(camPos.x, camPos.y, camPos.z, endPoint.x, endPoint.y, endPoint.z, -1, nil, 0)
	local _, hit, worldPosition, normalDirection, entity = GetShapeTestResult(rayHandle)

	if (hit == 1) then
		return true, worldPosition, normalDirection, entity
	else
		return false, vector3(0, 0, 0), vector3(0, 0, 0), nil
	end
end

function DegreesToRadians(degrees)
	return (degrees * 3.14) / 180.0
end

function enterbuildingmode()
    whileinbuildingmode(true)
    EnterCursorMode()
end

function exitbuildingmode()
    LeaveCursorMode()
end

function whileinbuildingmode(on)
    onScreen2, worldPosition2, normalDirection2, entity2 = ScreenToWorld(GetCursorScreenPosition(), 100.0)
    model = GetHashKey(Config.PlantModel)
    prop = CreateObject(model, worldPosition2, 0, true, true, true)
    SetEntityAlpha(prop, 100)
   -- prop = CreateObject(model, x, y,  0, true, true, true)
    Citizen.CreateThread(function()
        while on do
          
            Citizen.Wait(1)
            onScreen, worldPosition, normalDirection, entity = ScreenToWorld(GetCursorScreenPosition(), 100.0)
        if onScreen then
            print("setting prop to coords", worldPosition.x, worldPosition.y, worldPosition.z)
            SetEntityCoords(prop, worldPosition.x, worldPosition.y, worldPosition.z, 0, 0, 0, true)
        else
            if prop ~= nil then
                DeleteEntity(prop)
                prop = nil
            end
        end

        if IsControlJustReleased(0,24) then
            SetEntityAlpha(prop, 255)
            FreezeEntityPosition(prop, true)
            SetEntityCollision(prop, true, true)
            SetEntityAsMissionEntity(prop, true, true)
            SetEntityAsNoLongerNeeded(prop)
            SetModelAsNoLongerNeeded(model)
            print("saving prop..")
            saveprop(prop, model, worldPosition.x, worldPosition.y, worldPosition.z)
            print("at")
            LeaveCursorMode()
            break
        end
            --print( x, y, GetGroundZAndNormalFor_3dCoord(x,y,0).z)
    if IsControlJustReleased(0,177) or IsControlJustReleased(0,20) or IsPauseMenuActive() or IsPlayerDead(PlayerPedId()) then
        --print("disabling..")
        LeaveCursorMode()
       exitbuildingmode()
        break
        end

    end
    end)
end

AddEventHandler('onResourceStop', function(resourceName)
  exitbuildingmode()
  if prop ~= nil then
    DeleteEntity(prop)
    prop = nil
end
  end)
  
  function saveprop(prop, model, x, y, z)
    TriggerServerEvent("MyDrugsP:SaveProp" , prop, model, x, y, z)
  end