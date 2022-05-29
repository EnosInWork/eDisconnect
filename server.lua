ESX = nil

TriggerEvent(Config.esxGet, function(obj) ESX = obj end)

local cached_players = {}

AddEventHandler('playerDropped', function (reason)
    local pCoords = GetEntityCoords(GetPlayerPed(source))
    cached_players[source] = {res = reason, date = os.date(" %d/%m %X"), coords = pCoords}
    TriggerClientEvent("utils:playerDisconnect", -1, source, {res = reason, date = os.date(" %d/%m %X"), pos = pCoords})
end)

if Config.TestCommande then 
    RegisterCommand(Config.nameCmd, function(source, args, rawCommand)
        local pCoords = GetEntityCoords(GetPlayerPed(source))
        cached_players[source] = {res = "Exemple de message deconnexion", date = os.date(" %d/%m %X"), coords = pCoords}
        TriggerClientEvent("utils:playerDisconnect", -1, source, {res = "Exemple de deconnexion", date = os.date(" %d/%m %X"), pos = pCoords})
    end, false)
end
