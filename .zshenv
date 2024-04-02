export SPROMPT="Correct $fg[red]%R$reset_color to $fg[green]%r$reset_color [Yes, No, Abort, Edit]"

# bin
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/bin:$PATH"

# editor
export EDITOR=nvim
export VISUAL=nvim

# gpg
export GPG_TTY=$(tty)

# fzf
export FZF_DEFAULT_COMMAND="rg --files ."
export FZF_DEFAULT_OPTS="--preview 'cat {}'"

# rust
export PATH="$HOME/.cargo/bin/:$PATH"

# go
export PATH="$HOME/.go/bin/:$PATH"

# electron
export ELECTRON_MIRROR="https://npmmirror.com/mirrors/electron/"
