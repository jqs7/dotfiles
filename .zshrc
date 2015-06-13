export ZSH=/home/se7en/.oh-my-zsh

ZSH_THEME="7"

export UPDATE_ZSH_DAYS=1

# ENABLE_CORRECTION="true"
# COMPLETION_WAITING_DOTS="true"

# HIST_STAMPS="mm/dd/yyyy"

# ZSH_CUSTOM=/path/to/new-custom-folder

plugins=(git sudo systemd encode64 z t pass vagrant colored-man extract rsync)

export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl"

export PATH=$PATH:~/.gem/ruby/2.2.0/bin:~/bin:~/.linuxbrew/bin

export PYTHONPATH=/usr/lib/python3.4/site-packages

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

alias s='mosh'
alias pacman='yaourt'
alias rm='trash'
alias gd='git diff  --ignore-space-change'
alias hdg='hexo d -g'
alias adl='aria2c'
alias adlrpc='aria2c --enable-rpc --rpc-listen-all=true --rpc-allow-origin-all'
alias xp='xprop | grep "WM_WINDOW_ROLE\|WM_CLASS" && echo "WM_CLASS(STRING) = \"NAME\", \"CLASS\""'
alias 7tmux='Term=screen-256 tmux -2 a -t "[Jqs7]" || Term=screen-256 tmux -2 new-session -s "[Jqs7]"'

# git add commit and push -- all in one command
function lazygit() {
  git add .
  git commit -a
  git push
}

###-begin-twei-completion-###
### credits to npm, this file is coming directly from isaacs/npm repo
#
# Just testing for now. (trying to learn this cool stuff)
#
# npm command completion script
#
# Installation: twei completion >> ~/.bashrc  (or ~/.zshrc)
#

COMP_WORDBREAKS=${COMP_WORDBREAKS/=/}
COMP_WORDBREAKS=${COMP_WORDBREAKS/@/}
export COMP_WORDBREAKS

if complete &>/dev/null; then
  _twei_completion () {
    local si="$IFS"
    IFS=$'\n' COMPREPLY=($(COMP_CWORD="$COMP_CWORD" \
                           COMP_LINE="$COMP_LINE" \
                           COMP_POINT="$COMP_POINT" \
                           twei completion -- "${COMP_WORDS[@]}" \
                           2>/dev/null)) || return $?
    IFS="$si"
  }
  complete -F _twei_completion -o default twei
elif compctl &>/dev/null; then
  _twei_completion () {
    local cword line point words si
    read -Ac words
    read -cn cword
    let cword-=1
    read -l line
    read -ln point
    si="$IFS"
    IFS=$'\n' reply=($(COMP_CWORD="$cword" \
                       COMP_LINE="$line" \
                       COMP_POINT="$point" \
                       twei completion -- "${words[@]}" \
                       2>/dev/null)) || return $?
    IFS="$si"
  }
  compctl -K _twei_completion -f twei
fi
###-end-twei-completion-###
