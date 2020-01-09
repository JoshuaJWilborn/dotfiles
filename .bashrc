# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples
# If not running interactively, don't do anything
[ -z "$PS1" ] && return
export EDITOR=vim
# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=9999
HISTFILESIZE=9999

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

unset color_prompt force_color_prompt
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias ls="dir"
dir () {
  if [ $(pwd) == '/mnt/c/Users/jwilborn' ]; then
    /usr/bin/ls -LXCpF --color=always --group-directories-first \
        -I "AppData" -I "Contacts" -I "Favorites" -I "Links"\
        -I "Music" -I "My Documents" -I "Pictures" -I "Videos" -I "Saved Games" -I "Start Menu" -I "OneDrive"\
        -I "NTUSER.*" -I "ntuser.*" -I "thumbs.db" -I "Thumbs.db" -I "desktop.ini"\
        -I "Application Data" -I "Cookies" -I "NetHood" -I "PrintHood" -I "Local Settings"\
        -I "Recent" -I "Searches" -I "SendTo" -I "Templates" -I "Downloads" -I "Documents"\
        -I "3D Objects" -I "Desktop"\
        $@
  else
    /usr/bin/ls -LXCpF --color=always --group-directories-first $@
  fi
}
# some more ls aliases
alias ll='ls -al'
alias la='ls -A'
alias l='ls'
alias less='less -R'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /usr/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash ] && . /usr/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /usr/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash ] && . /usr/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[ -f /usr/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.bash ] && . /usr/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.bash

bind '"\t":menu-complete'
bind "set show-all-if-ambiguous on"
bind "set completion-ignore-case on"
bind "set menu-complete-display-prefix on"

shopt -s cdable_vars
set bell-style visible
export EDITOR=vim
mesg n || true

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

shopt -s expand_aliases
set -o vi
export PATH=/home/jwilborn/.local/bin:$PATH
export PATH=/home/jwilborn/aws-codepipeline-status/bin:$PATH
export AWS_SDK_LOAD_CONFIG=1
export NODE_OPTIONS="--max-old-space-size=8192"

npmrc () {
  if [ -f ~/.npmrc ]; then
    mv ~/.npmrc ~/.npmrc.bak
  else
    mv ~/.npmrc.bak ~/.npmrc
  fi
}

if [ -f /home/linuxbrew/.linuxbrew/bin/brew ]; then
  eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
fi

if [ -f /etc/bash_completion  ]; then
  . /etc/bash_completion
fi

# we cache neofetch daily because it's sometimes slow
if [ ! -f ~/.neofetch-cache ]; then
  neofetch > ~/.neofetch-cache
else
  written=$(date -r ~/.neofetch-cache +%s)
  day=$((60*60*24))
  yesterday=$((`date +%s` - $day))
  if (($written < $yesterday)); then
    neofetch > ~/.neofetch-cache
  fi
fi
cat ~/.neofetch-cache

awsstatus() {
  echo -e `aws-pipeline-status-plain | aws-pipeline-format-bash`
}
RGB_TO_FG() {
  echo -e "\[\033[38;2;$1;$2;$3m\]"
}
RGB_TO_BG() {
  echo -e "\[\033[48;2;$1;$2;$3m\]"
}
export CLEAR_STYLE="\[\033[0m\]"
export LIGHT_BLUE_BG=`RGB_TO_BG 129 162 190`
export LIGHT_BLUE_FG=`RGB_TO_FG 129 162 190`

export DARK_BLUE_BG=`RGB_TO_BG 95 129 157`
export DARK_BLUE_FG=`RGB_TO_FG 95 129 157`
promptsetup() {
export PS1="$DARK_BLUE_BG \w (\$(git branch 2>/dev/null | grep '^*' | colrm 1 2))\
$CLEAR_STYLE$DARK_BLUE_BG\
 [$(awsstatus)\
$CLEAR_STYLE$DARK_BLUE_BG]\
$CLEAR_STYLE$DARK_BLUE_FG\
$CLEAR_STYLE "
  aws-pipeline-prompt-mfa
}

PROMPT_COMMAND=promptsetup
