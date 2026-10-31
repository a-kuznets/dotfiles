typeset -U path

export XDG_CONFIG_HOME=$HOME/.config

export EDITOR='nvim'
export VISUAL='nvim'

# Add ~/.local/bin to the PATH if it exists and is not already there
if [ -d "$HOME/.local/bin" ]; then
  case ":$PATH:" in
    *":$HOME/.local/bin:"*) ;;
    *) export PATH="$HOME/.local/bin:$PATH" ;;
  esac
fi

command -v fzf > /dev/null && source <(fzf --zsh)

autoload -U compinit && compinit
autoload -U edit-command-line && zle -N edit-command-line
bindkey -M vicmd '^v' edit-command-line

if [[ -r ~/.zshrc.local ]]; then
  source ~/.zshrc.local
fi
