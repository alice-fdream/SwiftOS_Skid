local shell = require("shell")
local tty = require("tty")
local fs = require("filesystem")
local gpu = require('component').gpu
local term = require('term')
local gpu = require('component').gpu
local string = require('string')
local computer = require("computer")

gpu.setBackground(0x3f096d)
gpu.setForeground(0x000000)
term.clear()

if tty.isAvailable() then
  if io.stdout.tty then
    io.write("\27[40m\27[37m")
    tty.clear()
  end
end

shell.setAlias("dir", "ls")
shell.setAlias("move", "mv")
shell.setAlias("rename", "mv")
shell.setAlias("copy", "cp")
shell.setAlias("del", "rm")
shell.setAlias("md", "mkdir")
shell.setAlias("cls", "clear")
shell.setAlias("rs", "redstone")
shell.setAlias("view", "edit -r")
shell.setAlias("help", "man")
shell.setAlias("cp", "cp -i")



os.setenv('VER', 'Skidblandir')
os.setenv('NAME', 'SwiftOS')
os.setenv("date_release", "January 14, 2023 Happy Valentin's day!")
os.setenv("update", "Cortex")

local GUI = require("GUI")

local result, reason = loadfile('/system/systemDATA/auth/auth.lua')
  if result then
    result, reason = pcall(result)
    if not result then
     GUI.alert("Error: " .. reason)
 end
else
 GUI.alert("Error: " .. reason)
 end
 