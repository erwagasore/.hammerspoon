hs.grid.setGrid('24x16')
hs.grid.setMargins('0x0')
hs.window.animationDuration = 0

local meta = {"cmd", "option"}
local hyper = {"cmd", "option", "shift"}

function hyper_bind(key, f)
   hs.hotkey.bind(hyper, key, f)
end

function meta_bind(key, f)
   hs.hotkey.bind(meta, key, f)
end

meta_bind("right", hs.grid.pushWindowRight)
meta_bind("left", hs.grid.pushWindowLeft)
meta_bind("down", hs.grid.pushWindowDown)
meta_bind("up", hs.grid.pushWindowUp)

function ratio_resize_from_center(ratio)
   local win = hs.window.focusedWindow()
   local f = win:frame()
   local s = win:screen()
   local max = s:frame()
   ratio = ratio or 0.72

   f.x = max.x + (max.w * (1 - ratio) / 2)
   f.y = max.y + (max.h * (1 - ratio) / 2)
   f.w = max.w * ratio
   f.h = max.h * ratio
   win:setFrame(f)
end

-- hs.hotkey.bind(hyper, "0", ratio_resize_center_0)
-- hs.hotkey.bind(hyper, "9", ratio_resize_center_9)
-- hs.hotkey.bind(hyper, "8", ratio_resize_center_8)

hyper_bind("right", function()
    local win = hs.window.focusedWindow()
    if win == nil then return end
    local screen = win:screen()
    local sg = hs.grid.getGrid(screen)
    local g = hs.grid.get(win)
    if g.x + g.w == sg.w then
        g.x = g.x + 1
        g.w = g.w - 1
        hs.grid.set(win, g)
    else
        g.w = g.w + 1
        hs.grid.set(win, g)
    end
end)

hyper_bind("left", function()
    local win = hs.window.focusedWindow()
    if win == nil then return end
    local screen = win:screen()
    local sg = hs.grid.getGrid(screen)
    local g = hs.grid.get(win)
    if g.x + g.w >= sg.w and g.x ~= 0 then
        g.x = g.x - 1
        g.w = g.w + 1
        hs.grid.set(win, g)
    else
        g.w = g.w - 1
        hs.grid.set(win, g)
    end
end)

hyper_bind("down", function()
    local win = hs.window.focusedWindow()
    if win == nil then return end
    local screen = win:screen()
    local sg = hs.grid.getGrid(screen)
    local g = hs.grid.get(win)
    if g.y + g.h == sg.h then
        g.y = g.y + 1
        g.h = g.h - 1
        hs.grid.set(win, g)
    else
        g.h = g.h + 1
        hs.grid.set(win, g)
    end
end)

hyper_bind("up", function()
    local win = hs.window.focusedWindow()
    if win == nil then return end
    local screen = win:screen()
    local sg = hs.grid.getGrid(screen)
    local g = hs.grid.get(win)
    if g.y + g.h >= sg.h and g.y ~= 0 then
        g.y = g.y - 1
        g.h = g.h + 1
        hs.grid.set(win, g)
    else
        g.h = g.h - 1
        hs.grid.set(win, g)
    end
end)

hyper_bind("r", hs.reload)
hs.alert.show("Hammerspoon loaded")
