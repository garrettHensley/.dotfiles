return {
  {
    "folke/which-key.nvim",
      event = "VeryLazy",
      keys = {
        {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Local Keymaps",
      }
    }
  },
    -- {
    --     'kepano/flexoki-neovim',
    --     name = 'flexoki',
    --     config = function()
    --         vim.cmd([[colorscheme flexoki]])
    --     end,
    -- },
  {
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate",
      highlight = {
          enable = true
      }
  },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.nvim' },            -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' },        -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
  },
  -- {
  --   "ibhagwan/fzf-lua",
  --   -- optional for icon support
  --   -- dependencies = { "nvim-tree/nvim-web-devicons" },
  --   -- or if using mini.icons/mini.nvim
  --   dependencies = { "nvim-mini/mini.icons" },
  --   ---@module "fzf-lua"
  --   ---@type fzf-lua.Config|{}
  --   ---@diagnostic disable: missing-fields
  --   opts = {}
  --   ---@diagnostic enable: missing-fields
  -- },
  {
      'nvimdev/dashboard-nvim',
      event = 'VimEnter',
      config = function()
          local ascii = require("ascii.catgirl")
          require('dashboard').setup {
              -- config
              theme = 'hyper',
              config = {
                  header = ascii.cat,
                  center = {
                    {
                      desc = 'Welcome hax0r',
                      action = "Telescope app"
                    }
                  },
              }
          }
      end,
      dependencies = { { 'nvim-tree/nvim-web-devicons' } }
    },
}
