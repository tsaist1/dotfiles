export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

if [ -e /usr/share/terminfo/x/xterm-256color ]; then
        export TERM='xterm-256color'
else
        export TERM='xterm-color'
fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/shengtse/omnisci-datascience/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/shengtse/omnisci-datascience/etc/profile.d/conda.sh" ]; then
        . "/Users/shengtse/omnisci-datascience/etc/profile.d/conda.sh"
    else
        export PATH="/Users/shengtse/omnisci-datascience/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export PATH="$HOME/.cabal/bin:$PATH"
export PATH=~/.local/bin:$PATH

source "$HOME/.cargo/env"
export PATH="/usr/local/opt/llvm/bin:$PATH"

# Added by install_latest_perl_osx.pl
[ -r /Users/shengtse/.bashrc ] && source /Users/shengtse/.bashrc


