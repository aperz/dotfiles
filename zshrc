# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$HOME/.local/bin:$PATH

# Path to your oh-my-zsh installation.
# export ZSH=$HOME"/Dotfiles/oh-my-zsh"
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="robbyrussell"
#ZSH_THEME="af-magic-my" # I broke this?
ZSH_THEME="spaceship"
# Theunraveller kolo sorin
# oxide typewritten powerlevel10k alien/bullettrain
SPACESHIP_PROMPT_PREFIXES_SHOW=false
SPACESHIP_PROMPT_ORDER=(
    #time          # Time stamps section
    user          # Username section
    dir           # Current directory section
    #host          # Hostname section
    git           # Git section (git_branch + git_status)
    #hg            # Mercurial section (hg_branch  + hg_status)
    package       # Package version
    #node          # Node.js section
    #ruby          # Ruby section
    #elixir        # Elixir section
    #xcode         # Xcode section
    #swift         # Swift section
    #golang        # Go section
    #php           # PHP section
    #rust          # Rust section
    #haskell       # Haskell Stack section
    #julia         # Julia section
    #docker        # Docker section
    aws           # Amazon Web Services section
    venv          # virtualenv section
    conda         # conda virtualenv section
    pyenv         # Pyenv section
    #dotnet        # .NET section
    #ember         # Ember.js section
    #kubecontext   # Kubectl context section
    #terraform     # Terraform workspace section
    #exec_time     # Execution time
    line_sep      # Line break
    #battery       # Battery level and status
    vi_mode       # Vi-mode indicator
    jobs          # Background jobs indicator
    exit_code     # Exit code section
    char          # Prompt character
)
SPACESHIP_RPROMPT_ORDER=(
    time          # Time stamps section
    host          # Hostname section
)
SPACESHIP_TIME_SHOW=true
SPACESHIP_TIME_FORMAT=%D{%f}::%T
SPACESHIP_TIME_COLOR=black
SPACESHIP_HOST_SHOW=always
SPACESHIP_HOST_COLOR=green
SPACESHIP_HOST_COLOR_SSH=red
SPACESHIP_DIR_TRUNC=0
SPACESHIP_DIR_TRUNC_REPO=false

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
#CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=30

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    colorize
    history
    git
    zsh-autosuggestions
    zsh-syntax-highlighting 
    #tmux 
    python
    vi-mode
    web-search
    )

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# ==========================
# copied from .bashrc
#TERM=xterm

# some more ls aliases
#alias hir='history -r'
alias rm='rm -i'
alias lf='ls -B' # list files (and folders)
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias won='trash'
alias tmux='tmux -2' # forces 256 color support

alias xterm='xterm -maximized'
alias trim="sed -e 's/^[[:space:]]*//g' -e 's/[[:space:]]*\$//g'"
alias tree="tree -I '*~'"
#alias v='vim'
alias py='ipython'
alias jupyter-dark="jt -t onedork -fs 105 -tfs 13 -nfs 135 -cellw 88% -T && jupyter-notebook --NotebookApp.token='' --NotebookApp.password='' "
alias jupyter-bright="jt -t grade3 -fs 105 -tfs 13 -nfs 135 -cellw 88% -T && jupyter-notebook --NotebookApp.token='' --NotebookApp.password='' "
alias trello-app="google-chrome-stable --app='https://trello.com'"
alias docs-app="google-chrome-stable --app='https://docs.google.com/'"

alias bt='bluetoothctl'
# not tested
#function bt() {
#    if [[ $1 == "connect" ]]; then
#        if  [[ $2 == "E-headset" ]]; then
#            bluetoothctl connect 00:18:91:78:61:0E # EDIFIER W855BT
#        elif  [[ $2 == "E-speaker" ]]; then
#            bluetoothctl connect 5C:C6:E9:B6:F6:13 # EDIFIER R1700BT
#        elif  [[ $2 == "S-headset" ]]; then
#            bluetoothctl connect 00:1B:66:B7:C1:9B # Sennheiser CX 150BT
#    else
#        bluetoothctl "$@"
#    fi
#}


function g() {
    if [[ $@ == "s" ]]; then
        git status
    else
        git "$@"
    fi
}

function venv() {
    # with Osiris, the location was /P/
    if [[ $@ == "mne" ]]; then
        source $HOME/P/mnemonic_playground/venv-mnemonic-python3.5.new/bin/activate
    elif [[ $@ == "ls" ]]; then
        ls $HOME/P/venv/
    elif [[ $@ != "" ]]; then
        source $HOME/P/venv/$@/bin/activate
    else
        echo "venv: Specify venv name"
    fi
}

# set additional PATHs
if [[ -d $HOME/bin ]]; then
    export PATH=$PATH:$HOME/bin
fi

if [[ -d $HOME/.bin ]]; then
    export PATH=$PATH:$HOME/.bin
fi

if [[ -d $HOME/.local/.bin ]]; then
    export PATH=$PATH:$HOME/.local/.bin
fi

if [[ -d $HOME/.local/bin ]]; then
    export PATH=$PATH:$HOME/.local/bin
fi

if [[ $HOSTNAME == "Osiris" ]]; then
    #export PATH=$PATH:/home/perza/.aspera/connect/bin
    #export PATH=$PATH:/usr/local/bin/sratoolkit.2.5.2-ubuntu64/binexport 
    #export PATH=$PATH:/usr/local/bin/kentUtils
    #export PATH=$PATH:/P/mnenonic-old
    export PATH=$PATH:/P/metaphlan2
    export PATH=$PATH:/P/metaphlan2/utils
    export PATH=$PATH:/P/metaphlan2/strainphlan_src
    export PATH=$PATH:/P/microbiome_helper
    # wrenlab matrixdb metalearn
    export LD_LIBRARY_PATH=$HOME/.local/lib

    # work bench path
    WB="/P/mnemonic"
    DATA_MAIN="/D"

    export PATH="/home/perza/perl5/bin${PATH:+:${PATH}}"; export PATH;
    export PERL5LIB="/home/perza/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
    export PERL_LOCAL_LIB_ROOT="/home/perza/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
    export PERL_MB_OPT="--install_base \"/home/perza/perl5\""; export PERL_MB_OPT;
    export PERL_MM_OPT="INSTALL_BASE=/home/perza/perl5"; export PERL_MM_OPT;
fi


if [[ $HOSTNAME == "Sirius" ]]; then
    export PATH=$PATH:/home/aleksandra/.gem/ruby/2.3.0/bin 
fi


if [[ $HOSTNAME == "Ein" ]]; then
    export PATH=$PATH:/home/aleksandra/.bin
fi

if [[ $HOSTNAME == "localhost" ]]; then
    ## crouton-clipboard
    #nodejs ~/.crouton-clipboard/server
    (nohup nodejs ~/.crouton-clipboard/server.js > /dev/null 2>&1 &)                                                                          
fi


# ESC timeout  (Ola) 
KEYTIMEOUT=1
fpath=($fpath "/home/alx/.zfunctions")

  # Set Spaceship ZSH as a prompt
  autoload -U promptinit; promptinit
  prompt spaceship
