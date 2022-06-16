export PATH=/usr/local/sbin:$PATH

export PATH=/usr/local/bin:$PATH

# Load Composer tools
export PATH=$HOME/.composer/vendor/bin:$PATH

# Load Node global installed binaries
export PATH=$HOME/.node/bin:$PATH

# Use project specific binaries before global ones
export PATH=node_modules/.bin:vendor/bin:$PATH

# bin
export PATH=$HOME/bin:$PATH

# python
export PATH=$HOME/Library/Python/2.7/bin:$PATH

# GO
export GOPATH=$HOME/.go
export GOROOT="$(brew --prefix golang)/libexec"
export PATH=$PATH:$GOROOT/bin
export PATH=$PATH:$GOPATH/bin

# Andorid
export ANDROID_HOME=$HOME/Library/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
# fzf
export FZF_DEFAULT_OPTS="--bind='ctrl-o:execute(code {})+abort'"
