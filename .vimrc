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

nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
