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


local hyper = {'ctrl'}
hs.hotkey.bind(hyper, "6", ratio_resize_center)


spoon.ReloadConfiguration:start()
