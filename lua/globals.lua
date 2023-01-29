O = {
    auto_close_tree = 0,
    auto_complete = true,
    colorscheme = 'nvcode',
    hidden_files = true,
    wrap_lines = true,
    number = true,
    relative_number = true,
    shell = 'fish',
    database = {
        save_location = '~/.config/nvcode_db',
        auto_execute = 1
    },
    python = {
        linter = 'yapf',
        -- @usage can be 'yapf', 'black'
        formatter = 'flake8',
        autoformat = true,
        isort = false,
        diagnostics = {virtual_text = false, signs = true, underline = true}
    },
    lua = {
        -- @usage can be 'lua-format'
        formatter = 'lua-format',
        autoformat = true,
        diagnostics = {virtual_text = true, signs = true, underline = true}
    },
    sh = {
        -- @usage can be 'shellcheck'
        linter = 'shellcheck',
        -- @usage can be 'shfmt'
        formatter = 'shfmt',
        autoformat = false,
        diagnostics = {virtual_text = true, signs = true, underline = true}
    },
    json = {
        -- @usage can be 'prettier'
        formatter = 'prettier',
        autoformat = false,
        diagnostics = {virtual_text = true, signs = true, underline = true}
    },
    -- css = {formatter = '', autoformat = false, virtual_text = true},
    -- json = {formatter = '', autoformat = false, virtual_text = true}
    colors = {

    }
}

--luasnip = require('luasnip')

DATA_PATH = vim.fn.stdpath('data')
print(DATA_PATH)
CACHE_PATH = vim.fn.stdpath('cache')
