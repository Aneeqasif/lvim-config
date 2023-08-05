lvim.plugins = {


  { "folke/lazy.nvim",
    version = "stable",
    opts = {
      lazy = true,
    }
  },
  ------------------------------markdown wiki stuff --------------------------------------------------------
  { "SidOfc/mkdx",
    -- enabled = false,
    ft = { "markdown" },
    config = function()
      require("configs.mkdx")
    end
  },

  { "itchyny/calendar.vim",
    -- enabled=false,
  },


  { "lervag/wiki.vim",
    -- enabled = false,
    lazy = false,
    ft = { "markdown" },
    cmd = { "WikiIndex", "WikiJournal" },
    keys = {
      { "<leader>ww", "<cmd>WikiIndex<cr>", desc = "Wiki Index" },
    },
    init = function()
      vim.cmd([[
      let g:wiki_root = '~/Documents/vimwiki/'
      let g:wiki_filetypes = ['md','wiki']
      " let g:wiki_link_target_type = 'wiki'
      let g:wiki_select_method = "fzf"
      " let g:wiki_fzf_pages_opts = '--preview "bat --color=always {1}"'
      let g:wiki_fzf_pages_opts = '--preview "glow {1}"'
      let g:wiki_fzf_tags_opts = '--preview "bat --color=always {2..}"'

          "" Templates

    let g:wiki_templates = [
          \ { 'match_re': 'index*',
          \   'source_filename': '/home/aneeq/Documents/vimwiki/journal/.template.md'},
          \]

      let g:wiki_link_creation = {
            \ 'md': {
            \   'link_type': 'wiki',
            \   'url_extension': '',
            \   'url_transform': { x ->
            \     substitute(x, '\s\+', '-', 'g') },
            \ },
            \}
      " let g:wiki_tag_parsers = [g:wiki#tags#default_parser]

      let g:wiki#tags#default_parser = {
            \ 're_match': '\v%(^|\s):\zs[^: ]+\ze:',
            \ 're_findstart': '\v%(^|\s):\zs[^: ]+$'
            \}

      function! g:wiki#tags#default_parser.match(line) dict abort
        return a:line =~# self.re_match
      endfunction

      function! g:wiki#tags#default_parser.parse(line) dict abort
        let l:tags = []
        let l:tag = matchstr(a:line, self.re_match, 0)

        while !empty(l:tag)
          call add(l:tags, l:tag)
          let l:tag = matchstr(a:line, self.re_match, 0, len(l:tags) + 1)
        endwhile

        return l:tags
      endfunction

      function! g:wiki#tags#default_parser.make(taglist, curline='') dict abort
        return empty(a:taglist) ? '' : join(map(a:taglist, '":" . v:val . ":"'))
      endfunction

      let s:tag_parser = deepcopy(g:wiki#tags#default_parser)
      let s:tag_parser.re_match = '\v%(^|\s)#\zs[^# ]+'
      let s:tag_parser.re_findstart = '\v%(^|\s)#\zs[^# ]+'
      let s:tag_parser.make = {t, l -> empty(t) ? '' : join(map(t, '"#" . v:val'))}

      let g:wiki_tag_parsers = [s:tag_parser]

      let g:wiki_fzf_pages_force_create_key = "alt-n"

    let g:wiki_link_schemes = {
          \ 'wiki': {
          \   'resolver': function('personal#wiki#link_resolver'),
          \ }
          \}




      " augroup init_calendar
      "   autocmd!
      "   autocmd FileType calendar
      "         \ nnoremap <silent><buffer> <cr>
      "         \ :<c-u>call wiki#journal#open()<cr>
      " augroup END


      ]])
    end,
  },


  { 'vimwiki/vimwiki',
    enabled = false,
    lazy = false,
    init = function()
      vim.cmd([[
      let g:vimwiki_listsyms = '✗○◐●✓'
      " let g:vimwiki_listsyms = ' ○󱎖●✓'
      " let g:vimwiki_listsyms = ' .oO✓'
      let g:vimwiki_list = [{'path':'~/Documents/vimwiki/','syntax': 'markdown',
        \ 'ext': '.md','links_space_char': ' ' }]

      " list of additional fileypes that should be registered to vimwiki files
      " let g:vimwiki_filetypes = ['markdown', 'pandoc']
      let g:vimwiki_global_ext = 0
      let g:vimwiki_markdown_link_ext = 1

      let g:vimwiki_key_mappings = {
            \ 'mouse': '1'
            \ }
      command! Diary VimwikiDiaryIndex
      augroup vimwikigroup
          autocmd!
          " automatically update links on read diary
          autocmd BufRead,BufNewFile diary.wiki VimwikiDiaryGenerateLinks
      augroup end
      ]])
    end,
  },

  { "renerocksai/telekasten.nvim", -- enabled =false,
    ft = { "vimwiki", "markdown" },
    -- dependencies = {"nvim-telescope/telescope.nvim","renerocksai/calendar-vim" },
    -- lazy=true,
    -- enabled = false,
    cmd = { "Telekasten" },
    keys = {
      { "<leader>zp",  "<cmd>Telekasten panel<cr>",              desc = "teleksten panel" },
      { "<leader>zb",  "<cmd>Telekasten show_backlinks<cr>",     desc = "backlinks" },
      { "<leader>zf",  "<cmd>Telekasten find_notes<cr>",         desc = "find" },
      { "<leader>zg",  "<cmd>Telekasten follow_link<cr>",        desc = "follow link" },
      { "<leader>zl",  "<cmd>Telekasten insert_link<cr>",        desc = "insert link" },
      { "<leader>zn",  "<cmd>Telekasten new_templated_note<cr>", desc = "new" },
      { "<leader>zs",  "<cmd>Telekasten search_notes<cr>",       desc = "search" },
      { "<leader>zvi", "<cmd>Telekasten paste_img_and_link<cr>", desc = "paste image" },
      { "<leader>zt",  "<cmd>Telekasten show_tags<cr>",          desc = "tags" },
      { "<leader>oc",  "<cmd>Telekasten show_calendar<cr>",      desc = "calendar" },
      { "<leader>zF",  "<cmd>Telekasten find_friends<cr>",       desc = "find_friends" },
      {
        '<leader>zU',
        ':lua require("telekasten").follow_link({follow_tag="#urgent"})<CR>',
        desc = "Find Urgent"
      },
    },

    config = require("configs.telekasten")
  },

  { 'lukas-reineke/headlines.nvim',
    -- enabled = false,
    dependencies = "nvim-treesitter/nvim-treesitter",
    ft = { "markdown", "vimwiki", "org" },
    config = true,     -- or `opts = {}`
    opts = require("configs.headlines")
  },

  { "ellisonleao/glow.nvim", cmd = "Glow",       config = require("configs.glow"), },

  { "toppair/peek.nvim",
    event = { "BufRead", "BufNewFile" },
    build = "deno task --quiet build:fast",
    config = require("configs.peek"),
    ft = { "markdown", "vimwiki" }
  },

  { "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    init = function() vim.g.mkdp_filetypes = { "markdown" } end,
    ft = { "markdown" },
    config = function()
      vim.g.mkdp_auto_start = 1
      -- vim.g.mkdp_browser = 'qutebrowser'
      vim.cmd([[
          function OpenMarkdownPreview (url)
            execute "silent ! firefox --kiosk --new-window " . a:url
          endfunction
          let g:mkdp_browserfunc = 'OpenMarkdownPreview'
        ]])
    end,
    keys = {
      { "<leader>vmp", "<cmd>MarkdownPreviewToggle<cr>", desc = "markdown preview" },
    },
  },

  { 'ixru/nvim-markdown',
    enabled = false,
    ft = { "markdown" },
    init = function()
      vim.cmd([[
          let g:vim_markdown_no_default_key_mappings = 1
        ]])
    end,
  },


  { "epwalsh/obsidian.nvim",
    lazy = true,
    -- event = { "BufReadPre path/to/my-vault/**.md" },
    -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand':
    event = { "BufReadPre " .. vim.fn.expand "~" .. "/Documents/vimwiki/**.md" },
    keys = {
      { "<leader>ob", "<cmd>ObsidianOpen<cr>", desc = "Open with obsidian" },

    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
      "nvim-telescope/telescope.nvim",
      -- "ibhagwan/fzf-lua"
      -- "godlygeek/tabular",
    },
    opts = require("configs.obsidian"),
    config = function(_, opts)
      require("obsidian").setup(opts)

      -- Optional, override the 'gf' keymap to utilize Obsidian's search functionality.
      -- see also: 'follow_url_func' config option below.
      vim.keymap.set("n", "gf", function()
        if require("obsidian").util.cursor_on_markdown_link() then
          return "<cmd>ObsidianFollowLink<CR>"
        else
          return "gf"
        end
      end, { noremap = false, expr = true })
    end,
  },

  -------------------------------- LSP Stuff -------------------------------------------------------------------

  { url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    lazy = false,
    config = function()
      require("lsp_lines").setup()
    end,
  },

  { "rmagatti/goto-preview",
    config = function()
      require('goto-preview').setup {
        width = 120,              -- Width of the floating window
        height = 25,              -- Height of the floating window
        default_mappings = false, -- Bind default mappings
        debug = false,            -- Print debug information
        opacity = nil,            -- 0-100 opacity level of the floating window where 100 is fully transparent.
        post_open_hook = nil,     -- A function taking two arguments, a buffer and a window to be ran as a hook.
        -- You can use "default_mappings = true" setup option
        -- Or explicitly set keybindings
        vim.cmd("nnoremap gpd <cmd>lua require('goto-preview').goto_preview_definition()<CR>"),
        vim.cmd("nnoremap gP <cmd>lua require('goto-preview').close_all_win()<CR>")
        -- vim.cmd("nnoremap gpi <cmd>lua require('goto-preview').goto_preview_implementation()<CR>")
      }
    end
  },

  { "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline",
    config = function()
      require("symbols-outline").setup {
        opts = require("configs.symbols")
      }
    end,
  },

  { "ray-x/lsp_signature.nvim",
    -- enabled = false,
    event = "BufRead",
    config = function() require "lsp_signature".on_attach() end,
  },

  { "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },

  ------------------------------- Language Realated -------------------------------------------------------------

  { 'elkowar/yuck.vim',
    lazy = true,
    ft = { "yuck" }
  },

  { "luk400/vim-jukit",
    -- enabled=false,
    lazy = true,
    ft = { 'julia', 'python', 'r', 'matlab', 'json' },
    config = function()
      require("configs.jukit")
      -- vim.api.nvim_command('source /home/aneeq/.config/nvim/lua/configs/jukit.vim')
    end
  },

  { 'kdheepak/JuliaFormatter.vim',
    ft = { "jl" },
  },

  { 'JuliaEditorSupport/julia-vim',
    lazy = false,
    ft = { "julia", "jl" }
  },

  { 'michaelb/sniprun',
    enabled = false,
    -- build = 'bash ./install.sh'
    -- lazy=false,
    config = function()
      require("configs.sniprun")
    end,
  },

  -------------------------------- Colorschems ------------------------------------------------------------------


  { "arzg/vim-colors-xcode",
    lazy = false,
  },

  { "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    event = "VeryLazy",
    opts  = require("configs.catppuccin")
  },

  { "yorik1984/newpaper.nvim",
    -- event = "VeryLazy",
    -- lazy = false,
    config = function()
      require("newpaper").setup({
        -- style = "light"
      })
    end
  },

  { "EdenEast/nightfox.nvim",
    lazy = false,
    config = function()
      require('nightfox').setup({
        options = {
          dim_inactive = false,
          transparent = false,
          styles = {               -- Style to be applied to different syntax groups
                comments = "italic",     -- Value is any valid attr-list value `:help attr-list`
                conditionals = "italic",
                constants = "NONE",
                functions = "bold",
                keywords = "NONE",
                numbers = "NONE",
                operators = "NONE",
                strings = "NONE",
                types = "NONE",
                variables = "NONE",
              },
        }
      })
    end
  },

  {'srcery-colors/srcery-vim',
    lazy=false,
    name = 'srcery'},

  { 'projekt0n/github-nvim-theme',
    -- lazy = false, -- make sure we load this during startup if it is your main colorscheme
    -- priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require('github-theme').setup({
        -- ...
      })
    end,
  },

  { 'navarasu/onedark.nvim',
    lazy = false,
    config = function()
      require('onedark').setup {

        -- style = 'light',
        highlights = {
          ["FoldColumn"] = { bg = "NONE" },
        },
        lualine = {
          transparent = true,
        },
      }
      -- require('onedark').load()
      vim.o.background = 'light'

      vim.cmd("highlight FoldColumn guibg=NONE guifg=NONE")
    end
  },

  { "bluz71/vim-nightfly-colors",
    name = "nightfly",
    lazy = false,
    priority = 1000
  },

  { 'rose-pine/neovim',      name = 'rose-pine', lazy = false, },

  { "rebelot/kanagawa.nvim",
    event = "VeryLazy",
    config = function()
      require("configs.kanagawa")
    end
  },

  { "sainnhe/sonokai" },

  { "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },

  -- {"nyoom-engineering/oxocarbon.nvim"},

  -------------------------------- UltiSnips Stuff --------------------------------------------------------------

  { "hrsh7th/cmp-omni",
    event = { "InsertEnter", "CmdlineEnter" },
  },

  -- { "kdheepak/cmp-latex-symbols",
  --   lazy=false,
  -- },

  { "quangnguyen30192/cmp-nvim-ultisnips",
    enabled = false,
    ft = "tex",
    config = function()
      require("cmp_nvim_ultisnips").setup {}
    end,
  },

  { "SirVer/ultisnips",
    lazy = false,
    init = function()
      require("configs.ultisnips")
    end
  },

  { "honza/vim-snippets", enabled=false},
  ---------------------------------- AI -------------------------------------------------------------------------

  { "jackMort/ChatGPT.nvim",
    enabled = false,
    event = "VeryLazy",
    config = function()
      require("chatgpt").setup()
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    }
  },

  { 'Exafunction/codeium.vim',
    event = "BufEnter",
    config = function()
      -- Change '<C-g>' here to any keycode you like.
      vim.keymap.set('i', '<C-f>', function() return vim.fn['codeium#Accept']() end, { expr = true })
      vim.keymap.set('i', '<c-;>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true })
      vim.keymap.set('i', '<c-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true })
      vim.keymap.set('i', '<c-x>', function() return vim.fn['codeium#Clear']() end, { expr = true })
      vim.cmd([[
        let g:codeium_filetypes = {
        \ "bash": v:false,
          \ "typescript": v:true,
        \ }
        ]])
    end
  },

  ---------------------------------- Functionality Enhancment ---------------------------------------------------

  -- {"github/copilot.vim"},

  { "amrbashir/nvim-docs-view",
    cmd = { "DocsViewToggle" },

    keys = {
      { "<leader>lt", "<cmd>DocsViewToggle<cr>",
        mode = { "n"},
        desc = "Toggle DocsView",
        },
      },
    config = function()
        require("docs-view").setup {
        -- position = "bottom",
        -- height = 15,
        --
        position = "right",
        width = 70,
      }
        end
  },


  { "junegunn/vim-easy-align",
    keys = {
      {
        "<leader>ea",
        "<plug>(LiveEasyAlign)",
        mode = { "n", "v" },
        desc = "LiveEasyAlign",
      },
      {
        "<leader>eA",
        "<plug>(EasyAlign)",
        mode = { "n", "v" },
        desc = "EasyAlign",
      },
      {
        ".",
        "<plug>(EasyAlignRepeat)",
        mode = "v",
        desc = "EasyAlignRepeat",
      },
    },
    config = function()
      vim.g.easy_align_bypass_fold = 1
    end,
  },


  -- { "xorid/asciitree.nvim",
  --   cmd = { "AsciiTree" },
  -- },

  { "AndrewRadev/linediff.vim",
    keys = {
      { "<leader>ed", ":Linediff<cr> ",            mode = "x",            desc = "linediff" },
      { "<leader>ed", "<plug>(linediff-operator)", desc = "linediff" },
    },

    config = function()
      vim.api.nvim_create_autocmd("User", {
        group = vim.api.nvim_create_augroup("init_linediff", { clear = true }),
        pattern = "LinediffBufferReady",
        desc = "Linediff buffer ready",
        command = [[ nnoremap <buffer> <space>eq :LinediffReset<cr> ]],
      })
    end,
  },

  { "airblade/vim-rooter",
    lazy = false,
    config = function()
      vim.g.rooter_patterns = { ".git", ".hg", ".bzr", ".svn", "build.sbt" }
      vim.g.rooter_silent_chdir = 1
    end,
  },

  { "ggandor/leap.nvim",
    lazy = false,
    name = "leap",
    config = function()
      require("leap").add_default_mappings()
      vim.keymap.del({ 'x', 'o' }, 'x')
      vim.keymap.del({ 'x', 'o' }, 'X')
      -- To set alternative keys for "exclusive" selection:
      vim.keymap.set({ 'x', 'o' }, "t", '<Plug>(leap-forward-till)')
      vim.keymap.set({ 'x', 'o' }, "t", '<Plug>(leap-backward-till)')
    end,
  },

  { 'wakatime/vim-wakatime',
    lazy = false,
  },


  { "ggandor/flit.nvim",
    -- enabled = false,
    lazy = false,
    config = function()
      require('flit').setup {
        keys = { f = 'f', F = 'F', t = 't', T = 'T' },
        -- A string like "nv", "nvo", "o", etc.
        labeled_modes = "v",
        multiline = true,
        -- Like `leap`s similar argument (call-specific overrides).
        -- E.g.: opts = { equivalence_classes = {} }
        opts = {}
      }
    end
  },

  { "tpope/vim-repeat",
    lazy = false,
  },

  { 'AckslD/muren.nvim',
    config = true,
    cmd = "MurenToggle",
  },

  { "ethanholz/nvim-lastplace",
    lazy = false,
    event = "BufRead",
    config = function()
      require("nvim-lastplace").setup({
        lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
        lastplace_ignore_filetype = {
          "gitcommit", "gitrebase", "svn", "hgcommit",
        },
        lastplace_open_folds = true,
      })
    end,
  },

  { 'echasnovski/mini.move',
    config = function()
      require('mini.move').setup()
    end,
    version = '*'
  },

  { 'Vonr/align.nvim',
    config = function()
      require('configs.align')
    end
  },

  { "folke/todo-comments.nvim",
    event = "BufRead",
    -- config = function()
    --     require("todo-comments").setup()
    --   end,
    opts = require("configs.todo-comments")
  }, -- PERF

  -- TODO: csdca
  -- HACK: scsadc
  -- WARN: sdcasd j
  -- PERF: sdcasdc
  -- NOTE: scad
  -- TEST: adcsdca
  -- INFO: sdcsdca
  -- FIXME: sdcsds

  { "okuuva/auto-save.nvim",
    lazy = false,
    opts = require("configs.autosave"),
    keys = {
      { "<leader>ts", ":ASToggle<CR>", desc = "Toggle auto-save" },
    },
  },


  { "folke/zen-mode.nvim",
    cmd = "ZenMode",
    opts = require("configs.zenmode"),
    keys = { { "<leader>tz", "<cmd>ZenMode<cr>", desc = "Zen Mode" } },
  },

  { "tpope/vim-surround",
    lazy = false,
  },

  { 'jghauser/mkdir.nvim',   lazy = false, },

  { 'echasnovski/mini.jump', version = '*', lazy = false },

  { "kdheepak/lazygit.nvim",
    -- lazy=false,
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },

  { "ray-x/sad.nvim",
    lazy = false,
    dependencies = { "ray-x/guihua.lua", run = "cd lua/fzy && make" },
    config = function()
      require("sad").setup {
        -- debug = false, -- print debug info
        -- diff = 'delta', -- you can use `less`, `diff-so-fancy`
        -- ls_file = 'fd', -- also git ls-files
        -- exact = false, -- exact match
        -- vsplit = false, -- split sad window the screen vertically, when set to number
        -- -- it is a threadhold when window is larger than the threshold sad will split vertically,
        -- height_ratio = 0.6, -- height ratio of sad window when split horizontally
        -- width_ratio = 0.6, -- height ratio of sad window when split vertically
      }
    end,
  },

  { "MaximilianLloyd/adjacent.nvim" }, -- find files above in same dir of buffer


  { 'cameron-wags/rainbow_csv.nvim',
    config = true,
    ft = {
      'csv',
      'tsv',
      'csv_semicolon',
      'csv_whitespace',
      'csv_pipe',
      'rfc_csv',
      'rfc_semicolon'
    },
    cmd = {
      'RainbowDelim',
      'RainbowDelimSimple',
      'RainbowDelimQuoted',
      'RainbowMultiDelim'
    }
  },

  { 'ibhagwan/fzf-lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    lazy = true,
    cmd = "FzfLua",
    keys = { "<C-P>",
      { "<C-P>", "<cmd>lua require('fzf-lua').files()<CR>", desc = "find fzf files" }
    },
    config = require("configs.fzf-lua"),
  },

  { 'junegunn/fzf.vim',
    lazy = false,
    -- enabled=false,
    dependencies = { 'junegunn/fzf', build = ':call fzf#install()' },
    init = function()
      require("configs.fzf")
    end
  },


  { 'TheBlob42/houdini.nvim',
    event = "BufRead",
    config = function()
      require('houdini').setup {
        mappings = { 'jj' },
      }
    end
  },

  -------------------------- UI Enhancment --------------------------------------------------------------


  { 'echasnovski/mini.clue',
    enabled = false,
    version = false,
    lazy = false,
    config = function()
      local miniclue = require('mini.clue')
      miniclue.setup({
        triggers = {
          -- Leader triggers
          { mode = 'n', keys = '<Leader>' },
          { mode = 'x', keys = '<Leader>' },

          -- Built-in completion
          { mode = 'i', keys = '<C-x>' },

          -- `g` key
          { mode = 'n', keys = 'g' },
          { mode = 'x', keys = 'g' },

          -- Marks
          { mode = 'n', keys = "'" },
          { mode = 'n', keys = "," },
          { mode = 'n', keys = '`' },
          { mode = 'x', keys = "'" },
          { mode = 'x', keys = '`' },

          -- Registers
          { mode = 'n', keys = '"' },
          { mode = 'x', keys = '"' },
          { mode = 'i', keys = '<C-r>' },
          { mode = 'c', keys = '<C-r>' },

          -- Window commands
          { mode = 'n', keys = '<C-w>' },

          -- `z` key
          { mode = 'n', keys = 'z' },
          { mode = 'x', keys = 'z' },
        },

        clues = {
          -- Enhance this by adding descriptions for <Leader> mapping groups
          miniclue.gen_clues.builtin_completion(),
          miniclue.gen_clues.g(),
          miniclue.gen_clues.marks(),
          miniclue.gen_clues.registers(),
          miniclue.gen_clues.windows(),
          miniclue.gen_clues.z(),
        },
      })
    end,
  },


  { "Pocco81/true-zen.nvim",
    enabled = false,
    event = { "VeryLazy" },
    opts = require("configs.true-zen"),
  },

  { "stevearc/dressing.nvim",
    event = "VeryLazy",
    opts = require("configs.dressing"),
    -- opts = {
    --   input = {
    --     prompt_align = "center",
    --     anchor = "NW",
    --     relative = "editor",
    --     prefer_width = 80,
    --     max_width = nil,
    --     min_width = nil,
    --   },
    --   select = {
    --     telescope = {
    --       layout_config = {
    --         -- width = 0.9,
    --         -- height = 0.9,
    --       },
    --     },
    --   },
    -- },
  },


  { "Bekaboo/dropbar.nvim",
    enabled = false, -- will work when neovim will be on v0.10 at least
    lazy = false,
    config = function()
    end
  },


  { "folke/noice.nvim",
    -- enabled = false,
    -- cond = not vim.g.neovide,
    event = "VeryLazy",
    opts = require("configs.noice"),
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    }
  },

  { "wfxr/minimap.vim",
    build = "cargo install --locked code-minimap",
    -- lazy = false,
    -- enabled = false,
    keys = {
      { "<leader>tm", "<cmd>MinimapToggle<cr>", desc = "Toggle Minimap" },
    },
    cmd = "MinimapToggle",
    config = function()
      vim.cmd("let g:minimap_width = 13")
      vim.cmd("let g:minimap_auto_start = 1")
      vim.cmd("let g:minimap_auto_start_win_enter = 1")
      vim.cmd([[
      hi default link minimapRange Folded
      hi default link minimapCursor Search
      let g:minimap_highlight_search = 1
      let g:minimap_cursor_color = "Search"
      let g:minimap_range_color = "Folded"
    ]])
    end,
  },

  { 'echasnovski/mini.map',
    version = false,
    lazy = false,
    config = function()
      require('mini.map').setup({
        integrations = {
          require('mini.map').gen_integration.builtin_search(),
          -- require('mini.map').gen_integration.gitsigns(),
          require('mini.map').gen_integration.diagnostic(),
        },
        window = {
          focusable = true,
          width = 20,
          winblend = 10,
        }
      })
    end,
    -- cmd = {"Minimap.toggle()", "Minimap.toggle_focus()"},
    keys = {
      { "<leader>mm", "<cmd>lua require('mini.map').toggle() <cr>", "open and focus mini.map" },
    },
  },

  { 'kevinhwang91/nvim-ufo',
    -- enabled = false,
    dependencies = 'kevinhwang91/promise-async',
    lazy = false,
    config = function()
      require("configs.nvim-ufo")
    end,
  },

  { "luukvbaal/statuscol.nvim",
    lazy = false,
    -- enabled=false,
    config = function()
      require("configs.statuscol")
    end
  },

  { "rcarriga/nvim-notify",
    lazy = false,
    config = function()
      require "configs.notify"
    end,
  },

  { "RRethy/vim-illuminate",
    -- lazy=false,
  },

  { 'nvim-treesitter/nvim-treesitter-context',
    enabled = false,
    lazy = false,
  },

  { 'kevinhwang91/nvim-bqf',
    lazy = false,
    ft = 'qf'
  },

  { 'norcalli/nvim-colorizer.lua',
    event = "VeryLazy",
    config = function()
      require 'colorizer'.setup()
    end
  },

  -------------------------- Telescope Stuff ------------------------------------------------------------


  {
    "nvim-telescope/telescope-bibtex.nvim",
    ft = { "tex", "bib" },
    dependencies = {
      { 'nvim-telescope/telescope.nvim' },
    },
    config = function()
      require "telescope".load_extension("bibtex")
    end,
  },

  {
    "nvim-telescope/telescope-live-grep-args.nvim",
    enabled = false,
    config = function()
      require("telescope").load_extension("live_grep_args")
    end
  },

  {
    "debugloop/telescope-undo.nvim",
    lazy = false,
  },

  { "smilovanovic/telescope-search-dir-picker.nvim", lazy = false, },

  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader-ss>", "<cmd>Telescope file_browser path=%:p:h select_buffer=true<CR>",
        desc = "open telescoe file_browser" }
    }
  },

  { 'nvim-telescope/telescope-fzf-native.nvim',
  },


  --------------------------- LATEX -------------------------------------------------------------------

  {
    "barreiroleo/ltex_extra.nvim",
    enabled = false,
    ft = { "tex", "bib", "markdown" },
    config = function()
      require("ltex_extra").setup {
        path = "~/.config/lvim/spell/",
        server_opts = {
          settings = {
            ltex = {
              disabledRules = {
                ['en-US'] = { 'PROFANITY', 'MORFOLOGIK_RULE_EN_US' },
                ['en-GB'] = { 'PROFANITY' },
              },
            },
          },
        },
      }
    end
  },

  { "lervag/vimtex",
    -- enabled = false,
    lazy = false,
    init = function()
      require("configs.vimtex")
    end,
  },

  { "anufrievroman/vim-angry-reviewer",

    ft = { "tex", "bib" },
  },

  { "f3fora/cmp-spell",
    ft = { "tex", "markdown" },
    event = { "InsertEnter", "CmdlineEnter" },
  },


}





lvim.builtin.telescope.on_config_done = function(telescope)
  pcall(telescope.load_extension, "file_browser")
  pcall(telescope.load_extension, "bibtex")
  pcall(telescope.load_extension, "adjacent")
  pcall(telescope.load_extension, "search_dir_picker")
  pcall(telescope.load_extension, "undo")
  -- any other extensions loading
end


-- vim.api.nvim_set_keymap(
--   "n",
--   "<space>ss",
--   ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
--   { noremap = true }
-- )


lvim.builtin.telescope.extensions = {
  undo = {
    use_delta = true,
  },

  bibtex = {
    global_files = { '/home/aneeq/Documents/latex/My_Library.bib' }
  },

  adjacent = {
    level = 2   -- default
  },


  fzf = {
    fuzzy = true,                     -- false will only do exact matching
    override_generic_sorter = true,   -- override the generic sorter
    override_file_sorter = true,      -- override the file sorter
    case_mode = "smart_case",         -- or "ignore_case" or "respect_case" the default case_mode is "smart_case"
  },

  media_files = {
    -- filetypes whitelist
    -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
    filetypes = { "png", "webp", "jpg", "jpeg" },
    -- find command (defaults to `fd`)
    find_cmd = "rg"
  },

  file_browser = {
    -- theme = "ivy",
    -- disables netrw and use telescope-file-browser in its place
    hijack_netrw = false,
    mappings = {
      ["i"] = {
        -- your custom insert mode mappings
      },
      ["n"] = {
        -- your custom normal mode mappings
      },
    },
  },

}
