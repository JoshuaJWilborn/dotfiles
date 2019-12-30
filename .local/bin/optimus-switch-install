# Generate list of drivers to be removed before install
DRIVERS=$(mhwd -li 2>&1 | sed -rn '4,999s/^\s+(\S+)\s+.+$/\1/p') 
NVIDIA=$(echo $DRIVERS | sed -rn 's/(video-nvidia\S+)/\1/p')
TOREMOVE=$(echo $DRIVERS | sed -r 's/video-nvidia\S+//')
# Uninstall the drivers
if [ -n "$TOREMOVE" ]; then
  sudo mhwd -r pci $TOREMOVE
fi
# Install the nvidia drivers if no nvidia drivers present
if [ -z "$NVIDIA" ]; then
  sudo mhwd -i pci video-nvidia-435xx
fi
# Get kernel version
KVERSION=$(cat /proc/version | sed -rn 's/^Linux version ([0-9]+\.[0-9]+).+/\1/p' | sed 's/\.//')

#Insteall appropriate headers for the kernel as well as required packages, then set modprobe
sudo pacman --noconfirm --needed -S linux"$KVERSION"-headers acpi_call-dkms xorg-xrandr xf86-video-intel git
sudo modprobe acpi_call

cd ~
git clone https://github.com/dglt1/optimus-switch.git
sudo chmod +x ~/optimus-switch/install.sh
cd ~/optimus-switch
sudo ./install.sh
cd ..
rm -rf ~/optimus-switch

# set intel as default
sudo set-intel.sh
