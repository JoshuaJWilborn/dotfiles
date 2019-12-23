#/usr/bin/bash
if [ ! -d ~/.git ]; then
  git clone git@github.com:JoshuaJWilborn/vim.git ~/vim
  rsync -a ~/vim/ ~/
  rm -rf ~/vim
	git remote remove origin
	git remote add origin git@github.com:JoshuaJWilborn/vim.git
fi 

sudo pacman --needed --noconfirm -S $(cat ./.packages)
sudo pip install powerline-status undervolt

if [ ! $(command -v fzf) ]; then
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install
  rm -rf ~/.fzf
fi

nohup vim +PlugInstall +CocInstall +qall >/dev/null 2>&1 &

sudo echo TLP_ENABLE=1 | sudo tee /usr/share/defaults/tlp
sudo systemctl enable tlp.service
sudo systemctl enable tlp-sleep.service 
sudo systemctl enable NetworkManager-dispatcher.service
sudo systemctl mask systemd-rfkill.service
sudo systemctl mask systemd-rfkill.socket

# install linux brew
if [ ! $(command -v brew) ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
fi


if [ ! -f /etc/systemd/system/undervolt.service ]; then
  sudo tee -a /etc/systemd/system/undervolt.service <<- END
    [Unit]
    Description=undervolt
    [Service]
    Type=oneshot
    ExecStart=`which undervolt` -v --core -135 --cache -135 --gpu -135 --analogio -135 --uncore -135
END
fi

if [ ! -f /etc/systemd/system/undervolt-reset.service ]; then
  sudo tee -a /etc/systemd/system/undervolt-reset.service <<- END
    [Unit]
    Description=undervolt
    [Service]
    Type=oneshot
    ExecStart=`which undervolt` -v --core -0 --cache -0 --gpu -0 --analogio -0 --uncore -0
END
fi
source ~/.bashrc
