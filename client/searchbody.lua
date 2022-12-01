RegisterCommand("searchbody", function(source, args, raw)
    local closestPlayer, closestPlayerDistance = ESX.Game.GetClosestPlayer()
    if closestPlayer == -1 or closestPlayerDistance > 3.0 then
        exports['okokNotify']:Alert('ISRP Body Searching', 'There is no player nearby', 3000, 'error')
    else
        if IsPedDeadOrDying(GetPlayerPed(closestPlayer)) then
            TriggerServerEvent("inventory:server:OpenInventory", "otherplayer", GetPlayerServerId(closestPlayer))
        else
            exports['okokNotify']:Alert('ISRP Body Searching', 'Player is not dead!', 3000, 'error')
        end
    end
end)