---@diagnostic disable-next-line: undefined-global
local hs = hs

-- launch, focus or cycle through instances of an application
function LaunchOrFocusOrCycle(app)
    if hs.window.focusedWindow():application():name() == app then
        local appWindows = hs.application.get(app):allWindows()
        if #appWindows > 0 then
            appWindows[#appWindows]:focus()
        end
    else
        hs.application.launchOrFocus(app)
    end
end

function App(mods, key, app)
    hs.hotkey.bind(mods, key, function()
        LaunchOrFocusOrCycle(app)
    end)
end
