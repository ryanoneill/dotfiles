" vim-plug plugins section
call plug#begin('~/.vim/plugged')
Plug 'derekwyatt/vim-scala'
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

" Turn on line numbers
set number

" Set to custom dark green color scheme
set background=dark
colorscheme greenrhino

" Airline Settings
let g:airline_extensions=['branch',
\                         'tabline',
\                         'whitespace']                              " Disable other extensions by default
let g:airline_theme='luna'                                           " Dark green color theme
" Airline Tabline Extension Settings
" Using Buffers as Tabs
let g:airline#extensions#tabline#enabled=1                           " Turn on tabline extension
let airline#extensions#tabline#show_buffers=1                        " Show buffers in tabline
let airline#extensions#tabline#buffers_label=''                      " Don't display 'buffers' in tabline
let g:airline#extensions#tabline#left_sep=''                         " No tabline separators
let g:airline#extensions#tabline#left_alt_sep=''                     " No tabline separators
let g:airline#extensions#tabline#fnametruncate=30                    " Truncate display to 30 characters
let g:airline#extensions#tabline#buffer_nr_show=1                    " Show tab numbers
let g:airline#extensions#tabline#fnamemod=':t'                       " Only show filename in tab
" Airline Branch (Fugitive) Extension Settings
let g:airline#extensions#branch#enabled=1                            " Confirm Fugitive is enabled
" Airline Whitespace Extension Settings
let g:airline#extensions#whitespace#enabled=1                        " Confirm Whitespace is enabled
let g:airline#extensions#whitespace#show_message=1                   " See the line number
let g:airline#extensions#whitespace#trailing_format='%s'             " Only show the line number
let g:airline#extensions#whitespace#mixed_indent_format='%s'         " Only show the line number
" let g:airline#extensions#whitespace#
