-- general
vim.opt.wrap = true
lvim.log.level = "warn"
lvim.format_on_save.enabled = true
lvim.colorscheme = "vscode"

vim.opt.relativenumber = true

-- transparent window
lvim.transparent_window = true;
vim.g.neovide_transparency = 0.5
vim.g.transparency = 0.5

-- Check if g:neovide exists
if vim.g.neovide then
  -- Neovide cursor animation length
  vim.g.neovide_cursor_animation_length = 0.10
  -- Neovide cursor trail size
  vim.g.neovide_cursor_trail_size = 0.8
  -- Neovide cursor VFX mode
  vim.g.neovide_cursor_vfx_mode = "torpedo"
end
