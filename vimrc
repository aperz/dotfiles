""""""""""""""""""""""""""""""""""""""""
" Keymap
imap <C-c> <Esc>
vmap <C-c> <Esc>
vmap <Space> <Plug>RDSendSelection
nmap <Space> <Plug>RDSendLine
inoremap <Nul> <C-x><C-o>

""""""""""""""""""""""""""""""""""""""""
" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
syntax enable
filetype off

set backspace=indent,eol,start " allow backspacing over everything in insert mode
" set backspace=indent,eol,start

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
" autocmd BufNewFile,BufRead *.txt,*.html,README set spell "turns on spell check only for specified files
set paste           " turns on traditional pasting of text
set number                " turns line numbering on
set ruler           " show the cursor position all the time
set rulerformat=%l\:%c
set cursorline

set tabstop=4
set expandtab
set shiftwidth=4
set autoindent
"set smartindent

set laststatus=2
set visualbell
set clipboard=unnamed
set paste

map <F3> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

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

call vundle#end()            " required
"filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on
filetype plugin indent on
"
" see :h vundle for more details or wiki for FAQ

""""""""""""""""""""""""""""""""""""""""
"map T <Esc>:tabnew<CR>                                                                                                                                                                                           
"map W <Esc>:tabclose<CR>                                                                                                                                                                                         
"map H <Esc>:tabprev<CR>                                                                                                                                                                                          
"map L <Esc>:tabnext<CR>                                                                                                                                                                                          
"map M <Esc>:make<CR>                                                                                                                                                                                             
"map <C-h> :execute 'tabmove' tabpagenr() - 2 <CR>                                                                                                                                                                
"map <C-l> :execute 'tabmove' tabpagenr() <CR>    

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" sample settings for vim-r-plugin and screen.vim
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

colorscheme Tomorrow-Night-Bright
hi Comment ctermfg=grey
