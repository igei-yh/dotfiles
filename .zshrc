# environment variable setting
export LANG=en_US.UTF-8
export HOMEBREW_CASK_OPTIONS="--appdir/Applications"

# Completion setting
autoload -U compinit
compinit
setopt list_packed

# auto cd setting
setopt auto_cd
setopt auto_pushd

# auto correct setting
setopt correct
autoload predict-on
predict-on

# history setting
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt hist_ignore_dups
setopt share_history

# prompt setting
autoload colors
colors
PROMPT='%F{magenta}%(5~, %-2~/.../%3~, %~)%f %F{yellow}$%f '
PROMPT2='%F{magenta}%~%f %F{yellow}$%f '
SPROMPT="%F{red}%r is correct? [n,y,a,e]:%f "

# git prompt setting
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{magenta}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{yellow}+"
zstyle ':vcs_info:*' formats "%F{cyan}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd() { vcs_info }
RPROMPT='${vcs_info_msg_0_}'

# alias setting
alias ll='ls -l'
alias ls='ls -G'
alias vi='vim'
alias lf='ls -F'
alias du='du -h'
alias df='df -h'
alias cat='cat -n'
alias rm='rm -i'

# direnv setting
export EDITOR=vi
eval "$(direnv hook zsh)"

# pyenv setting
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# golang setting
export GOROOT="/usr/local/opt/go/libexec"
export GOPATH="$HOME/go"
export PATH="$PATH:$GOROOT/bin:$GOPATH/bin"

# rbenv setting
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
export PATH="$HOME/.rbenv/bin:$HOME/.rbenv/shims:$PATH"
eval "$(rbenv init -)"

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/Cellar/tfenv/0.6.0/versions/0.11.14/terraform terraform
