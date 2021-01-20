# If you come from bash you might have to change your $PATH.
export PATH=/urs/local/bin:$PATH
export PATH=$PATH:.
export PATH=$PATH:~/bin
export QMK_HOME='~/Repos/qmk_firmware'

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh
ZSH_THEME="robbyrussell"

plugins=(git)

source $ZSH/oh-my-zsh.sh

alias time="/usr/bin/time"
alias james="rm -rf"

local ret_status="%(?:%{$fg_bold[green]%}⑆:%{$fg_bold[red]%}⑆)"
PROMPT='${ret_status} %{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[magenta]%}(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[magenta]%}) %{$fg_bold[yellow]%}∆"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[magenta]%})"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "

source ~/.zsh_profile

export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion

# -- Change nvm version on directory -----------------------------------------------------------------------------------
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

export JAVA_HOME=$(/usr/libexec/java_home -v 1.8.0_72)
export CATALINA_HOME="/Users/nathaniel.walston/Repos/source_code/ehr_home/ehr-dev-tools/tools/apache-tomcat-8.5.4"
