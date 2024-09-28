--
-- Set home/end keys to line context instead of document
--
-- hs.hotkey.bind({}, "home", function()
--   hs.eventtap.keyStroke({"cmd"}, "left")
-- end)

-- hs.hotkey.bind({}, "end", function()
--   hs.eventtap.keyStroke({"cmd"}, "right")
-- end)

-- Map characters
keyMappings = {
  { mods = {"alt"},          key = "q", strokes = "@" },
  { mods = {"alt"},          key = "d", strokes = "™" },
  { mods = {"alt"},          key = ".", strokes = "…" },
  { mods = {"alt"},          key = "-", strokes = "–" },
  { mods = {"alt", "shift"}, key = "-", strokes = "—" },
}

for _, map in pairs(keyMappings) do
  hs.hotkey.bind(map["mods"], map["key"], function()
    hs.eventtap.keyStrokes(map["strokes"])
  end)
end
