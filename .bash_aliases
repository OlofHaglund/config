alias ssh-pwd='eval $(ssh-agent -t 10m) && ssh-add ~/.ssh/id_rsa'
alias CHMOD='chmod --preserve-root'

ssht() {
    ssh-pwd; ssh $*
}
ssh-socks() {
    ssh-pwd; ssh -f -D 127.0.0.1:5555 -q -N $*
}
source /usr/share/bash-completion/completions/ssh
complete -F _ssh ssht
complete -F _ssh ssh-socks

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

gitbranch() {
    git branch | grep -i "$1" | xargs git checkout
}
