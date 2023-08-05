require("plugins")
require("Autocommands")
require("init")
require("funcs")
require("mappings")
require("configs.neovide")

-- lvim.colorscheme = "lunar"
-- lvim.colorscheme = "newpaper"
-- lvim.colorscheme = "tokyonight-storm"
-- lvim.transparent_window = true
lvim.colorscheme = "nightfox"
-- lvim.colorscheme = "duskfox"
-- lvim.colorscheme = "onedark"

-- lvim.colorscheme = "carbonfox"
-- let g:sonokai_style = 'andromeda'
-- vim.api.nvim_set_hl(0, "FoldColumn", { bg = "xxx" })

vim.cmd([[
" hi default link Todo Search
let g:jukit_mappings_ext_enabled = ["py", "ipynb","jl"]
hi FoldColumn guibg=NONE guifg=NONE
command! -nargs=0 TodoTroubleAuto execute 'TodoTrouble cwd=' . expand('%:p:h')

" hi! link WhichKeyBorder WhichKeyFloat

]])



vim.opt.spellfile = "/home/aneeq/.config/lvim/spell/en.utf-8.add"
-- vim.env.FZF_DEFAULT_OPTS = '--border=sharp --color=dark --color=fg:-1,bg:black,hl:2,fg+:15,bg+:0,hl+:2,info:14,spinner:15,border:white'
vim.opt.relativenumber = true
vim.o.foldlevel = 8
vim.g.maplocalleader = " "
vim.opt.wrap = true
vim.opt.textwidth = 120

----------------------------
-- vim.opt.spell = true
-- vim.opt.spelllang = { 'en_us' }

----------------------------

lvim.lazy.opts.defaults.lazy = true

lvim.builtin.which_key.setup.plugins.marks = true
lvim.builtin.which_key.setup.plugins.registers = true
lvim.builtin.which_key.setup.window.border = "none"
lvim.builtin.which_key.setup.plugins.presets = {
  operators    = true, -- adds help for operators like d, y, ...
  motions      = true, -- adds help for motions
  text_objects = true, -- help for text objects triggered after entering an operator
  windows      = true, -- default bindings on <c-w>
  nav          = true, -- misc bindings to work with windows
  z            = true, -- bindings for folds, spelling and others prefixed with z
  g            = true, -- bindings for prefixed with g
}

vim.list_extend(lvim.builtin.cmp.sources, {
  { name = "omni"},
  -- { name = "latex_symbols", option = { strategy = 2, }, filetype = { "tex", "latex" }, },
  { name = 'spell',
    option = {
      keep_all_entries = false,
      enable_in_context = function()
        return true
      end, },
  },

})

lvim.builtin.cmp.formatting.source_names["omni"] = "(Omni)"
lvim.builtin.cmp.formatting.source_names["spell"] = "(Spell)"
lvim.builtin.cmp.cmdline.enable = true

--------------------- UI Stuff -------------------

lvim.builtin.breadcrumbs.options.icons.Boolean = lvim.icons.kind.Boolean .. " "
-- lvim.icons.ui.ChevronRight = ""

-- lvim.builtin.breadcrumbs.options.separator = ""
lvim.builtin.telescope.theme = "ivy"
lvim.builtin.telescope.defaults.selection_caret = " "

local glyps = { "󰀘 ", "󰀘 ", "󰀘 ", " ", " ", " ", "󰚩 ", "󱄛 ", " ", " ", " ", " ",
  "󰣐 ", " ", }
-- local glyps = {"󰀘", "󰀘", "󰀘", "", "", "", "󰚩", "󱄛", "", "", "", "", "󰣐", "", }
local rand_glyph = glyps[math.random(#glyps)]
lvim.icons.ui.Target = rand_glyph

lvim.builtin.gitsigns.opts.signs.delete.text = "󰍵"
lvim.builtin.gitsigns.opts.signs.untracked = { text = "│" }
lvim.icons.diagnostics.BoldWarning = " "

lvim.builtin.telescope.defaults.prompt_prefix = lvim.icons.ui.Telescope .. "  "


-- if vim.g.neovide then
--   -- lvim.builtin.lualine.options.section_separators = { left = '', right = ''}
--   lvim.builtin.lualine.options.section_separators = { left = '', right = '' }
-- else
--   -- lvim.builtin.lualine.options.section_separators = { left = '', right = ''}
--   lvim.builtin.lualine.options.section_separators = { left = '', right = '' }
--   -- lvim.builtin.lualine.options.section_separators = { left = ' ', right = ' '}
--   -- lvim.builtin.lualine.options.section_separators = { left = ' ', right = ' '}
-- end

lvim.builtin.lualine.options.section_separators = { left = '', right = '' }
--------------------------------------------------------------------------------------------------------

lvim.builtin.which_key.mappings.w = nil
lvim.builtin.indentlines.options.char = nil
lvim.builtin.indentlines.options.context_char = nil

lvim.builtin.nvimtree.setup.renderer.indent_markers.enable = true

lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "json",
  "lua",
  "python",
  "markdown",
  "vim",
  "julia",
}


lvim.builtin.treesitter.matchup.enable = true
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true

-- generic LSP settings

-- -- make sure server will always be installed even if the server is in skipped_servers list
lvim.lsp.installer.setup.ensure_installed = {
  -- "sumneko_lua",
  "jsonls",
  -- "ruff",
  -- "ruff_lsp",
  "marksman",
  -- "ltex",
  -- "proselint",


}


lvim.builtin.telescope.pickers.initial_mode = "normal"

require("lvim.lsp.manager").setup("marksman")
require("lvim.lsp.manager").setup("alex")
require("lvim.lsp.manager").setup("ruff_lsp")
-- require("lvim.lsp.manager").setup("ruff")

------------- ruff setup
local on_attach = function(client, bufnr)
  -- Disable hover in favor of Pyright
  client.server_capabilities.hoverProvider = false
end

require('lspconfig').ruff_lsp.setup {
  on_attach = on_attach,
}


local code_actions = require "lvim.lsp.null-ls.code_actions"
code_actions.setup {
  {
    name = "proselint",
  },
}

local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  -- { name = "ruff" },
}

lvim.lsp.null_ls.setup.sources = {
  require("null-ls").builtins.diagnostics.vale,
}

lvim.format_on_save.enabled = false


---------------- pyright advance config

vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright", "texlab","ltex-ls" })
local pyright_opts = {
  single_file_support = true,
  settings = {
    pyright = {
      disableLanguageServices = false,
      disableOrganizeImports = false
    },
    python = {
      analysis = {
        autoImportCompletions = true,
        autoSearchPaths = true,
        diagnosticMode = "workspace", -- openFilesOnly, workspace
        typeCheckingMode = "off",     -- off, basic, strict
        useLibraryCodeForTypes = true
      }
    }
  },
}

require("lvim.lsp.manager").setup("pyright", pyright_opts)





table.insert(lvim.builtin.breadcrumbs.winbar_filetype_exclude, "minimap")


lvim.builtin.indentlines.filetype_exclude = {
  "help",
  "terminal",
  "lazy",
  "lspinfo",
  "TelescopePrompt",
  "TelescopeResults",
  "mason",
  "nvdash",
  "nvcheatsheet",
  "",
  "calendar",
  "noice"
}


------------------------------MANAGE VIRTUAL TEXT--------------------------------------------
vim.diagnostic.config({ virtual_text = false })
vim.diagnostic.config({ virtual_lines = false })

vim.api.nvim_set_keymap(
  'n',
  '<Leader>tv',
  '<Cmd>lua virtual_text_toggle()<CR>',
  { silent = true, noremap = true }
)


vim.api.nvim_set_keymap(
  'n',
  '<Leader>tn',
  '<Cmd>lua virtual_lines_toggle()<CR>',
  { silent = true, noremap = true }
)

require 'nvim-web-devicons'.setup {
  override_by_extension = {
    ["md"] = {
      icon = " ",
      name = "Markdown"
    }
  },
}

lvim.builtin["terminal"].shade_terminals = true
-- lvim.builtin["terminal"].shading_factor = -10

-- local nvim_lsp = require("lspconfig")

-- local path = vim.fn.stdpath 'config' .. '/spell/en.utf-8.add'
-- local words = {}

-- for word in io.open(path, 'r'):lines() do
--   table.insert(words, word)
-- end
-- nvim_lsp.ltex.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
--   settings = {
--     ltex = {
--       disabledRules = {
--         ['en-US'] = { 'PROFANITY' },
--         ['en-GB'] = { 'PROFANITY' },
--       },
--       dictionary = {
--         ['en-US'] = words,
--         ['en-GB'] = words,
--       },
--     },
--   },
-- }
--

