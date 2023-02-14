local GUI = require("GUI")
local computer = require("computer")
local unicode = require("unicode")
local fs = require("filesystem")
local swift = require("swift")
local buffer = require("NyaDraw")
-------------------------------------
-- Start Files Alice Sherbakova 2023
-------------------------------------

local Screen = ...
local current_path = "/"
local files = GUI.app(20, 10, 40, 25, "Files")
local object = GUI.container(1, 3, 40, 24)
local history = {}
history.i = 1
history[history.i] = "/"

-----------------------------
local menu = files:addChild(GUI.menu(1, 2, object.width, 0x7d1c1c, 0xFFFFFF, 0x7d1c1c, 0xFFFFFF))
local contextMenu = menu:addContextMenu("Files")
contextMenu:addItem("New folder")
contextMenu:addItem("New file")
local back = files:addChild(GUI.button(37, 2, 2, 1, 0x367d1c, 0xFFFFFF, 0x000000, 0xFFFFFF, "<<"))
local subObject = GUI.container(1, 1, 40, 100)
subObject.eventHandler = function(Screen, subObject, ename, idds, x, y, chsc)
    if ename == "scroll" then
        if chsc >= 1 then
            if subObject.localY == 1 then
            else
                subObject.localY = subObject.localY + 2
                Screen:draw()
            end
        else
            subObject.localY = subObject.localY - 2
            Screen:draw()
        end
    end
end

-- callback
local function drawFiles(current_path, subObject, object, Screen, history, back)
    local x, y = 2, 2
    for file in fs.list(current_path) do
        if unicode.sub(file, -1, -1) == "/" then
            local fobject =
                subObject:addChild(
                GUI.button(x, y, subObject.width - 2, 1, 0xa62626, 0xFFFFFF, 0x000000, 0xFFFFFF, file)
            )
            fobject.onTouch = function()
                subObject:remove()
                local subObject = GUI.container(1, 1, 40, 100)
                object:addChild(subObject)
                subObject.eventHandler = function(Screen, subObject, ename, idds, x, y, chsc)
                    if ename == "scroll" then
                        if chsc >= 1 then
                            if subObject.localY == 1 then
                            else
                                subObject.localY = subObject.localY + 2
                                Screen:draw()
                            end
                        else
                            subObject.localY = subObject.localY - 2
                            Screen:draw()
                        end
                    end
                end
				history.i = history.i + 1
				history[history.i] = current_path
				back.onTouch = function()
				if history.i ~= 1 then
					history.i = history.i - 1
					current_path = history[history.i]
					subObject:remove()
                local subObject = GUI.container(1, 1, 40, 100)
                object:addChild(subObject)
                subObject.eventHandler = function(Screen, subObject, ename, idds, x, y, chsc)
                    if ename == "scroll" then
                        if chsc >= 1 then
                            if subObject.localY == 1 then
                            else
                                subObject.localY = subObject.localY + 2
                                Screen:draw()
                            end
                        else
                            subObject.localY = subObject.localY - 2
                            Screen:draw()
                        end
                    end
				end
					drawFiles(current_path, subObject, object, Screen, history, back)
				end
end
                current_path = current_path .. file
                drawFiles(current_path, subObject, object, Screen, history, back)
            end
            y = y + 2
        else
            local fobject =
                subObject:addChild(
                GUI.button(x, y, subObject.width - 2, 1, 0x367d1c, 0xFFFFFF, 0x000000, 0xFFFFFF, file)
            )
            y = y + 2
        end
    end
    Screen:draw()
end
--callback end
drawFiles(current_path, subObject, object, Screen, history, back)

-- body
files:addChild(object)
object:addChild(subObject)
--------------------------------- footer
Screen:addChild(files)
Screen:draw()
