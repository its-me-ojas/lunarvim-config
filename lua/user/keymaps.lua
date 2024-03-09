-- Enable cursor movement in insert mode using CTRL + H/J/K/L
lvim.keys.insert_mode["<C-h>"] = "<Left>"
lvim.keys.insert_mode["<C-j>"] = "<Down>"
lvim.keys.insert_mode["<C-k>"] = "<Up>"
lvim.keys.insert_mode["<C-l>"] = "<Right>"

vim.api.nvim_set_keymap('n', '<leader>tt', ':TroubleToggle', { noremap = true, silent = true })
