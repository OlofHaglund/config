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
