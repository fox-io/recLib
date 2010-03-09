-- $Id: kill.lua 550 2010-03-02 15:27:53Z john.d.mann@gmail.com $

recLib.Kill = function(object)
	local object_reference = object
	if type(object) == "string" then
		object_reference = _G[object]
	else
		object_reference = object
	end
	if not object_reference then return end
	if type(object_reference) == "frame" then
		object_reference:UnregisterAllEvents()
	end
	object_reference.Show = recLib.NullFunction
	object_reference:Hide()
end