#/bin/sh
cd $HOME/.dotfiles
xbps-query -m > packages.txt
git add .
git commit -m "$(date)"
git push -u origin main
