return {
    { "max397574/nvim-cmp", enabled = true },
    {
        dir = "~/neovim_plugins/colorscheme_switcher/",
    },
    { "elihunter173/dirbuf.nvim", config = true, cmd = { "Dirbuf" } },
    { "stevearc/oil.nvim", opts = {
        win_options = {
            conceallevel = 0,
        },
    } },

    {
        "windwp/nvim-autopairs",
        enabled = true,
        config = function() end,
        -- opts = {
        --     ignored_next_char = ".*",
        --     disable_filetype = { "tex", "rust" },
        -- },
    },
    { "nvim-neorg/neorg-telescope", dev = true },
    {
        "nvim-telescope/telescope.nvim",
        opts = {
            pickers = {
                live_grep = {
                    file_ignore_patterns = {
                        "^target",
                        "%.aux",
                        "%.toc",
                        "%.pdf",
                        "%.out",
                        "%.log",
                        "%.png",
                        "%.jpg",
                        "%.jpeg",
                        ".repro/*",
                        "build/*",
                        ".docusaurus/*",
                        "node_modules/*",
                        ".DS_Store",
                        "lsp.json",
                        "types/lsp.lua",
                        "lazy.lock.json",
                    },
                },
            },
        },
    },
    {
        dir = "~/neovim_plugins/tmpfile.nvim",
        cmd = "Tmp",
        config = function()
            require("tmpfile").setup({
                path = vim.fn.expand("~") .. "/tmpfiles",
            })
        end,
    },
    { "alanfortlink/blackjack.nvim", cmd = { "BlackJackNewGame" } },
    { "max397574/better-escape.nvim", dev = true, event = { "InsertEnter" }, config = true },
}
