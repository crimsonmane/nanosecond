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

#####################
# LOOK! A RAINBOW!! #
#####################

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
BBlack='\e[1;30m'       # Bold Black
BRed='\e[1;31m'         # Bold Red
BGreen='\e[1;32m'       # Bold Green
BYellow='\e[1;33m'      # Bold Yellow
BBlue='\e[1;34m'        # Bold Blue
BPurple='\e[1;35m'      # Bold Purple
BCyan='\e[1;36m'        # Bold Cyan
BWhite='\e[1;37m'       # Bold White

# Underline
UBlack='\e[4;30m'       # Black Underline
URed='\e[4;31m'         # Red Underline
UGreen='\e[4;32m'       # Green Underline
UYellow='\e[4;33m'      # Yellow Underline
UBlue='\e[4;34m'        # Blue Underline
UPurple='\e[4;35m'      # Purple Underline
UCyan='\e[4;36m'        # Cyan Underline
UWhite='\e[4;37m'       # White Underline

# High Intensity
HIBlack='\e[0;90m'       # High Intensity Black
HIRed='\e[0;91m'         # High Intensity Red
HIGreen='\e[0;92m'       # High Intensity Green
HIYellow='\e[0;93m'      # High Intensity Yellow
HIBlue='\e[0;94m'        # High Intensity Blue
HIPurple='\e[0;95m'      # High Intensity Purple
HICyan='\e[0;96m'        # High Intensity Cyan
HIWhite='\e[0;97m'       # High Intensity White

# Bold High Intensity
BHIBlack='\e[1;90m'      # Bold High Intensity Black
BHIRed='\e[1;91m'        # Bold High Intensity Red
BHIGreen='\e[1;92m'      # Bold High Intensity Green
BHIYellow='\e[1;93m'     # Bold High Intensity Yellow
BHIBlue='\e[1;94m'       # Bold High Intensity Blue
BHIPurple='\e[1;95m'     # Bold High Intensity Purple
BHICyan='\e[1;96m'       # Bold High Intensity Cyan
BHIWhite='\e[1;97m'      # Bold High Intensity White

# Underline High Intensity
UHIBlack='\e[4;90m'      # Underline High Intensity Black
UHIRed='\e[4;91m'        # Underline High Intensity Red
UHIGreen='\e[4;92m'      # Underline High Intensity Green
UHIYellow='\e[4;93m'     # Underline High Intensity Yellow
UHIBlue='\e[4;94m'       # Underline High Intensity Blue
UHIPurple='\e[4;95m'     # Underline High Intensity Purple
UHICyan='\e[4;96m'       # Underline High Intensity Cyan
UHIWhite='\e[4;97m'      # Underline High Intensity White

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
. ~/BASH/compjoke
# . ~/BASH/juliantime
# . ~/BASH/lag
# . ~/BASH/mtrmenu
# . ~/BASH/rebash
# . ~/BASH/editfunction
# . ~/BASH/testfunction
# . ~/BASH/apt-history
# . ~/BASH/createpass
# . ~/BASH/installreqs
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
