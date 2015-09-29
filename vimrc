syntax on
filetype plugin indent on
set notitle
set noswapfile

set background=dark
set t_Co=256

set hlsearch
set incsearch

set tabstop=4
"Make softtabstop and shiftwidth follow tabstop
set softtabstop=-1
set shiftwidth=0
set expandtab

map T <Esc>:tabnew<CR>
map W <Esc>:tabclose<CR>
map H <Esc>:tabprev<CR>
map L <Esc>:tabnext<CR>
map M <Esc>:make<CR>
map <C-h> :execute "tabmove" tabpagenr() - 2 <CR>
map <C-l> :execute "tabmove" tabpagenr() <CR>
