require("nvchad.options")

-- Use this file for standard vim configuration
vim.opt.colorcolumn = "80"
vim.o.tabstop = 4 -- A TAB character looks like 4 spaces
vim.o.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.o.softtabstop = 4 -- Number of spaces inserted instead of a TAB character
vim.o.shiftwidth = 4 -- Number of spaces inserted when indenting

vim.o.spelllang = en, fr

vim.filetype.add({
	extension = {
		adoc = "asciidoctor",
		asciidoc = "asciidoctor",
	},
})
