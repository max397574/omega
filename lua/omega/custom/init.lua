vim.api.nvim_create_autocmd("User", {
    pattern = "OmegaNewTheme",
    callback = function(args)
        require("colorscheme_switcher").new_scheme(args.data)
    end,
})

vim.api.nvim_create_user_command("TypstWatch", function()
    local job = vim.system({
        "typst",
        "watch",
        ---@diagnostic disable-next-line: assign-type-mismatch
        vim.fn.expand("%"),
        "--open",
        "/Applications/Skim.app/",
    })
    vim.api.nvim_buf_create_user_command(0, "TypstStop", function()
        job:kill(9)
        vim.api.nvim_buf_del_user_command(0, "TypstStop")
    end, {})

    vim.api.nvim_create_autocmd("VimLeavePre", {
        callback = function()
            job:kill(9)
            vim.api.nvim_buf_del_user_command(0, "TypstStop")
        end,
    })
end, {})

vim.keymap.set("n", "<leader>vl", function()
    vim.cmd.write()
    local shell_escape = false
    for _, line in ipairs(vim.api.nvim_buf_get_lines(0, 0, -1, false)) do
        if line:find("minted") or line:find("feynmp") then
            shell_escape = true
        end
    end
    if shell_escape then
        vim.cmd([[silent !pdflatex -shell-escape %; open %:t:r.pdf]])
    else
        vim.cmd([[silent !pdflatex %; open %:t:r.pdf]])
    end
end, { desc = " View Latex" })

vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*.tex",
    callback = function()
        local function latex_clipboard_image()
            local img_dir = vim.fn.getcwd() .. "/images"
            if vim.fn.isdirectory(img_dir) == 0 then
                vim.fn.mkdir(img_dir)
            end
            local index = 0
            local name
            vim.ui.input({ prompt = "Image name> " }, function(input)
                name = input
            end)
            local file_path = img_dir .. "/" .. name .. ".png"
            while vim.fn.filereadable(file_path) ~= 0 do
                index = index + 1
                file_path = img_dir .. "/" .. name .. index .. ".png"
            end
            local clip_command = 'osascript -e "set png_data to the clipboard as «class PNGf»" -e "set referenceNumber to open for access POSIX path of (POSIX file \\"'
                .. file_path
                .. '\\") with write permission" -e "write png_data to referenceNumber"'
            vim.fn.system(clip_command)
            if vim.v.shell_error == 1 then
                vim.notify("Missing Image in Clipboard", vim.log.levels.ERROR, {})
            else
                local caption = vim.fn.getline(".")
                local cursor = vim.api.nvim_win_get_cursor(0)
                vim.api.nvim_buf_set_lines(0, cursor[1] - 1, cursor[1], false, {
                    "\\begin{figure}[h]",
                    "\\centerline{\\includegraphics[width=200px]{" .. file_path:sub(
                        #img_dir + 2,
                        -(5 + (index ~= 0 and #tostring(index) or 0))
                    ) .. (index ~= 0 and tostring(index) or "") .. ".png}}",
                    "\\caption{" .. caption .. "}",
                    "\\end{figure}",
                })
            end
        end

        vim.keymap.set("n", "<c-p>", latex_clipboard_image, { silent = true, buffer = true })
    end,
})
