local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--single-branch",
        "https://github.com/folke/lazy.nvim.git",
        lazypath,
    })
end
vim.opt.runtimepath:prepend(lazypath)

require("lazy").setup({
    spec = {
        {
            "omega-nvim/omega-nvim",
            import = "omega.modules",
        },
        -- add extra modules
        { import = "plugins" },
    },
    defaults = {
        lazy = false,
        version = false,
    },
    ui = {
        custom_keys = {
            ["<leader>?"] = function(plugin)
                vim.pretty_print(plugin)
            end,
        },
    },
})
