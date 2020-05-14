#!/bin/sh
red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`

echo "${red}[SYSTEM] ${green}Setting up your Mac...${reset}"

echo echo "${red}[SYSTEM] ${green}Allowing installing Apps from Anywhere${reset}"
sudo spctl --master-disable

# Check for Homebrew and install if we don't have it
echo "${red}[SYSTEM] ${green}Checking if Homebrew is installed${reset}"
if test ! $(which brew); then
  echo "${red}[SYSTEM] ${green}Installing Homebrew...${reset}"
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
echo "${red}[SYSTEM] ${green}Updating Homebrew...${reset}"
# Update Homebrew recipes
brew update

echo "${red}[SYSTEM] ${green}Installing Dependencies from Brewfile...${reset}"
# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle

echo "${red}[SYSTEM] ${green}Update MYSQL Configurations"
mysql -u root -e "ALTER USER root@localhost IDENTIFIED WITH mysql_native_password BY 'password'; FLUSH PRIVILEGES;"
echo 'default_authentication_plugin=mysql_native_password' >> /usr/local/etc/my.cnf
brew services restart mysql

echo "${red}[SYSTEM] ${green}Installing PHP Extensions with PECL...${reset}"
# Homebrew doesn't support the installation of PHP extensions anymore, Install PHP extensions with PECL
pecl install memcached 
pecl install imagick
pecl install redis
pecl install xdebug


echo "${red}[SYSTEM] ${green} Installing Oh My ZSH${reset}"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


echo "${red}[SYSTEM] ${green}Installing global Composer packages...${reset}"
# Install global Composer packages
/usr/local/bin/composer global require laravel/installer laravel/spark-installer laravel/valet

echo "${red}[SYSTEM] ${green}Installing Laravel Valet...${reset}"
# Install Laravel Valet
$HOME/.composer/vendor/bin/valet install

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo "${red}[SYSTEM] ${green}Creating directories...${reset}"
# Create a Sites directory
# This is a default directory for macOS user accounts but doesn't comes pre-installed
mkdir $HOME/Sites

echo "${red}[SYSTEM] ${green}Symlink .zshrc from the .dotfiles...${reset}"
# Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the .dotfiles
rm -rf $HOME/.zshrc
ln -s $HOME/.dotfiles/.zshrc $HOME/.zshrc

echo "${red}[SYSTEM] ${green}Symlink .gitignore_global form the .dotfiles...${reset}"
rm -rf $HOME/.gitignore_global
ln -s $HOME/.dotfiles/.gitignore_global $HOME/.gitignore_global

echo "${red}[SYSTEM] ${green}Symlink Mackup config file from the .dotfiles...${reset}"
# Symlink the Mackup config file to the home directory
ln -s $HOME/.dotfiles/.mackup.cfg $HOME/.mackup.cfg

# chmod +x to all files inside install directory
chmod -R +x ./install

echo "${red}[SYSTEM] ${green}Installing NPM global packages...${reset}"
./install/npm.sh

echo "${red}[SYSTEM] ${green}Setting MacOS Preferences...${reset}"
# Set macOS preferences
# We will run this last because this will reload the shell
source .macos

echo "${red}[SYSTEM] ${green}Using 'diff-so-fancy' for all diffs${reset}"
git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"

echo "${red}[SYSTEM] ${green}Restoring all settings for all application from Cloud${reset}"
mackup restore -f
