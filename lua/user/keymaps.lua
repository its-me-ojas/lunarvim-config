-- Enable cursor movement in insert mode using CTRL + H/J/K/L
lvim.keys.insert_mode["<C-h>"] = "<Left>"
lvim.keys.insert_mode["<C-j>"] = "<Down>"
lvim.keys.insert_mode["<C-k>"] = "<Up>"
lvim.keys.insert_mode["<C-l>"] = "<Right>"

lvim.keys.normal_mode["<leader>tt"] = ":TroubleToggle<CR>"
