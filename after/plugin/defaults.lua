-- quick save
vim.api.nvim_set_keymap("n", "<localleader>w", ":w<CR>", { noremap = true, silent = true })

-- highlighting
vim.api.nvim_set_keymap("n", "nl", ":noh", { noremap = true, silent = true })

-- explorer
vim.api.nvim_set_keymap("n", "<localleader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

-- save
vim.api.nvim_set_keymap("n", "<localleader>w", ":w!<CR>", { noremap = true, silent = false })
-- better window movement
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", { silent = true })
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", { silent = true })
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", { silent = true })
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", { silent = true })

-- faster movement in code from homerow
vim.api.nvim_set_keymap("n", "L", "w", { silent = true })
vim.api.nvim_set_keymap("n", "H", "b", { silent = true })

-- Resize window
vim.api.nvim_set_keymap("n", "<C-Left>", ":vertical resize -10<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-Down>", ":resize +10<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-Up>", ":resize -10<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-Right>", ":vertical resize +10<CR>", { noremap = true, silent = true })

-- better indenting
vim.api.nvim_set_keymap("v", "<", "<gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", ">", ">gv", { noremap = true, silent = true })

-- Better nav for omnicomplete
vim.cmd('inoremap <expr> <c-j> ("\\<C-n>")')
vim.cmd('inoremap <expr> <c-k> ("\\<C-p>")')
vim.api.nvim_set_keymap("t", "<ESC>", "<C-\\><C-n>", { noremap = true, silent = true }) -- terminal mode remap for exit mode via ESC
vim.o.shell = "fish"

-- NOTE: Mapping multiple commands piped (|) cannot be done with nvim_create_autocmds "command" but must be used with a separate callback function
vim.api.nvim_create_autocmd("FileType", {
    pattern = "python",
    callback = function()
        vim.api.nvim_set_keymap("n", "<C-x>", ":vsplit | :term svenv; python %<CR>", { noremap = true, silent = true })
    end,
})
vim.api.nvim_create_autocmd("FileType", {
    pattern = "rust",
    callback = function()
        vim.api.nvim_set_keymap("n", "<C-x>", ":vsplit | :term cargo run<CR>", { noremap = true, silent = true })
    end,
})
vim.api.nvim_create_autocmd("FileType", {
    pattern = "rust",
    callback = function()
        vim.api.nvim_set_keymap("n", "<C-b>", ":vsplit | :term cargo build<CR>", { noremap = true, silent = true })
    end,
})

-- nvimtree
vim.api.nvim_set_keymap("n", "<leader>r", ":NvimTreeRefresh<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>f", ":NvimTreeFindFile<CR>", { noremap = true })

-- Other interactive
-- easier folding
vim.api.nvim_set_keymap("n", "<C-f>", "za", { noremap = true, silent = true }) -- terminal mode remap
-- jump out of brackets etc
vim.api.nvim_set_keymap("i", "<C-a>", "<C-o>a", { noremap = true, silent = true }) -- terminal mode remap

vim.api.nvim_set_keymap("n", "<leader>w", "<Cmd>w<CR>", { noremap = true })

-- Repl
vim.api.nvim_set_keymap("n", "<space>rr", ":IronRestart<CR>", { noremap = true })

-- LSP
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
})

vim.api.nvim_set_keymap("n", "T", ':lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', { noremap = true })
vim.api.nvim_set_keymap("n", "t", ':lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', { noremap = true })
vim.api.nvim_set_keymap(
    "n",
    "gl",
    ':lua vim.lsp.diagnostic.show_line_diagnostics({ border = "rounded" })<CR>',
    { noremap = true }
)

-- General setting
vim.wo.wrap = false --Display long lines as just one line
vim.cmd("set whichwrap+=<,>,[,],h,l")
vim.o.pumheight = 10 --Makes popup menu smaller
vim.o.fileencoding = "utf-8" --The encoding written to file
vim.o.cmdheight = 2 --More space for displaying messages
vim.o.mouse = "a" --Enable your mouse
vim.o.splitbelow = true --Horizontal splits will automatically be below
vim.o.termguicolors = true
vim.o.splitright = true --Vertical splits will automatically be to the right
vim.o.conceallevel = 0 --So that I can see `` in markdown files
vim.wo.relativenumber = true
vim.wo.signcolumn = "yes" --Always show the signcolumn, otherwise it would shift the text each time
vim.o.updatetime = 300 --Faster completion
vim.o.timeoutlen = 500 --By default timeoutlen is 1000 ms
vim.o.ttimeoutlen = 10 -- Used for key code delays
vim.o.clipboard = "unnamedplus" --Copy paste between vim and everything else
vim.cmd("set synmaxcol=120") -- stop syntax highlighting after a certain column to not be super slow on files with long lines
vim.o.filetype = "on" -- needs to be enabled to to have autocmd based of FileType working
vim.o.hidden = true -- To be able to move out of a modified buffer without writing
vim.g.tex_flavor = "latex" -- to also have files ot type plaintex treated as latex files
vim.g.rooter_manual_only = true -- no auto rooting to .git / etc
