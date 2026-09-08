--- Ref: https://zhiye.li/hammerspoon-use-the-keyboard-shortcuts-to-launch-apps-a7c59ab3d92
--- start quick open applications
function open_app(name)
    return function()
        hs.application.launchOrFocus(name)
        if name == 'Finder' then
            hs.appfinder.appFromName(name):activate()
        end
    end
end

--- quick open applications
hs.hotkey.bind({"alt", "shift"}, "T", open_app("Terminal"))
hs.hotkey.bind({"ctrl"},         "T", open_app("Terminal"))
