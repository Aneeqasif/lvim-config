vim.o.foldcolumn = '1' -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldenable = true
-- vim.opt.foldmethod = 'manual'
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
-- vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep:│,foldclose:]]
-- vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep:│,foldclose:]]


-- 
-- 
local ftMap = {
    vim = 'indent',
    python = {'indent'},
    git = '',
    toggleterm = '',
}


local filetypes = {
    vim = 'indent',
    python = {'indent'},
    git = '',
    toggleterm = '',
}


vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
vim.keymap.set('n', 'zr', require('ufo').openFoldsExceptKinds)
vim.keymap.set('n', 'zm', require('ufo').closeFoldsWith) -- closeAllFolds == closeFoldsWith(0)
vim.keymap.set('n', '<leader>op', function()
    local winid = require('ufo').peekFoldedLinesUnderCursor()
    if not winid then
        -- choose one of coc.nvim and nvim lsp
        vim.fn.CocActionAsync('definitionHover') -- coc.nvim
        vim.lsp.buf.hover()
    end
end)

-- buffer scope handler
-- will override global handler if it is existed
-- local bufnr = vim.api.nvim_get_current_buf()
-- require('ufo').setFoldVirtTextHandler(bufnr, handler)
--
local handler = function(virtText, lnum, endLnum, width, truncate)
    local newVirtText = {}
    local suffix = ('   %d '):format(endLnum - lnum)
    local sufWidth = vim.fn.strdisplaywidth(suffix)
    local targetWidth = width - sufWidth
    local curWidth = 0
    for _, chunk in ipairs(virtText) do
        local chunkText = chunk[1]
        local chunkWidth = vim.fn.strdisplaywidth(chunkText)
        if targetWidth > curWidth + chunkWidth then
            table.insert(newVirtText, chunk)
        else
            chunkText = truncate(chunkText, targetWidth - curWidth)
            local hlGroup = chunk[2]
            table.insert(newVirtText, {chunkText, hlGroup})
            chunkWidth = vim.fn.strdisplaywidth(chunkText)
            -- str width returned from truncate() may less than 2nd argument, need padding
            if curWidth + chunkWidth < targetWidth then
                suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
            end
            break
        end
        curWidth = curWidth + chunkWidth
    end
    table.insert(newVirtText, {suffix, 'MoreMsg'})
    return newVirtText
end

-- global handler
-- `handler` is the 2nd parameter of `setFoldVirtTextHandler`,
-- check out `./lua/ufo.lua` and search `setFoldVirtTextHandler` for detail.
require('ufo').setup({

    fold_virt_text_handler = handler,

    open_fold_hl_timeout = 150,
    close_fold_kinds = {'imports', 'comment'},
    preview = {
        win_config = {
            border = { "", "─", "", "", "", "─", "", "" },
            -- winhighlight = 'Normal:Normal',
            winhighlight = 'IncSearch:Folded',
            -- winhighlight = 'Normal:UfoPreviewNormal,FloatBorder:UfoPreviewBorder,CursorLine:UfoPreviewCursorLine',
            winblend = 0
        },
        mappings = {
            scrollU = '<C-u>',
            scrollD = '<C-d>',
            jumpTop = '[',
            jumpBot = ']'
        }
    },
    -- provider_selector = function(bufnr, filetype, buftype)
    --     -- if you prefer treesitter provider rather than lsp,
    --     return ftMap[filetype] or {'treesitter', 'indent'}
    --     -- return ftMap[filetype]
    --
    --     -- refer to ./doc/example.lua for detail
    -- end
    provider_selector = function(_, ft)
        return filetypes[ft] or { 'treesitter', 'indent' }
      end

})


-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself

-- require('ufo').setup()
-- require("ufo").setup(
--   {
--     provider_selector = function(bufnr, filetype, buftype)
--       return {"treesitter", "indent"}
--     end
--   }
-- )
