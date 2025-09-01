-- See `:h nvim_create_user_command()` and `:h user-commands`

vim.api.nvim_create_user_command("GitBlameLine", function()
    local line_number = vim.fn.line(".") -- Get the current line number. See `:h line()`
    local filename = vim.api.nvim_buf_get_name(0)
    print(vim.fn.system({ "git", "blame", "-L", line_number .. ",+1", filename }))
end, { desc = "Print the git blame for the current line" })
