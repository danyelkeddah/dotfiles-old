#!/bin/sh

###############
# DISK
###############



alias df="df -h"
alias diskusage="df"
alias fu="du -ch"
alias folderusage="fu"
alias tfu="du -sh"
alias totalfolderusage="tfu"
alias duu="ncdu --color dark -rr -x --exclude .git --exclude node_modules --exclude vendor"


###############
# DOCKER
###############



alias dcreate="docker create" # create container
alias dstart="docker start -a" # start and watch "-a: for changes
alias dstop="docker stop"
alias dr="docker run" # run container
alias dps="docker ps" # list running containers
alias dpsa="docker ps -a" # list all containers
alias dl="docker logs" # logs for specific container by id
alias ds="docker stop" # stop container
alias dk="docker kill" # kill containeur
alias dbuild="docker build -t" # Docker Build USERNAME/IMAGE_NAME:TAG_VERSION .
alias dsysp="docker system prune" # delete all containers
alias dexec="docker exec -it" # execute commands inside the container [container id, commad]

alias dcps="docker-compose ps"
alias dcup="docker-compose up"
alias dcupd="docker-compose up -d"
alias dcdown="docker-compose down"



###############
# DOTFILES
###############



alias config="/usr/local/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME"



###############
# GIT
###############



alias g="git"
alias lg="lazygit"
alias commit="git add . && git commit"
alias mcommit="git add . && git commit -m"
alias wip="git add . && git commit -m 'WIP 👷‍♂️'"
alias gs="git status"
alias gb="git branch"
alias gc="git checkout"
alias gd="git diff"
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias ga="git add ."
alias gpull="git pull"
alias gpush="git push"
alias gstash="git stash"
alias gstats="git-quick-stats"
alias gconflicts="git diff --name-only --diff-filter=U"



###############
# HOMEBREW
###############



alias brews="brew services"
alias brewu='brew update && brew upgrade && brew cleanup && brew prune && brew doctor'




###############
# MACOS
###############

# Get macOS Software Updates, and update installed Ruby gems, Homebrew, npm, and their installed packages
alias update='sudo softwareupdate -i -a; brew update; brew upgrade; brew cleanup; npm update -g; sudo gem update --system; sudo gem update; sudo gem cleanup'

# Google Chrome
alias chrome='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome'

# Kill all the tabs in Chrome to free up memory
# [C] explained: http://www.commandlinefu.com/commands/view/402/exclude-grep-from-your-grepped-output-of-ps-alias-included-in-description
alias chromekill="ps ux | grep '[C]hrome Helper --type=renderer' | grep -v extension-process | tr -s ' ' | cut -d ' ' -f2 | xargs kill"

# Empty the Trash on all mounted volumes and the main HDD.
# Also, clear Apple’s System Logs to improve shell startup speed.
# Finally, clear download history from quarantine. https://mths.be/bum
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl; sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'delete from LSQuarantineEvent'"

# Show/hide hidden files in Finder
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# Disable & Enable Spotlight
alias spotoff="sudo mdutil -a -i off"
alias spoton="sudo mdutil -a -i on"

# Mute
alias stfu="osascript -e 'set volume output muted true'"

# Max Volume
alias pumpitup="osascript -e 'set volume output volume 100'"

# Lock the screen (when going AFK)
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

# Reload the shell (i.e. invoke as a login shell)
alias reload="exec ${SHELL} -l"

# Print each PATH entry on a separate line
alias path='echo -e ${PATH//:/\\n}'

# Recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
alias ifactive="ifconfig | pcregrep -M -o '^[^\t:]+:([^\n]|\n\t)*status: active'"

# Shortcuts
alias copyssh="pbcopy < $HOME/.ssh/id_ed25519.pub"
alias reloadcli="source $HOME/.zshrc"
alias reloaddns="dscacheutil -flushcache && sudo killall -HUP mDNSResponder"
alias ll="/usr/local/opt/coreutils/libexec/gnubin/ls -ahlF --color --group-directories-first"
alias phpstorm='open -a /Applications/PhpStorm.app "`pwd`"'
alias shrug="echo '¯\_(ツ)_/¯' | pbcopy"
alias fight="echo '(ง'̀-'́)ง' | pbcopy";

# Edit Aliases
alias editaliases='open -a "Visual Studio Code" ~/.aliases'

# Weather
weather() { curl -4 wttr.in/${1:-mersin} }




###############
# NAVIGATION
###############



alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias bk="cd $OLDPWD"
alias icloud="cd ~/Library/Mobile\ Documents/com\~apple\~CloudDocs"



###############
# NPM
###############



alias npmglist="npm list -g --depth=0"




###############
# PHP
###############



# Composer
alias c="composer"
alias cu="composer update"
alias ci="composer install"
alias cr='composer require'
alias co='composer outdated --direct'
alias cda="composer dump-autoload -o"
alias update-global-composer='cd ~/.composer && composer update'
alias composer-update-global='update-global-composer'


#Laravel
alias a="php artisan"
alias art="php artisan"
alias a:l="php artisan route:list"
alias migrate="art migrate"
alias serve="php artisan serve"
alias tinker="php artisan tinker"
alias cclear="php artisan cache:clear"
alias fresh="artisan migrate:fresh --seed"
alias laravelidehelper="php artisan ide-helper:generate && php artisan ide-helper:meta"
alias laravelidehelperall="php artisan ide-helper:generate && php artisan ide-helper:models && php artisan ide-helper:meta"

# Laravel Homestead
alias edithomestead="code ~/Homestead/Homestead.yaml"


###############
# VAGRANT
###############
alias v="vagrant"
alias vgs="vagrant global-status"
alias vup="vagrant up"
alias vhalt="vagrant halt"
alias vssh="vagrant ssh"
alias vreload="vagrant reload"
alias vrebuild="vagrant destroy --force && vagrant up"


###############
# SYSTEM
###############
alias cat="bat --paging=never"
alias ping="prettyping --nolegend"
alias preview="fzf --preview 'bat --color \"always\" {}'"
