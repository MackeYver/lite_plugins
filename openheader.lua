local core = require "core"
local command = require "core.command"
local style = require "core.style"
local keymap = require "core.keymap"


local function open_header(in_split_node)
  local doc = core.active_view.doc
	local file_extension = doc.filename:match "[^.]+$"
	local filename_without_extension = doc.filename:match("(.+)%..+")

	local filename_to_open = ""

	if file_extension == "cpp" then
		filename_to_open = filename_without_extension .. ".h"
	else	
		if file_extension == "h" then
			filename_to_open = filename_without_extension .. ".cpp"
		end
	end

	core.log("Will open %s", filename_to_open)

	if filename_to_open ~= "" then
		if in_split_node then
			local result_node = nil
			local active_node = core.root_view:get_active_node()
			
			-- Don't know how to query for split views/nodes (and I don't know the correct terminology)
			-- Check to the right?
			local x, y
			y = active_node.position.y + active_node.size.y / 2
			x = active_node.position.x + (active_node.size.x + style.divider_size)
			local curr_node = core.root_view.root_node:get_child_overlapping_point(x, y)	  
			if curr_node and not curr_node:get_locked_size() then
				result_node = curr_node
			end
			
			if not result_node then
				y = active_node.position.y + active_node.size.y / 2
				x = active_node.position.x - style.divider_size
				curr_node = core.root_view.root_node:get_child_overlapping_point(x, y)	  
				if curr_node and not curr_node:get_locked_size() then
				result_node = curr_node
				end
			end
			
			-- Did we find a node?
			if result_node then
				core.set_active_view(result_node.active_view)
			else
				-- If we didn't find a node, then we split to the right
				command.perform("root:split-right")
			end	  
		end
		-- Open the file
		core.root_view:open_doc(core.open_doc(filename_to_open))
	end
end

command.add("core.docview", {
  ["open-header-in-split-node"] = function()
		open_header(true)
  end,
})

command.add("core.docview", {
  ["open-header-in-same-node"] = function()
		open_header(false)
  end,
})

keymap.add { ["f8"] = "open-header-in-split-node" }
keymap.add { ["shift+f8"] = "open-header-in-same-node" }