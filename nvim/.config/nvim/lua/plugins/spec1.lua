return {
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	{
		"dgox16/oldworld.nvim",
		name = "oldworld",
		lazy = false,
		priority = 1000,
	},
	{
		"kepano/flexoki-neovim",
		name = "flexoki",
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		highlight = {
			enable = true,
		},
	},
	{
		"MunifTanjim/nui.nvim",
		lazy = true,
	},

	{
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		config = function()
			local ascii = require("ascii.catgirl")
			require("dashboard").setup({
				-- config
				theme = "doom",
				config = {
					header = ascii.cat,
				},
			})
		end,
		dependencies = { { "nvim-tree/nvim-web-devicons" } },
	},
	{ "nvim-telescope/telescope.nvim", tag = "0.1.5", dependencies = { "nvim-lua/plenary.nvim" } },
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
		-- LSP Config
		{
			"neovim/nvim-lspconfig",
			event = { "BufReadPre", "BufNewFile" },
			config = function()
				require("lspconfig").rust_analyzer.setup({})
			end,
		},

		-- Autocomplete
		{
			"hrsh7th/nvim-cmp",
			dependencies = {
				"hrsh7th/cmp-nvim-lsp",
				"L3MON4D3/LuaSnip",
				"saadparwaiz1/cmp_luasnip",
			},
			event = "InsertEnter",
			config = function()
				local cmp = require("cmp")
				cmp.setup({
					snippet = {
						expand = function(args)
							require("luasnip").lsp_expand(args.body)
						end,
					},
					sources = {
						{ name = "nvim_lsp" },
						{ name = "luasnip" },
					},
					mapping = cmp.mapping.preset.insert({
						["<Tab>"] = cmp.mapping.confirm({ select = true }),
					}),
				})
			end,
		},

		-- Telescope
		{
			"nvim-telescope/telescope.nvim",
			dependencies = { "nvim-lua/plenary.nvim" },
			cmd = "Telescope",
			keys = {
				{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
				{ "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
			},
		},

		-- Which Key
		{
			"folke/which-key.nvim",
			event = "VeryLazy",
			config = function()
				require("which-key").setup()
			end,
		},
	},
}
