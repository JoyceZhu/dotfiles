#!/usr/bin/env zsh
# shellcheck shell=bash

# Plagiarizing from dotfiles repos: nicknisi, smockle
setopt pipefail

DOTFILES_DIRECTORY=$(cd "${0%/*}" && pwd -P)
LINUX=$(uname -a | grep -Fq Linux 2>/dev/null && echo "LINUX" || echo "")

cd $HOME

# Homebrew
if test ! "$(command -v brew)"; then
    echo "Homebrew not installed. Installing."
    # Run as a login shell (non-interactive) so that the script doesn't pause for user input
    curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh | bash --login
    [ -n "${LINUX}" ] && eval "$(${HOME}/.linuxbrew/bin/brew shellenv)"
    curl -L https://iterm2.com/shell_integration/zsh -o ~/.iterm2_shell_integration.zsh
fi

echo -e "\033[1mSetting up Homebrew\033[0m"
ln -fs "${DOTFILES_DIRECTORY}/Brewfile" "${HOME}/Brewfile"
ln -fs "${DOTFILES_DIRECTORY}/.iterm2_shell_integration.zsh" "${HOME}/.iterm2_shell_integration.zsh"
brew tap homebrew/bundle
brew bundle --file Brewfile
echo -e "\033[1mHomebrew setup complete\033[0m\n"


if ! grep -q "root.*/bin/zsh" /etc/passwd
then
  chsh -s /bin/zsh root
fi

# vim
echo -e "\033[1mLinking vim stuff\033[0m"
ln -fs "${DOTFILES_DIRECTORY}/.vimrc" "${HOME}/.vimrc"
mkdir -p "${HOME}/.vim/colors"
ln -fs "${DOTFILES_DIRECTORY}/.vim/colors/eldar.vim" "${HOME}/.vim/colors/eldar.vim"
echo -e "\033[1mVim setup complete\033[0m\n"

# git
echo -e "\033[1mSetting up Git\033[0m"
ln -fs "${DOTFILES_DIRECTORY}/.gitconfig" "${HOME}/.gitconfig"
ln -fs "${DOTFILES_DIRECTORY}/git-completion.bash" "${HOME}/git-completion.bash"
ln -fs "${DOTFILES_DIRECTORY}/git-completion.zsh" "${HOME}/git-completion.zsh"
ln -fs "${DOTFILES_DIRECTORY}/git-prompt.sh" "${HOME}/git-prompt.sh"
echo -e "\033[1mGit setup complete\033[0m\n"

# use zsh
echo -e "\033[1mSetting up Zsh\033[0m"
[ -n "${CODESPACES}" ] && sudo chsh -s "$(which zsh)" "$(whoami)"
ln -fs "${DOTFILES_DIRECTORY}/.zprofile" "${HOME}/.zprofile"
[ -n "${LINUX}" ] && echo 'eval "$(${HOME}.linuxbrew/bin/brew shellenv)"' >> "${HOME}/.zprofile"
ln -fs "${DOTFILES_DIRECTORY}/.zshrc" "${HOME}/.zshrc"
ln -fs "${DOTFILES_DIRECTORY}/zsh-brew-services.zsh" "${HOME}/zsh-brew-services.zsh"
ln -fs "${DOTFILES_DIRECTORY}/.zsh-interactive-cd.plugin.zsh" "${HOME}/.zsh-interactive-cd.plugin.zsh"
echo -e "\033[1mZsh setup complete\033[0m\n"

# fig
echo -e "\033[1mSetting up Fig\033[0m"
if [ ! -f "${HOME}/.fig" ]; then
  mkdir -p "${HOME}/.fig"
  ln -fs "${DOTFILES_DIRECTORY}/fig/settings.json" "${HOME}/.fig/settings.json"
fi
echo -e "\033[1mFig setup complete\033[0m\n"

# hammerspoon
echo -e "\033[1mSetting up Hammerspoon\033[0m"
if [ ! -f "${HOME}/.hammerspoon" ]; then
  mkdir -p "${HOME}/.hammerspoon"
  ln -fs "${DOTFILES_DIRECTORY}/hammerspoon-init.lua" "${HOME}/.hammerspoon/init.lua"
fi
echo -e "\033[1mHammerspoon setup complete\033[0m\n"
