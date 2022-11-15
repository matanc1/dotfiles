source ~/.dotfiles/shell/services.sh
source ~/.dotfiles/shell/aliases.sh

if [ -f "$HOME/bashrc_local" ]; then
    source ~/.bashrc_local
fi
