-- Additional Plugins
lvim.plugins = {
  {
    -- jupyter notebook hanlder

    -- TODO fix this
    -- "luk400/vim-jukit",
    -- Utility
    "andweeb/presence.nvim",
    -- flutter tools
    {
      'akinsho/flutter-tools.nvim',
      lazy = false,
      dependencies = {
        'nvim-lua/plenary.nvim',
        'stevearc/dressing.nvim', -- optional for vim.ui.select
      },
      config = true,
    },
    {
      "folke/todo-comments.nvim",
      event = "BufRead",
      config = function()
        require("todo-comments").setup()
      end,
    },
    -- LSP features
    "simrat39/rust-tools.nvim",
    {
      "zbirenbaum/copilot.lua",
      cmd = "Copilot",
      event = "InsertEnter",
      config = function()
        require("copilot").setup({})
      end,
    },
    {
      "zbirenbaum/copilot-cmp",
      config = function()
        require("copilot_cmp").setup()
      end
    },


    -- Themes
    "askfiy/visual_studio_code",
    'Mofiqul/vscode.nvim',
    "morhetz/gruvbox",
    -- "lunarvim/horizon.nvim",
    -- "tomasr/molokai",
    -- "ayu-theme/ayu-vim",
    -- "yonlu/omni.vim",
    "ray-x/aurora",
    "tiagovla/tokyodark.nvim",
    -- "rmehri01/onenord.nvim",
    -- "olimorris/onedarkpro.nvim",
    -- "ofirgall/ofirkai.nvim",
    -- "catppuccin/nvim",
    "Mofiqul/dracula.nvim",


    -- Feature plugins
    "iamcco/markdown-preview.nvim",
    {
      "folke/trouble.nvim",
      cmd = "TroubleToggle",
    },
    {
      "norcalli/nvim-colorizer.lua",
      config = function()
        require("colorizer").setup({ "css", "scss", "html", "javascript" }, {
          RGB = true,      -- #RGB hex codes
          RRGGBB = true,   -- #RRGGBB hex codes
          RRGGBBAA = true, -- #RRGGBBAA hex codes
          rgb_fn = true,   -- CSS rgb() and rgba() functions
          hsl_fn = true,   -- CSS hsl() and hsla() functions
          css = true,      -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
          css_fn = true,   -- Enable all CSS *functions*: rgb_fn, hsl_fn
        })
      end,
    },
    {
      "tpope/vim-surround",
    },
  },
}
