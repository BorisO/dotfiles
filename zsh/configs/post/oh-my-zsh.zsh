# Path to your oh-my-zsh installation.
export ZSH="/Users/bonufriyev/.oh-my-zsh"

ZSH_THEME="powerlevel9k/powerlevel9k"

POWERLEVEL9K_MODE="nerdfont-complete"
POWERLEVEL9K_DISABLE_RPROMPT=false
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="▶ "
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(virtualenv dir custom_terraform vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(custom_kube)
POWERLEVEL9K_CUSTOM_FEDORA_ICON="echo  "
POWERLEVEL9K_CUSTOM_FEDORA_ICON_BACKGROUND=069
POWERLEVEL9K_CUSTOM_FEDORA_ICON_FOREGROUND=015

plugins=(zsh-completions virtualenv osx colorize copyfile helm jira)

source $ZSH/oh-my-zsh.sh
source <(kubectl completion zsh)

# Terraform
zsh_terraform() {
  # break if there is no .terraform directory
  if [[ -d .terraform ]]; then
    local tf_workspace=$(/usr/local/bin/terraform workspace show)
    echo -n "$tf_workspace"
  fi
}

# Terraform Segment
POWERLEVEL9K_CUSTOM_TERRAFORM="zsh_terraform"
POWERLEVEL9K_CUSTOM_TERRAFORM_BACKGROUND=057
POWERLEVEL9K_CUSTOM_TERRAFORM_FOREGROUND=015

# Kube Cluster
source ~/dotfiles/kube-ps1/kube-ps1.sh
POWERLEVEL9K_CUSTOM_KUBE='kube_ps1'
KUBE_PS1_SYMBOL_USE_IMG='true'
POWERLEVEL9K_CUSTOM_KUBE_BACKGROUND='000'
KUBE_PS1_PREFIX=''
KUBE_PS1_SUFFIX=''
KUBE_PS1_SYMBOL_ENABLE='false'
