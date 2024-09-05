return {

    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lsp",

    },
    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {"lua_ls","clangd"}
        })
        local cmp = require('cmp')
        local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
        require("lspconfig").lua_ls.setup{}
        require("lspconfig").clangd.setup{
            {
                capabilities = lsp_capabilities,
                cmd = { "clangd", "--compile-commands-dir=./" },
                filetypes = { "c", "cpp", "objc", "objcpp" },
                root_dir = require("lspconfig").util.root_pattern("compile_commands.json", ".git"),
                settings = {
                    clangd = {
                        -- Add extra flags for preprocessor macros
                        compile_commands_dir = "./",
                    },
                },
            }}
        cmp.setup({
            sources = {
                { name = 'nvim_lsp' },
                { name = 'buffer' },
            },
        })
    end
}
