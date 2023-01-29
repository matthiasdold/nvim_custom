-- leader to space
vim.g.mapleader=','
vim.g.maplocalleader=','

-- quick save
vim.api.nvim_set_keymap('n', '<localleader>w', ':w<CR>', { noremap = true, silent = true })

-- highlighting
vim.api.nvim_set_keymap('n', 'nl', ':noh', { noremap = true, silent = true })

-- explorer
vim.api.nvim_set_keymap('n', '<localleader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

-- save
vim.api.nvim_set_keymap('n', '<localleader>w', ':w!<CR>', { noremap = true, silent = false})
-- better window movement
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { silent = true })

-- faster movement in code from homerow
vim.api.nvim_set_keymap('n', 'L', 'w', { silent = true })
vim.api.nvim_set_keymap('n', 'H', 'b', { silent = true })

-- coding with german keyboard
vim.api.nvim_set_keymap('i', '<C-h>', '[', { silent = true, noremap = true})
vim.api.nvim_set_keymap('i', '<C-l>', ']', { silent = true, noremap = true})
vim.api.nvim_set_keymap('i', '<C-s>', '{', { silent = true, noremap = true })
vim.api.nvim_set_keymap('i', '<C-g>', '}', { silent = true, noremap = true })
--vim.api.nvim_set_keymap('i', '{', '{}<left>', { silent = true, noremap = true })
--vim.api.nvim_set_keymap('i', '[', '[]<left>', { silent = true, noremap = true })

-- Resize window
vim.api.nvim_set_keymap('n', '<C-Left>', ':vertical resize -10<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-Down>', ':resize +10<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-Up>', ':resize -10<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-Right>', ':vertical resize +10<CR>', { noremap = true, silent = true })


-- Tab switch buffer --> specified in barbar
--vim.api.nvim_set_keymap('n', '<TAB>', ':bnext<CR>', { noremap = true, silent = true })
--vim.api.nvim_set_keymap('n', '<S-TAB>', ':bprevious<CR>', { noremap = true, silent = true })

-- better indenting
vim.api.nvim_set_keymap('v', '<', '<gv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '>', '>gv', { noremap = true, silent = true })

-- Better nav for omnicomplete
vim.cmd('inoremap <expr> <c-j> (\"\\<C-n>\")')
vim.cmd('inoremap <expr> <c-k> (\"\\<C-p>\")')

-- Iron vim
-- vim.api.nvim_set_keymap('n', '<C-S>', '<Cmd>lua require("iron").core.send(vim.api.nvim_buf_get_option(0,"ft"), vim.api.nvim_buf_get_lines(0, 0, -1, false))<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<C-s>', '<Cmd>lua require("iron").core.send_line()<CR>', { noremap = true, silent = true })
-- for some reason <Plug>(iron-visual-send) does not work directly, so we remap to default keymap for this
-- vim.api.nvim_set_keymap('v', '<C-s>', '<Cmd>lua require("iron").core.visual_send()<CR>', { noremap = true})
-- vim.api.nvim_set_keymap('v', '<C-s>', "<Cmd>:'<,'>TREPLSendSelection<CR>", { noremap = true, silent = true})
-- vim.api.nvim_set_keymap('n', '<C-s>', '<Cmd>TREPLSendLine<CR>', { noremap = true})
-- vim.api.nvim_set_keymap('v', '<C-s>', 'y<C-w>wpa<CR><C-\\><C-n><C-w>p<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<C-t>', '<Cmd>:Ttoggle<CR>', { noremap = true, silent = true })     -- terminal mode remap for exit mode via ESC
vim.api.nvim_set_keymap('t', '<ESC>', '<C-\\><C-n>', { noremap = true, silent = true })     -- terminal mode remap for exit mode via ESC

-- Python execuation
--vim.api.nvim_set_keymap('n', '<buffer> <C-x>', ":up<CR>:exec '! ipython3' shellescape(@%, 1)<CR>", {noremap = true})
-- vim.api.nvim_set_keymap('n', '<S-P>', ":up<CR>:exec '! python3 -m cProfile -o program.prof' shellescape(@%, 1)<CR> :exec '! svenv; snakeviz program.prof'<CR>", {noremap = true})

-- interesting fact, I could not get this to work with 'bash'
-- TODO: Think about how to derive the currently used venv -> not having svenv statically
vim.o.shell="fish"

-- NOTE: Mapping multiple commands piped (|) cannot be done with nvim_create_autocmds "command" but must be used with a separate callback function
vim.api.nvim_create_autocmd("FileType", { pattern = "python",
    callback = function () 
                vim.api.nvim_set_keymap("n", "<C-x>", ":vsplit | :term svenv; python %<CR>",
                                        { noremap = true, silent = true })
                end})
vim.api.nvim_create_autocmd("FileType", { pattern = "rust",
    callback = function () 
                vim.api.nvim_set_keymap("n", "<C-x>", ":vsplit | :term cargo run<CR>",
                                        { noremap = true, silent = true })
                end})
vim.api.nvim_create_autocmd("FileType", { pattern = "rust",
    callback = function () 
                vim.api.nvim_set_keymap("n", "<C-b>", ":vsplit | :term cargo build<CR>",
                                        { noremap = true, silent = true })
                end})

-- Telescope
vim.api.nvim_set_keymap('n', 'ff', "<Cmd>lua require('telescope.builtin').find_files()<CR>", {noremap = true})
vim.api.nvim_set_keymap('n', 'fg', "<Cmd>lua require('telescope.builtin').live_grep()<CR>", {noremap = true})
vim.api.nvim_set_keymap('n', 'fb', "<Cmd>lua require('telescope.builtin').buffers()<CR>", {noremap = true})
vim.api.nvim_set_keymap('n', 'fh', "<Cmd>lua require('telescope.builtin').help_tags()<CR>", {noremap = true})

-- CHADTree
-- vim.api.nvim_set_keymap('n', 'e', ":CHADopen<CR>", {noremap = true})

-- nvimtree
vim.api.nvim_set_keymap('n', '<C-e>', ":NvimTreeToggle<CR>", {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>r', ":NvimTreeRefresh<CR>", {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>f', ":NvimTreeFindFile<CR>", {noremap = true})

-- Other interactive
-- easier folding
vim.api.nvim_set_keymap('n', '<Space>', 'za', { noremap = true, silent = true})     -- terminal mode remap
-- jump out of brackets etc
vim.api.nvim_set_keymap('i', '<C-a>', '<C-o>a', { noremap = true, silent = true})     -- terminal mode remap
-- vim.cmd('autocmd FileType python vnoremap <silent> <C-s> m`""y:call vimteractive#sendlines(substitute(getreg(\'"\'), "\n*$", "", "")."\n")<CR>``')

-- Autoformat (should be autopep8 for python)
vim.api.nvim_set_keymap('n', 'F3', ":Autoformat<CR>", {noremap = true})


-- Debug Agent Protocol (DAP)
vim.api.nvim_set_keymap('n', 'F5', "<Cmd>lua require'dap'.continue()<CR>", {noremap = true})
vim.api.nvim_set_keymap('n', 'F10', "<Cmd>lua require'dap'.step_over()<CR>", {noremap = true})
vim.api.nvim_set_keymap('n', 'F11', "<Cmd>lua require'dap'.step_into()<CR>", {noremap = true})
vim.api.nvim_set_keymap('n', 'F12', "<Cmd>lua require'dap'.step_out()<CR>", {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>b', "<Cmd>lua require'dap'.toggle_breakpoint()<CR>", {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>B', "<Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>lp', "<Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>", {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>dr', "<Cmd>lua require'dap'.repl.open()<CR>", {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>dl', "<Cmd>lua require'dap'.run_last()<CR>", {noremap = true})

vim.api.nvim_set_keymap('n', '<leader>dn', "<Cmd>lua require('dap-python').test_method()<CR>", {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>df', "<Cmd>lua require('dap-python').test_class()<CR>", {noremap = true})
vim.api.nvim_set_keymap('v', '<leader>ds', "<ESC><Cmd>lua require('dap-python').debug_selection()<CR>", {noremap = true})

-- Quick save
vim.api.nvim_set_keymap('n', '<leader>s', "<Cmd>w<CR>", {noremap = true})
vim.api.nvim_set_keymap('i', '<leader>s', "<Cmd>w<CR>", {noremap = true})

-- Repl
vim.api.nvim_set_keymap('n', '<space>rr', ":IronRestart<CR>", {noremap = true})
