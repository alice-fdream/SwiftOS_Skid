local GUI = require("GUI")
local computer = require("computer")
local unicode = require('unicode')
local fs = require('filesystem')
local swift = require("swift")
local buffer = require("NyaDraw")
-------------------------------------
-- Start Desktop (Version: Lyoko Skid)
-------------------------------------

-------------------------------------


-- Get Screen
local Screen = ...
-- Stop and Remove past screen
Screen:stop()

-- Create new screen
local Screen = GUI.application()
-- Create main-panel
Screen:addChild(GUI.panel(1, 1, Screen.width, Screen.height, GUI.SystemColor.backgroundDesktop))



Screen:addChild(GUI.roundedButton(80 - 30 + 2, 2, 60, 5, 0x410057, 0x410057, 0x410057, 0x410057, ""))
Screen:addChild (GUI.image (53, 3, buffer.loadImage("/system/Programs/files/files.pic"))).eventHandler = function (main, win, evn, _, x, y)
   if evn == 'touch' then
	 local result, reason = loadfile("/system/Programs/files/files.lua")
			if result then
				result, reason = pcall(result, Screen)
				if not result then
					GUI.alert("Error: " .. reason)
				end
			else
				GUI.alert("Error: " .. reason)
			end
    end
end



local cp = Screen:addChild(GUI.app(30, 30, 50, 15, "Welcome SwiftOS Skidblandir"))
cp:addChild(GUI.roundedButton(4,4, 10, 3, GUI.SystemColor.inputBack, 0xFFFFFF, GUI.SystemColor.inputBack, 0xFFFFFF, "Reboot")).onTouch = function()
	computer.shutdown(true)
end
-- Draw Screen
Screen:draw()
-- Start screen
Screen:start()