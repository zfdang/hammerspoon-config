# HammerSpoon config
Personal config for hammerspoon

## install HammerSpoon

click here to download the latest version:

https://github.com/Hammerspoon/hammerspoon/releases/latest

NOTE: You might have to grant "accessibility" permission to HammerSpoon manually. Please follow instruction in "preference" page.

## how to use this config

```
rm -rf ~/.hammerspoon
git clone https://github.com/zfdang/hammerspoon-config.git ~/.hammerspoon
```

then reload hammerspoon config

## current key bindings and functions

HyperKey: {"cmd", "alt", "ctrl", "shift"}

- HyperKey + l: lock screen
- HyperKey + b: show battery status on screen
- HyperKey + [: move app to left screen
- HyperKey + ]: move app to right screen
- HyperKey + return: maximize current window
- HyperKey + left: resize current window to the left half of the screen
- HyperKey + right: resize current window to the right half of the screen
- HyperKey + up: resize current window to the top half of the screen
- HyperKey + down: resize current window to the bottom half of the screen
- HyperKey + x: launch application by x (see key2App in [key-bindings.lua](key-bindings.lua), you can customize it in your own way)

- {"CMD","Ctrl"} + up: volume up
- {"CMD","Ctrl"} + down: volume down

