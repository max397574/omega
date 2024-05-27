return {
    "mhartington/formatter.nvim",
    opts = {
        filetype = {
            yaml = {
                function()
                    return {
                        exe = "yamlfmt",
                        args = { vim.fn.expand("%"), "-o", "-" },
                    }
                end,
            },
            typst = {
                function()
                    vim.cmd.w()
                    return {
                        exe = "typstfmt",
                        args = { vim.fn.expand("%"), "-o", "-" },
                        stdin = true,
                    }
                end,
            },
            query = {
                function()
                    return {
                        exe = "~/programming/rust/query-fmt/target/debug/query-fmt",
                        args = { vim.fn.expand("%"), "--preview", "--no-print-filename" },
                        stdin = true,
                    }
                end,
            },
            tex = {
                function()
                    return {
                        exe = "/usr/local/Cellar/latexindent/3.20.1/bin/latexindent",
                        args = {
                            "-g",
                            "/dev/null",
                        },
                        stdin = true,
                    }
                end,
            },
            xml = {
                function()
                    return {
                        exe = "/opt/local/bin/xmllint",
                        args = { vim.fn.expand("%"), "--format" },
                        stdin = true,
                    }
                end,
            },
            bib = {
                function()
                    return {
                        exe = "bibtex-tidy",
                        args = { vim.fn.expand("%"), "--v2" },
                        stdin = true,
                    }
                end,
            },
        },
    },
}
