if [ -z "$INTELLIJ_ENVIRONMENT_READER" ]; then
  source ~/.bash_profile
  eval "$(starship init zsh)"
  
  if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
    exec tmux new-session -A -s meow
  fi
fi

plugins=(
    history
    )

TREE_IGNORE="cache|log|logs|node_modules|vendor"

alias ls=' eza --icons=always --group-directories-first'
alias la=' ls -a'
alias ll=' ls --git -l'
alias lla=' ls -la'
alias lt=' ls --tree -D -L 2 -I ${TREE_IGNORE}'
alias ltd=' ls --tree -L 2 -I ${TREE_IGNORE}'
alias ltt=' ls --tree -D -L 3 -I ${TREE_IGNORE}'
alias lttd=' ls --tree -L 3 -I ${TREE_IGNORE}'
alias lttt=' ls --tree -D -L 4 -I ${TREE_IGNORE}'
alias ltttt=' ls --tree -D -L 5 -I ${TREE_IGNORE}'
alias h=' history'
alias hl=' history | less'
alias hs=' history | grep'

alias cr='cargo run'

alias python='python3'
alias py='python3'

alias gl="git log --all --graph --pretty=format:'%C(auto)%h%d %s %C(black)%C(bold)%cr' --abbrev-commit"

export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export PATH="/opt/homebrew/opt/m4/bin:$PATH"
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"

eval $(opam env)

source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-autopair/autopair.zsh

# ------- FZF -------
eval "$(fzf --zsh)"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"

_fzf_compgen_path() {
    fd --hidden --exclude .git . "$1"
}

_fzf_common_dir() {
    fd --type=d --hidden --exclude .git . "$1"
}

source ~/fzf-git.sh/fzf-git.sh

# ------- BAT -------
export BAT_THEME="Catppuccin Mocha"

# ------- The Fuck -------
eval $(thefuck --alias)
eval $(thefuck --alias fk)

# ------- Zoxide -------
eval "$(zoxide init zsh)"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

# ------- OpenJDK ---------
export CPPFLAGS="-I/opt/homebrew/opt/openjdk/include"

export PATH="/usr/local/opt/postgresql@16/bin:$PATH"
export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"

# ------- Yazi -------
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# ------- x-cmd -------
[ ! -f "$HOME/.x-cmd.root/X" ] || . "$HOME/.x-cmd.root/X" # boot up x-cmd.
export PATH="$HOME/.cargo/bin:$PATH"

# ------ lazygit ------
export XDG_CONFIG_HOME="$HOME/.config"
export LG_CONFIG_FILE="$HOME/.config/lazygit/config.yml"
