ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj
end)

RegisterServerEvent('esx_gym:hireBmx')
AddEventHandler('esx_gym:hireBmx', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    if(xPlayer.getMoney() >= 250) then
        xPlayer.removeMoney(250)

        notification("You hired a ~g~BMX")
    else
        notification("You stole the bike because you didn't have enough ~r~money")
    end
end)

RegisterServerEvent('esx_gym:hireCruiser')
AddEventHandler('esx_gym:hireCruiser', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    if(xPlayer.getMoney() >= 300) then
        xPlayer.removeMoney(300)

        notification("You hired a ~g~CRUISER")
    else
        notification("You stole the bike because you didn't have enough ~r~money")
    end
end)

RegisterServerEvent('esx_gym:hireFixter')
AddEventHandler('esx_gym:hireFixter', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    if(xPlayer.getMoney() >= 329) then
        xPlayer.removeMoney(329)

        notification("You hired a ~g~FIXTER")
    else
        notification("You stole the bike because you didn't have enough ~r~money")
    end
end)

RegisterServerEvent('esx_gym:hireScorcher')
AddEventHandler('esx_gym:hireScorcher', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    if(xPlayer.getMoney() >= 400) then
        xPlayer.removeMoney(400)

        notification("You hired a ~g~SCORCHER")
    else
        notification("You stole the bike because you didn't have enough ~r~money")
    end
end)

RegisterServerEvent('esx_gym:checkChip')
AddEventHandler('esx_gym:checkChip', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local oneQuantity = xPlayer.getInventoryItem('gym_membership').count

    if oneQuantity > 0 then
        TriggerClientEvent('esx_gym:trueMembership', source) -- true
    else
        TriggerClientEvent('esx_gym:falseMembership', source) -- false
    end
end)

RegisterServerEvent('esx_gym:buyBandage')
AddEventHandler('esx_gym:buyBandage', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    if(xPlayer.getMoney() >= 50) then
        xPlayer.removeMoney(50)

        xPlayer.addInventoryItem('sport_bandage', 1)
        notification("You purchased a ~g~Sport bandage")
    else
        notification("You do not have enough ~r~money")
    end
end)

RegisterServerEvent('esx_gym:buyMembership')
AddEventHandler('esx_gym:buyMembership', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    if(xPlayer.getMoney() >= 800) then
        xPlayer.removeMoney(800)

        xPlayer.addInventoryItem('gym_membership', 1)
        notification("You purchased a ~g~Gym Membership")

        TriggerClientEvent('esx_gym:trueMembership', source) -- true
    else
        notification("You do not have enough ~r~money")
    end
end)


RegisterServerEvent('esx_gym:buyProteinshake')
AddEventHandler('esx_gym:buyProteinshake', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    if(xPlayer.getMoney() >= 6) then
        xPlayer.removeMoney(6)

        xPlayer.addInventoryItem('protein_shake', 1)

        notification("You purchased a ~g~Protein shake")
    else
        notification("You do not have enough ~r~money")
    end
end)

RegisterServerEvent('esx_gym:buyWater')
AddEventHandler('esx_gym:buyWater', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    if(xPlayer.getMoney() >= 1) then
        xPlayer.removeMoney(1)

        xPlayer.addInventoryItem('water', 1)

        notification("You purchased a bottle of ~g~Water")
    else
        notification("You do not have enough ~r~money")
    end
end)

RegisterServerEvent('esx_gym:buySportlunch')
AddEventHandler('esx_gym:buySportlunch', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    if(xPlayer.getMoney() >= 2) then
        xPlayer.removeMoney(2)

        xPlayer.addInventoryItem('sportlunch', 1)

        notification("You purchased a ~g~Sportlunch")
    else
        notification("You do not have enough ~r~money")
    end
end)

RegisterServerEvent('esx_gym:buyPowerade')
AddEventHandler('esx_gym:buyPowerade', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    if(xPlayer.getMoney() >= 4) then
        xPlayer.removeMoney(4)

        xPlayer.addInventoryItem('powerade', 1)

        notification("You purchased a ~g~Powerade")
    else
        notification("You do not have enough ~r~money")
    end
end)

-- Usable items

ESX.RegisterUsableItem('powerade', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('powerade', 1)
	TriggerClientEvent('esx_status:add', source, 'thirst', 700000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, 'You drank a ~g~powerade')
end)

ESX.RegisterUsableItem('protein_shake', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('protein_shake', 1)
	TriggerClientEvent('esx_status:add', source, 'thirst', 350000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, 'You drank a ~g~protein shake')
end)

ESX.RegisterUsableItem('sport_bandage', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('sport_bandage', 1)
    TriggerClientEvent('esx_gym:useBandage', source)
end)

ESX.RegisterUsableItem('sportlunch', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('sportlunch', 1)
	TriggerClientEvent('esx_status:add', source, 'hunger', 350000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'You ate a ~g~sportlunch')
end)

-- FUNCTIONS IN THE FUTURE (COMING SOON...)

--RegisterServerEvent('esx_gym:trainArms')
--AddEventHandler('esx_gym:trainArms', function()

--end)

--RegisterServerEvent('esx_gym:trainChins')
--AddEventHandler('esx_gym:trainArms', function()

--end)

--RegisterServerEvent('esx_gym:trainPushups')
--AddEventHandler('esx_gym:trainPushups', function()

--end)

--RegisterServerEvent('esx_gym:trainYoga')
--AddEventHandler('esx_gym:trainYoga', function()

--end)

--RegisterServerEvent('esx_gym:trainSitups')
--AddEventHandler('esx_gym:trainSitups', function()

--end)

function notification(text)
    TriggerClientEvent('esx:showNotification', source, text)
end
