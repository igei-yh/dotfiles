# environment variable setting
export LANG=ja_JP.UTF-8
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
PROMPT='%m:%F{magenta}%~%f %n %F{yellow}$%f '
PROMPT2='%m:%F{magenta}%~%f %n %F{yellow}$%f '
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
