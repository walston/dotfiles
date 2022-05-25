# If you come from bash you might have to change your $PATH.
export PATH=/urs/local/bin:$PATH
export PATH=$PATH:.
export PATH=$PATH:~/bin

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh
ZSH_THEME="robbyrussell"

plugins=(git)

source $ZSH/oh-my-zsh.sh

alias time="/usr/bin/time"
alias james="rm -rf"

local ret_status="%(?:%{$fg_bold[green]%}⑇:%{$fg_bold[red]%}⑇)"
PROMPT='${ret_status} %{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[magenta]%}⑆(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[magenta]%}) %{$fg_bold[yellow]%}∆"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[magenta]%})"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "

if [ -e ~/.profile ]; then
  source ~/.profile;
fi

export NVM_DIR="$HOME/.nvm"
if [ -d $NVM_DIR ]; then
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

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
fi

# git helpers -- by Paul Armstrong
# @see https://paularmstrong.dev/blog/git-helpers/
function main() {
  DEFAULT_BRANCH=`git remote show origin | grep "HEAD branch" | sed 's/.*: //'`
  git checkout $DEFAULT_BRANCH
  git pull
}

function rmbranch() {
  BRANCH=`git rev-parse --abbrev-ref HEAD`
  DEFAULT_BRANCH=`git remote show origin | grep "HEAD branch" | sed 's/.*: //'`
  git checkout $DEFAULT_BRANCH
  git branch -D $BRANCH
  git pull
}

function rebase() {
  DEFAULT_BRANCH=`git remote show origin | grep "HEAD branch" | sed 's/.*: //'`
  git fetch origin $DEFAULT_BRANCH
  git rebase origin/$DEFAULT_BRANCH
}
