-- define all key bindings here
local hk = require "hs.hotkey"

-- for all key codes, find here
-- https://github.com/Hammerspoon/hammerspoon/issues/1037

-- bindings for volume management
local volume = require('volume')
hk.bind({'cmd'}, 'Down', changeVolume(-5))
hk.bind({'cmd'}, 'Up', changeVolume(5))


--- Bind hotkey for window management.
local wm = require('window-management')
hk.bind({"ctrl", "alt", "cmd"}, "[", wm.throwLeft)
hk.bind({"ctrl", "alt", "cmd"}, "]", wm.throwRight)
hk.bind({"ctrl", "alt", "cmd"}, 'return', wm.maximizeWindow)
hk.bind({"ctrl", "alt", "cmd"}, 'left', wm.leftHalf)
hk.bind({"ctrl", "alt", "cmd"}, 'right', wm.rightHalf)
hk.bind({"ctrl", "alt", "cmd"}, 'up', wm.topHalf)
hk.bind({"ctrl", "alt", "cmd"}, 'down', wm.bottomHalf)

