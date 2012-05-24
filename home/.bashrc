####################################################################################################
# BASHRC
# Modded from - https://github.com/sharfah/dotfiles & https://github.com/fredrikmollerstrand/home/
####################################################################################################

# RVM guff
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.

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

# Enable coloured man pages
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# Coloured GREP, ignore case, recursive
export GREP_OPTIONS='--color=auto -R -i'
export GREP_COLOR='0;93'

# Source everything else
source ~/.bash_prompt
source ~/.bash_completion
source ~/.bash_aliases
source ~/.bash_functions
source ~/.bash_paths
source ~/.bash_hosts

############################################