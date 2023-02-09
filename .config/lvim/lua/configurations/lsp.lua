-- generic LSP settings
-- -- make sure server will always be installed even if the server is in skipped_servers list
lvim.lsp.installer.setup.ensure_installed = {
    "sumneko_lua",
    "jsonls",
    "tsserver",
    "rust_analyzer",
}

require("lvim.lsp.manager").setup("angularls")
