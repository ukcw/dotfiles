if status is-interactive
    # Commands to run in interactive sessions can go here
end

# fish way of adding to PATH
# contains /path $fish_user_paths; or set -Ua fish_user_paths /path
# contains /home/$USER/.pyenv/bin $PATH; or set -x PATH "/home/$USER/.pyenv/bin" $PATH

# set -Ux EDITOR nvim
# pyenv setup
#set -x PYENV_ROOT="$HOME/.pyenv"
#command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
#eval "$(pyenv init -)"
#source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
#source /opt/homebrew/opt/chruby/share/chruby/auto.sh
#chruby ruby-3.1.2

# SBIP-NUS
# configure system environment variables
#set -gx PATH $LLVM_INSTALL_DIR/bin:$PATH
#set -gx LIBRARY_PATH $LLVM_INSTALL_DIR/lib:$LIBRARY_PATH
#set -gx LD_LIBRARY_PATH $LLVM_INSTALL_DIR/lib:$LD_LIBRARY_PATH
#set -gx DYLD_LIBRARY_PATH $LLVM_INSTALL_DIR/lib:$DYLD_LIBRARY_PATH

#set -gx NVM_DIR "$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

#[ -f "/Users/ulysseskee/.ghcup/env" ] && source "/Users/ulysseskee/.ghcup/env" # ghcup-env

# set C++ compiler to use clang from brew for compatibility with C++ 11 -- this was done for Neorg sync-parsers
# set -gx CC /opt/homebrew/opt/llvm/bin/clang

# add ~/.emacs.d/bin/ to PATH
#set -x PATH="$HOME/.emacs.d/bin:$PATH"
#set -x PATH="$HOME/.config/emacs/bin:$PATH"

# use GNU grep if installed by homebrew -- the FreeBSD version (that comes with MacOS) is missing some functionalities
#if [ -d "$(brew --prefix)/opt/grep/libexec/gnubin" ]
#PATH="$(brew --prefix)/opt/grep/libexec/gnubin:$PATH"
#end

# set Golang up
#set -gx GOPATH=$HOME/dev/go-workspace # don't forget to change your path correctly!
#set -gx GOROOT=/opt/homebrew/opt/go/libexec
#set -x PATH=$PATH:$GOPATH/bin
#set -x PATH=$PATH:$GOROOT/bin

# Python scripts path (e.g. pipenv)
#set -x PATH=$PATH:/Users/ulysseskee/.local/bin

# set starship prompt
starship init fish | source

# use zoxide as a replacement for cd
zoxide init --cmd cd fish | source
