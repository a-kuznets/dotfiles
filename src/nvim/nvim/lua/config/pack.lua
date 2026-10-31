vim.pack.add({
    "https://github.com/tpope/vim-fugitive",
    "https://github.com/lewis6991/gitsigns.nvim",
    "https://github.com/stevearc/oil.nvim",
    "https://github.com/kepano/flexoki-neovim",
    "https://github.com/ibhagwan/fzf-lua",
    "https://github.com/neovim/nvim-lspconfig",
})

vim.cmd.colorscheme("flexoki-light")

require("gitsigns").setup()
require("oil").setup({
    skip_confirm_for_simple_edits = true,
    view_options = { show_hidden = true },
})
