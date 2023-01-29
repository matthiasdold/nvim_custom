" Configurations not in lua but vimscript for various reasons
" This is sourced from unit.lua"

highlight ColorColumn guibg=#19191f
highlight Folded guibg=#39393f guifg=#81a1c1 gui=None
highlight Comment gui=italic					
set cc=80

" For the matching parenteses / brakets
highlight MatchParen guifg=#ff3555 guibg=None gui=bold

"----------------------------------------------------------
"-- Custom highlighting
"----------------------------------------------------------
syn region pythonDocstring  start=+^\s*[uU]\?[rR]\?"""+ end=+"""+ 
syn region pythonDocstring  start=+^\s*[uU]\?[rR]\?'''+ end=+'''+ 
" keepend excludenl contains=pythonEscape,@Spell,pythonDoctest,pythonDocTest2,pythonSpaceError
hi def link pythonDocstring pythonTSComment 
" --> The above does not work. I should probably tweek a query / .scm file
" For treesitter directly to identify the """<something>""" as a docstring
" Queries are located at ~/.local/share/nvim/site/pack/packer/start/nvim-treesitter/queries/


"----------------------------------------------------------
"-- Removing trailing whitespace on save -> TODO: to lua?
"----------------------------------------------------------
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif

"----------------------------------------------------------
"-- for journaling TODO: to lua?
"----------------------------------------------------------
autocmd BufWritePost 0_combined_journal.md :! bass /home/md/Documents/journal/sync_back_todos.sh
" NOTE -> the combination of the 0_combine* etc is managed in the combine_and_open_combined_journal.sh which is triggered from dwm

"----------------------------------------------------------
"-- nicer execution of python files -> TODO: to lua?
"----------------------------------------------------------
" neoterm -> not load compatebility as script is vimscript
"	set nocompatible ---> NOTE I had to get rid of this for the lua/vimscript setup to work
" filetype off
" 
" let &runtimepath.=',$HOME.local/share/nvim/site/pack/packer/start/neoterm'
" 
" filetype plugin on
"
" let g:neoterm_repl_enable_ipython_paste_magic = 1
" let g:neoterm_bracketed_paste = 1
" let g:neoterm_default_mod = "vertical"
" let g:neoterm_repl_python = ["svenv", "clear", "ipython --no-autoindent"]

" SUPER IMPORTANT NOTE: --> these remaps did not work in the lua at all! Same as for iron,
" If time allows, investigate and understand why this is screwed up
" vnoremap <C-s> :TREPLSendSelection<CR>
" nnoremap <C-s> :TREPLSendLine<CR>

" Trying to fix iron
" NOTE: This is super interesting, that the following keymap from lua does not work
" vim.api.nvim_set_keymap('v', '<C-s>', '<Cmd>lua require("iron").core.visual_send()<CR>', { noremap = true})
"
" This might explain other non working keymaps as well --> investigate if time allows
" vnoremap <C-s> :lua require("iron").core.visual_send()<CR>
" nnoremap <C-s> :lua require("iron").core.send_line()<CR>

"----------------------------------------------------------
"-- Spell checking
"----------------------------------------------------------
nnoremap <silent> <F11> :set spell!<cr>


"----------------------------------------------------------
"-- Markdown
"----------------------------------------------------------
autocmd FileType markdown nnoremap <leader>w :MarkdownPreviewToggle<cr>

"----------------------------------------------------------
"-- Web development 
"----------------------------------------------------------
" Note: As of 2022-06-22 I had to source the correct node environment. Not sure what changed
autocmd FileType html,css,js nnoremap <leader>w :Dispatch snode & browser-sync start --server --files "*.js, *.html, *.css, css/*.css, js/*.js"<cr>


"----------------------------------------------------------
"-- Again, consider taking a larger tool, with lua focus --> for now this is minimalist setup
"-- also facilitating make files as stolen from here: https://www.preciouschicken.com/blog/posts/neovim-latex-zathura-in-perfect-harmony/
"----------------------------------------------------------
function! ZathuraOpenPdf()
	let fullPath = expand("%:p")
	let pdfFile = substitute(fullPath, ".tex", ".pdf", "")
	execute "silent !zathura '" . pdfFile . "' &"
endfunction

nnoremap <A-p> :call ZathuraOpenPdf()<CR>
" note, this is for preview only, for the actual compilation is am using
" Makefiles


" highlight Cursor guifg=white guibg=black --> changing the coursor for mac does not work for whatever reason!
highlight iCursor guifg=white guibg=steelblue
set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver100-iCursor
set guicursor+=n-v-c:blinkon0
set guicursor+=i:blinkwait10

" Highlight current line
hi CursorLineNr guifg=#aef202 guibg=None
set cursorline
set cursorlineopt=number    " do not highlight the full line

"" LSP for texlab LS
"if executable('texlab')
"    au User lsp_setup call lsp#register_server({
"                \ 'name': 'texlab',   
"                \ 'cmd': {server_info->['texlab']},
"                \ 'config': {
"                \     'hover_conceal': 0,
"                \ },
"                \ 'whitelist': ['bib','tex'],
"                \ })
"endif


"----------------------------------------------------------
"-- Closing three if last open buffer
"----------------------------------------------------------
autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif


"----------------------------------------------------------
"-- Vimtex (for quicker config doing it here for now)
"----------------------------------------------------------
" Or with a generic interface:
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'


"----------------------------------------------------------
"-- Some file dependent config TODO: Implement in lua
" Have a look at this link: https://alpha2phi.medium.com/neovim-for-beginners-lua-autocmd-and-keymap-functions-3bdfe0bebe42
"----------------------------------------------------------
autocmd FileType html setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd FileType css setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd FileType javascript setlocal shiftwidth=2 softtabstop=2 expandtab
