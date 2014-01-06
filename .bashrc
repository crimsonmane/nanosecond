# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# Source global definitions
if [ -f /etc/bash.bashrc ]; then
        . /etc/bash.bashrc
fi

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# Defaults Section

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

###################################
# LOOK! IT'S A RAINBOW OF COLORS! #
###################################

# Reset
Color_Off='\e[0m'       # Text Reset

# Regular Colors
Black='\e[0;30m'        # Black
Red='\e[0;31m'          # Red
Green='\e[0;32m'        # Green
Yellow='\e[0;33m'       # Yellow
Blue='\e[0;34m'         # Blue
Purple='\e[0;35m'       # Purple
Cyan='\e[0;36m'         # Cyan
White='\e[0;37m'        # White

# Bold
BBlack='\e[1;30m'       # Black
BRed='\e[1;31m'         # Red
BGreen='\e[1;32m'       # Green
BYellow='\e[1;33m'      # Yellow
BBlue='\e[1;34m'        # Blue
BPurple='\e[1;35m'      # Purple
BCyan='\e[1;36m'        # Cyan
BWhite='\e[1;37m'       # White

# Underline
UBlack='\e[4;30m'       # Black
URed='\e[4;31m'         # Red
UGreen='\e[4;32m'       # Green
UYellow='\e[4;33m'      # Yellow
UBlue='\e[4;34m'        # Blue
UPurple='\e[4;35m'      # Purple
UCyan='\e[4;36m'        # Cyan
UWhite='\e[4;37m'       # White

# High Intensty
HIBlack='\e[0;90m'       # Black
HIRed='\e[0;91m'         # Red
HIGreen='\e[0;92m'       # Green
HIYellow='\e[0;93m'      # Yellow
HIBlue='\e[0;94m'        # Blue
HIPurple='\e[0;95m'      # Purple
HICyan='\e[0;96m'        # Cyan
HIWhite='\e[0;97m'       # White

# Bold High Intensty
BHIBlack='\e[1;90m'      # Black
BHIRed='\e[1;91m'        # Red
BHIGreen='\e[1;92m'      # Green
BHIYellow='\e[1;93m'     # Yellow
BHIBlue='\e[1;94m'       # Blue
BHIPurple='\e[1;95m'     # Purple
BHICyan='\e[1;96m'       # Cyan
BHIWhite='\e[1;97m'      # White

# Underline High Intensty
UHIBlack='\e[4;90m'      # Black
UHIRed='\e[4;91m'        # Red
UHIGreen='\e[4;92m'      # Green
UHIYellow='\e[4;93m'     # Yellow
UHIBlue='\e[4;94m'       # Blue
UHIPurple='\e[4;95m'     # Purple
UHICyan='\e[4;96m'       # Cyan
UHIWhite='\e[4;97m'      # White

if [ "$color_prompt" = yes ]; then
    PS1="${debian_chroot:+($debian_chroot)}\[$BackRed\]\[$Blue\]\d \t \[$Color_Off\]\[$BackBlack\]\[$URed\]\u\[$UBlue\]@\[$UWhite\]\h\[$Color_Off\]\[$BBlue\]:\[$BBlue\]\w \[$BHIWhite\]\$\[$Color_Off\] "
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

##########################
# Extra Included Scripts #
##########################
. ~/BASH/apt-history
. ~/BASH/createpass
. ~/BASH/editstuff
. ~/BASH/forcefontfsck
. ~/BASH/installreqs
. ~/BASH/juliantime
. ~/BASH/lagging
. ~/BASH/rebash
. ~/BASH/webterm
. ~/BASH/welcome1

#########################
# The Terminal Greeting #
#########################

welcome1

####################################
# Move along. Nothing to see here. #
####################################

function search-for-droids()
{
clear
EASTEREGG="1"
source ~/.bashrc
}

#########################
# Some Alias Defintions #
#########################
alias ls='ls --color=auto'
alias ll='ls -l' 
alias la='ls -A'
alias lla='ls -la'
alias df='df -h'
alias du='du -c -h'
alias mkdir='mkdir -p -v'
alias 400='chmod 400'
alias 600='chmod 600'
alias 644='chmod 644'
alias 700='chmod 700'    
alias 755='chmod 755'
alias 777='chmod 777'
alias startmouse='synclient TouchpadOff=0'
alias detailson='apt-cache showpkg'

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi


# mint-fortune
/usr/bin/mint-fortune

