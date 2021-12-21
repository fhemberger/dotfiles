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

function isExternalKeyboard(usbDevice)
  -- usbLogger.df("pname %s, vname %s, vId %s, pId %s", usbDevice.productName, usbDevice.vendorName, usbDevice.vendorID, usbDevice.productID)
  return usbDevice.vendorID == 9610 and usbDevice.productID == 89
end

function configureKeyboard(event)
  if isExternalKeyboard(event) and event.eventType == "added" then
    hs.keycodes.setLayout("U.S.")
  end
  if isExternalKeyboard(event) and event.eventType == "removed" then
    hs.keycodes.setLayout("German")
  end
end

function checkKeyboardOnWakeup(event)
  if (event == hs.caffeinate.watcher.screensDidWake) then
    local usbDevices = hs.usb.attachedDevices()
    if usbDevices == nil then
      return
    end

    local keyboardLayout = "German"
    for index, usbDevice in pairs(usbDevices) do
      if isExternalKeyboard(usbDevice) then
        keyboardLayout = "U.S."
      end
    end
    hs.keycodes.setLayout(keyboardLayout)
  end
end

local keyboardWatcher = hs.usb.watcher.new(configureKeyboard)
keyboardWatcher:start()

local wakeupWatcher = hs.caffeinate.watcher.new(checkKeyboardOnWakeup)
wakeupWatcher:start()
