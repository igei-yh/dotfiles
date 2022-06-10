# environment variable setting
export LANG=en_US.UTF-8
export HOMEBREW_CASK_OPTIONS="--appdir/Applications"

# Completion setting
autoload -Uz compinit
compinit
setopt list_packed

# auto cd setting
setopt auto_cd
setopt auto_pushd

# auto correct setting
setopt correct
autoload predict-on
predict-on

# cdr setting
if [[ -n $(echo ${^fpath}/chpwd_recent_dirs(N)) && -n $(echo ${^fpath}/cdr(N)) ]]; then
    autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
    add-zsh-hook chpwd chpwd_recent_dirs
    zstyle ':completion:*' recent-dirs-insert both
    zstyle ':chpwd:*' recent-dirs-default true
    zstyle ':chpwd:*' recent-dirs-max 1000
    zstyle ':chpwd:*' recent-dirs-file "$HOME/.cache/chpwd-recent-dirs"
fi

# peco cdr setting
function peco-cdr () {
    local selected_dir=$(cdr -l | awk '{ print $2 }' | peco)
    if [ -n "$selected_dir" ]; then
        BUFFER="cd ${selected_dir}"
        zle accept-line
    fi
}
zle -N peco-cdr
bindkey '^H' peco-cdr

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
alias rm='rm -i'
# for ghq/peco
alias repo='cd $(ghq list -p | peco)'

# direnv setting
export EDITOR=vi
eval "$(direnv hook zsh)"

# pyenv setting
export PYTHONIOENCODING=utf-8
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/shims:$PATH"
eval "$(pyenv init -)"

# goenv setting
export GOENV_ROOT="$HOME/.goenv"
export PATH=$GOENV_ROOT/bin:$PATH
eval "$(goenv init -)"
export PATH=$GOROOT/bin:$PATH
export PATH=$PATH:$GOPATH/bin

# rbenv setting
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
export PATH="$HOME/.rbenv/bin:$HOME/.rbenv/shims:$PATH"
eval "$(rbenv init -)"

autoload -U +X bashcompinit && bashcompinit
complete -C '/usr/local/bin/aws_completer' aws

# nodebrew
export PATH="$HOME/.nodebrew/current/bin:$PATH"

# item2 shell integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# drawio
export DRAWIOPATH="/Applications/draw.io.app/Contents/MacOS"
export PATH="$DRAWIOPATH:$PATH"

# python virtual env PS1
show_virtual_env() {
  if [[ -n "$VIRTUAL_ENV" && -n "$DIRENV_DIR" ]]; then
    echo "($(basename $VIRTUAL_ENV))"
  fi
}
PS1='$(show_virtual_env)'$PS1

# gitignore.io
function create-gitignore() { curl -sLw n https://www.toptal.com/developers/gitignore/api/$@ ;}

# terraform
if type terraform &> /dev/null; then
  complete -C terraform terraform
fi

