# users generic .zshrc file for zsh(1)

## Environment variable configuration
#
# LANG
#
export LANG=ja_JP.UTF-8
export EDITOR='subl -w'

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"


## Default shell configuration
#
# set prompt
#
#
PROMPT="tsuwatch%% "
RPROMPT="%{$fg_bold[white]%}[%{$reset_color%}%{$fg[cyan]%}%~%{$reset_color%}%{$fg_bold[white]%}]%{$reset_color%}"
SPROMPT="%{$fg_bold[red]%}correct%{$reset_color%}: %R -> %r ? "
autoload colors
colors

# auto change directory
#
setopt auto_cd

# auto directory pushd that you can get dirs list by cd -[tab]
#
setopt auto_pushd

# command correct edition before each completion attempt
#
setopt correct
SPROMPT="%r? べ、別にあんたのために修正してるんじゃないだからね！[n,y,a,e]:"

# compacked complete list display
#
setopt list_packed

# no remove postfix slash of command line
#
setopt noautoremoveslash

# no beep sound when complete list displayed
#
setopt nolistbeep


## Keybind configuration
#
# emacs like keybind (e.x. Ctrl-a goes to head of a line and Ctrl-e goes 
#   to end of it)
#
bindkey -v

# historical backward/forward search with linehead string binded to ^P/^N
#
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end
bindkey "\\ep" history-beginning-search-backward-end
bindkey "\\en" history-beginning-search-forward-end


## Command history configuration
#
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data


## Completion configuration
#
fpath=(~/.zsh/functions/Completion ${fpath})
autoload -U compinit
compinit


## zsh editor
#
autoload zed


## Prediction configuration
#
#autoload predict-on
#predict-off


## Alias configuration
#
# expand aliases before completing
#
setopt complete_aliases     # aliased ls needs if file/dir completions work

alias where="command -v"
alias j="jobs -l"

case "${OSTYPE}" in
  freebsd*|darwin*)
    alias ls="ls -G -w"
    ;;
  linux*)
    alias ls="ls --color"
    ;;
esac

alias la="ls -la"
alias lf="ls -F"
alias ll="ls -l"

alias du="du -h"
alias df="df -h"

alias su="su -l"
alias rm="rm -i"

case "${OSTYPE}" in
  darwin*)
    alias updateports="sudo port selfupdate; sudo port outdated"
    alias portupgrade="sudo port upgrade installed"
    ;;
  freebsd*)
    case ${UID} in
      0)
        updateports() 
        {
          if [ -f /usr/ports/.portsnap.INDEX ]
          then
            portsnap fetch update
          else
            portsnap fetch extract update
          fi
          (cd /usr/ports/; make index)

          portversion -v -l \<
        }
        alias appsupgrade='pkgdb -F && BATCH=YES NO_CHECKSUM=YES portupgrade -a'
        ;;
    esac
    ;;
esac


## terminal configuration
#
unset LSCOLORS
case "${TERM}" in
  xterm)
    export TERM=xterm-color
    ;;
  kterm)
    export TERM=kterm-color
    # set BackSpace control character
    stty erase
    ;;
  cons25)
    unset LANG
    export LSCOLORS=ExFxCxdxBxegedabagacad
    export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
    zstyle ':completion:*' list-colors \
      'di=;34;1' 'ln=;35;1' 'so=;32;1' 'ex=31;1' 'bd=46;34' 'cd=43;34'
    ;;
esac

# set terminal title including current directory
#
case "${TERM}" in
  kterm*|xterm*)
    precmd() {
      echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
    }
    export LSCOLORS=exfxcxdxbxegedabagacad
    export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
    zstyle ':completion:*' list-colors \
      'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
    ;;
esac


## load user .zshrc configuration file
#
[ -f ~/.zshrc.mine ] && source ~/.zshrc.mine

# url: $1, delimiter: $2, prefix: $3, words: $4..
function web_search {
  local url=$1      && shift
  local delimiter=$1&& shift
  local prefix=$1   && shift
  local query

  while [ -n "$1" ]; do
    if [ -n "$query" ]; then
      query="${query}${delimiter}${prefix}$1"
    else
      query="${prefix}$1"
    fi
      shift
  done

  open "${url}${query}"
}

function qiita () {
  web_search "http://qiita.com/search?utf8=✓&q=" "+" "" $*
}
function google () {
  web_search "https://www.google.co.jp/search?&q=" "+" "" $*
}
function phpm () {
  web_search "http://jp2.php.net/manual-lookup.php?lang=ja&pattern=" "+" "" $*
}
