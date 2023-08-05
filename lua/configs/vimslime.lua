-- vim-slime configuration
vim.g.slime_target = "tmux"
vim.g.slime_python_ipython = 1
-- vim.g.slime_default_config = {
--   socket_name = vim.split(os.getenv("TMUX"), ",")[1],
--   target_pane = ":.1"
-- }
--
-- -- keybinding to send code to the REPL
-- vim.api.nvim_set_keymap("n", "<Leader>r", "<Plug>SlimeLineSend<CR>", {})
