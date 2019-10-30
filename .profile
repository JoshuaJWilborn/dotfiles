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

alias extron=/mnt/c/Users/jwilborn
alias reg=/mnt/c/Users/jwilborn/device-registration/packages/service
alias tap=/mnt/c/Users/jwilborn/em-tap-ui/web
alias ua=/mnt/c/Users/jwilborn/upgrade-adapter

# Powerline
if [ -f /usr/share/powerline/bindings/bash/powerline.sh  ]; then
      source /usr/share/powerline/bindings/bash/powerline.sh
fi
export EDITOR=vim
mesg n || true

PF_INFO="ascii title os host kernel uptime pkgs memory shell palette" ~/.pfetch
