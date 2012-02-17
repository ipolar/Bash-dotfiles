####################################################################################################
# FUNCTIONS
# Modded from - https://github.com/sharfah/dotfiles & https://github.com/fredrikmollerstrand/home/
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
	# Empty at the moment
    echo -e ""
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
}

# For exporting users from MySQL
# Use as: mygrants --host=localhost --user=root --password=dump
# This will create an SQL file, import this into your new MySQL server
function mygrants() {
	mysql -B -N $@ -e "SELECT DISTINCT CONCAT(
		'SHOW GRANTS FOR ''', user, '''@''', host, ''';'
		) AS query FROM mysql.user" | \
	mysql $@ | \
	sed 's/\(GRANT .*\)/\1;/;s/^\(Grants for .*\)/## \1 ##/;/##/{x;p;x;}'
}

# Reload profile
function reload() {
    echo "reloading .bash_profile"
    source $HOME/.bash_profile
}

# List all hosts connected to
function hosts() {
    echo -e "\n${RED}Connected hosts:$NONE \n";
	netstat -an | grep ESTABLISHED | awk '{print $5}' | awk -F: '{print $1}' | sort | uniq -c | awk '{ printf("%s\t%s\t",$2,$1) ; for (i = 0; i < $1; i++) {printf("*")}; print ""}'
}

####################################################################################################