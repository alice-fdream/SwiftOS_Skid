local GUI = require("GUI")
local fs = require("filesystem")
local swift = {}


	function swift.getFile(path)
		if fs.exists(path) then
			local file = io.open(path)
			local answer = file:read(1024)
			file:close()
			return answer
		else
			GUI.alert("Path is wrong")
			return 0
		end
	end


return swift