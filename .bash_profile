# ~/.profile: executed by Bourne-compatible login shells.

if [ "$BASH" ]; then
  if [ -f ~/.bashrc ]; then
    . ~/.bashrc
  fi
fi
powerline-daemon -q
# powerline
if [ -f /usr/share/powerline/bindings/bash/powerline.sh  ]; then
  source /usr/share/powerline/bindings/bash/powerline.sh
fi
if [ -f /etc/bash_completion  ]; then
  . /etc/bash_completion
fi
shopt -s cdable_vars
set bell-style visible

alias weather='curl -4 http://wttr.in/raleigh'
export EDITOR=vim
mesg n || true

PF_INFO="ascii title os host kernel uptime pkgs memory shell palette" ~/.pfetch
shopt -s expand_aliases
set -o vi
alias gp='git push -u origin HEAD'
alias vimrc="vim ~/.vimrc"
npmrc () {
  if [ -f ~/.npmrc ]; then
    mv ~/.npmrc ~/.npmrc.bak
  else
    mv ~/.npmrc.bak ~/.npmrc
  fi
}
export PATH=~/.local/bin:$PATH 
export AWS_SDK_LOAD_CONFIG=1
export NODE_OPTIONS="--max-old-space-size=8192"
alias ticker="watch -n 2 -t -c ~/ticker.sh"
alias ticker1="ticker TSLA MSFT AMD TGT DIS TWLO"
alias open="'/mnt/c/Program Files/Firefox Developer Edition/firefox.exe'"
alias scrum="open $STANDUP_URL"

