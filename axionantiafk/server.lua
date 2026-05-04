RegisterNetEvent('axionantiafk:kick')
AddEventHandler('axionantiafk:kick', function()
    local src = source
    local kickMessage = ""

    if AxionAntiAFKConfig.KickMessage == "" then
        kickMessage = "You were kicked for being AFK too long."
    else
        kickMessage = AxionAntiAFKConfig.KickMessage
    end

    DropPlayer(src, kickMessage)
end)