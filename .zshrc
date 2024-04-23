if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Plugins
zinit for \
    OMZL::compfix.zsh \
    OMZL::completion.zsh \
    OMZL::directories.zsh \
    OMZL::functions.zsh \
    OMZL::git.zsh \
    OMZL::history.zsh \
    OMZL::key-bindings.zsh \
    OMZL::misc.zsh \
    OMZL::prompt_info_functions.zsh \
    OMZL::prompt_info_functions.zsh \
    OMZL::spectrum.zsh \
    OMZL::theme-and-appearance.zsh \
    OMZP::colored-man-pages \
    OMZP::common-aliases \
    OMZP::kubectl \
    OMZP::git

zinit ice pick".oh-my-zsh/themes/oxide.zsh-theme"
zinit light dikiaap/dotfiles

zinit ice atinit"zicompinit; zicdreplay"
zinit light zdharma-continuum/fast-syntax-highlighting

zinit ice as"completion"
zinit snippet https://github.com/containers/podman/blob/main/completions/zsh/_podman

zinit ice as"completion"
zinit snippet https://github.com/TheLocehiliosan/yadm/blob/master/completion/zsh/_yadm

zinit ice as"program" from"gh-r"
zinit light ajeetdsouza/zoxide
eval "$(zoxide init zsh --cmd j)"

# SSH
export SSH_AGENT_PID=""
export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/gnupg/S.gpg-agent.ssh"

# NNN
export NNN_BMS="d:$HOME/Documents;D:$HOME/Dev;w:$HOME/Downloads"
export NNN_FIFO=/tmp/nnn.fifo
export NNN_PLUG="v:preview-tui"
export EDITOR=nvim

if [ -f /usr/share/nnn/quitcd/quitcd.bash_sh_zsh ]; then
  source /usr/share/nnn/quitcd/quitcd.bash_sh_zsh
fi

# Path modifications
export PATH=$PATH:~/bin:~/.local/bin
export PATH=$PATH:~/.dotnet/tools
export PATH=~/.nix-profile/bin:$PATH

# Aliases
unalias rm

alias de="dev-env"
