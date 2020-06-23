# ~/.profile: executed by Bourne-compatible login shells.
. ~/.profile
if [[ $- == *i* ]]; then . ~/.bashrc; fi
eval $(/home/jwilborn/.linuxbrew/bin/brew shellenv)
