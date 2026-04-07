RegisterNetEvent('axionantiafk:kick')
AddEventHandler('axionantiafk:kick', function()
    local src = source
    local kickMessage = ""

    if AxionAntiAFKConfig.KICK_MESSAGE == "" then
        kickMessage = "You were kicked for being AFK too long."
    else
        kickMessage = AxionAntiAFKConfig.KICK_MESSAGE
    end

    DropPlayer(src, kickMessage)
end)