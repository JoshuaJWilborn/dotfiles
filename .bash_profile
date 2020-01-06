# ~/.profile: executed by Bourne-compatible login shells.
if [ -f /etc/bash_completion  ]; then
  . /etc/bash_completion
fi
shopt -s cdable_vars
set bell-style visible
export EDITOR=vim
mesg n || true

# we cache neofetch daily because it's sometimes slow
if [ ! -f ~/.neofetch-cache ]; then
  neofetch > ~/.neofetch-cache
else
  written=$(date -r ~/.neofetch-cache +%s)
  day=$((60*60*24))
  yesterday=$((`date +%s` - $day))
  if (($written < $yesterday)); then
    echo caching neofetch
    neofetch > ~/.neofetch-cache
  fi
fi
cat ~/.neofetch-cache

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
