local popupmenu_style1 = {
  relative = "editor",
  position = {
    row = 7,
    col = "50%",
  },
  size = {
    width = 60,
    height = 10,
  },
  border = {
    style = "rounded",
    padding = { 0, 1 },
  },
  win_options = {
    winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
  },
}

local popupmenu_style2 = {
  backend = "popup",
  relative = "editor",
  position = {
    row = "97%",
    col = 0,
  },
  size = {
    height = "auto",
    width = 70,
  },
  border = {
    style = "none",
  },
  win_options = {
    winhighlight = {
      -- Normal = "NoiceCmdline",
      IncSearch = "",
      CurSearch = "",
      Search = "",
      FloatBorder = "NoicePopupBorder",
      -- PmenuSbar = "NoiceScrollbarThumb",
      -- PmenuThumb= "NoiceScrollbarThumb",

    },
  },
}

local cmd_style1 = {
  position = {
    row = 3,
    col = "50%",
  },
  size = {
    width = 60,
    height = "auto",
  },

  border = {
    style = "rounded",
    -- style = "single",
    padding = { 0, 1 },
  },
  win_options = {
    -- winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
    winhighlight = { Normal = "Normal", FloatBorder = "NormalFloat" },
  },
}

local cmd_style2 = {
    backend = "popup",
    relative = "editor",
    position = {
      row = "100%",
      col = 0,
    },
    size = {
      height = "auto",
      width = "100%",
    },
    border = {
      style = "none",
    },
    win_options = {
      winhighlight = {
      Normal = "NoicePopup",
      -- Normal = "NoiceCmdline",
        IncSearch = "",
        CurSearch = "",
        Search = "",
      },
    },
  }

local opts = {


  lsp = {
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
    hover = {
      enabled = false
    },

    signature = {
      enabled = false
    },
    progress = {
      enabled = false,
    },
  },

  messages = {
    enabled = true,        -- enables the Noice messages UI
    -- view = "notify", -- default view for messages
    view = "mini",         -- default view for messages
    view_error = "notify", -- view for errors
    view_warn = "notify",  -- view for warnings
    view_history = "mini", -- view for :messages
    view_search = "mini",  -- view for search count messages. Set to `false` to disable
    filter = function(msg)
      if msg:match("File .* already opened") then
        return false
      end
      return true
    end
  },
  presets = {
    -- long_message_to_split = false,
    bottom_search = false,        -- use a classic bottom cmdline for search
    command_palette = false,      -- position the cmdline and popupmenu together

    long_message_to_split = true, -- long messages will be sent to a split
    inc_rename = false,           -- enables an input dialog for inc-rename.nvim
  },


  -- cmdline = {
  --   view = "cmdline"
  -- },


  views = {
    cmdline_popup = cmd_style2,

    popupmenu = popupmenu_style2,
  },

  routes = {
    {
      filter = {
        event = "msg_show",
        kind = "",
        find = "written",
      },
      opts = { skip = false },
      view = "mini"
    },


    -- {
    --   filter = {
    --     event = "msg_show",
    --     kind = "",
    --         },
    --   opts = { skip = false },
    --   view = "notify"
    -- },


    -- {
    --   filter = {
    --     event = "msg_show",
    --     kind = "",
    --     find = "Swap files found",
    --   },
    --   opts = { skip = true },
    -- },
    --
    -- {
    --   filter = {
    --     event = "msg_show",
    --     kind = "",
    --     find = "In directory",
    --   },
    --   opts = { skip = true },
    -- },
    -- {
    --   filter = {
    --     event = "msg_show",
    --     kind = "",
    --     find = "Enter number of swap",
    --   },
    --   opts = { skip = true },
    -- },

  },

}
return opts



-- vim.keymap.set("c", "<S-Enter>", function()
--     require("noice").redirect(vim.fn.getcmdline())
--     end, { desc = "Redirect Cmdline" })













--
-- border = {
--     style = "none",
--     padding = { 1, 3 },
--           },
-- win_options = {
--     winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
--             },
