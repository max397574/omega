return {
    "max397574/neocomplete.nvim",
    enabled = true,
    event = "InsertEnter",
    lazy = false,
    config = function()
        require("neocomplete").setup({})
        -- vim.keymap.set("i", "<c-j>", function()
        --     require("neocomplete").core:mappings("select_next", 1)
        -- end)
        -- vim.keymap.set("i", "<c-k>", function()
        --     require("neocomplete").core:mappings("select_prev", 1)
        -- end)
        -- vim.keymap.set("i", "<cr>", function()
        --     require("neocomplete").core:mappings("confirm", 1)
        -- end)
        -- vim.keymap.set("i", "<c-space>", function()
        --     require("neocomplete").core:mappings("complete", 1)
        -- end)
    end,
    dependencies = {
        {
            "max397574/neocomplete-lsp.nvim", --[[ opts = {} ]]
        },
    },
}
