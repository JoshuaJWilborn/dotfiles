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
  alias vimrc="vim ~/.vimrc"
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
