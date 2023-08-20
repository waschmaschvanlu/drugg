

MySQL.ready(function()

 local query4 = [[
    CREATE TABLE IF NOT EXISTS `mypdrugs` (
        `id` INT NOT NULL AUTO_INCREMENT,
        `identifier` VARCHAR(60) NOT NULL,
        `x` INT NOT NULL,
        `y` INT NOT NULL,
        `z` INT NOT NULL,
        `growth` INT NOT NULL,
        PRIMARY KEY (`id`) USING BTREE
    );    
 ]]
    exports.oxmysql:execute(query4)
end)

RegisterNetEvent('MyDrugsP:SaveProp')
AddEventHandler('MyDrugsP:SaveProp', function( prop, model, x, y, z)
    print("hi i got the prop") 
    print(prop)
    print(model)
    print(x)
    print(y)
    print(z)

    local xPlayer = ESX.GetPlayerFromId(source)
    identifier = xPlayer.getIdentifier()
local query = [[

    INSERT INTO mypdrugs (identifier, x, y, z, growth) VALUES (@identifier, @x, @y, @z, @growth);
    ]]
    exports.oxmysql:execute(query, { ['@identifier'] = identifier, ['@x'] = x, ['@y'] = y, ['@z'] = z, ['@growth'] = 0})
end)


lib.callback.register('myDrugsP:GetPlants', function(source)
    print("ah")
    local xPlayer = ESX.GetPlayerFromId(source)
    identifier = xPlayer.getIdentifier()
    local result = MySQL.query.await('SELECT * FROM mypdrugs', {})
    print(json.encode(result))
    return result
end)

