-- vim.cmd('colorscheme nord')
-- vim.cmd('let g:nord_termcolors=256')
-- vim.cmd('let g:nord_italic = 1')
-- vim.cmd('let g:nord_italic_comments = 1')

vim.cmd('syntax on')
vim.cmd('colorscheme moonfly')
-- vim.cmd('colorscheme nightfly')
-- vim.cmd('let g:codedark_conservative = 0')
-- vim.cmd('colorscheme codedark')

--Set Vim-specific sequences for RGB colors
-- vim.cmd('let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"')
-- vim.cmd('let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"')
-- vim.cmd('set termguicolors')

vim.cmd('let g:nord_termcolors=256')
vim.cmd('let g:nord_italic=1')
vim.cmd('let g:nord_italic_comments=1')
vim.cmd('hi LineNr ctermbg=NONE guibg=NONE')
vim.cmd('hi Normal ctermbg=NONE guibg=NONE')
vim.cmd('hi SignColumn ctermbg=NONE guibg=NONE')
vim.cmd('hi NormalFloat ctermbg=NONE guibg=NONE')
vim.cmd('hi FloatBorder ctermbg=NONE guibg=NONE')
vim.cmd('hi Pmenu ctermbg=NONE guibg=#252538')
-- Python docstrings same as comments
-- O is the global options object
-- vim.cmd('colorscheme ' .. O.colorscheme)

-- Custom highlighting for barbar --> actually barbar is good out of the box but 
-- not as flexible as I would have whished for ... maybe look for alternatives
-- local bbcolors = {
--     current_bg = '#5e81ac', -- #81a1c1
--     current_fg = '#000',
--     current_modified_bg = '#a3be8c',
--     current_modified_fg = '#000000',
--     current_sign_bg = '#5e81ac',
--     current_sign_fg = '#000',
--     current_index_bg = '#5e81ac',
--     current_index_fg = '#000',
--     current_sign_fg = '#ff5555'
-- }
-- 
-- 
-- vim.cmd('hi BufferCurrent guibg=' .. bbcolors.current_bg .. ' guifg=' .. bbcolors.current_fg)
-- vim.cmd('hi BufferCurrentIndex guibg=' .. bbcolors.current_index_bg .. ' guifg=' .. bbcolors.current_index_fg)
-- vim.cmd('hi BufferCurrentMod guibg=' .. bbcolors.current_modified_bg .. ' guifg=' .. bbcolors.current_modified_fg)
-- vim.cmd('hi BufferCurrentSign guibg=' .. bbcolors.current_sign_bg .. ' guifg=' .. bbcolors.current_sign_fg)
-- vim.cmd('hi link BufferCurrentIcon BufferCurrent')
-- vim.cmd('hi link BufferCurrentSign BufferCurrent')



-- LSP saga
vim.cmd('hi LspSagaCodeActionTruncateLine guibg=None guifg=#a3be8c')
vim.cmd('hi LspSagaSignatureHelpBorder guibg=None guifg=#a3be8c')
vim.cmd('hi DiagnosticInformation guibg=None guifg=#a3be8c')
vim.cmd('hi DiagnosticInformation guibg=None guifg=#a3be8c')
