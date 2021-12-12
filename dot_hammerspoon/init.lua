-- Key bindings:
--
-- f1, f2, f3, f4, f5, f6, f7, f8, f9, f10, f11, f12, f13, f14, f15,
-- f16, f17, f18, f19, f20, pad, pad*, pad+, pad/, pad-, pad=,
-- pad0, pad1, pad2, pad3, pad4, pad5, pad6, pad7, pad8, pad9,
-- padclear, padenter, return, tab, space, delete, escape, help,
-- home, pageup, forwarddelete, end, pagedown, left, right, down, up,
-- shift, rightshift, cmd, rightcmd, alt, rightalt, ctrl, rightctrl,
-- capslock, fn

require "window"

hs.loadSpoon("ReloadConfiguration")
spoon.ReloadConfiguration:start()

--

hs.loadSpoon("Emojis")
spoon.Emojis:bindHotkeys({
  toggle = { { "ctrl", "alt", "cmd" }, "E" },
})

--

local usbLogger = hs.logger.new('usb', 'debug')

function configureKeyboard(data)
  local isKeyboardAffected = data.vendorID == 9610 and data.productID == 89
  -- usbLogger.df("eventType %s, pname %s, vname %s, vId %s, pId %s, keyboardAffected %s", data.eventType, data.productName, data.vendorName, data.vendorID, data.productID, isKeyboardAffected)
  if isKeyboardAffected and data.eventType == "added" then
    hs.keycodes.setLayout("U.S.")
  end
  if isKeyboardAffected and data.eventType == "removed" then
    hs.keycodes.setLayout("German")
  end
end

local keyboardWatcher = hs.usb.watcher.new(configureKeyboard)
keyboardWatcher:start()