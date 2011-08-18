export PATH=~/Code/scripts:$PATH

# makes color constants available
autoload -U colors zsh/terminfo
colors

# enable colored output from ls, etc
export CLICOLOR=1
export LSCOLORS=cxfxexexDxexexDxDxcxcx

# expand functions in the prompt
setopt prompt_subst

# prompt
#git_prompt_info() {
#  ref=$(git symbolic-ref HEAD 2> /dev/null)
#  if [[ -n $ref ]]; then
#    echo "[%{$fg_bold[green]%}${ref#refs/heads/}%{$reset_color%}]"
#  fi
#}

function __git_prompt {
  local DIRTY="%{$fg[yellow]%}"
  local CLEAN="%{$fg[green]%}"
  local UNMERGED="%{$fg[red]%}"
  local RESET="%{$terminfo[sgr0]%}"
  git rev-parse --git-dir >& /dev/null
  if [[ $? == 0 ]]
  then
    echo -n "["
    if [[ `git ls-files -u >& /dev/null` == '' ]]
    then
      git diff --quiet >& /dev/null
      if [[ $? == 1 ]]
      then
        echo -n $DIRTY
      else
        git diff --cached --quiet >& /dev/null
        if [[ $? == 1 ]]
        then
          echo -n $DIRTY
        else
          echo -n $CLEAN
        fi
      fi
    else
      echo -n $UNMERGED
    fi
    echo -n `git branch | grep '* ' | sed 's/..//'`
    echo -n $RESET
    echo -n "]"
  fi
}

export RPS1='$(__git_prompt)'

export PS1='[${SSH_CONNECTION+"%{$fg_bold[green]%}%n@%m:"}%{$fg_bold[blue]%}%~%{$reset_color%}] '
#source ~/.zsh/git-prompt/zshrc.sh
#PROMPT='$(prompt_git_info)[${SSH_CONNECTION+"%{$fg_bold[green]%}%n@%m:"}%{$fg_bold[blue]%}%~%{$reset_color%}] '

# autocompletion for ruby_test
# works with tu/tf aliases
# _ruby_tests() {
#   if [[ -n $words[2] ]]; then
#     compadd `ruby_test -l ${words[2]}`
#   fi
# }
# compdef _ruby_tests ruby_test

# # autocompletion for ruby_spec
# # works with sm/sc aliases
# _ruby_specs() {
#   if [[ -n $words[2] ]]; then
#     compadd `ruby_spec -l ${words[2]}`
#   fi
# }
# compdef _ruby_specs ruby_spec

# # autocompletion for ruby_tu_rs
# # works with su/sf aliases
# _ruby_mixed_tests() {
#   if [[ -n $words[2] ]]; then
#     compadd `ruby_tu_rs -l ${words[2]}`
#   fi
# }
# compdef _ruby_mixed_tests ruby_tu_rs

# _git_remote_branch() {
#   ref=$(git symbolic-ref HEAD 2> /dev/null)
#   if [[ -n $ref ]]; then
#     if (( CURRENT == 2 )); then
#       # first arg: operation
#       compadd track remote_add remote_rm rm push mv new pull
#     elif (( CURRENT == 3 )); then
#       if [[ $words[2] == "push" ]]; then
#         # second arg: local branch name
#         compadd `git branch -l | sed "s/[ \*]//g"`
#       else;
#         # second arg: remote branch name
#         compadd `git branch -r | grep -v HEAD | sed "s/.*\///" | sed "s/ //g"`
#       fi
#     elif (( CURRENT == 4 )); then
#       # third arg: remote name
#       compadd `git remote`
#     fi
#   else;
#     _files
#   fi
# }
# compdef _git_remote_branch grb

# # autocompletion for schema
# _rails_tables() {
#   if [[ -n $words[2] ]]; then
#     compadd `schema -l ${words[2]}`
#   fi
# }
# compdef _rails_tables schema

# # autocompletion for cuc
# _cucumber_features() {
#   compadd `ls features/**/*.feature | sed "s/features\/\(.*\).feature/\1/"`
# }
# compdef _cucumber_features cuc

# restore previous cwd
if [[ -f ~/.last_cwd ]]; then
  cd `cat ~/.last_cwd`
fi
_save_last_cwd() {
  echo `pwd` > ~/.last_cwd
}
chpwd_functions=( "${chpwd_functions[@]}" _save_last_cwd )
