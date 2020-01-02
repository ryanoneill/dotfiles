" begin vim-plug plugins section
call plug#begin('~/.vim/plugged')
Plug 'derekwyatt/vim-scala'
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
Plug 'rust-lang/rust.vim'
Plug 'ryanoneill/vim-green-rhino'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()
" end vim-plug plugins section

" Confirmation of defaults
set wildmenu
set wildmode=full

" General Settings
set expandtab                                                        " Tabs as spaces
set shiftwidth=2                                                     " Indentation of 2 spaces
set softtabstop=2                                                    " Indentation without hard tabs
set nowrap                                                           " Don't wrap lines
set number                                                           " Turn on line numbers

" Set to custom dark green color scheme
set background=dark
colorscheme greenrhino

" Airline Settings
let g:airline_section_c='%t'                                         " Show only file tail name
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'         " Don't display default file format
let g:airline_extensions=['branch',
\                         'tabline',
\                         'whitespace']                              " Disable other extensions by default
let g:airline_theme='luna'                                           " Dark green color theme
" Airline Tabline Extension Settings
let g:airline#extensions#tabline#enabled=1                           " Turn on tabline extension
let g:airline#extensions#tabline#show_buffers=1                      " Show buffers in tabline
let g:airline#extensions#tabline#buffers_label=''                    " Don't display 'buffers' text in tabline
let g:airline#extensions#tabline#left_sep=''                         " No tabline separators
let g:airline#extensions#tabline#left_alt_sep=''                     " No tabline separators
let g:airline#extensions#tabline#fnametruncate=30                    " Truncate display to 30 characters
let g:airline#extensions#tabline#buffer_nr_show=1                    " Show tab numbers
let g:airline#extensions#tabline#fnamemod=':t'                       " Only show filename in tab
" Airline Branch (Fugitive) Extension Settings
let g:airline#extensions#branch#enabled=1                            " Confirm Fugitive is enabled
let g:airline#extensions#branch#format=1                             " Show only branch tail name
" Airline Whitespace Extension Settings
let g:airline#extensions#whitespace#enabled=1                        " Confirm Whitespace is enabled
let g:airline#extensions#whitespace#show_message=1                   " See the line number
let g:airline#extensions#whitespace#trailing_format='%s'             " Only show the line number
let g:airline#extensions#whitespace#mixed_indent_format='%s'         " Only show the line number

" Edit neovim config
nnoremap <leader>en :edit ~/.config/nvim/init.vim<cr>
" Source neovim config
nnoremap <leader>sn :source ~/.config/nvim/init.vim<cr>
" Cleanup old plugins
nnoremap <leader>pc :PlugClean<cr>
" Install new plugins
nnoremap <leader>pi :PlugInstall<cr>
" Exit terminal mode using only Escape
tnoremap <esc> <c-\><c-n>
" Send a true 'Escape' to terminal mode
tnoremap <c-v><esc> <esc>

" Fuzzy Finder Extension Settings (Use ctrl-p to open)
nnoremap <c-p> :<c-u>FZF<cr>
" Fuzzy Finder colors
let g:fzf_colors =
\ { 'fg':          ['fg', 'Normal'],
\   'bg':          ['bg', 'Normal'],
\   'hl':          ['fg', 'Comment'],
\   'fg+':         ['fg', 'Normal'],
\   'bg+':         ['bg', 'Visual'],
\   'hl+':         ['fg', 'Visual'],
\   'info':        ['fg', 'Comment'],
\   'border':      ['fg', 'Ignore'],
\   'prompt':      ['fg', 'LineNr'],
\   'pointer':     ['fg', 'Normal'],
\   'marker':      ['fg', 'Comment'],
\   'spinner':     ['fg', 'Comment'],
\   'header':      ['fg', 'Comment'] }
