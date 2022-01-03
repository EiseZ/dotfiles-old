### Startx if not running ###
/home/eisezimmerman/.config/fish/try-startx.sh

### Settings ###
set fish_greeting
starship init fish | source

### Alias' ###
alias ls="lsd"
alias la="lsd -a"
alias lt="lsd --tree"
alias dotfiles="git --git-dir=$HOME/dotfiles-repo/ --work-tree=$HOME"
alias fm="cd (xplr)"
alias getpass="rbw ls | grep -i"

### Fetch ###
fm6000 -c blue -n -de="bspwm" -g=6 -l=9 -f /home/eisezimmerman/.config/fm6000/astronaut.txt
