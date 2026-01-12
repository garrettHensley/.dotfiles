vim.lsp.config['rustls'] = {
	    capabilities = capabilities,
    cmd = { 'rust-analyzer' },
    filetypes = { 'rust' },
    root_markers = {"Cargo.toml", ".git"},
}
