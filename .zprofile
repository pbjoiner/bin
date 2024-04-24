# initialize rbenv Ruby version manager
# eval "$(rbenv init -)"

# environment for ls command
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# custom aliases and functions
# shellcheck disable=SC1090
source ~/.aliases
# shellcheck disable=SC1090
source ~/.functions

#path
export PATH=$HOME/bin:$HOME/.rbenv/shims/:/opt/local/bin:/opt/local/sbin:$HOME/.docker/bin:$PATH:./

# change prompt
# shellcheck disable=SC2034
PROMPT="
╭─%n@%M/%~
╰─> "
# shellcheck disable=SC2034
RPROMPT=""

# plugins
# shellcheck disable=SC2034
plugins=(zsh-syntax-highlighting sudo macos tldr)

#AWSCLI
export AWS_DEFAULT_REGION=us-east-1

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Google Cloud
source /snap/google-cloud-cli/current/completion.zsh.inc

clear
