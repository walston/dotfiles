PATH="/opt/homebrew/bin:$PATH"

fpath+=("$(brew --prefix)/share/zsh/site-functions")
autoload -U promptinit; promptinit
prompt pure

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
