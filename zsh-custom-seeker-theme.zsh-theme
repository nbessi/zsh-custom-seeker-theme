setopt prompt_subst
autoload -Uz vcs_info
zstyle ':vcs_info:*' stagedstr '%F{28}› '
zstyle ':vcs_info:*' unstagedstr '%F{11}✗'
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{11}%r%p'
zstyle ':vcs_info:*' formats '| [%F{green}%b%c%F{blue}] %u'
zstyle ':vcs_info:*' check-for-changes true


function vcs_prompt_info() {
vcs_info
echo "${vcs_info_msg_0_}"
}


function workon_prompt_info() {

    if [ -n "$VIRTUAL_ENV" ]; then
        if [ "$VIRTUAL_ENV" != "" ]; then
        local name=$(basename $VIRTUAL_ENV)
        echo "| workon (${name})"
        fi
    fi
}

PROMPT='╭ %{$fg_bold[red]%}➜ %{$fg_bold[green]%}%n@%M:%{$fg[cyan]%}%~ %{$fg_bold[blue]%}$(workon_prompt_info)$(vcs_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}
╰ ➤ '
