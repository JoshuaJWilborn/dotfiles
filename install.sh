#TODO Install git if required;


#TODO Install python if not installed


#install tmux if not installed


git clone git@github.com:JoshuaJWilborn/vim.git
rsync -a ./vim/ ~/
rm -rf ./vim
sudo pip install powerline-status
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

source ~/.bashrc
nohup vim +PlugInstall +CocInstall +qall >/dev/null 2>&1 &


