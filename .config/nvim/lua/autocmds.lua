require "nvchad.autocmds"

-- add mappings
local map = vim.keymap.set

vim.api.nvim_create_autocmd("BufEnter", {
    pattern = {"*.adoc", "*.asciidoc"},
    callback = function()
        map('n', '<leader>ch', '<cmd><cr><cmd>Asciidoctor2HTML<cr>', {desc = '📄 Asciidoc: Convert HTML'})
        map('n', '<leader>cp', '<cmd>Asciidoctor2PDF<cr>', {desc = '📄 Asciidoc: Convert PDF'})
        map('n', '<leader>cd', '<cmd>Asciidoctor2DOCX<cr>', {desc = '📄 Asciidoc: Convert DOCX'})
        map('n', '<leader>oo', '<cmd>AsciidoctorOpenRAW<cr>', {desc = '🌐 Asciidoc: Open Raw'})
        map('n', '<leader>op', '<cmd>AsciidoctorOpenPDF<cr>', {desc = '🌐 Asciidoc: Open PDF'})
        map('n', '<leader>oh', '<cmd>AsciidoctorOpenHTML<cr>', {desc = '🌐 Asciidoc: Open HTML'})
        map('n', '<leader>ox', '<cmd>AsciidoctorOpenDOCX<cr>', {desc = '🌐 Asciidoc: Open DOCX'})
    end
})
vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = {"main.adoc", "main.asciidoc"},
    callback = function()
        vim.cmd("Asciidoctor2PDF")
    end
})
