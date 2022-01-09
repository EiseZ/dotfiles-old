# Lines configured by zsh-newuser-install
HISTFILE=~/.cache/zsh/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob
. /home/eisezimmerman/.config/zsh/.zsh_completion
# End of lines configured by zsh-newuser-install

/home/eisezimmerman/.config/fish/try-startx.sh

zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# eval "$(starship init zsh)"
PS1="%F{blue}%2~ %(?.->.%F{red}~>) "

export PATH="$PATH:$(yarn global bin):$HOME/.local/bin:$HOME/downloads/apps/steamcmd:/opt/metasploit-framework"

### Alias' ###
alias ls="lsd"
alias la="lsd -A"
alias ll="lsd -l"
alias lt="lsd --tree -d"
alias fm="vifm"
alias getpass="rbw ls | grep -i"
alias todo="todo.sh"
alias rm="rm -i"
alias mv="mv -i"
alias mkdir="mkdir -p"
alias v="nvim"
alias se="EDITOR=nvim sudoedit"
alias rss="newsboat -u .config/newsboat/urls"

### Fetch ###
# fm6000 -c blue -n -de="bspwm" -g=6 -l=12 -f /home/eisezimmerman/.config/fm6000/astronaut.txt
if [[ $(tty) != "/dev/tty"* ]]; then
    pfetch
fi

### Syntax Highlighting ###
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
