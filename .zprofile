# initialize rbenv Ruby version manager
# eval "$(rbenv init -)"

# environment for ls command
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# custom aliases and functions
source ~/.aliases
source ~/.functions

#path
export PATH=$HOME/bin:/opt/local/bin:/opt/local/sbin:$PATH:./

# change prompt
PROMPT="
╭─%n@%M/%~
╰─> "
RPROMPT=""

# plugins
plugins=(zsh-syntax-highlighting sudo macos tldr)

#AWSCLI
export AWS_DEFAULT_REGION=us-east-1

clear
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
