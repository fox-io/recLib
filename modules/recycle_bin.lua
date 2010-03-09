-- $Id: recycle_bin.lua 556 2010-03-02 20:31:41Z john.d.mann@gmail.com $
local _, ns = ...

ns.recycle_bin = {}

recLib.Recycle = function(trash_table)
	if trash_table and type(trash_table) == "table" then
		-- Recycle trash_table
		for k,v in pairs(trash_table) do
			if type(v) == "table" then
				recLib.Recycle(v)
			end
			trash_table[k] = nil
		end
		ns.recycle_bin[(#ns.recycle_bin or 0) + 1] = trash_table
		trash_table = nil
	end
	return nil
end