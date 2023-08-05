-- vim.opt.guifont = "Sarasa Mono TC Nerd Font,JuliaMono Nerd Font:h13"
-- vim.opt.guifont = "JetBrainsMono Nerd Font,Sarasa Mono TC Nerd Font,JuliaMono Nerd Font:h12"
--
-- vim.opt.guifont = "JuliaMono,Sarasa Mono TC Nerd Font,JetBrainsMono Nerd Font:h12"
-- vim.opt.guifont = "JetBrainsMono Nerd Font:h12"
-- vim.opt.guifont = "JetBrainsMono Nerd Font,Sarasa Mono TC Nerd Font,JuliaMono:h12"
-- vim.opt.guifont = "Iosevka Nerd Font,Sarasa Mono TC Nerd Font,JuliaMono:#e-subpixelantialias:h13:#h-full"
vim.opt.guifont = "Sarasa Mono TC Nerd Font,Iosevka Nerd Font Propo,JuliaMono:#e-antialias:h13"
-- vim.opt.guifont = "Sarasa Mono TC Nerd Font,Iosevka Nerd Font,JuliaMono:#e-antialias:h13:#h-full"
-- vim.opt.guifont = "Sarasa Mono TC Nerd Font,Iosevka Nerd Font,JuliaMonoh13"
-- vim.opt.guifont = "Consola Mono,Sarasa Mono TC Nerd Font,JuliaMono:#e-subpixelantialias:h12:#h-full"
-- vim.opt.guifont = "Iosevka Nerd Font:#e-subpixelantialias:h13:#h-full"
-- ==>
-- general
local options = {
  neovide_confirm_quit = true,
  neovide_no_idle = true,
  -- neovide_transparency = 1,
  neovide_transparency = 0.96,
  neovide_input_use_logo = true,
  neovide_remember_window_size = true,
  -- neovide_cursor_antialiasing = true,
  neovide_hide_mouse_when_typing = true,
  -- vfx settings
  neovide_cursor_vfx_mode = "sonicboom",
  -- neovide_cursor_vfx_mode = "pixiedust",
  neovide_cursor_vfx_opacity = 200.0,
  neovide_refresh_rate = 60,
  neovide_refresh_rate_idle = 5,
  neovide_floating_blur_amount_x = 2.0,
  neovide_floating_blur_amount_y = 2.0,
  neovide_profiler = false,


  neovide_padding_top = 0,
  neovide_padding_bottom = 0,
  neovide_padding_right = 10,
  neovide_padding_left = 0,

  -- neovide_cursor_vfx_particle_lifetime = 1.2,
  -- neovide_cursor_vfx_particle_curl = 0.01,
  -- neovide_cursor_vfx_particle_density = 20,
}

for k, v in pairs(options) do
  vim.g[k] = v
end




vim.opt.linespace = 1


vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    vim.defer_fn(function()
      vim.g.neovide_scroll_animation_length = 0.0
      vim.g.neovide_cursor_animation_length = 0.04
    end, 200)
  end,
})


if vim.g.neovide then
  -- Put anything you want to happen only in Neovide here
  -- vim.api.nvim_command('set autochdir')
end


-- Disable animations outside buffers
-- vim.api.nvim_create_autocmd("BufLeave", {
--     callback = function()
--         vim.g.neovide_scroll_animation_length = 0
--         vim.g.neovide_cursor_animation_length = 0
--     end,
-- })
