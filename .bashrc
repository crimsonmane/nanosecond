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
mintVersion=$(inxi -S)
iamme=$(whoami)

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

#########################
# Directory Colors	#
#			#
# You choices are	#
# Blue = 34		#
# Green = 32		#
# Light Green = 1;32	#
# Cyan = 36		#
# Red = 31		#
# Purple = 35		#
# Brown = 33		#
# Yellow = 1;33		#
# white = 1;37		#
# Light Grey = 0;37	#
# Black = 30		#
# Dark Grey= 1;30	#
#########################

LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lz=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;34:*.jpeg=01;34:*.gif=01;34:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;32:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.axa=00;36:*.oga=00;36:*.spx=00;36:*.xspf=00;36:';
export LS_COLORS

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
. ~/BASH/pressanykey
. ~/BASH/rebash
. ~/BASH/unlockdpkg
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

alias ls='ls -hAl --color=auto'
alias 400='chmod 400'
alias 600='chmod 600'
alias 644='chmod 644'
alias 700='chmod 700'    
alias 755='chmod 755'
alias 777='chmod 777'
alias bc='bc -l'
alias startmouse='synclient TouchpadOff=0'
alias detailson='apt-cache showpkg'
alias owned='sudo chown -R $iamme:$iamme'

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi


# mint-fortune
/usr/bin/mint-fortune

