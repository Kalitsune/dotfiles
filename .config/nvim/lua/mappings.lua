require "nvchad.mappings"

-- Define functions 
function toggleZenMode() 
    require("zen-mode").toggle({
        window = {
            width = .85 -- width will be 85% of the editor width
        }
    })
end

-- Add mappings
local map = vim.keymap.set

-- Multiple modes 
map({ "i", "n", "v" }, "<leader>zm", toggleZenMode, { desc = "☯  Toggle ZenMode" })

-- Disable mappings
local nomap = vim.keymap.del

