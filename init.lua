hs.loadSpoon("ReloadConfiguration")

function ratio_resize_center(ratio)
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

function ratio_resize_center_0()
   ratio_resize_center(0.56)
end

function ratio_resize_center_9()
ratio_resize_center()
end

function ratio_resize_center_8()
   ratio_resize_center(1)
end

local hyper = {'cmd', 'ctrl'}
hs.hotkey.bind(hyper, "0", ratio_resize_center_0)
hs.hotkey.bind(hyper, "9", ratio_resize_center_9)
hs.hotkey.bind(hyper, "8", ratio_resize_center_8)


spoon.ReloadConfiguration:start()
