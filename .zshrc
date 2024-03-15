ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

zinit light zdharma-continuum/history-search-multi-word
zinit light zsh-users/zsh-autosuggestions
zinit light zdharma-continuum/fast-syntax-highlighting
zinit light zsh-users/zsh-completions

autoload -Uz compinit; compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
setopt extendedglob
_comp_options+=(globdots)

bindkey -e
setopt correct
set -o GLOB_SUBST
autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
HISTFILE=~/.zsh_history

alias ll="ls --color=auto -la"
alias ls='ls --color=auto'
alias grep='grep --color=auto'

