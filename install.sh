#!/bin/bash
source confirm.sh
if [ ! -d ~/.git ] && confirm "Install dotfiles and configs"; then
  exit
  git clone https://github.com/joshuajwilborn/vim.git ~/vim
  echo Moving files...
  rsync -a ~/vim/ ~/
  echo Cleaning up...
  rm -rf ~/vim
  git remote remove origin
  git remote add origin git@github.com:JoshuaJWilborn/vim.git
else
  echo Skipping git clone...
fi 

if [ $(command -v pacman) ] && confirm "Install pacman and pip and pip packages:"; then
  echo "Installing pacman packages..."
  sudo pacman --needed --noconfirm -S $(cat ~/.packages)

  echo "Installing pip packages"
  sudo pip install powerline-status undervolt

  echo "Installing TLP services"
  sudo echo TLP_ENABLE=1 | sudo tee /usr/share/defaults/tlp
  sudo systemctl enable tlp.service
  sudo systemctl enable tlp-sleep.service
  sudo systemctl enable NetworkManager-dispatcher.service
  sudo systemctl mask systemd-rfkill.service
  sudo systemctl mask systemd-rfkill.socket
fi

if [ ! $(command -v fzf) ] && confirm "Install FZF (fuzzy file finder):"; then
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install
  rm -rf ~/.fzf
fi

vim -E -s -u "~/.vimrc" +PlugInstall +CoCInstall +qall

timedatectl set-ntp true

if [ $(command -v undervolt) ] && confirm "Install undervolt service(-135mv): "; then
  sudo tee -a /etc/systemd/system/undervolt.service <<- END
  [Unit]
  Description=undervolt
  [Service]
  Type=oneshot
  ExecStart=`which undervolt` -v --core -135 --cache -135 --gpu -135 --analogio -135 --uncore -135
END
  sudo tee -a /etc/systemd/system/undervolt-reset.service <<- END
  [Unit]
  Description=undervolt
  [Service]
  Type=oneshot
  ExecStart=`which undervolt` -v --core -0 --cache -0 --gpu -0 --analogio -0 --uncore -0
END
  echo "Undervolt by typing 'undervolt' and reset by calling 'undervolt-reset'"
fi


