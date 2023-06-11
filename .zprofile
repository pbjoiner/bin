# initialize rbenv Ruby version manager
# eval "$(rbenv init -)"

# environment for ls command
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# custom aliases and functions
source ~/.aliases
source ~/.functions

#path
export PATH=$HOME/bin:$HOME/.rbenv/shims/:/opt/local/bin:/opt/local/sbin:/usr/local/opt/python@3.10/libexec/bin:$PATH:./

# change prompt
PROMPT="
╭─%n@%M/%~
╰─> "
RPROMPT=""

# plugins
plugins=(zsh-syntax-highlighting sudo macos tldr)

#AWSCLI
export AWS_DEFAULT_REGION=us-east-1

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Google Cloud
source /snap/google-cloud-cli/current/completion.zsh.inc

clear
