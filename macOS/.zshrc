# ----------
# History
# ----------
HISTSIZE=5000
SAVEHIST=5000
HISTFILE=~/.zsh_history
setopt append_history
setopt share_history
setopt hist_ignore_dups

# ----------
# Behavior
# ----------
setopt autocd
setopt interactive_comments

# ----------
# Aliases
# ----------
alias ll='ls -lah'
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias v='nvim'
alias ..='cd ..'

# ----------
# PATH (Homebrew on Apple Silicon)
# ----------
if [ -d /opt/homebrew/bin ]; then
  export PATH="/opt/homebrew/bin:$PATH"
fi

# ----------
# fzf
# ----------
if [ -f /opt/homebrew/opt/fzf/shell/key-bindings.zsh ]; then
  source /opt/homebrew/opt/fzf/shell/key-bindings.zsh
fi
if [ -f /opt/homebrew/opt/fzf/shell/completion.zsh ]; then
  source /opt/homebrew/opt/fzf/shell/completion.zsh
fi

# ----------
# Prompt
# ----------
autoload -Uz colors && colors
PROMPT='%F{cyan}%n@%m%f %F{yellow}%~%f %# '

# ----------
# Zinit (optional)
# ----------
if [ -f "$HOME/.zinit/bin/zinit.zsh" ]; then
  source "$HOME/.zinit/bin/zinit.zsh"
  zinit light zsh-users/zsh-autosuggestions
  zinit light zsh-users/zsh-syntax-highlighting
fi
