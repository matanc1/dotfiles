source ~/.dotfiles/shell/services.sh
source ~/.dotfiles/shell/aliases.sh

if [ -f "$HOME/.bashrc_local" ]; then
    source ~/.bashrc_local
fi
. "$HOME/.cargo/env"


export PATH="$HOME/.local/bin:$PATH"

. "$HOME/.atuin/bin/env"

[[ -f ~/.bash-preexec.sh ]] && source ~/.bash-preexec.sh
eval "$(atuin init bash)"
