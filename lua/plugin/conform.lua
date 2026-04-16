require("conform").setup({
  formatters_by_ft = {
    python = { "ruff_format", "ruff_organize_imports" },
    javascript = { "prettierd", "prettier", stop_after_first = true },
    typescript = { "prettierd", "prettier", stop_after_first = true },
    javascriptreact = { "prettierd", "prettier", stop_after_first = true },
    typescriptreact = { "prettierd", "prettier", stop_after_first = true },
    html = { "prettierd", "prettier", stop_after_first = true },
    css = { "prettierd", "prettier", stop_after_first = true },
    json = { "prettierd", "prettier", stop_after_first = true },
    yaml = { "prettierd", "prettier", stop_after_first = true },
    markdown = { "prettierd", "prettier", stop_after_first = true },
    sql = { "sql_formatter" },
    lua = { "stylua" },
    bash = { "shfmt" },
    sh = { "shfmt" },
    dockerfile = { lsp_format = "fallback" },
    rust = { lsp_format = "fallback" }, -- rustaceanvim handles this
    -- go is handled by go.nvim's goimports
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_format = "fallback",
  },
  formatters = {
    sql_formatter = {
      prepend_args = { "--language", "postgresql" },
    },
  },
})
