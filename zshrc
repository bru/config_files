# completion
autoload -U compinit
compinit

# automatically enter directories without cd
setopt auto_cd

# use vim as an editor
export EDITOR=vim

# aliases
if [ -e "$HOME/.aliases" ]; then
  source "$HOME/.aliases"
fi

# emacs mode
bindkey -e

# use incremental search
bindkey ^R history-incremental-search-backward

# search path for the cd command
cdpath=(.. ~ ~/Code )

# expand functions in the prompt
setopt prompt_subst

# prompt
export PS1='[${SSH_CONNECTION+"%n@%m:"}%~] '

# ignore duplicate history entries
setopt histignoredups

# keep more history
export HISTSIZE=200

export LSCOLORS=gxfxcxdxbxegedabagacad
source ~/.cinderella.profile

# RVM
if [[ -s /Users/bru/.rvm/scripts/rvm ]] ; then source /Users/bru/.rvm/scripts/rvm ; fi
