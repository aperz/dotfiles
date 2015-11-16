""""""""""""""""""""""""""""""""""""""""
" This must be first, because it changes other options as a side effect.
set nocompatible
filetype off
filetype plugin on
filetype plugin indent on
syntax on

set modeline
set backspace=indent,eol,start " allow backspacing over everything in insert mode

if has("vms")
      set nobackup              " do not keep a backup file, use versions instead
else
      set backup          " keep a backup file
endif
set history=50              " keep 50 lines of command line history

set showcmd         " display incomplete commands
set incsearch               " do incremental searching
set nowrap          " turns off text wrapping
set nospell                 " turns on spell check for all files
autocmd BufNewFile,BufRead *.txt,*.html,README set spell "turns on spell check only for specified files
set paste           " turns on traditional pasting of text
set number                " turns line numbering on
set ruler           " show the cursor position all the time
set rulerformat=%l\:%c
set cursorline

set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4
set autoindent
set smartindent

set laststatus=2
set visualbell
set clipboard=unnamed
set paste


""""""""""""""""""""""""""""""""""""""""
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.
Plugin 'https://github.com/jalvesaq/R-Vim-runtime'
Plugin 'https://github.com/vim-scripts/Screen-vim---gnu-screentmux'
Plugin 'https://github.com/vim-scripts/Vim-R-plugin'
Plugin 'https://github.com/jalvesaq/VimCom'

" Plugin 'https://github.com/vim-scripts/pythoncomplete'
Plugin 'https://github.com/vim-scripts/Python-mode-klen'

call vundle#end()            " required
"
" see :h vundle for more details or wiki for FAQ

""""""""""""""""""""""""""""""""""""""""
"Cory's settings

"map T <Esc>:tabnew<CR>                                                                                                                                                                                           
"map W <Esc>:tabclose<CR>                                                                                                                                                                                         
"map H <Esc>:tabprev<CR>                                                                                                                                                                                          
"map L <Esc>:tabnext<CR>                                                                                                                                                                                          
"map M <Esc>:make<CR>                                                                                                                                                                                             
"map <C-h> :execute 'tabmove' tabpagenr() - 2 <CR>                                                                                                                                                                
"map <C-l> :execute 'tabmove' tabpagenr() <CR>    

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-r-plugin and screen.vim

" Installation 
"       - Place plugin file under ~/.vim/
"       - To activate help, type in vim :helptags ~/.vim/doc
"       - Place the following vim conf lines in .vimrc
" Usage
"       - Read intro/help in vim with :h vim-r-plugin or :h screen.txt
"       - To initialize vim/R session, start screen/tmux, open some *.R file in vim and then hit F2 key
"       - Object/omni completion command CTRL-X CTRL-O
"       - To update object list for omni completion, run :RUpdateObjList
" My favorite Vim/R window arrangement 
"	tmux attach
"	Open *.R file in Vim and hit F2 to open R
"	Go to R pane and create another pane with C-a %
"	Open second R session in new pane
"	Go to vim pane and open a new viewport with :split *.R
" Useful tmux commands
"       tmux new -s <myname>       start new session with a specific name
"	tmux ls (C-a-s)            list tmux session
"       tmux attach -t <id>        attach to specific session  
"       tmux kill-session -t <id>  kill specific session
" 	C-a-: kill-session         kill a session
" 	C-a %                      split pane vertically
"       C-a "                      split pane horizontally
" 	C-a-o                      jump cursor to next pane
"	C-a C-o                    swap panes
" 	C-a-: resize-pane -L 10    resizes pane by 10 to left (L R U D)
" Corresponding Vim commands
" 	:split or :vsplit      split viewport
" 	C-w-w                  jump cursor to next pane-
" 	C-w-r                  swap viewports
" 	C-w C-++               resize viewports to equal split
" 	C-w 10+                increase size of current pane by value

"" For tmux support
"let g:ScreenImpl = 'Tmux'
"let vimrplugin_screenvsplit = 1 " For vertical tmux split
"let g:ScreenShellInitialFocus = 'shell' 
"" instruct to use your own .screenrc file
"let g:vimrplugin_noscreenrc = 1
"" For integration of r-plugin with screen.vim
"let g:vimrplugin_screenplugin = 1
"" Don't use conque shell if installed
"let vimrplugin_conqueplugin = 0
"" map the letter 'r' to send visually selected lines to R 
"let g:vimrplugin_map_r = 1
"" see R documentation in a Vim buffer
"let vimrplugin_vimpager = "no"
"let vimrplugin_args_in_stline = 1
""set expandtab
"set shiftwidth=4
"set tabstop=8
"" start R with F2 key
"map <F2> <Plug>RStart 
"imap <F2> <Plug>RStart
"vmap <F2> <Plug>RStart
"" send selection to R with space bar
"vmap <Space> <Plug>RDSendSelection 
"" send line to R with space bar
"nmap <Space> <Plug>RDSendLine
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" python-mode
" K             Show python docs
" <Ctrl-Space>  Rope autocomplete
" <Ctrl-c>g     Rope goto definition
" <Ctrl-c>d     Rope show documentation
" <Ctrl-c>f     Rope find occurrences
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)
let g:pymode_rope = 1

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

"Linting
"let g:pymode_lint = 1
"let g:pymode_lint_checker = "pyflakes,pep8"
" Auto check on save
"let g:pymode_lint_write = 1

" Support virtualenv
"let g:pymode_virtualenv = 1

" Enable breakpoints plugin
"let g:pymode_breakpoint = 1
"let g:pymode_breakpoint_bind = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 0

"let g:pymode_python = 'python3'








"""""""""""""""""""""""""""""""""""""""
" Keymap
inoremap <C-c> <Esc>
vnoremap <C-c> <Esc>
iunmap <Esc>
" inoremap <BS> <Nop>
vnoremap <Space> <Plug>RDSendSelection
nnoremap <Space> <Plug>RDSendLine
inoremap <Nul> <C-x><C-o>

" pane navigation
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

noremap <F3> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
" omnicompletion navigation in popup buffers
"inoremap <expr> j ((pumvisible())?("\<C-n>"):("j"))
"inoremap <expr> k ((pumvisible())?("\<C-p>"):("k"))
""""""""""""""""""""""""""""""""""""""""
colorscheme Tomorrow-Night-Bright
"hi Comment ctermfg=grey
