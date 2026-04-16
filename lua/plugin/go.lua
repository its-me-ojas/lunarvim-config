require("go").setup({
  lsp_cfg = false,       -- LunarVim manages gopls, don't conflict
  lsp_gofumpt = true,    -- use gofumpt for formatting
  lsp_inlay_hints = { enable = true },
  trouble = true,        -- use trouble.nvim for diagnostics (if installed)
  luasnip = true,        -- use LuaSnip snippets
})

-- format + organize imports on save
local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    require("go.format").goimports()
  end,
  group = format_sync_grp,
})
