export PS1="\[$(tput bold)\]\[\033[38;5;11m\]\u\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\]@\h:\[$(tput sgr0)\]\[\033[38;5;10m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"

export PATH=/usr/local/bin:/usr/local/sbin:$PATH

alias gs="git status"
alias prp="pipenv run python"

eval $(thefuck --alias)


function iterm2_print_user_vars() {
  iterm2_set_user_var gitBranch $((git branch 2> /dev/null) | grep \* | cut -c3-)
  iterm2_set_user_var badge $(dir_badges)
}

function dir_badges() {
 while read directory badge || [[ -n "$directory" ]]
    do
        if [[ "$PWD" == $directory* ]]; then
            echo $badge
            break
        fi
    done < ~/.badges
}

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/ashwin/google-cloud-sdk/path.bash.inc' ]; then source '/Users/ashwin/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/ashwin/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/ashwin/google-cloud-sdk/completion.bash.inc'; fi
