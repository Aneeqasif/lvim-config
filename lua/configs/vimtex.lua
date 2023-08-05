-- Notice that these options are window and buffer local options
vim.wo.conceallevel = 2
vim.bo.spelllang = "en_gb"


vim.g.vimtex_syntax_conceal = {
    sections = 1,
}


-- -- PDF viewer settings
-- -- for zathura

vim.g.vimtex_view_general_viewer = "zathura"
vim.g.vimtex_view_method = "zathura"
vim.g['vimtex_context_pdf_viewer'] = 'zathura'

-- for sioyek
-- vim.g.vimtex_context_pdf_viewer = "sioyek"
-- vim.g.vimtex_view_method = "sioyek"

-- vim.g.vimtex_context_pdf_viewer = "okular"
-- vim.g.vimtex_view_general_viewer = "okular"
-- vim.g.vimtex_view_general_options = "--unique file:@pdf\\#src:@line@tex"


vim.g.vimtex_mappings_prefix = "<localleader>v"

vim.g.vimtex_toc_config = {
    show_help = 0,
    layer_status = {
        content = 1,
        label = 0,
        todo = 1,
        include = 0
    }
}

vim.g.vimtex_log_ignore = {
    "Underfull \\\\hbox",
    "Overfull \\\\hbox",
    "LaTeX Warning: .\\+ float specifier changed to",
    "LaTeX hooks Warning",
    'Package siunitx Warning: Detected the "physics" package:',
    "Package hyperref Warning: Token not allowed in a PDF string",
    "Compilation completed",
}

vim.g.vimtex_quickfix_mode = 0

vim.g.vimtex_fold_enabled = 1
vim.g.vimtex_fold_manual = 1

-- vim.g.vimtex_compiler_latexmk = {
--     options = {
--       "-verbose",
--       "-file-line-error",
--       "-synctex=1",
--       "-interaction=nonstopmode",
--       "-shell-escape",
--     }
-- }


-- ___________________________________________________________


-- -- Disable imaps (using Ultisnips)
-- -- vim.g.vimtex_imaps_enabled = 0
-- -- Do not open pdfviwer on compile
-- -- vim.g.vimtex_view_automatic = 0
-- -- Disable conceal
-- vim.g.vimtex_syntax_conceal = {
--     accents = 1,
--     cites = 1,
--     fancy = 1,
--     greek = 1,
--     math_bounds = 1,
--     math_delimiters = 1,
--     math_fracs = 1,
--     math_super_sub = 1,
--     math_symbols = 1,
--     sections = 1,
--     styles = 1,
-- }
-- vim.api.nvim_command('set conceallevel=2')


-- --  for okular

-- -- vim.g['vimtex_context_pdf_viewer'] = 'okular'
-- -- vim.g.vimtex_view_general_viewer = "okular"
-- -- vim.cmd([[

-- --     let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
-- --     " let g:vimtex_view_general_options_latexmk = '--unique' 
-- -- ]])




-- vim.g.tex_conceal= "abdmg"

-- vim.cmd([[


-- let g:vimtex_mappings_prefix = '<localleader>v'
-- let g:vimtex_imaps_leader = "`"


-- " let g:vimtex_grammar_textidote = {
-- "       \ 'jar': '/usr/share/java/textidote.jar',
-- "       \ 'args': '',
-- "       \}

-- set spelllang=en_gb


-- " let g:vimtex_grammar_vlty = {
-- "       \ 'lt_directory': '/usr/bin/',
-- "       \ 'lt_command': 'languagetool',
-- "       \ 'lt_disable': 'WHITESPACE_RULE',
-- "       \ 'lt_enable': '',
-- "       \ 'lt_disablecategories': '',
-- "       \ 'lt_enablecategories': '',
-- "       \ 'server': 'my',
-- "       \ 'shell_options': '',
-- "       \ 'show_suggestions': 1,
-- "       \ 'encoding': 'auto',
-- "       \}



-- " let g:livepreview_engine = 'latexmk' . ' ["-shell-escape"]' 
-- let g:vimtex_complete_enabled = 1
-- " let g:vimtex_compiler_progname = 'nvr'
-- " let g:vimtex_compiler_latexmk.options += ['-shell-escape']
-- " Silent all messages
-- " let g:vimtex_compiler_silent=1

-- let g:vimtex_toc_config = {
--     \'split_width':  30,
--     \'show_help':  0,
--     \'layer_status' : { 
--         \'content': 1,
--         \'label': 0,
--         \'todo': 1,
--         \'include': 0 
--     \ }
--     \}

-- let g:vimtex_log_ignore = [
--       \ 'Underfull \\hbox',
--       \ 'Overfull \\hbox',
--       \ 'LaTeX Warning: .\+ float specifier changed to',
--       \ 'LaTeX hooks Warning',
--       \ 'Package siunitx Warning: Detected the "physics" package:',
--       \ 'Package hyperref Warning: Token not allowed in a PDF string',
--       \ 'Compilation completed',
--       \]

-- " let g:vimtex_compiler_latexmk = {
-- "     \ 'options' : [
-- "     \   '-shell-escape',
-- "     \   '-verbose',
-- "     \   '-file-line-error',
-- "     \   '-synctex=1',
-- "     \   '-interaction=nonstopmode',
-- "     \ ],
-- "     \}

-- " let vim.g.vimtex_compile_latexmk_engines = {
-- "   ['_'] = '-xelatex',
-- " }

-- ]])


-- -- Disable quickfix auto open
-- vim.g.vimtex_quickfix_ignore_mode = 0

-- -- vim.g.vimtex_view_general_options = "-reuse-instance -forward-search @tex @line @pdf"
-- -- Do not auto open quickfix on compile erros
-- vim.g.vimtex_quickfix_mode = 0



-- vim.g.vimtex_fold_enabled = 1
-- vim.g.vimtex_fold_manual = 1



-- Latex warnings to ignore
-- vim.g.vimtex_quickfix_ignore_filters = {
--     "Command terminated with space",
--     "LaTeX Font Warning: Font shape",
--     "Package caption Warning: The option",
--     [[Underfull \\hbox (badness [0-9]*) in]],
--     "Package enumitem Warning: Negative labelwidth",
--     [[Overfull \\hbox ([0-9]*.[0-9]*pt too wide) in]],
--     [[Package caption Warning: Unused \\captionsetup]],
--     "Package typearea Warning: Bad type area settings!",
--     [[Package fancyhdr Warning: \\headheight is too small]],
--     [[Underfull \\hbox (badness [0-9]*) in paragraph at lines]],
--     "Package hyperref Warning: Token not allowed in a PDF string",
--     [[Overfull \\hbox ([0-9]*.[0-9]*pt too wide) in paragraph at lines]],
-- }



-- vim.g.vimtex_fold_types = {
--     cmd_addplot = {
--         cmds = { "addplot[+3]?" },
--     },
--     cmd_multi = {
--         cmds = {
--             "%(re)?new%(command|environment)",
--             "providecommand",
--             "presetkeys",
--             "Declare%(Multi|Auto)?CiteCommand",
--             "Declare%(Index)?%(Field|List|Name)%(Format|Alias)",
--         },
--     },
--     cmd_single = {
--         cmds = { "hypersetup", "tikzset", "pgfplotstableread", "lstset" },
--     },
--     cmd_single_opt = {
--         cmds = { "usepackage", "includepdf" },
--     },
--     comments = {
--         enabled = 0,
--     },
--     env_options = vim.empty_dict(),
--     envs = {
--         blacklist = {},
--         whitelist = { "figure", "frame", "table", "example", "answer" },
--     },
--     items = {
--         enabled = 0,
--     },
--     markers = vim.empty_dict(),
--     preamble = {
--         enabled = 0,
--     },
--     sections = {
--         parse_levels = 0,
--         parts = { "appendix", "frontmatter", "mainmatter", "backmatter" },
--         sections = {
--             "%(add)?part",
--             "%(chapter|addchap)",
--             "%(section|section\\*)",
--             "%(subsection|subsection\\*)",
--             "%(subsubsection|subsubsection\\*)",
--             "paragraph",
--         },
--     },
-- }
