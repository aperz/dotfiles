""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"NOTES, POSSIBILITIES?
" global: /etc/vimrc
" arch-specific: /usr/share/vim/vimfiles/archlinux.vim
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" This must be first, because it changes other options as a side effect.
set nocompatible

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

colorscheme Tomorrow-Night-Bright


set statusline=%<%f%{FF()}\ %M\ %h%r%=%-10.(%l,%c%V\ b=%n,w=%{winnr()}%)\ %P
function! FF()
    if &ft == 'qf'
		return exists('w:quickfix_title') ? ' ' . w:quickfix_title : ''
    endif
    return &ff == 'unix'  ?  ''  :  ' [' . &ff . ']'
endfunction

set number                " turns line numbering on
set ruler           " show the cursor position all the time
set rulerformat=%l\:%c
set cursorline
set colorcolumn=81
hi colorcolumn ctermbg=4
"set colorcolumn=81 ctermbg=7
set term=screen-256color
set t_md=

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("vms")
      set nobackup              " do not keep a backup file, use versions instead
else
      set backup          " keep a backup file
endif
set history=50              " keep 50 lines of command line history

set modeline
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set showcmd					   " display incomplete commands
set incsearch                  " do incremental searching
set nowrap					   " turns off text wrapping
set nospell                    " turns on spell check for all files
set paste                      " turns on traditional pasting of text
set laststatus=2
set visualbell
set belloff=all
set t_vb=
set clipboard=unnamed
set hlsearch
" set timeoutlen=0 # this is great for using Esc but it causes the leader key to become unsueable.

let mapleader=","
"let mapleader = "\<Space>"

autocmd BufNewFile,BufRead *.txt,*.html,README set spell "turns on spell check only for specified files

" Associate filetypes with extensions
autocmd BufNewFile,BufRead *.not setlocal filetype=not
autocmd BufNewFile,BufRead *.kalen setlocal filetype=calendar
autocmd BufNewFile,BufRead *.tsv,*.csv setlocal filetype=tabular

filetype off
filetype plugin on
filetype plugin indent on
syntax on

"if has("autocmd")
"    au InsertEnter *
"        \ if v:insertmode == 'i' |
"        \   silent execute "!gnome-terminal-cursor-shape.sh ibeam" |
"        \ elseif v:insertmode == 'r' |
"        \   silent execute "!gnome-terminal-cursor-shape.sh underline" |
"        \ endif
"    au InsertLeave * silent execute "!gnome-terminal-cursor-shape.sh block"
"    au VimLeave * silent execute "!gnome-terminal-cursor-shape.sh block"
"endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" this section was in the end - some reason?
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4
set noautoindent " disabled for fix-vim-pasting plugin
set smartindent

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set the runtime path to include Vundle and initialize
set rtp+=$HOME/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'


" NOTES:
" :SemanticHighlightToggle -> toggle
" :set hlsearch! -> toggle

" Keep Plugin commands between vundle#begin/end.
if hostname() == 'Osiris'
    Plugin 'https://github.com/chr4/nginx.vim'
    Plugin 'christoomey/vim-tmux-navigator'
    Plugin 'Yggdroot/indentLine'
    Plugin 'nathanaelkane/vim-indent-guides'
    Plugin 'jalvesaq/R-Vim-runtime'
    "Plugin 'vim-scripts/Screen-vim---gnu-screentmux'
    Plugin 'ervandew/screen'
    Plugin 'vim-scripts/Vim-R-plugin'
    Plugin 'jalvesaq/VimCom'
    Plugin 'ivanov/vim-ipython'
    "Plugin 'vim-scripts/pythoncomplete'
    Plugin 'vim-scripts/indentpython.vim'
    Plugin 'vim-scripts/Python-mode-klen'
    "Plugin 'vim-ruby/vim-ruby'
    "Plugin 'tpope/vim-rails'
    Plugin 'ycm-core/YouCompleteMe'
    "autocmd FileType python Bundle 'Valloric/YouCompleteMe'
    "autocmd FileType R Bundle 'Valloric/YouCompleteMe'
    "autocmd FileType c++ Bundle 'Valloric/YouCompleteMe'
    "autocmd FileType c++ Bundle 'Valloric/YouCompleteMe'
    Plugin 'jaxbot/semantic-highlight.vim'
    Plugin 'challenger-deep-theme/vim'
    Plugin 'itchyny/lightline.vim'
    "Plugin 'manabuishii/vim-cwl'
    Plugin 'bioSyntax/bioSyntax-vim.git'
    "TODO require: +clipboard Plugin 'NLKNguyen/copy-cut-paste.vim'
    Plugin 'Rykka/InstantRst'
    Plugin 'Rykka/riv.vim'

elseif hostname() == 'Embers'
    Plugin 'https://github.com/chr4/nginx.vim'
    Plugin 'christoomey/vim-tmux-navigator'
    Plugin 'Yggdroot/indentLine'
    Plugin 'nathanaelkane/vim-indent-guides'
    Plugin 'jalvesaq/R-Vim-runtime'
    "Plugin 'vim-scripts/Screen-vim---gnu-screentmux'
    Plugin 'ervandew/screen'
    Plugin 'vim-scripts/Vim-R-plugin'
    Plugin 'jalvesaq/VimCom'
    Plugin 'ivanov/vim-ipython'
    "Plugin 'vim-scripts/pythoncomplete'
    Plugin 'vim-scripts/indentpython.vim'
    Plugin 'vim-scripts/Python-mode-klen'
    "Plugin 'vim-ruby/vim-ruby'
    "Plugin 'tpope/vim-rails'
    Plugin 'ycm-core/YouCompleteMe'
    "autocmd FileType python Bundle 'Valloric/YouCompleteMe'
    "autocmd FileType R Bundle 'Valloric/YouCompleteMe'
    "autocmd FileType c++ Bundle 'Valloric/YouCompleteMe'
    "autocmd FileType c++ Bundle 'Valloric/YouCompleteMe'
    Plugin 'jaxbot/semantic-highlight.vim'
    Plugin 'challenger-deep-theme/vim'
    Plugin 'itchyny/lightline.vim'
    "Plugin 'manabuishii/vim-cwl'
    "Plugin 'bioSyntax/bioSyntax-vim.git'
    "TODO require: +clipboard Plugin 'NLKNguyen/copy-cut-paste.vim'
    Plugin 'Rykka/InstantRst'
    Plugin 'Rykka/riv.vim'
    "Plugin 'ryanpcmcquen/fix-vim-pasting'
    Plugin 'preservim/nerdcommenter'




" chromebook crouton
elseif hostname() == 'localhost'
    Plugin 'christoomey/vim-tmux-navigator'
    Plugin 'https://github.com/Yggdroot/indentLine'
    Plugin 'https://github.com/ervandew/screen'
    Plugin 'https://github.com/jalvesaq/VimCom'
    Plugin 'https://github.com/ivanov/vim-ipython'
    Plugin 'vim-scripts/indentpython.vim'
    Plugin 'https://github.com/vim-scripts/Python-mode-klen'
    Plugin 'jaxbot/semantic-highlight.vim'
    Plugin 'preservim/nerdcommenter'

else
    Plugin 'https://github.com/chr4/nginx.vim'
    Plugin 'christoomey/vim-tmux-navigator'
    Plugin 'https://github.com/Yggdroot/indentLine'
    Plugin 'https://github.com/ervandew/screen'
    Plugin 'https://github.com/jalvesaq/VimCom'
    Plugin 'https://github.com/ivanov/vim-ipython'
    Plugin 'vim-scripts/indentpython.vim'
    Plugin 'https://github.com/vim-scripts/Python-mode-klen'
    Plugin 'jaxbot/semantic-highlight.vim'
    "Plugin 'ryanpcmcquen/fix-vim-pasting'
    Plugin 'preservim/nerdcommenter'
endif



call vundle#end()            " required
"
" see :h vundle for more details or wiki for FAQ


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-indent-guidelines
"let mycolour = 222
"set ts=4 sw=4 et
"let g:indent_guides_start_level = 2
"let g:indent_guides_guide_size = 1
"hi IndentGuidesOdd ctermbg = 235
"hi IndentGuidesEven ctermbg = 236


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" lightline
set noshowmode



let g:lightline = {
    \ 'colorscheme': 'one',
    \ 'component': {
    \   'filename': '%f', 
    \ },
    \ 'inactive': {
    \   'left': [ [ 'mode', 'paste' ],
    \           [ 'readonly', 'filename', 'modified' ] ],
    \   'right': [ [ 'lineinfo' ],
    \            [ 'percent' ],
    \            [ 'fileformat', 'fileencoding', 'filetype' ] ]
    \ },
    \ }



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins: indentLine
let g:indentLine_color_term = 239
" disable by def let g:indentLine_enabled = 0
"let g:indentLine_char = '¦'
let g:indentLine_char = "'"
"¦ ┆ │


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins: vim-r-plugin and screen.vim

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
"	C-a-: kill-session         kill a session
"	C-a %                      split pane vertically
"       C-a "                      split pane horizontally
"	C-a-o                      jump cursor to next pane
"	C-a C-o                    swap panes
"	C-a-: resize-pane -L 10    resizes pane by 10 to left (L R U D)
" Corresponding Vim commands
"	:split or :vsplit      split viewport
"	C-w-w                  jump cursor to next pane-
"	C-w-r                  swap viewports
"	C-w C-++               resize viewports to equal split
"	C-w 10+                increase size of current pane by value

"" For tmux support
" let g:ScreenImpl = 'Tmux' "????
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
"" start R with F2 key
"map <F2> <Plug>RStart 
"imap <F2> <Plug>RStart
"vmap <F2> <Plug>RStart
"" send selection to R with space bar
"" send line to R with space bar
"


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins: python-mode
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
let g:pymode_rope = 0
let g:pymode_rope_lookup_project = 0
let g:pymode_rope_show_doc_bind = 'K'

" Documentation
let g:pymode_doc = 0
"let g:pymode_doc_key = 'N'

"Linting
let g:pymode_lint = 0
"let g:pymode_lint_checker = "pyflakes,pep8"
" Auto check on save
let g:pymode_lint_write = 0

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 0
"let g:pymode_breakpoint_bind = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all


" Don't autofold code
let g:pymode_folding = 0

let g:pymode_python = 'python3'

let pymode = 1
let pymode_path = 1
let pymode_paths = []
let pymode_run = 1
let pymode_run_key = 'r'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" cpp c++ c

" key to compile and run current file (coursera Algorithmic Toolbox flags)
map <F8> :!g++ -pipe -O2 -std=c++11 max_pairwise_product.cpp % && ./a.out <CR> 
"map <F8> :!g++ % && ./a.out <CR> 
"autocmd BufNewFile *.cpp r /path/to/file.cpp


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins: YouCompleteMe
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_largefile=1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Keymap

" disable some
inoremap <BS> <Nop>
noremap <C-s> <Nop>
noremap <C-a> <Nop>
noremap <F3> <Nop>

inoremap <C-b> <>
" or C-Space
inoremap <C-h> <BS>
nnoremap <C-h> <BS>

" scrolling (uses e-d to scroll buffers - one hand scrolling)
"nnoremap <C-e> <C-u>
"vnoremap <C-e> <C-u>
"nnoremap <C-u> <C-e>
"vnoremap <C-u> <C-e>

" show type of thing under cursor
noremap <F3> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
" omnicompletion navigation in popup buffers
"inoremap <expr> j ((pumvisible())?("\<C-n>"):("j"))
"inoremap <expr> k ((pumvisible())?("\<C-p>"):("k"))

" Search hi Press F4 to toggle highlighting on/off, and show current value.
noremap <F4> :set hlsearch! hlsearch?<CR>


"Plugins: ScreenShell
vnoremap <Space> <Plug>RDSendSelection
nnoremap <Space> <Plug>RDSendLine
nnoremap <Space> :ScreenSend
vnoremap <Space> :ScreenSend
"inoremap <Nul> <C-x><C-o>

" arrows in insert mode
inoremap <C-j> ^[OA
inoremap <C-k> ^[OB
inoremap <C-l> ^[OC
inoremap <C-h> ^[OD

" pane navigation
"nnoremap <C-j> <C-w>j
"nnoremap <C-k> <C-w>k
"nnoremap <C-l> <C-w>l
"nnoremap <C-h> <C-w>h


"Plugins: vim-tmux-navigator
let g:tmux_navigator_no_mappings = 1

" these dont work: ^K, ^[k ^M-k, M-k, A-k
noremap <silent> <C-j> :TmuxNavigateDown<cr>
noremap <silent> <C-k> :TmuxNavigateUp<cr>
noremap <silent> <C-l> :TmuxNavigateRight<cr>
noremap <silent> <C-h> :TmuxNavigateLeft<cr>
noremap <silent> <C-\> :TmuxNavigatePrevious<cr>


"TODO: try mapping to something different after
" The below prevents alt pane changing (also control)
"map <C-j> <Nop>
"map <C-k> <Nop>
"map <C-l> <Nop>
"map <C-h> <Nop>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins: NERDCommenter
" Add spaces after comment delimiters by default
" let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

"noremap <C-n> <Nop>
map <C-n> <plug>NERDCommenterToggle
"noremap <leader>, <plug>NERDCommenterToggle


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Map the C-c / Esc variations

"" Can be typed even faster than jj.
":imap jk <Esc>
"" If want to avoid jk in certain languages can use:
"" (and to make it where order doesn't matter, the second mapping also)
":imap jw <Esc>
":imap wj <Esc>
"" Press i to enter insert mode, and ii to exit.
":imap ii <Esc>
"" Pressing Ctrl-L leaves insert mode in evim, so why not in regular vim, too.
":imap <C-L> <Esc>
"" This is a variation on the previous mapping that checks for evim
"" and only changes the function of <C-L> in regular vim.  This allows <C-L>
"" to still work as usual in evim. See :help insertmode for more.
":inoremap <expr> <C-L> &insertmode ? '<C-L>' : '<Esc>'
"" This is a variation on the previous mapping that additionally checks
"" for the popup menu (present when doing completions). During completions,
"" <C-L> adds a character from the current match, so this mapping will
"" preserve that behavior. See :help popupmenu-keys for more.
":inoremap <expr> <C-L> (pumvisible() <bar><bar> &insertmode) ? '<C-L>' : '<Esc>'
"" Use backtick.
":imap ` <Esc>
"" Two semicolons are easy to type.
":imap ;; <Esc>
"" Press Shift-Space (may not work on your system).
":imap <S-Space> <Esc>
"" Try the following so Shift-Space also enters insert mode.
":nmap <S-Space> i
"" Or just Space to enter insert mode.
":nmap <Space> i
"" In Mac OS X, mapping <S-space> does not work, but the following
"" is better (press the "apple" key and the space key).
"" Note that this will conflict with the spotlight shortcut
":imap <D-space> <Esc>
"" On gvim and Linux console Vim, you can use Alt-Space.
":imap <M-Space> <Esc>
inoremap <C-q> <C-c>
:inoremap <C-q> <C-c>




""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" crouton
"nnoremap "*p :r !cat /home/ola/.crouton-clipboard/data.txt<CR>
"vnoremap "*y :'<,'>w! /home/ola/.crouton-clipboard/data.txt<CR>

" keep folds on close file 
augroup remember_folds
    autocmd!
    autocmd BufWinLeave ?* mkview | filetype detect
    autocmd BufWinEnter ?* silent loadview | filetype detect
augroup END


