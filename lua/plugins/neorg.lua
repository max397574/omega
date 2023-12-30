return {
    "nvim-neorg/neorg",
    dev = true,
    opts = {
        load = {
            ["core.dirman"] = {
                config = {
                    workspaces = {
                        notes = "~/notes",
                        plugins = "~/neovim_plugins/",
                    },
                },
            },
        },
    },
}
