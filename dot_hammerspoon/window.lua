hs.window.animationDuration = 0

function rsutils()
  local win = hs.window.frontmostWindow()
  local frame = win:frame()
  local screen = win:screen()
  local viewp  = screen:frame()
  return win, frame, screen, viewp
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
hs.hotkey.bind({"alt", "ctrl"}, "pad7", function()
  win, frame, screen, viewp = rsutils()
  frame.x = viewp.x
  frame.y = viewp.y
  frame.w = (viewp.w / 3)
  frame.h = (viewp.h / 2)
  win:setFrame(frame)
end)

-- sizes window to 3rds width, half height, top/center aligned
hs.hotkey.bind({"alt", "ctrl"}, "pad8", function()
  win, frame, screen, viewp = rsutils()
  frame.x = (viewp.w / 3)
  frame.y = viewp.y
  frame.w = (viewp.w / 3)
  frame.h = (viewp.h / 2)
  win:setFrame(frame)
end)

-- sizes window to 3rds width, half height, top/right aligned
hs.hotkey.bind({"alt", "ctrl"}, "pad9", function()
  win, frame, screen, viewp = rsutils()
  frame.x = (viewp.w / 3) * 2
  frame.y = viewp.y
  frame.w = (viewp.w / 3)
  frame.h = (viewp.h / 2)
  win:setFrame(frame)
end)

-- sizes window to 3rds width, full height, left aligned
hs.hotkey.bind({"alt", "ctrl"}, "pad4", function()
  win, frame, screen, viewp = rsutils()
  frame.x = viewp.x
  frame.y = viewp.y
  frame.w = (viewp.w / 3)
  frame.h = viewp.h
  win:setFrame(frame)
end)

-- sizes window to 3rds width, full height, center aligned
hs.hotkey.bind({"alt", "ctrl"}, "pad5", function()
  win, frame, screen, viewp = rsutils()
  frame.x = (viewp.w / 3)
  frame.y = viewp.y
  frame.w = (viewp.w / 3)
  frame.h = viewp.h
  win:setFrame(frame)
end)

-- sizes window to 3rds width, full height, right aligned
hs.hotkey.bind({"alt", "ctrl"}, "pad6", function()
  win, frame, screen, viewp = rsutils()
  frame.x = (viewp.w / 3) * 2
  frame.y = viewp.y
  frame.w = (viewp.w / 3)
  frame.h = viewp.h
  win:setFrame(frame)
end)

-- sizes window to 3rds width, half height, bottom/left aligned
hs.hotkey.bind({"alt", "ctrl"}, "pad1", function()
  win, frame, screen, viewp = rsutils()
  frame.x = viewp.x
  frame.y = (viewp.h / 2)
  frame.w = (viewp.w / 3)
  frame.h = (viewp.h / 2)
  win:setFrame(frame)
end)

-- sizes window to 3rds width, half height, bottom/center aligned
hs.hotkey.bind({"alt", "ctrl"}, "pad2", function()
  win, frame, screen, viewp = rsutils()
  frame.x = (viewp.w / 3)
  frame.y = (viewp.h / 2)
  frame.w = (viewp.w / 3)
  frame.h = (viewp.h / 2)
  win:setFrame(frame)
end)

-- sizes window to 3rds width, half height, bottom/right aligned
hs.hotkey.bind({"alt", "ctrl"}, "pad3", function()
  win, frame, screen, viewp = rsutils()
  frame.x = (viewp.w / 3) * 2
  frame.y = (viewp.h / 2)
  frame.w = (viewp.w / 3)
  frame.h = (viewp.h / 2)
  win:setFrame(frame)
end)


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


-- maximize mappings -----------------------------------------------------------
windowSizes = {}

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
