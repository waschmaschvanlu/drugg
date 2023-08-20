Config = {}
Config.Debug = false
Config.Itemname = "diamond"
Config.Policejobs = {"police","sheriff","highway","ambulance","ambulance"}
Config.Locale = "en"
Config.PlantModel = "prop_plant_cane_01b"
Config.Translation = {
    ['de'] = {
        ['cop'] = "Du kannst das nicht machen, du bist ein Cop!"
    },
    ['en'] = {
        ['cop'] = "You can't do this, you are a cop!",
        ['menuname'] = "Place a Seed",
    }
}

Config.Function = {
    Notify = function(msg)
        -- insert your notify here
        ESX.ShowNotification(msg)
    end
}