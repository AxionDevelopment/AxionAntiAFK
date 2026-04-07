-- Axion Anti-AFK Configuration
-- Author: SpunkyDunkie | AxionDevelopment
-- GitHub: https://github.com/AxionDevelopment/AxionAntiAFK
-- 
-- NOTICE:
-- To use AxionNotifications for warnings, make sure to have the AxionNotifications resource installed and running on your server.
-- You can get it here: https://github.com/AxionDevelopment/AxionNotifications

AxionAntiAFKConfig = {}



-- Time (in seconds) before the player is warned about being AFK
AxionAntiAFKConfig.AFK_WARNING_TIME = 300 -- 5 minute default (1 minute = 60)

-- Time (in seconds) before the player is kicked for being AFK
AxionAntiAFKConfig.AFK_KICK_TIME = 450 -- 7.5 minute default (1 minute = 60)

-- Type of warning message to send to the player when they reach the warning threshold
-- WARNING_MESSAGE_TYPE options:
-- "axionnotification" - Warning will be sent as an Axion Notification (requires AxionNotifications resource) (default)
-- "chat" - Warning will be sent as a chat message
AxionAntiAFKConfig.WARNING_MESSAGE_TYPE = "chat"

-- Custom warning message (optional, leave empty for default)
-- DEFAULT: "You will be kicked in {timeLeft} minutes for being AFK."
-- PLACEHOLDERS: You can use the following placeholders in the text:
-- {timeLeft} - The time left before being kicked in minutes
AxionAntiAFKConfig.WARNING_MESSAGE = ""

-- Custom kick message (optional, leave empty for default)
-- DEFAULT: "You were kicked for being AFK too long."
AxionAntiAFKConfig.KICK_MESSAGE = ""