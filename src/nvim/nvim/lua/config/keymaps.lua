local keymap = vim.keymap.set

-- Clipboard
keymap("v", "<leader>y", '"+y', { desc = "Yank to system clipboard" })
keymap("n", "<leader>p", '"+p', { desc = "Paste from system clipboard" })
keymap("v", "<leader>p", '"+p', { desc = "Paste from system clipboard" })
keymap("n", "<leader>@", ':let @+=expand("%:p")<CR>', { desc = "Copy current file path to clipboard" })

-- Navigate between panes with ctrl + h/j/k/l
keymap({ "n" }, "<C-h>", "<C-w>h")
keymap({ "n" }, "<C-j>", "<C-w>j")
keymap({ "n" }, "<C-k>", "<C-w>k")
keymap({ "n" }, "<C-l>", "<C-w>l")

-- Oil
keymap("n", "-", "<cmd>Oil<cr>", { desc = "Open parent directory" })

-- Fzf-lua
keymap("n", "<leader>ff", "<cmd>FzfLua files<cr>", { desc = "Find files" })
keymap("n", "<leader>fg", "<cmd>FzfLua live_grep<cr>", { desc = "Live grep" })
keymap("n", "<leader>fm", "<cmd>FzfLua git_status<cr>", { desc = "Find git modified files" })
keymap("n", "<leader>fb", "<cmd>FzfLua buffers<cr>", { desc = "Find buffers" })

-- LSP
keymap("n", "<leader>ld", function()
    vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, { desc = "Toggle diagnostics" })

-- Gitsigns
keymap("n", "<leader>gss", "<cmd>Gitsigns stage_hunk<cr>", { desc = "Stage hunk" })
keymap("n", "<leader>gsu", "<cmd>Gitsigns undo_stage_hunk<cr>", { desc = "Unstage hunk" })
keymap("n", "<leader>gsp", "<cmd>Gitsigns preview_hunk<cr>", { desc = "Preview hunk" })
keymap("n", "<leader>gsr", "<cmd>Gitsigns reset_hunk<cr>", { desc = "Preview hunk" })
keymap("n", "<leader>gsn", "<cmd>Gitsigns next_hunk<cr>", { desc = "Next hunk" })
keymap("n", "<leader>gsN", "<cmd>Gitsigns prev_hunk<cr>", { desc = "Previous hunk" })
keymap("n", "<leader>gsS", "<cmd>Gitsigns stage_buffer<cr>", { desc = "Stage buffer" })
keymap("n", "<leader>gsb", "<cmd>Gitsigns blame_line<cr>", { desc = "Blame line" })
keymap("n", "<leader>gsd", "<cmd>Gitsigns diffthis<cr>", { desc = "Diff this" })
keymap("n", "<leader>gst", "<cmd>Gitsigns toggle_current_line_blame<cr>", { desc = "Toggle line blame" })

-- Fugitive
keymap("n", "<leader>gg", "<cmd>Git<cr>", { desc = "Git status (fugitive)" })
keymap("n", "<leader>gd", "<cmd>Gvdiffsplit<cr>", { desc = "Diff current file vs. index" })
keymap("n", "<leader>gD", "<cmd>Git difftool -y origin/main...HEAD<cr>", { desc = "Diff branch vs. origin/main" })
keymap("n", "<leader>gl", "<cmd>Git log --oneline<cr>", { desc = "Git log" })
keymap("n", "<leader>gb", "<cmd>Git blame<cr>", { desc = "Git blame" })

-- Buffers
keymap("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
keymap("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })
keymap("n", "<leader>bd", "<cmd>bdelete<cr>", { desc = "Delete buffer" })

