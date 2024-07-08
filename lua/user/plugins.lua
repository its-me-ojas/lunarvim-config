-- Additional Plugins
lvim.plugins = {
  {
    -- 'nvim-java/nvim-java',
    --   dependencies = {
    --     'nvim-java/lua-async-await',
    --     'nvim-java/nvim-java-refactor',
    --     'nvim-java/nvim-java-core',
    --     'nvim-java/nvim-java-test',
    --     'nvim-java/nvim-java-dap',
    --     'MunifTanjim/nui.nvim',
    --     'neovim/nvim-lspconfig',
    --     'mfussenegger/nvim-dap',
    --     {
    --       'williamboman/mason.nvim',
    --       opts = {
    --         registries = {
    --           'github:nvim-java/mason-registry',
    --           'github:mason-org/mason-registry',
    --         },
    --       },
    --     }
    --   },
    -- light bulb
    'kosayoda/nvim-lightbulb',

    -- "i3d/vim-jimbothemes",
    'nosduco/remote-sshfs.nvim',
    -- php
    "gbprod/phpactor.nvim",
    -- jupyter notebook hanlder
    -- {
    "GCBallesteros/jupytext.nvim",
    -- config = true,
    -- Depending on your nvim distro or config you may need to make the loading not lazy
    -- lazy = false,
    -- },
    -- TODO fix this
    -- "luk400/vim-jukit",
    "rafamadriz/friendly-snippets",
    -- Utility
    "andweeb/presence.nvim",
    -- {
    --   "kawre/leetcode.nvim",
    --   build = ":TSUpdate html",
    --   dependencies = {
    --     "nvim-telescope/telescope.nvim",
    --     "nvim-lua/plenary.nvim", -- required by telescope
    --     "MunifTanjim/nui.nvim",

    --     -- optional
    --     "nvim-tree/nvim-web-devicons",
    --   },
    --   opts = {
    --     -- configuration goes here
    --   },
    -- },
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
    "catppuccin/nvim",
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
