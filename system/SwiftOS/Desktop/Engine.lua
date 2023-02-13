local GUI = require("GUI")
local computer = require("computer")
local unicode = require('unicode')
local fs = require('filesystem')
local swift = require("swift")
-------------------------------------
-- Start Desktop (Version: Lyoko Skid)
-------------------------------------

-- Get Screen
local Screen = ...
-- Stop and Remove past screen
Screen:stop()

-- Create new screen
local Screen = GUI.application()
-- Create color-panel
Screen:addChild(GUI.panel(1, 1, Screen.width, Screen.height, GUI.SystemColor.backgroundDesktop))

local window3 = Screen:addChild(GUI.app(50, 22, 60, 20, "Welcome "))
local layout = window3:addChild(GUI.layout(1, 2, window3.width, window3.height - 1, 1, 1))
-- Add some stuff to layout
layout:addChild(GUI.button(1, 1, 36, 3, 0xB4B4B4, 0xFFFFFF, 0x969696, 0xB4B4B4, "Press me"))
layout:addChild(GUI.button(1, 1, 36, 3, 0xB4B4B4, 0xFFFFFF, 0x969696, 0xB4B4B4, "And me"))

-- Draw Screen
Screen:draw()
-- Start screen
Screen:start()