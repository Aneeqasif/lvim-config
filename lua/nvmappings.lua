---@type MappingsTable
opts = {noremap = false }
local M = {}


M.disabled = {
  n = {
      ["<leader>n"] = "",
  }
}


M.general = {
  n = {
    -- [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>as"] = { "vim.diagnostic.open_float", "show diagnostics", opts = { noremap = true } },

    ["Q"] = { "@q", "apply macro normal mode" },
    ["<C-d>"] = { "<C-d>zz", "scroll down and center" },
    ["<C-u>"] = { "<C-u>zz", "scroll down and center" },

    ["<C-P>"] = {"<cmd>lua require('fzf-lua').files()<CR>", "find fzf files", 
      opts= { noremap = true, silent = true } },

    ["<leader>fu"] = {"<cmd>Telescope undo<cr>", "open undo tree in telescope"},

    ["<leader>fi"] = {"<cmd>Telescope adjacent<cr>",
      "find files in adjecent directories relative to buffer"},
    ["<leader>ls"] = { "<cmd>SymbolsOutline<CR>", "toggle lsp SymbolsOutline" },

    ["<leader>cd"] = { "[[:execute 'cd ' .. expand('%:p:h')<CR>:execute 'pwd'<CR>]]",
      "change cwd of nvim",opts = { noremap = true, silent = true } },

    ["<leader>vp"] = { "<cmd>PeekOpen<CR>", "peek in markdown" },
    ["<M-,>"] = {"<cmd> Telescope <CR>", "Telescope"},
    ["<leader>og"] = { ":LazyGit<CR>", "LazyGit" },

    ["<leader>tt"] = {
      function()
         require("base46").toggle_transparency()
      end,
      "toggle transparency",
    },

},

  v = {
    ["Q"] = { "<cmd>norm @q<cr>", "apply macro visual mode" },
    ["y"] = { "ygv<esc>", "keep cursor possition after yanking in visual mode" },

  }
}


M.terminal = {
    t = {
        ["<C-h>"] = {"<C-\\><C-N><C-h>" , opts = {noremap = true }} ,
        ["<C-j>"] = {"<C-\\><C-N><C-j>" , opts = {noremap = true }} ,
        ["<C-k>"] = {"<C-\\><C-N><C-k>" , opts = {noremap = true }} ,
        ["<C-l>"] = {"<C-\\><C-N><C-l>" , opts = {noremap = true }} ,
    },
}


M.vimtex = {
  n = {
    ["<leader>lb"] = { "<cmd> VimtexCompile<CR>", "Compile latex with vimtex" },
    -- ["<leader>le"] = { "<cmd> VimtexErrors<CR>", "Vimtex Errors" },
    -- ["<leader>lt"] = { "<cmd> VimtexTocToggle<CR>", "Toggle TOC in Latex" },
    -- ["<leader>li"] = { '<cmd>lua vim.fn.feedkeys(string.format("%c%c%c(vimtex-info)", 0x80, 253, 83))<CR>' },
    ["<leader>li"] = { '<Plug>(vimtex-info)' ,"vim tex info", opts = {noremap = false } },  
    ["<leader>lin"] = { '<plug>(wiki-link-follow)' ,"wiki-index", opts = {noremap = false } },  

  },
}



M.lspconfig = {
  plugin = true,

--   -- See `<cmd> :help vim.lsp.*` for documentation on any of the below functions

  n = {
    ["<leader>as"] = {'<cmd>lua vim.diagnostic.open_float()<CR>',},
      -- "show lsp floating info", }
    ["<leader>tl"] = {'<cmd>lua require("lsp_lines").toggle()<CR>', "toggle lsp virtual lines", },
--     
	},
}

M.fun = {
  n = {
['<leader>mit'] = {"<cmd>CellularAutomaton make_it_rain<CR>", "make it rain", opts=opts},
['<leader>mig'] = {"<cmd>CellularAutomaton game_of_life<CR>", "make it rain", opts=opts},
  },
}



M.dap = {
  n = {
    ['<leader>dct'] = {'<cmd>lua require"dap".continue()<CR>'},
    ['<leader>dut'] = {'<cmd>lua require"dapui".toggle()<CR>'},
    ['<leader>dsv'] = {'<cmd>lua require"dap".step_over()<CR>'},
    ['<leader>dsi'] = {'<cmd>lua require"dap".step_into()<CR>'},
    ['<leader>dso'] = {'<cmd>lua require"dap".step_out()<CR>'},
    ['<leader>dtb'] = {'<cmd>lua require"dap".toggle_breakpoint()<CR>'},
    -- ['<leader>dsc'] = {'<cmd>lua require"dap.ui.variables".scopes()<CR>'},
    -- ['<leader>dhh'] = {'<cmd>lua require"dap.ui.variables".hover()<CR>'},
    -- ['<leader>dhv'] = {'<cmd>lua require"dap.ui.variables".visual_hover()<CR>'},
    ['<leader>duh'] = {'<cmd>lua require"dap.ui.widgets".hover()<CR>'},
    ['<leader>duf'] = {"<cmd>lua local widgets=require'dap.ui.widgets';widgets.centered_float(widgets.scopes)<CR>"},
    ['<leader>dsbr']= {'<cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>'},
    ['<leader>dsbm'] = {'<cmd>lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>'},
    ['<leader>dro'] = {'<cmd>lua require"dap".repl.open()<CR>'},
    -- ['<leader>drl'] = {'<cmd>lua require"dap".repl.run_last()<CR>'},

  }
}


M.treesitter = {
  n = {
    ["<leader>cu"] = { "<cmd> TSCaptureUnderCursor <CR>", "  find media" },
  },
}



return M
