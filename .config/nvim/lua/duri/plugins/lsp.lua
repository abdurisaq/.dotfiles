return {

    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    },
    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {"lua_ls","clangd"}
        })
        require("lspconfig").lua_ls.setup{}
        require("lspconfig").clangd.setup{
            {
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
    end
}
