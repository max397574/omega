-- Add custom mappings
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
