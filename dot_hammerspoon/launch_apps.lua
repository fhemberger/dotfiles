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
-- hs.hotkey.bind({"alt", "shift"}, "C", open_app("Visual Studio Code"))
-- hs.hotkey.bind({"alt", "shift"}, "G", open_app("Google Chrome"))
hs.hotkey.bind({"alt", "shift"}, "T", open_app("WezTerm"))
hs.hotkey.bind({"ctrl"},         "T", open_app("WezTerm"))
-- hs.hotkey.bind({"alt", "shift"}, "S", open_app("Slack"))
