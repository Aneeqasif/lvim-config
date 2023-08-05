-- Autocommands (https://neovim.io/doc/user/autocmd.html)

-- vim.api.nvim_create_autocmd("BufEnter", {
--   pattern = { "*.json", "*.jsonc" },
--   -- enable wrap mode for json files only
--   command = "setlocal wrap",
-- })



-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })

-- vim.fn.fnamemodify(vim.fn.expand('%'), ':e')
-- vim.bo.filetype
-- vim.api.nvim_buf_get_option(0, 'filetype')

-- vim.api.nvim_create_autocmd("BufEnter", {
--   pattern = "*",
--   callback = function()
--   -- lvim.builtin.which_key.mappings['l'] = {}
--     local file_extension = vim.bo.filetype
--     if file_extension == 'tex' then
--       lvim.builtin.which_key.mappings['l'] = {}
--     else
--       lvim.builtin.which_key.mappings['l'] = lvim.builtin.which_key.mappings['l']
--     end
--   end,
-- })

-- vim.cmd('autocmd FileType tex lua lvim.builtin.which_key.mappings["l"] = {}')


-- Use spelling for markdown files ‘]s’ to find next, ‘[s’ for previous, 'z=‘ for suggestions when on one.
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "html", "markdown", "text", "tex" },
  callback = function()
    vim.opt_local.spell = true
  end,
})



vim.api.nvim_create_autocmd("BufEnter", {
  pattern = { "*.md" },
  -- enable wrap mode for json files only
  callback = function()
    vim.diagnostic.config({ virtual_lines = false })
  end
})

-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "markdown",
--   callback = function()
--     local file_path = string.match(vim.api.nvim_buf_get_name(0), "(.*)/[^/]*$")
--     vim.lsp.buf.add_workspace_folder(file_path)
--   end,
-- })


-- vim.api.nvim_create_autocmd("BufEnter", {
--   pattern = { "*.md"},
--   command = "source /home/aneeq/.config/lvim/lua/configs/test.vim"
-- })



-- local ufo_status_ok, ufo = pcall(require, "cmp")
-- if  ufo_status_ok then
--   vim.cmd([[
--   autocmd FileType Outline lua require('ufo').detach()
--   ]])
-- end


vim.cmd([[

augroup VimTeX
  autocmd!
  autocmd BufWritePost *.tex call vimtex#toc#refresh()
augroup END


" fun! PythonHelp()
"     let visual_selection = jukit#util#get_visual_selection()
"     let cmd = 'help(' . visual_selection . ')'
"     call jukit#send#send_to_split(cmd)
" endfun

"set approproate FileType- and shell_cmd for jukit plugin
augroup jukit_shell_cmd
  autocmd!
  autocmd FileType python let g:jukit_shell_cmd = 'ipython3'
  autocmd FileType julia let g:jukit_shell_cmd = 'julia'
augroup END

 " Autosave Vimwiki files
" autocmd BufWritePost vimwiki silent! wall
" autocmd BufWritePost *.wiki silent! wall
"" for rainbow_csv.nvim
autocmd FileType csv,tsv,csv_semicolon,csv_whitespace,csv_pipe,rfc_csv,rfc_semicolon set nowrap
autocmd BufNewFile,BufRead *.csv   set filetype=csv_semicolon
autocmd BufNewFile,BufRead *.dat   set filetype=csv_pipe

]])
