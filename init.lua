local Plug = vim.fn['plug#']
local PlugBegin = vim.fn['plug#begin']
local PlugEnd = vim.fn['plug#end']

PlugBegin('~/.config/nvim/plugged')
Plug('arcticicestudio/nord-vim')
Plug('neoclide/coc.nvim', { branch = 'release' })
Plug('rust-lang/rust.vim')
Plug('tpope/vim-commentary')
Plug('tpope/vim-fugitive')
Plug('vim-airline/vim-airline')
Plug('vim-airline/vim-airline-themes')
PlugEnd()

-- General Settings
vim.opt.expandtab = true                                             -- Tabs as spaces
vim.opt.shiftwidth = 2                                               -- Indentation of 2 spaces
vim.opt.softtabstop = 2                                              -- Indentation without hard tabs
vim.opt.wrap = false                                                 -- Don't wrap lines
vim.opt.number = true                                                -- Turn on line numbers
vim.opt.signcolumn = 'yes'                                           -- Always show signcolumn

-- Color Scheme Nord
vim.cmd.colorscheme('nord')                                          -- Testing out Nord color scheme

-- Airline Settings
vim.g.airline_section_c = '%t'                                       -- Show only file tail name
vim.g.airline_extensions = {'branch', 'tabline', 'whitespace'}       -- Disable other extensions by default
vim.g.airline_theme = 'nord'                                         -- Nord theme
vim.g["airline#parts#ffenc#skip_expected_string"] = 'utf-8[unix]'    -- Don't display default file format

-- Airline Tabline Settings
vim.g["airline#extensions#tabline#enabled"] = 1                      -- Turn on tabline extension
vim.g["airline#extensions#tabline#show_buffers"] = 1                 -- Show buffers in tabline
vim.g["airline#extensions#tabline#buffers_label"] = ''               -- Don't display 'buffers' text in tabline
vim.g["airline#extensions#tabline#left_sep"] = ' '                   -- No tabline separators
vim.g["airline#extensions#tabline#left_alt_sep"] = ''                -- No tabline separators
vim.g["airline#extensions#tabline#fnametruncate"] = 30               -- Truncate display to 30 characters
vim.g["airline#extensions#tabline#buffer_nr_show"] = 0               -- Turn off numbers (Use wildmode instead)
vim.g["airline#extensions#tabline#fnamemod"] = ':t'                  -- Only show filename in tab

-- Airline Branch (Fugitive) Extension Settings
vim.g["airline#extensions#branch#enabled"] = 1                       -- Confirm Fugitive is enabled
vim.g["airline#extensions#branch#format"] = 1                        -- Show only branch tail name

-- Airline Whitespace Extension Settings
vim.g["airline#extensions#whitespace#enabled"] = 1                   -- Confirm Whitespace is enabled
vim.g["airline#extensions#whitespace#show_message"] = 1              -- See the line number
vim.g["airline#extensions#whitespace#trailing_format"] = '%s'        -- Only show the line number
vim.g["airline#extensions#whitespace#mixed_indent_format"] = '%s'    -- Only show the line number

-- Colorscheme Overrides
vim.api.nvim_set_hl(0, 'CocInlayHint', { ctermfg=8 })                -- Make hints look like comments

-- Buffer Next, Previous, and Close
vim.keymap.set('n', '<leader>n', '<cmd>bnext<cr>')
vim.keymap.set('n', '<leader>b', '<cmd>bprevious<cr>')
vim.keymap.set('n', '<leader>x', '<cmd>bd<cr>')
