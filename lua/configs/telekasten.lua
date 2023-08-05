return function()

  local home = vim.fn.expand("~/Documents/vimwiki")
  require("telekasten").setup({
    home = home,
    -- auto_set_syntax = false,
    -- install_syntax = false,
    auto_set_filetype = false,
    image_link_style = "markdown",
    image_subdir = "img",
    -- follow_creates_nonexisting = true,
    calendar_opts = {weeknm = 2},
    -- templates = nil,
    template_handling = "prefer_new_note",
    -- template_new_note = templates .. "/" .. "new_note.md",
    -- template_new_note = nil,
    insert_after_inserting = true,
    media_previewer = "catimg-previewer",
    dailies = home .. "/" .. "journal",
    weeklies = home .. "/" .. "journal/weekly",
    template_new_daily  =  nil,
    template_new_weekly = nil,
    template_new_note = nil,
    -- plug_into_calendar = false,
    -- journal_auto_open = true,
  })

vim.cmd([[
let g:calendar_no_mappings=0
" inoremap [[ <cmd>:lua require('telekasten').insert_link()<CR>
inoremap ;[ <cmd>:lua require('telekasten').insert_link({ i=true })<CR>
]])
--  # set keybindings -- 
end

