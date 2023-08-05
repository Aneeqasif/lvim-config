local opts = {

  enabled = true,
  condition = function(buf)
    local fn = vim.fn
    local utils = require("auto-save.utils.data")

    -- don't save for `sql` file types
    if utils.not_in(fn.getbufvar(buf, "&filetype"), {'alpha','TelescopePrompt'}) then
      return true
    end
    return false
  end,
  debounce_delay = 1000,
  write_all_buffers = false,

 execution_message = {
		message = function() -- message to print on save
			-- return ("AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"))
      return ("  Saved")
		end,
		dim = 0.18, -- dim the color of `message`
		cleaning_interval = 1250, -- (milliseconds) automatically clean MsgArea after displaying `message`. See :h MsgArea
	},
}

return opts








  -- condition = function(buf)
  --   -- Check if the buffer's filetype is vimwiki
  --   if vim.bo[buf].filetype == 'vimwiki' then
  --     return true
  --   end
  --
  --   if vim.bo[buf].filetype == 'tex' then
  --     return false
  --   end
  --
  --   return true
  --   -- return false
  -- end,
