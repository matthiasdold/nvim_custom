-- Helper function to shortly define auto commands similar to vim itsefl
local function define_augroups(definitions) -- {{{1
    -- Create autocommand groups based on the passed definitions
    --
    -- The key will be the name of the group, and each definition
    -- within the group should have:
    --    1. Trigger
    --    2. Pattern
    --    3. Text
    -- just like how they would normally be defined from Vim itself
    for group_name, definition in pairs(definitions) do
        vim.cmd('augroup ' .. group_name)
        vim.cmd('autocmd!')

        for _, def in pairs(definition) do
            local command = table.concat(vim.tbl_flatten {'autocmd', def}, ' ')
            vim.cmd(command)
        end

        vim.cmd('augroup END')
    end
end

define_augroups(
    {_general_settings = {
            {'BufWinEnter', '*', 'setlocal formatoptions-=c formatoptions-=r formatoptions-=o'},
            {'BufRead', '*', 'setlocal formatoptions-=c formatoptions-=r formatoptions-=o'},
            {'BufNewFile', '*', 'setlocal formatoptions-=c formatoptions-=r formatoptions-=o'},
        },
     nord_theme_overwrites = {
         {'ColorScheme nord', 'hi Folded', 'guibg=NONE'},
         {'ColorScheme nord', 'hi Normal', 'guibg=NONE ctermbg=NONE'},

     }
    }
)

