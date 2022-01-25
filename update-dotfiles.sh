#/bin/sh
cd $HOME/.dotfiles
pacman -Qet > packages.txt
git add .
git commit -m "$(date)"
git push -u origin main
