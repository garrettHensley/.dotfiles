vim.pack.add({
	{ src = "https://github.com/ibhagwan/fzf-lua" },
	{ src = "https://github.com/stevearc/oil.nvim" },
})

-- local actions = require('fzf-lua.actions')

require('fzf-lua')
require('oil').setup({
  default_file_explorer = true,
})

-- 	default_file_explorer = true,
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
