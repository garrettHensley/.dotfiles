vim.cmd[[set completeopt+=noselect]]

vim.api.nvim_create_autocmd('LspAttach', {
  pattern = '*.cs',
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if not client then return end

    vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })

    local set = vim.keymap.set
    set('n', 'gd',         vim.lsp.buf.definition,    { buffer = true, desc = "Go to definition" })
    set('n', 'gD',         vim.lsp.buf.declaration,   { buffer = true, desc = "Go to declaration" })
    set('n', 'gr',         vim.lsp.buf.references,    { buffer = true, desc = "References" })
    set('n', 'K',          vim.lsp.buf.hover,         { buffer = true, desc = "Hover docs" })
    set('n', '<leader>rn', vim.lsp.buf.rename,        { buffer = true, desc = "Rename" })
    set('n', '<leader>ca', vim.lsp.buf.code_action,   { buffer = true, desc = "Code action" })
    set('n', '[d',         vim.diagnostic.goto_prev,  { buffer = true, desc = "Prev diagnostic" })
    set('n', ']d',         vim.diagnostic.goto_next,  { buffer = true, desc = "Next diagnostic" })
    set('n', '<leader>dd', vim.diagnostic.open_float, { buffer = true, desc = "Diagnostic detail" })
  end,
})
