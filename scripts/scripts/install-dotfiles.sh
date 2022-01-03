bold=$(tput bold)
normal=$(tput sgr0)
red='\033[0;31m'
green='\033[0;32m'

read -p "${bold}Are you sure you want to install my system and you have no folders called: 'dotfiles'? " yn
read -p "${bold}What is the install command for you system? " installcmd
if [ $yn == "yes" ]; then
echo "Installing dotfiles..."
cd ~
git clone https://github.com/EiseZ/dotfiles.git
cp -r -b --suffix=.backup dotfiles/.asoundrc ~
cp -r -b --suffix=.backup dotfiles/.asouncrc.asoundconf ~
cp -r -b --suffix=.backup dotfiles/.bashrc ~
cp -r -b --suffix=.backup dotfiles/.config ~
cp -r -b --suffix=.backup dotfiles/.xinitrc ~
cp -r -b --suffix=.backup dotfiles/scripts ~
cp -r -b --suffix=.backup dotfiles/wallpapers ~

${installcmd} $(cat dotfiles/packages.txt)

rm -rf ~/dotfiles
echo "${green}Done!"
else
  echo "${red}${bold}Quiting"
fi
