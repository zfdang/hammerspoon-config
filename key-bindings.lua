-- define all key bindings here
local hk = require "hs.hotkey"

-- for all key codes, find here
-- https://github.com/Hammerspoon/hammerspoon/issues/1037

-- lock screen
local hyperKey = {'ctrl', 'alt', 'cmd', 'shift'}
hk.bind(hyperKey, 'l', function() hs.caffeinate.lockScreen() end)

-- Show battery status
hs.hotkey.bind(hyperKey, 'b', function()
  local seconds = 1
  local message = "Battery: " .. hs.battery.percentage() .. "%"
  hs.alert.show(message, seconds)
end)


-- bindings for volume management
local volume = require('volume')
local volumeHyperKey = {'cmd'}
hk.bind(volumeHyperKey, 'Down', changeVolume(-10))
hk.bind(volumeHyperKey, 'Up', changeVolume(10))


--- Bind hotkey for window management.
local wm = require('window-management')
local wmHyperKey = {'ctrl', 'alt', 'cmd', 'shift'}
hk.bind(wmHyperKey, "[", wm.throwLeft)
hk.bind(wmHyperKey, "]", wm.throwRight)
hk.bind(wmHyperKey, 'return', wm.maximizeWindow)
hk.bind(wmHyperKey, 'left', wm.leftHalf)
hk.bind(wmHyperKey, 'right', wm.rightHalf)
hk.bind(wmHyperKey, 'up', wm.topHalf)
hk.bind(wmHyperKey, 'down', wm.bottomHalf)


-- Bind hotkey for app management
local app = require('app-management')
local amHyperKey = {'ctrl', 'alt', 'cmd', 'shift'}
local key2App = {
    a = 'Sublime Text',
    c = 'Google Chrome',
    d = 'Dictionary',
    e = 'Microsoft Excel',
    f = 'Path Finder',
    g = 'Mail',
    i = 'iTerm',
    j = 'Google Chrome',
    k = 'Foxmail',
    m = 'MacDown',
    n = 'Microsoft OneNote',
    o = 'Microsoft Outlook',
    p = 'Microsoft PowerPoint',
    r = 'Foxit PDF Reader',
    s = 'Slack',
    t = 'Thunder',
    w = 'Microsoft Word',
    x = 'Thunder-AA',
}

for key, app in pairs(key2App) do
    hk.bind(amHyperKey, key, function() launch_or_toggle_application(app) end)
end

