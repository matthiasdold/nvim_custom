vim.g.startify_custom_header = {
    '                                                                ',
    '                                                         ,o88888',
    '                                                      ,o8888888',
    '                                ,:o:o:oooo.        ,8O88Pd8888"',
    '                            ,.::.::o:ooooOoOoO. ,oO8O8Pd888"´',
    '                          ,.:.::o:ooOoOoOO8O8OOo.8OOPd8O8O"',
    '                         , ..:.::o:ooOoOOOO8OOOOo.FdO8O8"',
    '                        , ..:.::o:ooOoOO8O888O8O,COCOO"',
    '                       , . ..:.::o:ooOoOOOO8OOOOCOCO"',
    '                        . ..:.::o:ooOoOoOO8O8OCCCC"o',
    '                           . ..:.::o:ooooOoCoCCC"o:o',
    '                           . ..:.::o:o:,cooooCo"oo:o:',
    '                         `   . . ..:.:cocoooo"´o:o:::',
    '                        .`   . ..::ccccoc"´o:o:o:::',
    '                       :.:.    ,c:cccc"´:.:.:.:.:.',
    '                     ..:.:"``::::c:"´..:.:.:.:.:.',
    '                  ...:.`.:.::::"´    . . . . .',
    '                  .. . ....:."´ `   .  . . ',
    '                . . . ...."',
    '                .. . ."',
    '               .',
}

vim.g.webdevicons_enable_startify = 1
vim.g.startify_enable_special = 0
vim.g.startify_session_dir = '~/.config/nvim/session'
vim.g.startify_session_autoload = 1
vim.g.startify_session_delete_buffers = 1
vim.g.startify_change_to_vcs_root = 1
vim.g.startify_fortune_use_unicode = 1
vim.g.startify_session_persistence = 1
vim.g.startify_session_dir = '~/.config/nvim/session'

vim.api.nvim_exec(
    'let startify_lists = [ { \'type\': \'files\', \'header\': [\' Files\'] }, { \'type\': \'sessions\',  \'header\': [\'   Sessions\'] },    { \'type\': \'bookmarks\', \'header\': [\'   Bookmarks\'] },                                                                   ]',
    true)

vim.api.nvim_exec(
    'let startify_bookmarks = [{ \'b\': \'~/.bashrc\' }, { \'n\': \'~/.config/nvim/init.lua\' }, { \'f\': \'~/.config/fish/config.fish\' }, { \'r\': \'~/README.md\' }]',
    true)

vim.cmd([[
function! StartifyEntryFormat()
        return 'WebDevIconsGetFileTypeSymbol(absolute_path) ." ". entry_path'
endfunction
]])
