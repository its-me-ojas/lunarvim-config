-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

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

-- Override LunarVim's Space+lf to use conform instead of LSP
lvim.builtin.which_key.mappings["l"]["f"] = {
  function()
    require("conform").format({ bufnr = 0, timeout_ms = 1000, lsp_format = "fallback" })
  end,
  "Format (conform)",
}

-- Let rustaceanvim and yaml-companion manage their own LSPs
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "rust_analyzer", "yamlls" })

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
    lazy = false, -- plugin is already lazy by design (filetype-based)
  },

  -- Universal formatter
  {
    "stevearc/conform.nvim",
    config = function()
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
    end,
    ft = { "yaml", "yml" },
  },
}
