-- Override LunarVim's Space+lf to use conform instead of LSP
lvim.builtin.which_key.mappings["l"]["f"] = {
  function()
    require("conform").format({ bufnr = 0, timeout_ms = 1000, lsp_format = "fallback" })
  end,
  "Format (conform)",
}
