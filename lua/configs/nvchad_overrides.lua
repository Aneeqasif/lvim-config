local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "c",
    "markdown",
    "bash",
    "python"
  },
  indent = {
    enable = true,
    disable = {
      "python"
    },
  },
}



M.blankline = {
  indentLine_enabled = 1,
  filetype_exclude = {
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
}



M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",
    "ruff",
    "ruff-lsp",
    "julia-lsp",
    "marksman",
    "pyright",
    "cmake-language-server",
    "fortls",
    -- "bashls",
    "black",
    "ltex-ls",
    "vale",
    "proselint",
    "latexindent"
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  view = {
     -- adaptive_size = false,
     -- side = "right",
     -- width = 27,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

M.telescope = {
  extensions = {
    undo = {
      use_delta = true,
  },

  adjacent = {
      level = 2 -- default
  },

  fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case" the default case_mode is "smart_case"
  },
  media_files = {
    -- filetypes whitelist
    -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
    filetypes = {"png", "webp", "jpg", "jpeg"},
    -- find command (defaults to `fd`)
    find_cmd = "rg"
    },
  file_browser = {
    -- theme = "ivy",
    -- disables netrw and use telescope-file-browser in its place
    hijack_netrw = true,
    mappings = {
      ["i"] = {
        -- your custom insert mode mappings
      },
      ["n"] = {
        -- your custom normal mode mappings
              },
      },
    },
  },

      -- extensions_list = { "themes", "terms", "undo", "adjacent","fzf", "search_dir_picker", "file_browser", "bibtex" }
extensions_list = {
    "themes", "terms", "undo", "adjacent", "search_dir_picker", "file_browser", "bibtex", "media_files" }
}

M.lspconfig = {
  capabilities= {textDocument= {foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true, },
}}}

M.nvimtree= { renderer =  { icons = { glyphs = {
        default = "󰈚 ",
        symlink = " ",
        folder = {
          default = "󰉋 ",
          empty = " ",
          empty_open = " ",
          open = " ",
          symlink = "",
          symlink_open = " ",
          arrow_open = "",
          arrow_closed = "",
        },
        git = {
          unstaged = "✗",
          staged = "✓",
          unmerged = " ",
          renamed = "➜",
          untracked = "★",
          deleted = "",
          ignored = "◌",
        },

} }}

}

-- -- -- -- --  -- -- -- --  -- -- -- --  CMP + UltiSnipsUltiSnips
local cmp = require'cmp'

local function cmp_ultimap()
  return require'cmp_nvim_ultisnips.mappings'
end

M.cmp = {


 snippet = {
    expand = function(args)
      vim.fn["UltiSnips#Anon"](args.body)
    end,
  },


  mapping = {
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),
    ["<CR>"] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = false,
      },
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        cmp_ultimap(fallback)
        fallback()
      end
    end, {
      "i",
      "s",
    }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        cmp_ultimap(fallback)
        fallback()
      end
    end, {
      "i",
      "s",
    }),
  },

  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "nvim_lua" },
    { name = "path" },
    { name = 'ultisnips' },
    { name = "omni" },
  },

}

return M
