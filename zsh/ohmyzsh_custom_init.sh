#overide ZSH path to change install directory
export ZSH="$HOME/.dotfiles/zsh/ohmyzsh"

# oh-my-zsh config
ZSH_THEME="robbyrussell"
plugins=(git z)
source $ZSH/oh-my-zsh.sh
