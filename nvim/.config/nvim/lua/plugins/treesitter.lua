return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  opts = {
    ensure_installed = {
      "fsharp",
    },
    highlight = {
      enable = true,
    },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)

    -- Add custom F# parser if not in upstream
    local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
    parser_config.fsharp = {
      install_info = {
        url = "https://github.com/NightBlok/tree-sitter-fsharp",
        files = { "src/parser.c", "src/scanner.c" },
        branch = "main",
      },
      filetype = "fsharp",
    }
  end,
}

