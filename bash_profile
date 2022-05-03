set -o vi

export EDITOR=vim

alias f='open -a Finder ./'
alias ll='ls -FGlAhp'
alias ls="ls -F"

# export PS1='[\u \W$(__git_ps1 " (%s)")]\$ '

# For Ruby installed by homebrew
export PATH=/usr/local/opt/ruby/bin:/usr/local/lib/ruby/gems/2.7.0/bin:$PATH
export PATH=~/bin:/usr/local/bin:$PATH

export PATH=~/go/bin:$PATH

brew_prefix=$(brew --prefix)

# For diff-highlight. See http://theunixtoolbox.com/git-diff-highlight/
PATH=$PATH:$brew_prefix/share/git-core/contrib/diff-highlight

if [ -f $brew_prefix/share/bash-completion/bash_completion ]; then
  . $brew_prefix/share/bash-completion/bash_completion
fi

if [ -f $brew_prefix/opt/bash-git-prompt/share/gitprompt.sh ]; then
  GIT_PROMPT_THEME=Default
  source $brew_prefix/opt/bash-git-prompt/share/gitprompt.sh
  # . ~/dotfiles/git-prompt-overrides.sh
fi

# export HOMEBREW_GITHUB_API_TOKEN=

# MenubarNotifier function
# https://github.com/alexglasser/menubarnotifier
mn () {
    ~/bin/menubarnotifier.py "$1" 2>/dev/null &
}

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
#export GREP_OPTIONS='--color=auto'
alias grep='ggrep --color=auto'

export GPG_TTY=$(tty)

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# This is annoyingly slow
#export PATH=$HOME/.jenv/bin:$PATH
# eval "$(jenv init -)"

[ -s "/usr/local/etc/grc.bashrc" ] && . "/usr/local/etc/grc.bashrc" # Colourise with grc

# Better syntax highlighting, but no handling of binary files
# LESSPIPE=`which src-hilite-lesspipe.sh`
# export LESSOPEN="| ${LESSPIPE} %s"
# export LESS=' -R'

# Nice binary handling, not as good for syntax highlighting
export LESSOPEN="|/usr/local/bin/lesspipe.sh %s" LESS_ADVANCED_PREPROCESSOR=1
export LESS='-XFR'

lesscolors()
{
  #LESS=' -R' \
  LESSPIPE=`which src-hilite-lesspipe.sh` \
  LESSOPEN='| ${LESSPIPE} %s' \
  $(which less) $@
}

realpath() {
  OURPWD=$PWD
  cd "$(dirname "$1")"
  LINK=$(readlink "$(basename "$1")")
  while [ "$LINK" ]; do
    cd "$(dirname "$LINK")"
    LINK=$(readlink "$(basename "$1")")
  done
  REALPATH="$PWD/$(basename "$1")"
  cd "$OURPWD"
  echo "$REALPATH"
}

less()
{
  less=$(which less)
  has_file=false
  all_text=true

  for arg in $@; do
    if [[ "$arg" != -* ]] && [ -e "$arg" ]; then
      has_file=true
      enc=$(file -b --mime-encoding "$(realpath $arg)")

      if [[ "$enc" != *"-ascii" ]] && [ "$enc" != "utf-8" ]; then
        all_text=false
        break
      fi
    fi
  done

  if [ $has_file == true ] && [ "$all_text" == true ]; then
    less=lesscolors
  fi

  $less $@
}

alias more=less
export PAGER=less

export DOTNET_CLI_TELEMETRY_OPTOUT=1

# bash parameter completion for the dotnet CLI

_dotnet_bash_complete()
{
  local word=${COMP_WORDS[COMP_CWORD]}

  local completions
  completions="$(dotnet complete --position "${COMP_POINT}" "${COMP_LINE}" 2>/dev/null)"
  if [ $? -ne 0 ]; then
    completions=""
  fi

  COMPREPLY=( $(compgen -W "$completions" -- "$word") )
}

complete -f -F _dotnet_bash_complete dotnet

# Executed after reading a command and before executing it. Will restore the cursor to a block
export PS0="\e[2 q"
eval export PATH="/Users/matt/.jenv/shims:${PATH}"
export JENV_SHELL=bash
export JENV_LOADED=1
unset JAVA_HOME
source '/usr/local/Cellar/jenv/0.5.4/libexec/libexec/../completions/jenv.bash'
jenv rehash 2>/dev/null
jenv refresh-plugins
jenv() {
  typeset command
  command="$1"
  if [ "$#" -gt 0 ]; then
    shift
  fi

  case "$command" in
  enable-plugin|rehash|shell|shell-options)
    eval `jenv "sh-$command" "$@"`;;
  *)
    command jenv "$command" "$@";;
  esac
}


