local g = vim.g

vim.o.conceallevel = 2
function ToggleConcealLevel()
  if vim.o.conceallevel == 2 then
    vim.o.conceallevel = 0
  else
    vim.o.conceallevel = 2
  end
end
vim.api.nvim_set_keymap('n', '<leader>tc', ':lua ToggleConcealLevel()<CR>', { noremap = true, silent = true })



--------------------------------------------------------------------------
-- Toggle calendar window
local function toggle_calendar_window()
  if vim.bo.filetype == 'calendar' and vim.fn.bufname('%') == '__Calendar' then
    -- If the current buffer is the calendar and its name is '__Calendar',
    -- close the window
    vim.cmd('close')
  else
    -- Open the calendar window with the 'CalendarVR' command
    vim.cmd('CalendarVR')
  end
end
-- Keybinding to toggle the calendar window
vim.keymap.set('n', '<leader>nc', ':lua toggle_calendar_window()<CR>', { noremap = true, silent = true,desc = 'toggle calendar' })


--------------------------------------------------------------------------










g.maplocalleader = " "


local mod_text1 = {
"    ╔════════════════════════════════════════════════════════╗    ",
"    ║                      ▄ ▄                               ║    ",
"    ║                  ▄   ▄▄▄     ▄ ▄▄▄ ▄ ▄                 ║    ",
"    ║                  █ ▄ █▄█ ▄▄▄ █ █▄█ █ █                 ║    ",
"    ║               ▄▄ █▄█▄▄▄█ █▄█▄█▄▄█▄▄█ █                 ║    ",
"    ║             ▄ █▄▄█ ▄ ▄▄ ▄█ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄              ║    ",
"    ║             █▄▄▄▄ ▄▄▄ █ ▄ ▄▄▄ ▄ ▄▄▄ ▄ ▄ █ ▄            ║    ",
"    ║             █ █▄█ █▄█ █ █ █▄█ █ █▄█ ▄▄▄ █ █            ║    ",
"    ║            ▄█ ▄ █▄▄█▄▄█ █ ▄▄█ █ ▄ █ █▄█▄█ █            ║    ",
"    ║               █▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█ █▄█▄▄▄█                ║    ",
"    ║                                                        ║    ",
"    ╚════════════════════════════════════════════════════════╝    ",
}

local mod_text2 = {
"                ▄ ▄                      ",
"            ▄   ▄▄▄     ▄ ▄▄▄ ▄ ▄        ",
"            █ ▄ █▄█ ▄▄▄ █ █▄█ █ █        ",
"         ▄▄ █▄█▄▄▄█ █▄█▄█▄▄█▄▄█ █        ",
"       ▄ █▄▄█ ▄ ▄▄ ▄█ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄     ",
"       █▄▄▄▄ ▄▄▄ █ ▄ ▄▄▄ ▄ ▄▄▄ ▄ ▄ █ ▄   ",
"       █ █▄█ █▄█ █ █ █▄█ █ █▄█ ▄▄▄ █ █   ",
"      ▄█ ▄ █▄▄█▄▄█ █ ▄▄█ █ ▄ █ █▄█▄█ █   ",
"         █▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█ █▄█▄▄▄█       ",
}

local mod_text3 = { 
	"                                                                   ",
	"      ████ ██████           █████      ██                    ",
	"     ███████████             █████                            ",
	"     █████████ ███████████████████ ███   ███████████  ",
	"    █████████  ███    █████████████ █████ ██████████████  ",
	"   █████████ ██████████ █████████ █████ █████ ████ █████  ",
	" ███████████ ███    ███ █████████ █████ █████ ████ █████ ",
	"██████  █████████████████████ ████ █████ █████ ████ ██████",

}

lvim.builtin.alpha.dashboard.section.header.val = mod_text3












































-- --------------------------------------------------------------------------
-- for _, provider in ipairs { "node", "perl", "python3", "ruby" } do
--   vim.g["loaded_" .. provider .. "_provider"] = 1
-- end
-- --------------------------------------------------------------------------
-- -- Enable python support
-- local enable_providers = {
--       "python3_provider",
--       -- and so on
--     }
--     for _, plugin in pairs(enable_providers) do
--       vim.g["loaded_" .. plugin] = nil
--
--       vim.cmd("runtime " .. plugin)
--     end
--
-- --------------------------------------------------------------------------

------------ virtual text on off plugin need this-------------------------
-- vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
--   pattern = {"*"},
--   callback = function()
--     require 'toggle_lsp_diagnostics'.init({
--       underline = false,
--       virtual_text = false
--     })
--   end
-- })
-- vim.cmd([[nmap <leader>tv <Plug>(toggle-lsp-diag-vtext)]])
--   in plugins.lua ==>
--   {"WhoIsSethDaniel/toggle-lsp-diagnostics.nvim", 
    -- lazy = false,
    -- enabled = false
  -- },

--------------------------------------------------------------------------
-- local autocmd = vim.api.nvim_create_autocmd
-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
--------------------------------------------------------------------------




--------------------------------------------------------------------------

-- local enable_providers = {
--       "python3_provider",
--       "node_provider",
--       -- and so on
--     }
--     
--     for _, plugin in pairs(enable_providers) do
--       vim.g["loaded_" .. plugin] = nil
--       vim.cmd("runtime " .. plugin)
--     end


