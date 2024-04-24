# Use vim keybindings, but add some favorite emacs standards
bindkey -v
bindkey '^A' beginning-of-line
bindkey '^[[H' beginning-of-line
bindkey '^E' end-of-line
bindkey '^[[F' end-of-line
bindkey '^K' kill-line
# DON'T have a 0.4-second delay after pressing Esc from vim mode
KEYTIMEOUT=1
# Home, insert, end, and friends
[[ -n ${key[Insert]} ]] && bindkey "${key[Insert]}" overwrite-mode
# Undo a tab complete
bindkey '^_' undo
# Show autocomplete suggestions for current prefix
bindkey '^i' expand-or-complete-prefix
[[ -n ${key[PageUp]} ]] && bindkey "${key[PageUp]}" up-line-or-history
bindkey "${terminfo[kdch1]}" delete-char
bindkey "${terminfo[kend]}" end-of-line
[[ -n ${key[PageDown]} ]] && bindkey "${key[PageDown]}" down-line-or-history
[[ -n ${key[Up]} ]] && bindkey "${key[Up]}" up-line-or-search
[[ -n ${key[Left]} ]] && bindkey "${key[Left]}" backward-char
[[ -n ${key[Down]} ]] && bindkey "${key[Down]}" down-line-or-search
[[ -n ${key[Right]} ]] && bindkey "${key[Right]}" forward-char
# For zsh history completion
bindkey '^[[1;5A' history-substring-search-up
bindkey '^[[1;5B' history-substring-search-down
autoload -U compinit && compinit -d ~/.zcompdump_custom
#compinit -d ~/.zcompdump_custom
zmodload -i zsh/complist
# Keyboard nav menus
zstyle ':completion:*' menu select
zstyle ':completion:*' add-space false
zstyle ':completion:*:expand:*' add-space false
zstyle ':completion:*:default' add-space false
zstyle ':completion:*:prefix:*' add-space false
zstyle ':completion:expand-alias-word:*' add-space false
#zstyle ':completion:*:*:git:*' script ~/git-completion.zsh
# Tab-complete reminders from man pages
compdef __gnu_generic remind
alias vimrc="vim ~/.vimrc"
alias rc="vim ~/.zshrc"
alias erc="source ~/.zshrc"

alias pu="git pull; git push"

alias go="git add .;git commit -v"
export VSCODE_CONFIG_PATH="${HOME}/Library/Application\ Support/Code/User/settings.json"
function gf() {
    git checkout -b "$1" origin/master
}
function squash() {
    git rebase -i HEAD~$1
}
# Tab retitle
function title {
    echo -ne "\033]0;"$*"\007"
}
alias ls="ls -G"
alias la='ls -la'
alias qupdate="git stash save 'Pre-pull' && git pull && git stash pop"
alias gs="git stash save -u -k 'Unstaged'"
alias gcn="git commit -n"
alias hg="history | grep"
alias hs="cd ~; ls"
alias ...="../.."
alias ....="../../.."
alias directories="file * | grep directory"
alias .....="../../../.."
alias diskspace="du -sh | sort -nr | more"
alias p="python"
alias init="git init"
alias addall="git add ."
alias addpy="git add *py"
alias pull="git pull"
alias push="git push origin"
alias addbranch="git checkout -b"
alias check="git log -p -1"
alias delbranch="git checkout -d"
alias merge="git merge"
alias binstall="brew install"
alias activate="source $HOME/venv/bin/activate"
alias mysql="mysql -u root -p"
alias weather='ansiweather -l "Cambridge,us" -u imperial -s true -d true; ansiweather -l "Palo Alto,us" -u imperial -s true -d true'
eval $(thefuck --alias)
export LSCOLORS=Gadxcxdxfxegedabagacad
alias mycommits="git log --author=\"Joyce\""
export VENV="$HOME/venv"
export EDITOR=$(which vim)
export GIT_EDITOR=$(which vim)
export BROKER_HOST=localhost
export ENV_BROKER_HOST=localhost
alias firefox=/Applications/Firefox.app/Contents/MacOS/firefox
export MOZ_NO_REMOTE=0
export DOTNET_CLI_TELEMETRY_OPTOUT=1
export BROWSER=firefox

# VSCode color scheme development
alias uvscode="cp ~/joycevimblackboard/themes/vim-blackboard.tmTheme  ~/.vscode/extensions/vimblackboard/themes/vim-blackboard.tmTheme"

# Autocomplete git branch/command names
fpath=(~/.zsh $fpath)
export COMPLETION_DIR="/usr/share/zsh/site-functions"

# if test -z "$VIRTUAL_ENV" ; then
#    PYTHON_VIRTUALENV=""
# else
#    PYTHON_VIRTUALENV="${YELLOW}[`basename \"$VIRTUAL_ENV\"`]${COLOR_NONE} "
# fi

# Change command prompt

source ~/git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1 # Show unstaged (*) and staged (+) changes
export GIT_PS1_SHOWSTASHSTATE=1 # Show if there's a stash ($)
export GIT_PS1_SHOWUNTRACKEDFILES=1 # Show if there are untracked files (%)
export GIT_PS1_SHOWUPSTREAM="verbose" # Show number of commits ahead/behind upstream
export GIT_PS1_HIDE_IF_PWD_IGNORED=1 # Don't do git stuff if current directory not a repo
setopt PROMPT_SUBST
autoload colors && colors
local host_name=$'%{\e[0;35m%}%n'
local git_status=$'%{\e[1;31m%}\$(__git_ps1)'
local path_string=$'%{\e[1;36m%}%~'
local prompt_string="$"
local current_date=$'%{\e[1;33m%}%W'

# Make prompt_string red if the previous command failed.
local return_status="%(?:%{$fg[blue]%}$prompt_string:%{$fg[red]%}$prompt_string)"
PROMPT=$'${current_date} ${host_name}%{\e[1;31m%}\$(__git_ps1) ${path_string} ${return_status} %{$reset_color%}'

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
# The next line updates PATH for the Google Cloud SDK.
# if [ -f '/Users/joyce.zhu/Downloads/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/joyce.zhu/Downloads/google-cloud-sdk/path.zsh.inc'; fi
# source '/Users/joyce.zhu/Downloads/google-cloud-sdk/path.zsh.inc'

# The next line enables shell command completion for gcloud.
# if [ -f '/Users/joyce.zhu/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/joyce.zhu/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
# source '/Users/joyce.zhu/Downloads/google-cloud-sdk/completion.zsh.inc'



# Various sensible options

# Lazy implicit cd
setopt autocd
# Don't record duplicate entries in history
setopt histignorealldups
# Smarter globbing
setopt extendedglob
# Try to correct shitty spelling
setopt correct
# Complete from both ends of a word.
setopt COMPLETE_IN_WORD
# Show completion menu on a successive tab press.
setopt AUTO_MENU
# Automatically list choices on ambiguous completion.
setopt AUTO_LIST
# If completed parameter is a directory, add a trailing slash.
setopt AUTO_PARAM_SLASH
setopt NO_COMPLETE_ALIASES
# Who the hell needs this?
setopt NO_BEEP
# Don't write a duplicate event to the history file.
setopt HIST_SAVE_NO_DUPS
# Delete an old recorded event if a new event is a duplicate.
setopt HIST_IGNORE_ALL_DUPS


# Fuzzy completion
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# Preview pane
export FZF_CTRL_T_OPTS='--height=70% --preview="cat {}" --preview-window=right:60%:wrap'
export FZF_CTRL_T_COMMAND='rg --files'

# fcd - Find any directory and cd to selected directory
fcd() {
   local dir
   dir=$(find ${1:-.} -path '*/\.*' -prune -o -type d \
      -print 2> /dev/null | fzf +m) &&
    cd "$dir"
}
zle -N fcd
bindkey '^P' fcd

# Dump globalias
globalias() {
   zle _expand_alias
   zle expand-word
   zle self-insert
}
zle -N globalias

source ~/zsh-brew-services.zsh

# space expands all aliases, including global
bindkey -M emacs " " globalias
bindkey -M viins " " globalias

# control-space to make a normal space
bindkey -M emacs "^ " magic-space
bindkey -M viins "^ " magic-space

# normal space during searches
bindkey -M isearch " " magic-space

# Get zplug up and running
#export ZPLUG_HOME=/usr/local/opt/zplug
#source $ZPLUG_HOME/init.zsh

## Zplug packages
#zplug "zdharma/fast-syntax-highlighting", from:github, defer:2
#zplug "zsh-users/zsh-autosuggestions", from:github, defer:2
## zplug "zsh-users/zsh-completions"
#zplug "arzzen/calc.plugin.zsh"
#zplug "sindresorhus/pretty-time-zsh"
#zplug "adolfoabegg/browse-commit"
#zplug "tarrasch/zsh-bd"
## zplug "zpm-zsh/colors"
## https://github.com/peterhurford/git-it-on.zsh command list
#zplug "peterhurford/git-it-on.zsh"
##zplug "nviennot/zsh-vim-plugin"
#zplug "mafredri/zsh-async", from:"github", use:"async.zsh"
#zplug "ael-code/zsh-colored-man-pages", from:"github"
#zplug "plugins/git", from:oh-my-zsh
#zplug load


# Freaking mv is broken
# rm -f ~/.zcompdump*
# exec zsh -l

# autoload -U compinit && compinit

# Faster compinit
# autoload -Uz compinit
# if [ $(date +'%j') != $(stat -f '%Sm' -t '%j' ~/.zcompdump) ]; then
#   compinit
# else
#   compinit -C
# fi

# zmodload -i zsh/complist


# Various other scripts
source $(brew --prefix)/share/zsh-history-substring-search/zsh-history-substring-search.zsh
# iTerm2 shell integration
source ~/.iterm2_shell_integration.zsh
# interactive `cd`
source ~/.zsh-interactive-cd.plugin.zsh

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

zinit ice wait"0" atload"unalias grv; unalias ga; unalias gd" lucid
zinit snippet OMZ::plugins/git/git.plugin.zsh

zinit ice wait"0" blockf lucid
zinit light zsh-users/zsh-autosuggestions
zinit light zdharma-continuum/fast-syntax-highlighting
zinit light arzzen/calc.plugin.zsh
zinit light adolfoabegg/browse-commit
zinit light melkster/zsh-bd
zinit light peterhurford/git-it-on.zsh
zinit light mafredri/zsh-async

zinit ice wait"0" lucid
zinit snippet OMZ::plugins/colored-man-pages/colored-man-pages.plugin.zsh

zinit ice wait"0.1" atload"alias gco=\"git checkout\"" lucid
zinit light wfxr/forgit 

alias ga=forgit::add

# Bypass https://github.com/nvbn/thefuck/issues/1219
export THEFUCK_PRIORITY="git_hook_bypass=1100"
# PDE SETUP || 2022-02-15T15:36:03-0500
##############################################
/usr/bin/ssh-add --apple-load-keychain >/dev/null 2>&1
##############################################

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

# eval "$(rbenv init - zsh)"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
# export PATH="$PATH:$HOME/.rvm/bin"
