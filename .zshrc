# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh
ZSH_THEME="robbyrussell"

plugins=(
  git
  direnv
)

source $ZSH/oh-my-zsh.sh

alias time="/usr/bin/time"
alias james="rm -rf"
alias vim="/opt/homebrew/bin/nvim"

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

export PATH=/urs/local/bin:$PATH:.:$HOME/bin

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

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/work/miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/work/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/Users/work/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/work/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

