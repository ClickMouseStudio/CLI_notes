# Enable Powerlevel10k instant prompt. Keep this near the top.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ----------
# Basic shell behavior
# ----------
export PROMPT='%n@%m(`uname -m`) %1~ %# '

HISTFILE=$HOME/.zsh-history
HISTSIZE=100000
SAVEHIST=1000000
setopt share_history
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt autocd
setopt interactive_comments

# ----------
# Prerequisites (installed beforehand)
# ----------
# brew install zsh git fzf ripgrep bat lsd
# Optional: zinit / powerlevel10k / anyframe / enhancd

# ----------
# Homebrew helpers (macOS)
# ----------
if type brew &>/dev/null; then
  FPATH="$(brew --prefix)/share/zsh-completions:$FPATH"
  [[ -f "$(brew --prefix)/opt/fzf/shell/key-bindings.zsh" ]] && source "$(brew --prefix)/opt/fzf/shell/key-bindings.zsh"
  [[ -f "$(brew --prefix)/opt/fzf/shell/completion.zsh" ]] && source "$(brew --prefix)/opt/fzf/shell/completion.zsh"
  autoload -Uz compinit
  compinit
fi

# ----------
# Aliases
# ----------
if type lsd &>/dev/null; then
  alias ls='lsd'
  alias lt='lsd --tree'
  alias la='lsd -a'
  alias l='lsd'
  alias ll='lsd -l'
  alias lla='lsd -al'
else
  alias ls='ls -G'
  alias lt='ls'
  alias la='ls -a'
  alias l='ls'
  alias ll='ls -l'
  alias lla='ls -al'
fi
alias nv='nvim'
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias ..='cd ..'

# Architecture switch helpers (Apple Silicon)
alias arm='exec arch -arch arm64e /bin/zsh --login'
alias x64='exec arch -arch x86_64 /bin/zsh --login'

# pip search wrapper compatibility
alias pip='function _pip(){
  if [ "$1" = "search" ]; then
    pip_search "$2"
  else
    command pip "$@"
  fi
};_pip'

# Open VS Code from terminal (macOS)
function code() {
  if [[ $# -eq 0 ]]; then
    open -a "Visual Studio Code"
  else
    local argPath="$1"
    [[ $1 = /* ]] && argPath="$1" || argPath="$PWD/${1#./}"
    open -a "Visual Studio Code" "$argPath"
  fi
}

# ----------
# Zinit (optional)
# ----------
if [[ -f "$HOME/.zinit/bin/zinit.zsh" ]]; then
  source "$HOME/.zinit/bin/zinit.zsh"
  autoload -Uz _zinit
  (( ${+_comps} )) && _comps[zinit]=_zinit

  # Annexes
  zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

  # Completion plugins
  zinit light zsh-users/zsh-completions
  zinit light conda-incubator/conda-zsh-completion
  autoload -Uz compinit && compinit

  # Interactive plugins
  zinit light zsh-users/zsh-autosuggestions
  zinit light momo-lab/zsh-abbrev-alias
  zinit light zsh-users/zsh-syntax-highlighting
  zinit light mollifier/anyframe
  zinit light b4b4r07/enhancd
  zinit light zdharma-continuum/history-search-multi-word

  # Prompt theme
  zinit ice depth=1
  zinit light romkatv/powerlevel10k
fi

# Completion style
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:default' menu select=1
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# anyframe key bindings (enabled only when plugin exists)
if typeset -f anyframe-widget-execute-history >/dev/null 2>&1; then
  zstyle ':anyframe:selector:' use fzf
  bindkey '^w' anyframe-widget-cdr
  autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
  add-zsh-hook chpwd chpwd_recent_dirs
  bindkey '^r' anyframe-widget-execute-history
  bindkey '^f' anyframe-widget-insert-filename
  bindkey '^y' anyframe-widget-put-history
  bindkey '^g^b' anyframe-widget-checkout-git-branch
  bindkey '^g' anyframe-widget-cd-ghq-repository
fi

# Optional enhancd init path (if plugin is present)
[[ -f "$HOME/.zinit/plugins/b4b4r07---enhancd/init.sh" ]] && source "$HOME/.zinit/plugins/b4b4r07---enhancd/init.sh"

# Load Powerlevel10k config if present
[[ -f "$HOME/.p10k.zsh" ]] && source "$HOME/.p10k.zsh"

# ----------
# Tool options
# ----------
export BAT_THEME='Solarized (dark)'
if type bat &>/dev/null; then
  export FZF_DEFAULT_OPTS="--reverse --border none --height 100% --preview 'bat --color=always --style=full {}' --preview-window border-none"
else
  export FZF_DEFAULT_OPTS='--reverse --border none --height 100% --preview-window border-none'
fi
export ENHANCD_FILTER="fzf --preview 'tree -C {} | head -200'"

# Optional Homebrew formula env hints
export PATH="/opt/homebrew/opt/curl/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/curl/lib -L/opt/homebrew/opt/libomp/lib"
export CPPFLAGS="-I/opt/homebrew/opt/curl/include -I/opt/homebrew/opt/libomp/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/curl/lib/pkgconfig"

# ----------
# Notes for local/private customization
# ----------
# 1) Keep API keys and machine-local PATH changes in ~/.zshrc.local
#    Example: [[ -f "$HOME/.zshrc.local" ]] && source "$HOME/.zshrc.local"
# 2) Keep "conda init" managed block out of this shared template.
# 3) Avoid hardcoding user-specific absolute paths.
