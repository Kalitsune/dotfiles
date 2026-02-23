require "nvchad.mappings"

-- Define functions 

local function quickfix()
    vim.lsp.buf.code_action({
        filter = function(a) return a.isPreferred end,
        apply = true
    })
end

-- Add mappings
local map = vim.keymap.set

map('n', '<leader>qf', quickfix, { noremap=true, silent=true, desc = "🩹 Apply LSP Suggestions" })

-- Disable mappings
local nomap = vim.keymap.del

