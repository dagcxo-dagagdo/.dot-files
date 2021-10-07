### MY ALAISES ###
alias tmp='cd /tmp/'
alias apt='dnf' # :D
alias cls='clear'
alias des='cd ~/Desktop'
alias dow='cd ~/Downloads'
alias www='cd /var/www/html'
alias tmp='cd /tmp'
alias ..='cd ../'

alias grep='grep --color=auto'
alias ll='ls -la'
alias l='ls -lta'
alias open='xdg-open'

alias copy='xclip -selection clipboard'
alias paste='xclip -selection clipboard -o'

unset SSH_ASKPASS

virt() {
	virtualenv env
	. env/bin/activate
}

gpush() {
	python3 make.py push
}

gpull() {
	python3 make.py pull
}

export PS1='\[\033[01;31m\]\u\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

bright() {
	xrandr | grep ' conn' | awk '{print $1}' \
	| while read device; do
		xrandr --output $device --brightness ${1:-1}
	done
}

function pyactivate () {

    name=env
    location=.


    if [[ $1 ]]; then
        location=$1
    fi

    if [[ $2 ]]; then
        name=$2
    fi

    if [[ -d "$location/$name" ]]; then
        . "$location/$name/bin/activate"
    elif [[ -d "../$location/$name" ]]; then
        . "../$location/$name/bin/activate"
    fi
}



mcd() {
	[ $# -eq 0 ] && return 1
	mkdir "$1" && cd "$1"
}




# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
unset SSH_ASKPASS
