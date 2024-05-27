return {
    "nvim-neorg/neorg",
    opts = {
        load = {
            ["core.dirman"] = {
                config = {
                    workspaces = {
                        notes = "~/1_Knowledge/2_Notes/",
                        books = "~/1_Knowledge/1_Books/",
                        plugins = "~/4_ComputerScience/1_Programming/neovim_plugins/",
                    },
                },
            },
        },
    },
}
