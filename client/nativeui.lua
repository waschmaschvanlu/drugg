_menuPool = NativeUI.CreatePool()

 Citizen.CreateThread(function()
     while true do
         Citizen.Wait(1)
        if _menuPool:IsAnyMenuOpen() then
         _menuPool:ProcessMenus()
        else
         Citizen.Wait(150) -- this small line
        end
     end
end)

function buildingmode()
    EnterCursorMode()
end
function openmenu()
   mainmenu = NativeUI.CreateMenu(locale("menuname"), "")
    print("openmenu")
  _menuPool:Add(mainmenu)
  _menuPool:RefreshIndex()
  _menuPool:MouseControlsEnabled(false)
  _menuPool:MouseEdgeEnabled(false)
  _menuPool:ControlDisablingEnabled(false)
  mainmenu:Visible(true)
end