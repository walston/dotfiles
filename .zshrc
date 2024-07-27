PATH="/opt/homebrew/bin:$PATH"

fpath+=("$(brew --prefix)/share/zsh/site-functions")
autoload -U promptinit; promptinit
prompt pure

zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
fpath+=("$(brew --prefix)/share/zsh-completions")
autoload -Uz compinit
compinit

source "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh"

# Pure prompt styling
zstyle ':prompt:pure:path' color white
zstyle ':prompt:pure:prompt:success' color green
zstyle ':prompt:pure:git:stash' show yes
PURE_PROMPT_SYMBOL='»'
PURE_GIT_DOWN_ARROW='↓'
PURE_GIT_UP_ARROW='↑'

if [[ -f $HOME/.zsh_profile ]]; then
  source $HOME/.zsh_profile
fi
