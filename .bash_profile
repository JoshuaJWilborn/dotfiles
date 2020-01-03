# ~/.profile: executed by Bourne-compatible login shells.
if [ -f /etc/bash_completion  ]; then
  . /etc/bash_completion
fi
shopt -s cdable_vars
set bell-style visible
export EDITOR=vim
mesg n || true

PF_INFO="ascii title os host kernel uptime pkgs memory shell palette" pfetch 
shopt -s expand_aliases
set -o vi
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

if [ -f /home/linuxbrew/.linuxbrew/bin/brew ]; then
	eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
fi

if [ -z "$BASHRC_LOADED" ]; then
  source ~/.bashrc
fi
