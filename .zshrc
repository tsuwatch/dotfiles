ZSH=$HOME/.oh-my-zsh
plugins=(brew bundler coffee gem git git-flow github history history-substring-search node npm osx pip python rbenv redis-cli vagrant yum)
source $ZSH/oh-my-zsh.sh

source $HOME/.zshrc.custom

# added by travis gem
[ -f /Users/suwatomohiro/.travis/travis.sh ] && source /Users/suwatomohiro/.travis/travis.sh
[[ -s /Users/suwatomohiro/.tmuxinator/scripts/tmuxinator ]] && source /Users/suwatomohiro/.tmuxinator/scripts/tmuxinator
