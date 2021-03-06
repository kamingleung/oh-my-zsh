function zsh_stats() {
  history | awk '{print $2}' | sort | uniq -c | sort -rn | head
}

function uninstall_oh_my_zsh() {
  /usr/bin/env ZSH=$ZSH /bin/sh $ZSH/tools/uninstall.sh
}

function upgrade_oh_my_zsh() {
  /usr/bin/env ZSH=$ZSH /bin/sh $ZSH/tools/upgrade.sh
}

function take() {
  mkdir -p $1
  cd $1
}

f() {
    find . -name "*"$1"*" ${(@)argv[2,$#]}
}
# Strict find
sf() {
    find . -name $*
}

# Colorize stderr
#exec 2>>(while read line; do
#  print '\e[91m'${(q)line}'\e[0m' > /dev/tty; print -n $'\0'; done &)

# Parse last command content
autoload -U read-from-minibuffer
zmodload -i zsh/parameter
insert-last-command-output() {
    local last_out="$(eval $history[$((HISTCMD-1))])"
    if [[ -z $last_out ]]; then
        return
    fi
    local -a out_array
    out_array=(${(f)last_out})
    if [[ $#out_array -eq 1 ]]; then
        LBUFFER+=$last_out
    else
        local disp
        disp=""
        local i=1
        for line in $out_array; do
            disp+="$i"
            disp+=":"
            disp+=$line
            disp+="
"
            ((i++))
        done
        read-from-minibuffer $disp
        LBUFFER+=$out_array[$REPLY]
    fi
}
zle -N insert-last-command-output
bindkey "^[[1;3A" insert-last-command-output
bindkey "^[[1;5A" insert-last-command-output

