" vim-plug plugins section
call plug#begin('~/.vim/plugged')
Plug 'derekwyatt/vim-scala'
Plug 'ryanoneill/vim-green-rhino'
Plug 'tpope/vim-commentary'
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
let g:airline_extensions=['tabline', 'whitespace']         " Disable other extensions by default
let g:airline_theme='luna'                                 " Dark green color theme
let g:airline#extensions#tabline#enabled=1                 " Buffers as tabs
let g:airline#extensions#tabline#left_sep=''               " No tabline separators
let g:airline#extensions#tabline#left_alt_sep=''           " No tabline separators
let g:airline#extensions#tabline#fnametruncate=30          " Truncate display to 30 characters
let g:airline#extensions#tabline#buffer_nr_show=1          " Show tab numbers
let g:airline#extensions#tabline#fnamemod=':t'             " Only show filename in tab
