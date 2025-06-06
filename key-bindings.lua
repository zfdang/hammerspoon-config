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
local volume = require('volume-management')
local volumeHyperKey = {'cmd', 'ctrl'}
hk.bind(volumeHyperKey, 'Down', changeVolume(-5))
hk.bind(volumeHyperKey, 'Up', changeVolume(5))

-- bindings for brightness management
local volume = require('brightness-management')
local volumeHyperKey = {'ctrl', 'alt'}
hk.bind(volumeHyperKey, 'Down', changeBrightness(-5))
hk.bind(volumeHyperKey, 'Up', changeBrightness(5))

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
    -- b = 'Revered for battery status',
    c = 'Google Chrome',
    d = 'Dictionary',
    e = 'Microsoft Excel',
    f = 'Path Finder',
    -- g = 'App-Does-Not-Exist',
    -- h = 'App-Does-Not-Exist',
    i = 'iTerm',
    -- j = 'App-Does-Not-Exist',
    -- k = 'App-Does-Not-Exist',
    -- l = 'Reserved for Lock screen',
    m = 'Thunderbird.app',
    n = 'Microsoft OneNote',
    o = 'OmniFocus',
    p = 'Microsoft PowerPoint',
    -- q = 'App-Does-Not-Exist',
    r = 'Foxit PDF Reader',
    -- s = 'App-Does-Not-Exist',
    t = 'Thunder.app',
    -- u = 'App-Does-Not-Exist',
    v = 'Visual Studio Code',
    w = 'Microsoft Word',
    x = 'Android Studio.app',
    -- y = 'App-Does-Not-Exist',
    z = 'Final Cut Pro',
}

for key, app in pairs(key2App) do
    hk.bind(amHyperKey, key, function() launch_or_toggle_application(app) end)
end

