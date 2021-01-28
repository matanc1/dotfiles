# How I set this up:
1. I use [dotbot](https://github.com/anishathalye/dotbot) to manage and install the dotfiles. 
1. I use a directory structure similar to [here](https://github.com/anishathalye/dotfiles) with some minor changes. 


# Useful links to understand how this works: 
1. https://www.anishathalye.com/2014/08/03/managing-your-dotfiles/
1. https://dotfiles.github.io/tutorials/


# Install Instructions 
1. Run `apt install zsh` and config zsh as the default shell using `chsh -s $(which zsh)`
1. Run `git clone --recurse-submodules https://github.com/matanc1/dotfiles`. I suggest running this not in the OneDrive directory as it makes everything slower (probably some security measure).
1. Move to the dotfiles directory and run `install.sh`
