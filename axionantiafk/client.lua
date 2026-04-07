local lastActivity = GetGameTimer()
local isWarned = false
local lastPosition = nil
local lastCamRot = nil

-- Activity detection (movement + camera + input)
CreateThread(function()
    while true do
        Wait(1000)

        local ped = PlayerPedId()
        local currentPos = GetEntityCoords(ped)
        local currentCam = GetGameplayCamRot(0)

        if not lastPosition then lastPosition = currentPos end
        if not lastCamRot then lastCamRot = currentCam end

        local moved = #(currentPos - lastPosition) > 0.1

        local camMoved = math.abs(currentCam.x - lastCamRot.x) > 0.5 or
                         math.abs(currentCam.y - lastCamRot.y) > 0.5 or
                         math.abs(currentCam.z - lastCamRot.z) > 0.5

        local keyPressed = IsControlPressed(0, 0)

        if moved or camMoved or keyPressed then
            lastActivity = GetGameTimer()
            isWarned = false
        end

        lastPosition = currentPos
        lastCamRot = currentCam
    end
end)

CreateThread(function()
    while true do
        Wait(2000)

        local idleTime = (GetGameTimer() - lastActivity) / 1000

        if idleTime >= AxionAntiAFKConfig.AFK_WARNING_TIME and not isWarned then
            isWarned = true

            local timeLeft = (AxionAntiAFKConfig.AFK_KICK_TIME - idleTime)
            local minutes = math.floor((timeLeft / 60) * 2 + 0.5) / 2

            local warningMessage = ""

            if AxionAntiAFKConfig.WARNING_MESSAGE == "" then
                warningMessage = "You will be kicked in " .. minutes .. " minutes for being AFK."
            else
                warningMessage = AxionAntiAFKConfig.WARNING_MESSAGE:gsub("{timeLeft}", minutes)
            end

            if AxionAntiAFKConfig.WARNING_MESSAGE_TYPE == "chat" then
                TriggerEvent('chat:addMessage', {
                    color = {255, 0, 0},
                    multiline = true,
                    args = {"[AFK Warning]", warningMessage}
                })
            else
                exports['AxionNotifications']:AxionNotify(warningMessage, "error", minutes * 60000)
            end
        end

        if idleTime >= AxionAntiAFKConfig.AFK_KICK_TIME then
            TriggerServerEvent('axionantiafk:kick')
        end
    end
end)