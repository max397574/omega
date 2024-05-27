return {
    { "max397574/nvim-cmp", enabled = true },
    { "max397574/jujutsu.nvim", lazy = false },
    { "MagicDuck/grug-far.nvim", config = true, cmd = { "GrugFar" } },
    {
        dir = "~/4_ComputerScience/1_Programming/neovim_plugins/colorscheme_switcher/",
    },
    { "elihunter173/dirbuf.nvim", config = true, cmd = { "Dirbuf" } },
    { "nvim-neorg/neorg-telescope", dev = true },
    {
        dir = "~/4_ComputerScience/1_Programming/neovim_plugins/tmpfile.nvim",
        cmd = "Tmp",
        config = function()
            require("tmpfile").setup({
                path = vim.fn.expand("~") .. "/5_Misc/tmpfiles",
            })
        end,
    },
    { "max397574/better-escape.nvim", dev = true, event = { "InsertEnter" }, config = true },
}
