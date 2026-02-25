require("nvchad.autocmds")

-- add mappings
local map = vim.keymap.set
-- Disable mappings
local nomap = vim.keymap.del

-- Asciidoc
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = { "*.adoc", "*.asciidoc" },
	callback = function(event)
		map("n", "<leader>ch", ":Asciidoctor2HTML<cr>", { buffer = event.buf, desc = "📄 Asciidoc: Convert HTML" })
		map("n", "<leader>cp", ":Asciidoctor2PDF<cr>", { buffer = event.buf, desc = "📄 Asciidoc: Convert PDF" })
		map("n", "<leader>cd", ":Asciidoctor2DOCX<cr>", { buffer = event.buf, desc = "📄 Asciidoc: Convert DOCX" })
		map("n", "<leader>oo", ":AsciidoctorOpenRAW<cr>", { buffer = event.buf, desc = "🌐 Asciidoc: Open Raw" })
		map("n", "<leader>op", ":AsciidoctorOpenPDF<cr>", { buffer = event.buf, desc = "🌐 Asciidoc: Open PDF" })
		map("n", "<leader>oh", ":AsciidoctorOpenHTML<cr>", { buffer = event.buf, desc = "🌐 Asciidoc: Open HTML" })
		map("n", "<leader>ox", ":AsciidoctorOpenDOCX<cr>", { buffer = event.buf, desc = "🌐 Asciidoc: Open DOCX" })
	end,
})

vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = { "main.adoc", "main.asciidoc" },
	callback = function()
		vim.cmd("Asciidoctor2PDF")
	end,
})

-- Typst
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = { "*.typst" },
	callback = function(event)
		map("n", "<leader>oo", ":TypstPreviewToggle<cr>", { buffer = event.buf, desc = "📄 Open Typst Preview" })
	end,
})
