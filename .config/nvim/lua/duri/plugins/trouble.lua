return {
    "folke/trouble.nvim",
    config = function()
        require("trouble").setup({
            icons = true,
            use_diagnostic_signs = true,
        })
    end
}
