local opt = vim.opt

opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true

opt.cursorline = true
opt.cursorlineopt = "number" 

opt.termguicolors = true

vim.cmd.colorscheme('tokyonight')

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'cs' },
  callback = function() vim.treesitter.start() end,
})
