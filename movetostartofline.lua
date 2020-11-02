local core = require "core"
local command = require "core.command"
local Doc = require "core.doc"
local keymap = require "core.keymap"


command.add("core.docview", {
  ["move-to-to-start-of-line-ignoring-whitespace"] = function()	
		local doc = core.active_view.doc				
		local current_line, current_pos = doc:get_selection()
		local current_line_length = #doc.lines[current_line]				
		
		local i = 1
		while i <= current_line_length and doc.lines[current_line]:sub(i, i) == " " do				
				i = i + 1
		end
		
		if i == current_pos then i = 1 end
		
		core.log("first_char_pos = %u", i)
		
		doc:set_selection(current_line, i)
  end,
})

keymap.add { ["home"] = "move-to-to-start-of-line-ignoring-whitespace" }
