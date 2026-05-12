vim.pack.add({
	{
		src = 'https://github.com/stevearc/oil.nvim'
	},
	{
		src = 'https://github.com/ibhagwan/fzf-lua'
	},
	{
		src = 'https://github.com/nvim-treesitter/nvim-treesitter'
	},
  {
    src = 'https://github.com/nvim-lualine/lualine.nvim'
  }, 
  {
    src = 'https://github.com/nvim-tree/nvim-web-devicons'
  },
  {
    src = 'https://github.com/MeanderingProgrammer/render-markdown.nvim'
  },
  {
    src = 'https://github.com/folke/which-key.nvim'
  },
  {
    src = 'https://github.com/seblj/roslyn.nvim'
  },
  {
    src = 'https://github.com/folke/tokyonight.nvim'
  }
})

fzf = require('fzf-lua')
oil = require('oil').setup()
treesitter = require('nvim-treesitter')
rendermd = require('render-markdown')
lualine = require('lualine')
lualine.setup()
require('which-key').setup()
require('roslyn').setup()
