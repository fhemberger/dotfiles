local windowSizes = {}

hs.window.animationDuration = 0

function rsutils()
  local win = hs.window.frontmostWindow()
  local frame = win:frame()
  local screen = win:screen()
  local viewp  = screen:frame()

  -- Height of menu bar/dock
  local offset = screen:fullFrame().h - screen:frame().h
  return win, frame, screen, viewp, offset
end

-- maximize mappings -----------------------------------------------------------
function aroundTheSame(a, b)
  a = math.floor(a)
  b = math.floor(b)
  return math.abs(a - b) < 15
end

function isMaximized()
  win, frame, screen, viewp = rsutils()
  return aroundTheSame(frame.x, viewp.x) and
         aroundTheSame(frame.y, viewp.y) and
         aroundTheSame(frame.w, viewp.w) and
         aroundTheSame(frame.h, viewp.h)
end


-- half mappings ---------------------------------------------------------------
-- sizes window to half width, full height, left aligned
hs.hotkey.bind({"alt", "ctrl"}, "left", function()
  win, frame, screen, viewp = rsutils()
  frame.x = viewp.x
  frame.y = viewp.y
  frame.w = (viewp.w / 2)
  frame.h = viewp.h
  win:setFrame(frame)
end)

-- sizes window to half width, full height, right aligned
hs.hotkey.bind({"alt", "ctrl"}, "right", function()
  win, frame, screen, viewp = rsutils()
  frame.x = (viewp.w / 2)
  frame.y = viewp.y
  frame.w = (viewp.w / 2)
  frame.h = viewp.h
  win:setFrame(frame)
end)


-- thirds mappings (numpad) ----------------------------------------------------
-- sizes window to 3rds width, half height, top/left aligned
local one_third_width_half_height_top_left = function()
  win, frame, screen, viewp = rsutils()
  frame.x = viewp.x
  frame.y = viewp.y
  frame.w = (viewp.w / 3)
  frame.h = (viewp.h / 2)
  win:setFrame(frame)
end
hs.hotkey.bind({"alt", "ctrl"}, "pad7", one_third_width_half_height_top_left)
hs.hotkey.bind({"alt", "ctrl"}, "7", one_third_width_half_height_top_left)

-- sizes window to 3rds width, half height, top/center aligned
local one_third_width_half_height_top_center = function()
  win, frame, screen, viewp = rsutils()
  frame.x = (viewp.w / 3)
  frame.y = viewp.y
  frame.w = (viewp.w / 3)
  frame.h = (viewp.h / 2)
  win:setFrame(frame)
end
hs.hotkey.bind({"alt", "ctrl"}, "pad8", one_third_width_half_height_top_center)
hs.hotkey.bind({"alt", "ctrl"}, "8", one_third_width_half_height_top_center)

-- sizes window to 3rds width, half height, top/right aligned
local one_third_width_half_height_top_right = function()
  win, frame, screen, viewp = rsutils()
  frame.x = (viewp.w / 3) * 2
  frame.y = viewp.y
  frame.w = (viewp.w / 3)
  frame.h = (viewp.h / 2)
  win:setFrame(frame)
end
hs.hotkey.bind({"alt", "ctrl"}, "pad9", one_third_width_half_height_top_right)
hs.hotkey.bind({"alt", "ctrl"}, "9", one_third_width_half_height_top_right)

-- sizes window to 3rds width, full height, left aligned
local one_third_width_full_height_left = function()
  win, frame, screen, viewp = rsutils()
  frame.x = viewp.x
  frame.y = viewp.y
  frame.w = (viewp.w / 3)
  frame.h = viewp.h
  win:setFrame(frame)
end
hs.hotkey.bind({"alt", "ctrl"}, "pad4", one_third_width_full_height_left)
hs.hotkey.bind({"alt", "ctrl"}, "4", one_third_width_full_height_left)

-- sizes window to 3rds width, full height, center aligned
local one_third_width_full_height_center = function()
  win, frame, screen, viewp = rsutils()
  frame.x = (viewp.w / 3)
  frame.y = viewp.y
  frame.w = (viewp.w / 3)
  frame.h = viewp.h
  win:setFrame(frame)
end
hs.hotkey.bind({"alt", "ctrl"}, "pad5", one_third_width_full_height_center)
hs.hotkey.bind({"alt", "ctrl"}, "5", one_third_width_full_height_center)

-- sizes window to 3rds width, full height, right aligned
local one_third_width_full_height_right = function()
  win, frame, screen, viewp = rsutils()
  frame.x = (viewp.w / 3) * 2
  frame.y = viewp.y
  frame.w = (viewp.w / 3)
  frame.h = viewp.h
  win:setFrame(frame)
end
hs.hotkey.bind({"alt", "ctrl"}, "pad6", one_third_width_full_height_right)
hs.hotkey.bind({"alt", "ctrl"}, "6", one_third_width_full_height_right)

-- sizes window to 3rds width, half height, bottom/left aligned
local one_third_width_half_height_bottom_left = function()
  win, frame, screen, viewp, offset = rsutils()
  frame.x = viewp.x
  frame.y = (viewp.h / 2) + offset
  frame.w = (viewp.w / 3)
  frame.h = (viewp.h / 2)
  win:setFrame(frame)
end
hs.hotkey.bind({"alt", "ctrl"}, "pad1", one_third_width_half_height_bottom_left)
hs.hotkey.bind({"alt", "ctrl"}, "1", one_third_width_half_height_bottom_left)

-- sizes window to 3rds width, half height, bottom/center aligned
local one_third_width_half_height_bottom_center = function()
  win, frame, screen, viewp, offset = rsutils()
  frame.x = (viewp.w / 3)
  frame.y = (viewp.h / 2) + offset
  frame.w = (viewp.w / 3)
  frame.h = (viewp.h / 2)
  win:setFrame(frame)
end
hs.hotkey.bind({"alt", "ctrl"}, "pad2", one_third_width_half_height_bottom_center)
hs.hotkey.bind({"alt", "ctrl"}, "2", one_third_width_half_height_bottom_center)

-- sizes window to 3rds width, half height, bottom/right aligned
local one_third_width_half_height_bottom_right = function()
  win, frame, screen, viewp, offset = rsutils()
  frame.x = (viewp.w / 3) * 2
  frame.y = (viewp.h / 2) + offset
  frame.w = (viewp.w / 3)
  frame.h = (viewp.h / 2)
  win:setFrame(frame)
end
hs.hotkey.bind({"alt", "ctrl"}, "pad3", one_third_width_half_height_bottom_right)
hs.hotkey.bind({"alt", "ctrl"}, "3", one_third_width_half_height_bottom_right)


-- two thirds mapping ----------------------------------------------------------
-- sizes window to two 3rds width, full height, left aligned
local two_thirds_width_full_height_left = function()
  win, frame, screen, viewp = rsutils()
  frame.x = viewp.x
  frame.y = viewp.y
  frame.w = (viewp.w / 3) * 2
  frame.h = viewp.h
  win:setFrame(frame)
end
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "pad4", two_thirds_width_full_height_left)
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "4", two_thirds_width_full_height_left)

-- sizes window to two 3rds width, full height, right aligned
local two_thirds_width_full_height_right = function()
  win, frame, screen, viewp = rsutils()
  frame.x = (viewp.w / 3)
  frame.y = viewp.y
  frame.w = (viewp.w / 3) * 2
  frame.h = viewp.h
  win:setFrame(frame)
end
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "pad6", two_thirds_width_full_height_right)
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "6", two_thirds_width_full_height_right)


-- quarter mappings ------------------------------------------------------------
-- sizes window to half width, half height, top/left aligned
hs.hotkey.bind({"alt", "ctrl"}, "home", function()
  win, frame, screen, viewp = rsutils()
  frame.x = viewp.x
  frame.y = viewp.y
  frame.w = (viewp.w / 2)
  frame.h = (viewp.h / 2)
  win:setFrame(frame)
end)

-- sizes window to half width, half height, top/right aligned
hs.hotkey.bind({"alt", "ctrl"}, "pageup", function()
  win, frame, screen, viewp = rsutils()
  frame.x = (viewp.w / 2)
  frame.y = viewp.y
  frame.w = (viewp.w / 2)
  frame.h = (viewp.h / 2)
  win:setFrame(frame)
end)

-- sizes window to half width, half height, bottom/left aligned
hs.hotkey.bind({"alt", "ctrl"}, "end", function()
  win, frame, screen, viewp = rsutils()
  frame.x = viewp.x
  frame.y = (viewp.h / 2)
  frame.w = (viewp.w / 2)
  frame.h = (viewp.h / 2)
  win:setFrame(frame)
end)

-- sizes window to half width, half height, bottom/right aligned
hs.hotkey.bind({"alt", "ctrl"}, "pagedown", function()
  win, frame, screen, viewp = rsutils()
  frame.x = (viewp.w / 2)
  frame.y = (viewp.h / 2)
  frame.w = (viewp.w / 2)
  frame.h = (viewp.h / 2)
  win:setFrame(frame)
end)


-- maximizes window. if window was previously maximized, returns it to previous size
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "m", function()
  win, frame = rsutils()
  local id = win:id()
  if not isMaximized() then
    windowSizes[id] = frame
    win:maximize()
  elseif windowSizes[id] ~= nil then
    local prevFrame = windowSizes[id]
    windowSizes[id] = nil
    win:setFrame(prevFrame)
  end
end)

return windowSizes
