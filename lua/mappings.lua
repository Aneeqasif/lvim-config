local ts = require("user.utils.ts")


lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<C-n>"] = "<cmd>NvimTreeToggle<cr>"

lvim.keys.normal_mode["<leader-w>"] = false
lvim.builtin.which_key.mappings['f'] = {}

vim.cmd([[
vmap <c-v> "+p
inoremap <c-v> <c-r>+
cnoremap <c-v> <c-r>+
]])



lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
-- Centers cursor when moving 1/2 page down
lvim.keys.normal_mode["<C-u>"] = "<C-u>zz"
lvim.keys.normal_mode["<C-d>"] = "<C-d>zz"
lvim.keys.normal_mode["<ESC>"] = "<cmd>nohlsearch<cr>"
-- lvim.keys.normal_mode["<C-t>"] = "<cmd>tabn<cr>"
lvim.keys.normal_mode["<C-1>"] = "<cmd>tabc<cr>"
-- vim.keymap.set("n", ",ow", function() ts.files_wiki() end)

lvim.builtin.which_key.mappings["f"] = {
  name = "Find Stuff",
  f = { function()
    require("lvim.core.telescope.custom-finders").find_project_files(require('telescope.themes').get_dropdown({ previewer = false,initial_mode = "normal"})) 
  end, "Find File", },
  l = { '<cmd>lua require("user.utils.ts").files_lvim() <cr>', "find lvim configs" },
  w = {'<cmd>Telescope current_buffer_fuzzy_find<cr>', "find current buffer" },

}


lvim.builtin.which_key.mappings['j'] = {
  name = "zatellkasten",
  f = { function() ts.files_wiki() end, "find wiki" },
  b = { '<cmd>lua require("user.utils.ts").find_backlinks() <cr>', "find backlinks" },
}


vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, { noremap = true })

vim.api.nvim_set_keymap('n', 'o', 'o<esc>', { noremap = true })
vim.api.nvim_set_keymap('n', 'O', 'O<esc>', { noremap = true })
vim.api.nvim_set_keymap('x', 'p', 'p:let @+=@0<CR>:let @"=@0<CR>',
  { silent = true, noremap = true, desc = "Dont copy replaced text" })


vim.api.nvim_set_keymap('n', '<space>ib', '<cmd>Telescope bibtex<cr>', { noremap = true , desc = "insert citation" })
vim.api.nvim_set_keymap('n', '<space>vf', '<cmd>call vimtex#fzf#run("cl", g:fzf_layout)<cr>', { noremap = true , desc = "find fzf in vimtex" })


vim.api.nvim_set_keymap("v", "p", '"_dP', {})



vim.api.nvim_set_keymap('n', '<space>ii', '1z=', { noremap = true , desc = "fix spelling" })
vim.api.nvim_set_keymap('n', '<C-i>', 'ciw', { noremap = true , desc = "change inside word" })
vim.api.nvim_set_keymap('n', '<C-i>', 'ciw', { noremap = true , desc = "change inside word" })

vim.keymap.set("n", "<space>is", function()
  require("telescope.builtin").spell_suggest(require("telescope.themes").get_cursor({initial_mode = "normal"}))
end, { desc = "Spelling Suggestions" })



------------------ form NVchad
vim.api.nvim_set_keymap('i', '<C-b>', '<ESC>^i', { noremap = true, desc = "Beginning of line" })
vim.api.nvim_set_keymap('i', '<C-e>', '<End>', { noremap = true, desc = "End of line" })

-- navigate within insert mode
vim.api.nvim_set_keymap('i', '<C-h>', '<Left>', { noremap = true, desc = "Move left" })
vim.api.nvim_set_keymap('i', '<C-l>', '<Right>', { noremap = true, desc = "Move right" })
vim.api.nvim_set_keymap('i', '<C-j>', '<Down>', { noremap = true, desc = "Move down" })
vim.api.nvim_set_keymap('i', '<C-k>', '<Up>', { noremap = true, desc = "Move up" })

vim.api.nvim_set_keymap('n', 'j', 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true, desc = "Move down" })
vim.api.nvim_set_keymap('n', 'k', 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true, desc = "Move up" })


vim.api.nvim_set_keymap('x', 'j', 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true, desc = "Move down" })
vim.api.nvim_set_keymap('x', 'k', 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true, desc = "Move up" })
    -- Don't copy the replaced text after pasting in visual mode
vim.api.nvim_set_keymap('x', 'p', 'p:let @+=@0<CR>:let @"=@0<CR>', { silent = true, desc = "Don't copy replaced text" })

--------------------------------------------------

lvim.builtin.which_key.mappings["lb"] = { "<cmd>lua  vim.lsp.buf.add_workspace_folder(vim.fn.expand('%:p:h')) <cr>",
  "Add workspace folder" }


lvim.builtin.which_key.mappings['m'] = {
  name = "Minimap",
  t = { "<cmd>lua require('mini.map').toggle()<cr>", "toggle mini.map" },
  m = { "<cmd>lua require('mini.map').toggle() require('mini.map').toggle_focus()<cr>", "open and focus mini.map" },
  f = { "<cmd>lua require('mini.map').toggle_focus()<cr>", "focus mini.map" },
}

-- unmap a default keymapping
-- vim.keymap.del("n", "<C-Up>")
lvim.builtin.which_key.mappings['c'] = {}

-- override a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }

lvim.builtin.which_key.mappings["x"] = { "<cmd>BufferKill<CR>", "Close Buffer" }

lvim.builtin.which_key.mappings["t"] = {
  name = "Diagnostics",
  t = { "<cmd>TroubleToggle<cr>", "trouble" },
  w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Trouble workspace" },
  d = { "<cmd>TroubleToggle document_diagnostics<cr>", "Trouble document" },
  q = { "<cmd>TroubleToggle quickfix<cr>", "Trouble quickfix" },
  l = { "<cmd>TroubleToggle loclist<cr>", "Trouble loclist" },
  r = { "<cmd>TroubleToggle lsp_references<cr>", "Trouble references" },
}

local whichmaps = {
  ["as"] = { "<cmd>lua vim.diagnostic.open_float()<CR>", "show diagnostics" },
}


for key, maps in pairs(whichmaps) do
  lvim.builtin.which_key.mappings[key] = maps
end

--------------------------------------------------------------------------------------


vim.g.mapleader = ' '
local mappings = {
  n = {
    -- [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["Q"] = { "@q", opts = { desc = "apply macro normal mode" } },
    ["<C-d>"] = { "<C-d>zz", opts = { desc = "scroll down and center" } },
    ["<C-u>"] = { "<C-u>zz", opts = { desc = "scroll down and center" } },

    ["<C-P>"] = { "<cmd>lua require('fzf-lua').files()<CR>",
      opts = { desc = "find fzf files", noremap = true, silent = true } },

    ["<leader>su"] = { "<cmd>Telescope undo<cr>", opts = { desc = "open undo tree in telescope" } },
    ["<leader>ms"] = { "<cmd>SymbolsOutline<CR>", opts = { desc = "toggle lsp SymbolsOutline" } },
    ["<leader>cd"] = { "[[:execute 'cd ' .. expand('%:p:h')<CR>:execute 'pwd'<CR>]]",
      opts = { noremap = true, silent = true, desc = "change cwd of nvim" } },

    ["<leader>vp"] = { "<cmd>PeekOpen<CR>", opts = { desc = "peek in markdown" } },
    ["<M-,>"] = { "<cmd> Telescope <CR>", { desc = "Telescope" } },
    ["<leader>og"] = { ":LazyGit<CR>", opts = { desc = "LazyGit" } },


  },

  v = {
    ["Q"] = { "<cmd>norm @q<cr>", { desc = "apply macro visual mode" } },
    ["y"] = { "ygv<esc>", { desc = "keep cursor possition after yanking in visual mode" } },
  },


}




local mapset = function(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local set_mappings = function()
  for mode, modeMappings in pairs(mappings) do
    for key, map in pairs(modeMappings) do
      local cmd = map[1]
      local opts = map.opts or map[2] or {}

      mapset(mode, key, cmd, opts)
    end
  end
end

set_mappings()

--- get visually selected lines

function vim.getVisualSelection()
	vim.cmd('noau normal! "vy"')
	local text = vim.fn.getreg('v')
	vim.fn.setreg('v', {})

	text = string.gsub(text, "\n", "")
	if #text > 0 then
		return text
	else
		return ''
	end
end


local keymap = vim.keymap.set
local tb = require('telescope.builtin')
local opts = { noremap = true, silent = true }

keymap('v', '<space>g', function()
	local text = vim.getVisualSelection()
	tb.current_buffer_fuzzy_find({ default_text = text })
end, opts)

keymap('v', '<space>G', function()
	local text = vim.getVisualSelection()
	tb.live_grep({ default_text = text })
end, opts)



