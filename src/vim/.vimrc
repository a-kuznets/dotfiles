let mapleader = ' '
let maplocalleader = '\'

" Neovim defaults
filetype plugin indent on
syntax on
set hlsearch
set ttimeout ttimeoutlen=50

" Line numbers
set number
set relativenumber

" Search
set ignorecase
set smartcase

" Display
set nowrap
set scrolloff=10

" Cursor: block in normal, bar in insert, underline in replace
let &t_EI = "\e[2 q"
let &t_SI = "\e[6 q"
let &t_SR = "\e[4 q"
let &t_ti ..= "\e[2 q"
let &t_te ..= "\e[0 q"

" Whitespace
set list
set listchars=tab:>\ ,trail:-,nbsp:+

" Indent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" Ask to save
set confirm

" Reload files changed outside Vim
set autoread

" Clear search highlights after a pause or in insert mode
packadd! nohlsearch

" Briefly highlight yanked text
packadd! hlyank

" Clipboard
vnoremap <leader>y "+y
nnoremap <leader>p "+p
vnoremap <leader>p "+p
nnoremap <leader>@ :let @+=expand('%:p')<CR>

" Move between windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Buffers
nnoremap <S-h> <Cmd>bprevious<CR>
nnoremap <S-l> <Cmd>bnext<CR>
nnoremap <leader>bd <Cmd>bdelete<CR>

" Explore current directory
nnoremap - <Cmd>Explore<CR>
