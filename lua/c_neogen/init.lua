require('neogen').setup {
    snippet_engine = "luasnip",
    enabled = true,
    languages = {
        python = {
            template = {
                annotation_convention = "numpydoc" -- for a full list of annotation_conventions, see supported-languages below,
                }
        },
    }
}

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<Leader>ds", ":lua require('neogen').generate()<CR>", opts)
