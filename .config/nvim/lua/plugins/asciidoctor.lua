return {
    {
        "habamax/vim-asciidoctor", 
        ft = { "adoc", "asciidoc", "asciidoctor" },
        init = function()
            -- Set the executable
            vim.g.asciidoctor_executable = 'asciidoctor'
            -- Set the extensions (note: Lua uses {} for tables)
            vim.g.asciidoctor_extensions = { 
                'asciidoctor-diagram', 'asciidoctor-mathematical', 
                'asciidoctor-latexmath',
            }
            -- Path to your custom CSS
            -- vim.g.asciidoctor_css_path = vim.fn.expand('~/docs/AsciiDocThemes')
            -- vim.g.asciidoctor_css = 'haba-asciidoctor.css'
          
            vim.g.asciidoctor_pdf_executable = 'asciidoctor-pdf'
            vim.g.asciidoctor_pdf_extensions = {
                'asciidoctor-diagram', 'asciidoctor-mathematical', 
                'asciidoctor-latexmath',
            }
            -- vim.g.asciidoctor_pdf_themes_path = '~/docs/AsciiDocThemes'
            -- vim.g.asciidoctor_pdf_fonts_path = '~/docs/AsciiDocThemes/fonts'
        end
    },
}
