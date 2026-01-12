-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"


-- Works best with completeopt=noselect.
-- Use CTRL-Y to select an item. |complete_CTRL-Y|

-- LSP STUFF BELOW
vim.cmd[[set completeopt+=popup]]
vim.lsp.start({
  name = 'ts_ls',
  cmd = …,
  on_attach = function(client, bufnr)
    vim.lsp.completion.enable(true, client.id, bufnr, {
      autotrigger = true,
      convert = function(item)
        return { abbr = item.label:gsub('%b()', '') }
      end,
    })
  end,
})


vim.lsp.inlay_hint.enable()
-- language server?
vim.lsp.enable('luals')
vim.lsp.enable('rustls')
vim.lsp.enable('qmlls')
vim.cmd([[colorscheme sorbet]])


-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- import your plugins
    { import = "plugins" },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  	-- install = { colorscheme = { 'kepano/flexoki-neovim', name = 'flexoki'} },
	 {
     "nvim-treesitter/nvim-treesitter", branch= "master", lazy = false, build = "TSUpdate"
   },
  -- automatically check for plugin updates
  checker = { enabled = false },
})

