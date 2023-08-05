config = {
    display = { "Terminal" },
    display_options = {
        terminal_width = 45,
    },
    -- repl_enable = {"Python3_original", "Julia_orignal"},
    -- selected_interpreters = {"Python3_original","Julia_orignal"},
    -- interpreter_options = { 
    --    Python3_original = {
    --       error_truncate = "auto"         --# Truncate runtime errors 'long', 'short' or 'auto'
    --     } 
  -- }

}


require'sniprun'.setup(config)
