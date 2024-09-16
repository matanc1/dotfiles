
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    sudo apt update -y
    sudo apt install -y git
    sudo apt install -y vim
    sudo apt install -y zsh
    sudo apt install -y python3-pip

elif [[ "$OSTYPE" == "darwin"* ]]; then
    brew update
    brew upgrade
    brew install git
    brew install vim
    brew install zsh
    brew install fzf
fi

curl --proto '=https' --tlsv1.2 -LsSf https://setup.atuin.sh | sh
