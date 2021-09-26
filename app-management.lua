-- if app is not running, launch it; 
-- otherwise, toggle the status between FrontMost and Hide
-- https://www.dazhuanlan.com/yqw961017/topics/1429247

local application = require 'hs.application'

function launch_or_toggle_application(_app)
    -- finds a running applications
    local app = application.find(_app)

    if not app then
        -- application not running, launch app
        if false == application.launchOrFocus(_app) then
            -- launch failed, send notification
            hs.alert('Failed to launch app: ' .. _app)
        end
        return
    end


    local mainwin = app:mainWindow()
    if mainwin then
        -- application running, toggle hide/unhide
        if true == app:isFrontmost() then
            mainwin:application():hide()
        else
            mainwin:application():activate(true)
            mainwin:application():unhide()
            mainwin:focus()
        end
    else
        -- no window, launchOrFocus
        application.launchOrFocus(_app)
    end
end
