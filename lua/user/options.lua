-- Add Mason bin to PATH so conform can find formatters
vim.env.PATH = vim.fn.expand("~/.local/share/lvim/mason/bin") .. ":" .. vim.env.PATH

lvim.colorscheme = "vscode"

vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.wrap = true
vim.opt.linebreak = true    -- wrap at word boundaries, not mid-word
vim.opt.breakindent = true  -- preserve indentation on wrapped lines

-- Disable LunarVim's built-in formatting, let conform handle it
lvim.format_on_save.enabled = false

-- Let rustaceanvim and yaml-companion manage their own LSPs
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "rust_analyzer", "yamlls" })
