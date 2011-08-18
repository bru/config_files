# completion
autoload -U compinit
compinit

# automatically enter directories without cd
setopt auto_cd

# use vim as an editor
export EDITOR="mvim -f"

# get around bug in 10.6.5
export ULIMIT_MAX_FILES=""

# aliases
if [ -e "$HOME/.aliases" ]; then
  source "$HOME/.aliases"
fi

# emacs mode
bindkey -e
bindkey -M viins '' backward-delete-char
bindkey -M viins '' backward-delete-char
# vim mode
#bindkey -v

# use incremental search
#bindkey ^R history-incremental-search-backward

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

# Ruby Enterprise development optimization
export RUBY_HEAP_MIN_SLOTS=500000
export RUBY_HEAP_SLOTS_INCREMENT=250000
export RUBY_HEAP_FREE_MIN=100000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1.6
export RUBY_GC_MALLOC_LIMIT=75000000

# Cope with XCode4
export ARCHFLAGS="-arch i386 -arch x86_64"

# FLEX
export FLEX_HOME=/Users/bru/Developer/opt/flex_sdk
