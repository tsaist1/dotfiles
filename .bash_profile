export PS1='\u@\h:\[\e[01;32m\]\w\[\e[0m\]\$ '
export EDITOR='vim'
export CLICOLOR=1

[ -r ~/.bashrc ] && . ~/.bashrc

export PATH="/opt/homebrew/bin:$PATH"
#export PATH="/opt/homebrew/opt/llvm/bin:$PATH"

export LDFLAGS="-L/opt/homebrew/lib"
export CPPFLAGS="-I/opt/homebrew/include"

# opencv3 
export PATH="/opt/homebrew/opt/opencv@3/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/opencv@3/lib"
export CPPFLAGS="-I/opt/homebrew/opt/opencv@3/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/opencv@3/lib/pkgconfig"

