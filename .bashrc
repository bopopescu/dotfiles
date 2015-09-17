
# used to keep my history forever
PROMPT_COMMAND="[ -d $HOME/.history ] || mkdir -p $HOME/.history; echo : [\$(date)] $$ $USER \$OLDPWD\; \$(history 1 | sed -E 's/^[[:space:]]+[0-9]*[[:space:]]+//g') >> $HOME/.history/bash_history-\`date +%Y%m%d\`"

# search history 
function hsearch {
       grep "$1" $HOME/.history/*
}

# search history (return only raw commands without timestamps)
function hs {
	hsearch $1 | cut -d';' -f2
}

# search history and copy last item to clipboard
function hsc {
        echo "Last command matching "$1
        hs $1|tail -1
	hs $1|tail -1|xclip -selection c
}

PATH=$PATH:/home/carolinux/intellij/idea-IC-133.193/bin/
export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64/

# git shortcuts
alias st='git status -uno'
alias stu='git status'
alias gau='git add -u'
alias ga='git add'
alias gc='git checkout'
alias gb='git branch'
# for kerberos authentication
alias ack='aklog;tokens'
# for loading things from the shell to the clipboard
alias xclip="xclip -selection c"
