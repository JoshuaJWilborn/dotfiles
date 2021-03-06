alias gp='git push -u origin HEAD'
alias vimrc="vim ~/.vimrc"
alias weather='curl -4 http://wttr.in/raleigh'
alias ticker="watch -n 2 -t -c ~/ticker.sh"
alias ticker1="ticker TSLA MSFT AMD TGT DIS TWLO"
alias scrum="open $STANDUP_URL"
alias undervolt="systemctl start undervolt"
alias uv="undervolt"
alias undervolt-reset="systemctl start undervolt-reset"
alias uvr="undervolt-reset"
alias st="st -f 'Hack:size=12'"
alias makekey="ssh-keygen -t rsa -C"
alias tmux="systemd-run --scope --user tmux attach"
alias hibernate="systemctl hibernate"
alias editmodified='vim $(git ls-files . --modified --exclude-standard --others)'
alias vim=nvim
