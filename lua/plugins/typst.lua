local typst = {
    "max397574/typst-tools.nvim",
    lazy = false,
}

typst.opts = {
    treesitter = true,
    lsp = {
        enabled = true,
        on_attach = function(client, bufnr)
            require("omega.modules.lsp.on_attach").setup(client, bufnr)
        end,
    },
    formatter = {
        formatter_nvim = true,
        conform_nvim = false,
    },
}

return typst
