local cfg = require("yaml-companion").setup({
  builtin_matchers = {
    kubernetes = { enabled = true },
    cloud_init = { enabled = true },
  },
  lspconfig = {
    settings = {
      redhat = { telemetry = { enabled = false } },
      yaml = {
        validate = true,
        format = { enable = true },
        hover = true,
        schemaStore = {
          enable = true,
          url = "https://www.schemastore.org/api/json/catalog.json",
        },
        schemaDownload = { enable = true },
      },
    },
  },
})
require("lspconfig")["yamlls"].setup(cfg)
require("telescope").load_extension("yaml_schema")
