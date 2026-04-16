lvim.plugins = {
  { "Mofiqul/vscode.nvim" },

  -- Lightbulb icon when code actions are available
  {
    "kosayoda/nvim-lightbulb",
    config = function()
      require("nvim-lightbulb").setup({
        autocmd = { enabled = true },
      })
    end,
    event = "LspAttach",
  },

  -- Better diagnostics list
  {
    "folke/trouble.nvim",
    opts = {},
    cmd = "Trouble",
    keys = {
      { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (Trouble)" },
      { "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer Diagnostics (Trouble)" },
      { "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>", desc = "Symbols (Trouble)" },
      { "<leader>cl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", desc = "LSP Definitions / refs (Trouble)" },
      { "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix List (Trouble)" },
    },
  },

  -- Go development
  {
    "ray-x/go.nvim",
    dependencies = {
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("plugin.go")
    end,
    ft = { "go", "gomod" },
    build = ':lua require("go.install").update_all_sync()',
  },

  -- Auto close/rename HTML tags
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup({
        opts = {
          enable_close = true,
          enable_rename = true,
          enable_close_on_slash = false,
        },
      })
    end,
    ft = { "html", "javascript", "typescript", "javascriptreact", "typescriptreact", "svelte", "vue", "tsx", "jsx", "xml", "markdown" },
  },

  -- Rust development (replaces rust-tools.nvim)
  {
    "mrcjkb/rustaceanvim",
    version = "^9",
    lazy = false,
  },

  -- Universal formatter
  {
    "stevearc/conform.nvim",
    config = function()
      require("plugin.conform")
    end,
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
  },

  -- YAML schema detection + switching
  {
    "someone-stole-my-name/yaml-companion.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("plugin.yaml-companion")
    end,
    ft = { "yaml", "yml" },
  },
}
