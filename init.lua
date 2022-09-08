-- https://github.com/zfdang/hammerspoon-config

require "volume-management"
require "brightness-management"
require "window-management"
require "app-management"

-- turn off bluetooth when system sleeps
-- blueutil is needed. $ brew install blueutil
-- https://github.com/toy/blueutil
require "bluetooth-sleep"

-- all keys binding are defined here
require "key-bindings"

-- show config load alert
hs.alert.show("HammerSpoon config reloaded!", 1)
