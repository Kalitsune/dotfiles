require "nvchad.mappings"

-- Define functions 
function toggleZenMode() 
    require("zen-mode").toggle({
        window = {
            width = .85 -- width will be 85% of the editor width
        }
    })
end

local function quickfix()
    vim.lsp.buf.code_action({
        filter = function(a) return a.isPreferred end,
        apply = true
    })
end

-- Add mappings
local map = vim.keymap.set

-- Multiple modes 
map({ "i", "n", "v" }, "<leader>zm", toggleZenMode, { desc = "☯  Toggle ZenMode" })

map('n', '<leader>qf', quickfix, { noremap=true, silent=true, desc = "🩹 Apply LSP Suggestions" })

-- Disable mappings
local nomap = vim.keymap.del

