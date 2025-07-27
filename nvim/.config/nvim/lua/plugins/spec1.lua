

return {
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	{ 'kepano/flexoki-neovim', name = 'flexoki',
		config = function ()
			vim.cmd([[colorscheme flexoki]])
		end,
	},	
	{ 
		"nvim-treesitter/nvim-treesitter", 
		build = ":TSUpdate", 
		highlight = {
			enable = true
		}
	}, 
	{
		'nvimdev/dashboard-nvim',
		 event = 'VimEnter',
		 config = function()
			 local ascii = require("ascii.catgirl")
			require('dashboard').setup {
		      -- config
		      		theme = 'doom',
				config = {
					header = ascii.cat
				}
		    	}
		  end,
		  dependencies = { {'nvim-tree/nvim-web-devicons'}}
	},
	{ 'nvim-telescope/telescope.nvim', tag = '0.1.5', dependencies = { 'nvim-lua/plenary.nvim' } },
	{
	  "nvim-neo-tree/neo-tree.nvim",
	  branch = "v3.x",
	  dependencies = {
	    "nvim-lua/plenary.nvim",
	    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
	    "MunifTanjim/nui.nvim",
	    -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
	  },
	  lazy = false, -- neo-tree will lazily load itself
	  ---@module "neo-tree"
	  ---@type neotree.Config?
	  opts = {
	    -- fill any relevant options here
	  },
	}
}
