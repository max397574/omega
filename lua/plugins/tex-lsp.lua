local tex_lsp = {
    "lervag/vimtex",
    config = function()
        local tex_preview_settings = {}
        local forward_search_executable = "/Applications/Skim.app/Contents/SharedSupport/displayline"
        local skim_args = { "%l", "%p", "%f" }

        tex_preview_settings = skim_args
        local texlab = {
            settings = {
                texlab = {
                    auxDirectory = ".",
                    build = {
                        on_save = true,
                        forward_search_after = true,
                    },
                    chktex = {
                        on_open_and_save = false,
                        on_edit = false,
                    },
                    latexindent = {
                        ["local"] = nil,
                        modify_line_breaks = false,
                    },
                    diagnostics = {
                        virtual_text = { spacing = 0, prefix = "" },
                        signs = true,
                        underline = true,
                    },
                    linters = { "chktex" },
                    auto_save = false,
                    ignore_errors = {},
                    diagnosticsDelay = 300,
                    formatterLineLength = 120,
                    forwardSearch = {
                        args = tex_preview_settings,
                        executable = forward_search_executable,
                    },
                    latexFormatter = "latexindent",
                },
            },
        }
        local function on_attach(client, bufnr)
            require("omega.modules.lsp.on_attach").setup(client, bufnr)
        end
        require("lspconfig").tsserver.setup({
            on_attach = on_attach,
        })
        local pid = vim.fn.getpid()

        local omnisharp_bin = "/usr/local/bin/omnisharp-roslyn/OmniSharp"
        local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

        require("lspconfig").omnisharp.setup({
            on_attach = on_attach,
            capabilities = capabilities,
            cmd = { omnisharp_bin, "--languageserver", "--hostPID", tostring(pid) },
            -- Additional configuration can be added here
        })

        require("lspconfig")["texlab"].setup(vim.tbl_deep_extend("force", {
            on_attach = on_attach,
            -- single_file_support = true,
            flags = {
                debounce_text_changes = 150,
            },
        }, texlab))
    end,
}

tex_lsp.init = function()
    vim.g.vimtex_view_method = "skim"
    vim.g.vimtex_quickfix_ignore_filters = {
        "Underfull",
        "Overfull",
        "undefined references",
        "(re)run Biber",
        "Unused global option(s)",
        "Package fancyhdr Warning",
    }
    vim.g.vimtex_quickfix_open_on_warning = 0
end

return tex_lsp
