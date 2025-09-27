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
    {
        'kepano/flexoki-neovim',
        name = 'flexoki',
        config = function()
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
