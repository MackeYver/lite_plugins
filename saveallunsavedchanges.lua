local core = require "core"
local command = require "core.command"
local keymap = require "core.keymap"


command.add(nil, {
  ["save-all-unsaved-changes"] = function()
    core.log("Saving all unsaved changes...")
    for _, doc in ipairs(core.docs) do
      if doc:is_dirty() then
        if doc.filename then
          doc:save()
        else
          command.perform("doc:save-as")
       end
      end
    end
  end,
})

keymap.add { ["alt+s"] = "save-all-unsaved-changes" }