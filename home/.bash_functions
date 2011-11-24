####################################################################################################
# FUNCTIONS
# Modded from - https://github.com/sharfah/dotfiles
####################################################################################################

# Define some colours
GREY=$'\033[1;30m'
RED=$'\033[1;31m'
GREEN=$'\033[1;32m'
YELLOW=$'\033[1;33m'
BLUE=$'\033[1;34m'
MAGENTA=$'\033[1;35m'
CYAN=$'\033[1;36m'
WHITE=$'\033[1;37m'
NONE=$'\033[m'

# Function to run upon exit of shell.
function _exit() {
    echo -e "${RED}Hasta la vista, baby${NONE}"
}
trap _exit EXIT

# Show/Hide files through terminal
function hidden() {
	defaults write com.apple.finder AppleShowAllFiles ${1};
	killall Finder;
}

# Find a file with a pattern in name:
function ff() {
	find . -type f -iname '*'$*'*' -ls ;
}

# Get my IP address
function my_ip() {
    echo -e "${CYAN}" ; /sbin/ifconfig | grep "inet " | grep -v "127.0.0.1" | awk '{ print $2}' | sed 's/addr://' | head -1;    
}

# Get my public IP address
function pub_ip() {
	echo -e "${CYAN}" ; curl -s checkip.dyndns.org|sed -e 's/.*Current IP Address: //' -e 's/<.*$//';
}

# Get current host related info.
function ii() {
    echo -e "\n${RED}Additionnal information:$NONE " ; uname -a
    echo -e "\n${RED}Users logged on:$NONE " ; w -h
    echo -e "\n${RED}Machine stats :$NONE " ; uptime
    echo
}

####################################################################################################