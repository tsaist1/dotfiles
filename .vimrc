syntax on
filetype indent plugin on
set tabstop=4
set shiftwidth=4
set expandtab
set relativenumber
set number
set ignorecase
set smartcase
set incsearch
set autochdir
set backspace=indent,eol,start
set t_Co=256
colorscheme desert

nnoremap ∆ :m .+1<CR>==
nnoremap ˚ :m .-2<CR>==
inoremap ∆ <Esc>:m .+1<CR>==gi
inoremap ˚ <Esc>:m .-2<CR>==gi
vnoremap ∆ :m '>+1<CR>gv=gv
vnoremap ˚ :m '<-2<CR>gv=gv

