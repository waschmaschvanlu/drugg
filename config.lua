Config = {}
Config.Debug = true
Config.Heistsnpc = { range = 20, coords = vector4(171.2233, -3185.7825, 4.8638, 86.9678), npcmodel = "u_m_y_juggernaut_01", idleanimation = "WORLD_HUMAN_GUARD_STAND", blip = {enabled = true, title="Military-Heists", colour=2, id=84, } }
Config.Locale = "en"
Config.CampSettings = {easy = {range = 20, amount = 4, weapon="WEAPON_PISTOL", npc="a_m_m_mexcntry_01", min= 200, max = 900} }
Config.Camps = {vector3(57.8824, -2690.3042, 7.4655) , vector3(-54.9404, -2191.6292, 13.8495), vector3(-498.9451, -2184.4246, 7.4764)}
Config.Translation = {
    ['de'] = {
         ["abovenpc"] = "~g~[E]~w~ Mit dem Heist-NPC sprechen",
         ["alreadydoingheist"] = "Du bist bereits in einem Heist, beende diesen zuerst!",
         ["heistmenu"] = "Heist-Missionen",
         ["camps"] = "Outrider-Camps",
         ["easy"] = "~g~Einfach",
         ["medium"] ="~y~Mittel",
         ["hard"] = "~r~Schwer",
         ["notarmed"] = "Du hast nicht mal eine Waffe? haha.. zeig mir deine Waffe und wir können weiter reden",
    },
    ['en'] = {
       ["abovenpc"] = "~g~[E]~w~ Talk to the Heist NPC",
       ["alreadydoingheist"] = "You are already in a heist, complete that one first!",
       ["heistmenu"] = "Heist-Missions",
       ["camps"] = "Outrider-Camps",
       ["easy"] = "~g~Easy",
       ["medium"] ="~y~Medium",
       ["hard"] = "~r~Hard",
       ["notarmed"] = "You dont even have a weapon? haha.. show me your weapon and we can continue talking",
       ["youdiditc"] = "You Succesfully killed these people! thank you, here is your reward",
       ["reward"] = "You Sucessfully got the reward, thank you for your help",
       ["$"] = "$",
       ["youfailed"] = "You Failed! all the people left!"
    }
}

Config.Function = {
    Notify = function(msg)
        -- insert your notify here
        ESX.ShowNotification(msg)
    end
}