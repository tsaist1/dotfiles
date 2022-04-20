call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': './install --all' }
Plug 'junegunn/fzf.vim'
call plug#end()

set nocompatible
syntax on
filetype indent plugin on

" basic settings
set tabstop=4
set shiftwidth=4
set autoindent
set smartindent
set expandtab
set noesckeys
set relativenumber
set number
set ignorecase
set smartcase
set incsearch
set hlsearch
set autochdir
set nowrap
set backspace=indent,eol,start

colorscheme desert

nnoremap ∆ :m .+1<CR>==
nnoremap ˚ :m .-2<CR>==
inoremap ∆ <Esc>:m .+1<CR>==gi
inoremap ˚ <Esc>:m .-2<CR>==gi
vnoremap ∆ :m '>+1<CR>gv=gv
vnoremap ˚ :m '<-2<CR>gv=gv

