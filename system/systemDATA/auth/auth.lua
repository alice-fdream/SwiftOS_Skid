local buffer = require("NyaDraw")
local GUI = require("GUI")
local computer = require("computer")
local gpu = require('component').gpu
local unicode = require('unicode')
local fs = require('filesystem')
local swift = require("swift")
------------------------------------------------------------------------------------------
buffer.setGPUProxy(require("component").gpu)
------------------------------------------------------------------------------------------


mainContainer = GUI.application()

mainContainer:addChild(GUI.panel(1, 1, mainContainer.width, mainContainer.height, GUI.SystemColor.background))
mainContainer:addChild (GUI.image (4, 4, buffer.loadImage("/system/systemDATA/images/logo.pic")))
mainContainer:addChild (GUI.label (25, 5, mainContainer.width, mainContainer.height, GUI.SystemColor.regularText, os.getenv('NAME') .. " " .. os.getenv("VER")))
mainContainer:addChild (GUI.label (25, 6, mainContainer.width, mainContainer.height, GUI.SystemColor.regularText, "Data release: " .. os.getenv("date_release")))
mainContainer:addChild (GUI.label (25, 7, mainContainer.width, mainContainer.height, GUI.SystemColor.regularText, "Update: " .. os.getenv("update")))
mainContainer:addChild (GUI.label (25, 12, mainContainer.width, mainContainer.height, GUI.SystemColor.regularText, "Sherbakova Alice, SwiftOS 2023"))

mainContainer:addChild (GUI.label ((mainContainer.width/2) - 15 + 8, 18, mainContainer.width, mainContainer.height, GUI.SystemColor.regularText, "Authorization"))
local login = GUI.input((mainContainer.width/2) - 15, 20, 30, 3, GUI.SystemColor.inputBack, GUI.SystemColor.inputText, GUI.SystemColor.placeholderText, GUI.SystemColor.inputBack, GUI.SystemColor.inputText, "", "login")
mainContainer:addChild(login)

local key = GUI.input((mainContainer.width/2) - 15, 24, 30, 3, GUI.SystemColor.inputBack, GUI.SystemColor.inputText, GUI.SystemColor.placeholderText, GUI.SystemColor.inputBack, GUI.SystemColor.inputText, "", "Key", "", "-")
mainContainer:addChild(key)

mainContainer:addChild(GUI.roundedButton((mainContainer.width/2) - 16, 28, 32, 3, GUI.SystemColor.inputBack, GUI.SystemColor.inputText, 0xFFFFFF, 0x000000, "OK")).onTouch = function()
	if fs.exists("/Users/" .. login.text) then
		local password = swift.getFile("/Users/" .. login.text .. "/REESTR/key.txt")
		if password == key.text then
			local result, reason = loadfile('/system/SwiftOS/Desktop/Engine.lua')
			if result then
				result, reason = pcall(result, mainContainer)
				if not result then
					GUI.alert("Error: " .. reason)
				end
			else
				GUI.alert("Error: " .. reason)
			end
		else
			GUI.alert("User not having this password. Retrying please.")
		end
	else
		GUI.alert("User is wrong")
	end
end

mainContainer:addChild(GUI.roundedButton((mainContainer.width/2) - 32, 46, 64, 3, 0x4f1117, 0xFFFFFF, 0xFFFFFF, 0x000000, "Reboot")).onTouch = function()
	computer.shutdown(true)
end

mainContainer:draw  ()
mainContainer:start ()
