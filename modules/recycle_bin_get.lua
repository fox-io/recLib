-- $Id: recycle_bin_get.lua 587 2010-03-06 15:46:47Z john.d.mann@gmail.com $
local _, ns = ...

recLib.Get = function(object_type, ...)
	if object_type:find("table") then
		local new_table, num_args
		local arg_index = 1
		
		if #ns.recycle_bin and #ns.recycle_bin > 0 then
			new_table = table.remove(ns.recycle_bin, 1)
		else
			new_table = {}
		end
		
		num_args = select("#", ...)
		
		-- Empty table
		if not num_args or num_args < 1 then
			return new_table
		end
		
		-- Key/Value table
		if object_type == "table" then
			while (1 == 1) do
				local key, value = select(arg_index, ...)
				if key and value then
					new_table[key] = value
					arg_index = arg_index + 2
				else
					return new_table
				end
			end
			
		-- Indexed table
		elseif object_type == "itable" then
			for arg_index = 1, num_args do
				local value = select(arg_index, ...)
				new_table[arg_index] = value
			end
			
			return new_table
		end
	end
end