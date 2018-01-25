# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/home/cgoette/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="colby"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# aliases
## General
alias create='~/config-files/create.pl'
alias dr='tree -a ~/Dropbox'
alias home='cd ~; clear'
alias ls='ls --group-directories-first --color=auto'
alias ll='ls -lAh --group-directories-first --color=auto'
alias mkdir='mkdir -p'
alias ping='ping -c2'
alias tree='tree -Ch'

function plex(){
for arg
  do
    sudo chmod -R 775 "$arg"
  done
}

## Git
alias gita='git add'
alias gitc='git commit'
alias gitca='git commit -a'
alias gitp='git push'
alias gitpr='~/config-files/gitpr.sh'
alias gits='git status'
alias git3='~/config-files/git3.pl'

## System-related
alias ins='sudo dnf install'
alias upd='sudo dnf upgrade; sudo dnf erase -y akmod-nvidia libva-intel-driver xorg-x11-drv-nvidia-libs; sudo dnf install -y xorg-x11-drv-nvidia akmod-nvidia "kernel-devel-uname-r == $(uname -r)"'

PATH="/home/colby/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/colby/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/colby/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/colby/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/colby/perl5"; export PERL_MM_OPT;
