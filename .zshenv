export GPG_TTY=$(tty)
export EDITOR=nvim
export VISUAL=nvim

export FZF_DEFAULT_COMMAND="rg --files ."
export FZF_DEFAULT_OPTS="--preview 'cat {}'"

# rust
export RUSTUP_UPDATE_ROOT=https://mirrors.tuna.tsinghua.edu.cn/rustup/rustup
export RUSTUP_DIST_SERVER=https://mirrors.tuna.tsinghua.edu.cn/rustup
export PATH="$HOME/.cargo/bin/:$HOME/.local/bin:$PATH"

