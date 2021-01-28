alias ls='ls --color=auto'
alias grep='grep --color'
alias explorer="explorer.exe ." #Open the windows explorer in the current directory

# Aliases to protect against overwriting
 alias rm='rm -i'
 alias cp='cp -i'
 alias mv='mv -i'



# ls, the common ones I use a lot shortened for rapid fire usage
alias l='ls -lFh'     #size,show type,human readable
alias la='ls -lAFh'   #long list,show almost all,show type,human readable
alias lr='ls -tRFh'   #sorted by date,recursive,show type,human readable
alias lt='ls -ltFh'   #long list,sorted by date,show type,human readable
alias ll='ls -l'      #long list

alias zshrc='${=EDITOR} ${ZDOTDIR:-$HOME}/.zshrc' # Quick access to the .zshrc file
alias h='history'

#find files and directories
alias ff='find . -type f -name'
alias fd='find . -type d -name'
