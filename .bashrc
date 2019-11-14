alias vimrc="vim ~/.vimrc"
# alias vim="/usr/local/bin/vim"
alias rc="vim ~/.bashrc"
alias erc="source ~/.bash_profile"
alias pu="git pull; git push"
export PATH="$PATH":~/android-sdk-macosx/tools:~/android-sdk-macosx/tools/bin:~/android-sdk-macosx/platform-tools:~/android-ndk-r10d:~/quip/android/tools:~/local/bin:~/quip/bin:~/google-cloud-sdk/bin/:~/depot_tools:~/neovim/bin
alias go="git add .;git commit"
function gf() {
    git checkout -b "$1" origin/master
}
alias la='ls -la'
alias qupdate="git stash && git pull && git stash pop"
alias gs="git stash -u -k"
alias hg="history | grep"
alias hs="cd ~; ls"
alias ...="../.."
alias ....="../../.."
alias directories="file * | grep directory"
alias .....="../../../.."
alias diskspace="du -sh | sort -nr | more"
alias home="cd ~"
alias p="python"
alias init="git init"
alias addall="git add ."
alias addpy="git add *py"
alias commit="git commit -m"
alias pull="git pull"
alias push="git push origin"
alias addbranch="git checkout -b"
alias delbranch="git checkout -d"
alias merge="git merge"
alias binstall="brew install"
alias activate="source $HOME/venv/bin/activate"
alias mysql="mysql -u root -p"
eval $(thefuck --alias)
alias mycommits="git log --author=\"Joyce\""
export PYTHONDONTWRITEBYTECODE=1
export VENV="$HOME/venv"
export EDITOR=$(which vim)
# export PATH=$PATH:/usr/local/mysql:/usr/local/sbin:/usr/local/mysql/bin
alias firefox=/Applications/Firefox.app/Contents/MacOS/firefox
export MOZ_NO_REMOTE=0
export DOTNET_CLI_TELEMETRY_OPTOUT=1
function cgh() {
    firefox -new-tab "https://www.github.com/quip/quip/commit/"$1
}
export BROWSER=firefox
alias ngrok="/Applications/ngrok"
# Autocomplete git branch/command names
if [ -f ~/git-completion.bash ]; then
  . ~/git-completion.bash
fi

# colors!
GREEN="\[\033[0;32m\]"
LIGHT_CYAN="\[\033[1;36m\]"
PURPLE="\[\033[0;35m\]"
YELLOW="\[\033[1;33m\]"
LIGHT_RED="\[\033[1;31m\]"
reset="\[\033[0m\]"

if test -z "$VIRTUAL_ENV" ; then
   PYTHON_VIRTUALENV=""
else
   PYTHON_VIRTUALENV="${YELLOW}[`basename \"$VIRTUAL_ENV\"`]${COLOR_NONE} "
fi

# Change command prompt

source ~/git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1 # Show unstaged (*) and staged (+) changes
export GIT_PS1_SHOWSTASHSTATE=1 # Show if there's a stash ($)
export GIT_PS1_SHOWUNTRACKEDFILES=1 # Show if there are untracked files (%)
export GIT_PS1_SHOWUPSTREAM="verbose" # Show number of commits ahead/behind upstream
export GIT_PS1_HIDE_IF_PWD_IGNORED=1 # Don't do git stuff if current directory not a repo
# '\u' adds the name of the current user to the prompt
# '\$(__git_ps1)' adds git-related stuff
# '\W' adds the name of the current directory
export PS1="${PYTHON_VIRTUALENV}$PURPLE\u$LIGHT_RED\$(__git_ps1)$LIGHT_CYAN \W $ $reset"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/joyce.zhu/Downloads/google-cloud-sdk/path.bash.inc' ]; then source '/Users/joyce.zhu/Downloads/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/joyce.zhu/Downloads/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/joyce.zhu/Downloads/google-cloud-sdk/completion.bash.inc'; fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
