# zplug
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-history-substring-search", defer:3
zplug "zsh-users/zsh-autosuggestions"

if ! zplug check --verbose; then
	printf "Install? [y/N]: "
	if read -q; then
		echo; zplug install
	fi
fi

zplug load

# modules
zmodload zsh/complist

# aliases
alias vi=nvim
alias ls=lsd
alias ns='nix-shell --command zsh'
alias wget='wget --no-hsts'
alias reload="source $HOME/.zshenv && source $ZDOTDIR/.zshrc"
alias config="vi $ZDOTDIR/.zshrc"

# bindings
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
bindkey -M menuselect '/' history-incremental-search-backward
bindkey -M menuselect '?' history-incremental-search-forward

# options
setopt no_beep
setopt hist_expire_dups_first
setopt hist_reduce_blanks
setopt share_history

# style
zstyle ':completion:*' menu yes select

# prompt
eval "$(starship init zsh)"

# direnv
eval "$(direnv hook zsh)"

# zoxide
eval "$(zoxide init --cmd cd zsh)"
