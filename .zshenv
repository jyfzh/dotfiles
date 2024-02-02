export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/bin:$PATH"

# editor
export EDITOR=nvim
export VISUAL=nvim

# gpg
# export GPG_TTY=$(tty)

# fzf
export FZF_DEFAULT_COMMAND="rg --files ."
export FZF_DEFAULT_OPTS="--preview 'cat {}'"

# rust
export RUSTUP_UPDATE_ROOT=https://mirrors.tuna.tsinghua.edu.cn/rustup/rustup
export RUSTUP_DIST_SERVER=https://mirrors.tuna.tsinghua.edu.cn/rustup
export PATH="$HOME/.cargo/bin/:$HOME/.local/bin:$PATH"

