config = {
  auto_load = true,         -- whether to automatically load preview when
                            -- entering another markdown buffer
  close_on_bdelete = true,  -- close preview window on buffer delete

  syntax = true,            -- enable syntax highlighting, affects performance

  theme = 'dark',           -- 'dark' or 'light'

  update_on_change = true,

--   app = 
-- {
--   'brave',
--   '--class=WebApp-MarkdownPreview9553',
--   '--user-data-dir=/home/aneeq/.local/share/ice/profiles/MarkdownPreview9553'
-- },

  app = 'webview',          -- 'webview', 'browser', string or a table of strings

-- app =  {
--   "bash",
--   "-c",
--   "XAPP_FORCE_GTKWINDOW_ICON=\"webapp-manager\" firefox --class WebApp-mark2744 --profile /home/aneeq/.local/share/ice/firefox/mark2744 --no-remote \"$1\"",
--   "--",
-- },

  filetype = { 'markdown', 'vimwiki' },-- list of filetypes to recognize as markdown

  -- relevant if update_on_change is true
  throttle_at = 200000,     -- start throttling when file exceeds this
                            -- amount of bytes in size
  throttle_time = 'auto',   -- minimum amount of time in milliseconds
                            -- that has to pass before starting new render
}

return function()
  require("peek").setup(config)
  vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
  vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
end
