local Plug = vim.fn['plug#']
local PlugBegin = vim.fn['plug#begin']
local PlugEnd = vim.fn['plug#end']

PlugBegin('~/.config/nvim/plugged')
Plug('ryanoneill/vim-green-rhino')
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

-- Set to custom dark green color scheme
vim.opt.background = 'dark'                                          -- Dark background
vim.cmd.colorscheme('greenrhino')                                    -- Custom theme

-- Airline Settings
vim.g.airline_section_c = '%t'                                       -- Show only file tail name
vim.g.airline_extensions = {'branch', 'tabline', 'whitespace'}       -- Disable other extensions by default
vim.g.airline_theme = 'luna'                                         -- Dark green color theme
vim.g["airline#parts#ffenc#skip_expected_string"] = 'utf-8[unix]'    -- Don't display default file format

-- Airline Tabline Settings
vim.g["airline#extensions#tabline#enabled"] = 1                      -- Turn on tabline extension
vim.g["airline#extensions#tabline#show_buffers"] = 1                 -- Show buffers in tabline
vim.g["airline#extensions#tabline#buffers_label"] = ''               -- Don't display 'buffers' text in tabline
vim.g["airline#extensions#tabline#left_sep"] = ''                    -- No tabline separators
vim.g["airline#extensions#tabline#left_alt_sep"] = ''                -- No tabline separators
vim.g["airline#extensions#tabline#fnametruncate"] = 30               -- Truncate display to 30 characters
vim.g["airline#extensions#tabline#buffer_nr_show"] = 1               -- Show tab numbers
vim.g["airline#extensions#tabline#fnamemod"] = ':t'                  -- Only show filename in tab

-- Airline Branch (Fugitive) Extension Settings
vim.g["airline#extensions#branch#enabled"] = 1                       -- Confirm Fugitive is enabled
vim.g["airline#extensions#branch#format"] = 1                        -- Show only branch tail name

-- Airline Whitespace Extension Settings
vim.g["airline#extensions#whitespace#enabled"] = 1                   -- Confirm Whitespace is enabled
vim.g["airline#extensions#whitespace#show_message"] = 1              -- See the line number
vim.g["airline#extensions#whitespace#trailing_format"] = '%s'        -- Only show the line number
vim.g["airline#extensions#whitespace#mixed_indent_format"] = '%s'    -- Only show the line number
