export GREP_OPTIONS="--color=auto"

# Alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# General
alias ack='ack-grep'
alias create='~/config-files/create.pl'
alias dr='tree -a ~/Dropbox'
alias home='cd ~ && clear'
alias ls='ls --group-directories-first --color=auto'
alias ll='ls -lh --group-directories-first --color=auto'
alias lla='ls -lAh --group-directories-first --color=auto'
alias mkdir='mkdir -p'
alias ping='ping -c3'
alias tree='tree -Ch'
alias rs='if [ -f /var/run/reboot-required ]; then echo "reboot required"; fi'

# Git
alias gita='git add'
alias gitc='git commit'
alias gitca='git commit -a'
alias gitp='git push'
alias gitpr='~/config-files/gitpr.sh'
alias gits='git status'
alias git3='~/config-files/git3.pl'

# System-related
alias ins='sudo apt-get install'
alias upd='~/config-files/update.sh'
alias sync-music='time rsync -avz /music/* root@jan-vigushin:/nfs/Music'

# If no man page exists, open info page.
man ()
{
    /usr/bin/man $@ || (help $@ 2> /dev/null && help $@ | less)
}
